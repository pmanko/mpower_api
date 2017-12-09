from app import db
from sqlalchemy.orm import relationship

db.Model.metadata.reflect(db.engine)#change to (db.engine)

class Patient(db.Model):
    __table__ = db.Model.metadata.tables['patients']
    def __repr__(self):
        return self.MRN
