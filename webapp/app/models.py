from . import app
from flask_sqlalchemy import SQLAlchemy
from sqlalchemy.orm import relationship

from sqlalchemy import create_engine, MetaData, Table, Column, ForeignKey
from sqlalchemy.orm import scoped_session, sessionmaker
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.ext.automap import automap_base
from sqlalchemy import create_engine
from sqlalchemy import inspect

import json

# engine = create_engine('mysql+pymysql://mpower:mpower@db/mpower_api', pool_recycle=3600)
# session = scoped_session(sessionmaker(autocommit=False,
#                                          autoflush=False,
#                                          bind=engine))
#
#
# metadata = MetaData()
#
# metadata.reflect(engine, only=['users', 'patients', 'clinics', 'sites'])
#
# Base = automap_base(metadata=metadata)
#
# Base.prepare()
#User = Base.classes.users

# for u in session.query(User):
#     print(u)


db = SQLAlchemy(app)

# Reflect only the structure of the mPOWEr db.
db.reflect(bind='mpower')

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

class User(SerializeMixin, db.Model):
    __bind_key__ = 'mpower'
    __table__ = db.Model.metadata.tables['users']

    patient = relationship('Patient', backref='user', lazy=True, primaryjoin="User.id == foreign(Patient.consenter_id)")
