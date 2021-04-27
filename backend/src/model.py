from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()

class userInfo(db.Model):
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    email = db.Column(db.String(50), unique=True)
    password = db.Column(db.String(20))
    nickname = db.Column(db.String(20))
    school = db.Column(db.String(40))
    major = db.Column(db.String(40))

    def __init__(self, email, password):
        self.email = email
        self.password = password
    
    def __repr__(self):
        return "user: %s  %s  %s" % (self.email, self.nickname, self.password)


class tempTable(db.Model):
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    email = db.Column(db.String(50))
    code = db.Column(db.String(6))

    def __init__(self, email, code):
        self.email = email
        self.code = code
    
    def __repr__(self):
        return "%s Verify Code: %s" % (self.email, self.code)


class docSetting(db.Model):
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    email = db.Column(db.String(50), unique=True)
    baseIds = db.Column(db.String(50))
    indentify = db.Column(db.String(256))

    def __init__(self, email, baseIds, indentify):
        self.email = email
        self.baseIds = baseIds
        self.indentify = indentify
    
    def __repr__(self):
        return "email: %s \n indentify: %s \n base item ids: %s \n" % (self.email, self.indentify, self.baseIds)

class baseItems(db.Model):
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    itemName = db.Column(db.String(128))
    itemValue = db.Column(db.String(128))

    def __init__(self, itemName, itemValue):
        self.itemName = itemName
        self.itemValue = itemValue
    
    def __repr__(self):
        return "id: %d : %s %s" % (self.id, self.itemName, self.itemValue)

class documentStorage(db.Model):
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    email = db.Column(db.String(50))
    docName = db.Column(db.String(50))
    address = db.Column(db.String(128))

    def __init__(self, email, address):
        self.email = email
        self.address = address

    def __repr__(self):
        return "document%d :\n name: %s address: %s user: %s" % (self.id, self.docName, self.address, self.email)
