from flask import Flask, Response,request
from flask_sqlalchemy import SQLAlchemy
from docx import Document
import json
import os
import re
import pymysql
import datetime

import config
from ext import db
from model import userInfo

app = Flask(__name__)
app.config.from_object(config)
db.init_app(app)

def dbAuthorization():
    db = pymysql.connect("localhost", "root", "chris123", "superwrite")
    db_cursor = db.cursor()
    return db, db_cursor

# 检查连通性
@app.route('/', methods=['GET'])
def getTest():
   return 'SUPERWRITE server is working ...',200

@app.route('/register/', methods=['POST'])
def registerAndLogin():
    form = request.form
    data = json.loads(json.dumps(form))
    print(data, type(data))

    avatuarPath = os.path.join('../receive/image/',data['phone'])
    if not os.path.exists(avatuarPath):
        os.mkdir(avatuarPath)

    files = request.files
    for key,f in files.items():
        print(key)
        if key == 'avatuar':
            print(f)
            now = datetime.datetime.now() 
            # 文件上传时间
            filetime = now.strftime("%Y-%m-%d-%H:%M:%S")
            # 文件名
            filename = os.path.splitext(f.filename)[0]
            # 文件后缀
            filetype = os.path.splitext(f.filename)[1]
            #存储路径
            filepath = os.path.join('../receive/image/'+data['phone'],filename+'-'+filetime+filetype)
            f.save(filepath)
    
    result = userInfo.query.all()
    print(result)

    return 'Welcome!',200

@app.route('/uploadDocx/', methods=['POST']) # 上传路径
def uploadDocx():
    form = request.form #获得表单数据 除了file
    data = json.loads(json.dumps(form)) #转成dict
    titles = pickTitles(data) #需要匹配的title
    print(titles)

    #获取文件
    files = request.files.getlist('files[]')
    print(files)

    fileSavePath = []
    for f in files:
        filename = os.path.join('../RECEIVE/',f.filename)
        fileSavePath.append(filename)
        f.save(filename)

    # 提取文档内容并分类
    pickOutText = dealWithDocx(fileSavePath[0], titles)
    return {
        'para': pickOutText
    }, 200
    

#返回需要匹配的title
def pickTitles(data):
    titles = []
    for key in data:
        if re.search(r'title(\d+)$',key) != None:
            titles.append(data[key])
    return titles


def dealWithDocx(file, titles):
    result = []

    temp_title = ''
    real_title = ''
    temp_content = []

    #获取文档
    raw = Document(file)

    for para in raw.paragraphs:
        line = para.text
        print(line)
        is_match = False
        for title in titles:
            # 编码后匹配
            pattern_encode = title.encode('utf-8').strip()
            line_encode = line.encode('utf-8').strip()
            if re.search(pattern_encode, line_encode):
                print(title)
                if temp_title != '':
                    if temp_title == title:
                        break
                    result.append({
                        real_title : ''.join(temp_content)
                    })
                    temp_title = title
                    real_title = line
                    temp_content = []
                else:
                    temp_title = title
                    real_title = line
                    temp_content = []
                is_match = True
                break
        if not is_match:
            if temp_title != '':
                temp_content.append(line)
    result.append({
        real_title : ''.join(temp_content)
    })
    return result

if __name__ == '__main__':
    app.run(debug=True)