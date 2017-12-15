from flask_sqlalchemy import SQLAlchemy
from sqlalchemy.orm import relationship
from sqlalchemy import inspect

import json

from .db import db

class SerializeMixin(object):
    # def __repr__(self):
    #     return json.dumps(self.serialize)

    @property
    def serialize(self):
       """Return object data in easily serializeable format"""

       serialized = {}

       for key in inspect(self.__class__).columns.keys():
           serialized[key] = getattr(self, key)

       return serialized


class Patient(SerializeMixin, db.Model):
    __bind_key__ = 'mpower'
    __table__ = db.Model.metadata.tables['patients']
    #__tablename__ = 'patients'

class MpowerUser(SerializeMixin, db.Model):
    __bind_key__ = 'mpower'
    __table__ = db.Model.metadata.tables['users']
    #__tablename__ = 'users'

    patient = relationship('Patient', backref='user', lazy=True, primaryjoin="User.id == foreign(Patient.consenter_id)")

# Flask-Oauthlib Server Setup
class User(db.Model):
    __tablename__ = 'user'

    id = db.Column(db.Integer, primary_key=True)
    email = db.Column(db.String(128))

class Client(db.Model):
    # human readable name, not required
    name = db.Column(db.String(40))

    # human readable description, not required
    description = db.Column(db.String(400))

    # creator of the client, not required
    user_id = db.Column(db.ForeignKey('user.id'))
    # required if you need to support client credential
    user = db.relationship('User')

    client_id = db.Column(db.String(40), primary_key=True)
    client_secret = db.Column(db.String(55), unique=True, index=True,
                              nullable=False)

    # public or confidential
    is_confidential = db.Column(db.Boolean)

    _redirect_uris = db.Column(db.Text)
    _default_scopes = db.Column(db.Text)

    @property
    def client_type(self):
        if self.is_confidential:
            return 'confidential'
        return 'public'

    @property
    def redirect_uris(self):
        if self._redirect_uris:
            return self._redirect_uris.split()
        return []

    @property
    def default_redirect_uri(self):
        return self.redirect_uris[0]

    @property
    def default_scopes(self):
        if self._default_scopes:
            return self._default_scopes.split()
        return []

class Grant(db.Model):
    id = db.Column(db.Integer, primary_key=True)

    user_id = db.Column(
        db.Integer, db.ForeignKey('user.id', ondelete='CASCADE')
    )
    user = db.relationship('User')

    client_id = db.Column(
        db.String(40), db.ForeignKey('client.client_id'),
        nullable=False,
    )
    client = db.relationship('Client')

    code = db.Column(db.String(255), index=True, nullable=False)

    redirect_uri = db.Column(db.String(255))
    expires = db.Column(db.DateTime)

    _scopes = db.Column(db.Text)

    def delete(self):
        db.session.delete(self)
        db.session.commit()
        return self

    @property
    def scopes(self):
        if self._scopes:
            return self._scopes.split()
        return []

class Token(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    client_id = db.Column(
        db.String(40), db.ForeignKey('client.client_id'),
        nullable=False,
    )
    client = db.relationship('Client')

    user_id = db.Column(
        db.Integer, db.ForeignKey('user.id')
    )
    user = db.relationship('User')

    # currently only bearer is supported
    token_type = db.Column(db.String(40))

    access_token = db.Column(db.String(255), unique=True)
    refresh_token = db.Column(db.String(255), unique=True)
    expires = db.Column(db.DateTime)
    _scopes = db.Column(db.Text)

    def delete(self):
        db.session.delete(self)
        db.session.commit()
        return self

    @property
    def scopes(self):
        if self._scopes:
            return self._scopes.split()
        return []
