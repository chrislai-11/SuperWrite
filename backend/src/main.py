from flask import Flask, Response,request,send_from_directory,send_file,make_response

from flask_sqlalchemy import SQLAlchemy

from docx import Document

import json
import os
import re
import datetime

from common import *
from model import *
from document import *
import config

app = Flask(__name__)
app.config.from_object(config)
with app.app_context(): 
    db.init_app(app)
    # db.drop_all()
    db.create_all()

################################################ API ############################################

# 检查连通性
@app.route('/check/', methods=['POST'])
def getTest():
    data = formToDict(request.form)
    userExit = userInfo.query.filter(userInfo.email == data['email']).first()
    if userExit == None or userExit.email == None or userExit.password == None or userExit.nickname == None or userExit.school == None or userExit.major == None:
        return {}, 401
    else:
        return {}, 200

# 获得验证码
@app.route('/getVerifyCode/', methods=['POST'])
def getVerifyCode():
    data = formToDict(request.form)
    result, code = sendVerifyCode(data['email'])
    if result:
        db.session.add(tempTable(data['email'], code))
        db.session.commit()
        return {}, 200
    else:
        return {}, 502

# 用户登录注册
@app.route('/register/', methods=['POST'])
def register():
    data = formToDict(request.form)
    email = data['email']
    pwd = data['password']
    verify = data['verify']

    # 验证码
    checkVerify = tempTable.query.filter(tempTable.email == email).order_by(tempTable.id.desc()).first()
    print(checkVerify)
    if checkVerify is None or checkVerify.code != verify:
        return {}, 403
    

    userExit = userInfo.query.filter(userInfo.email == email).first()
    isExit = False
    pwdRight = False

    # 用户不存在
    if userExit is None:
        print('创建用户:' + email + ' ' + pwd)
        db.session.add(userInfo(email, pwd))
        db.session.commit()
    elif userExit.nickname==None or userExit.school==None or userExit.major==None:
        userExit.password = pwd
        db.session.commit()
    else:
        print('用户登录:' + email)
        isExit = True
        if userExit.password == pwd:
            pwdRight = True

    return {
        'exit': isExit,
        'pwdRight': pwdRight
    }, 200

# 修改密码
@app.route('/changePwd/', methods=['POST'])
def changePwd():
    data = formToDict(request.form)

    userExit = userInfo.query.filter(userInfo.email == data['email']).first()
    
    userExit.password = data['password']
    db.session.commit()

    return {}, 200

# 更新个人资料
@app.route('/updateUser/', methods=['POST'])
def updateUserInfo():
    data = formToDict(request.form)

    userExit = userInfo.query.filter(userInfo.email == data['email']).first()
    
    userExit.nickname = data['nickname']
    userExit.school = data['school']
    userExit.major = data['major']
    db.session.commit()

    return {}, 200

# 获取个人资料
@app.route('/getUserInformation/', methods=['POST'])
def getUserInformation():
    data = formToDict(request.form)
    userReq = userInfo.query.filter(userInfo.email == data['email']).first()

    return {
        'nickname': userReq.nickname,
        'school': userReq.school,
        'major': userReq.major
    }, 200


@app.route('/generateDocx/', methods=['POST'])
def generateDocx():
    form = request.form
    data = formToDict(form)
    text = json.loads(data['text'])

    files = request.files.to_dict()
    print(files)
    
    textList = []
    for part in text:
        partition = json.loads(part)
        textList.append(partition)
    
    path = generateReport(textList, files)
    return {'path': path}, 200


@app.route('/uploadDocx/', methods=['POST']) # 上传路径
def uploadDocx():
    form = request.form #获得表单数据 除了file
    data = formToDict(form) #转成dict
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

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=5000)