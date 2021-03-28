from ext import db
from flask_sqlalchemy import SQLAlchemy

class userInfo(db.Model):
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    nickname = db.Column(db.String(20))
    phone = db.Column(db.String(11), unique=True)
    password = db.Column(db.String(20))

    def __repr__(self):
        return "userInfo: %s %s %s %s" % (self.id,self.nickname, self.phone, self.password)
