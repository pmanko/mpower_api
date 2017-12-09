from sqlalchemy import create_engine, MetaData, Table, Column, ForeignKey
from sqlalchemy.orm import scoped_session, sessionmaker
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.ext.automap import automap_base
from sqlalchemy import create_engine

engine = create_engine('mysql+pymysql://mpower:mpower@localhost:3066/mpower_api', pool_recycle=3600)
session = scoped_session(sessionmaker(autocommit=False,
                                         autoflush=False,
                                         bind=engine))


metadata = MetaData()

metadata.reflect(engine, only=['users', 'patients', 'clinics', 'sites'])

Base = automap_base(metadata=metadata)

Base.prepare()

User, Site, Clinic, Patient = Base.classes.users, Base.classes.sites, Base.classes.clinics, Base.classes.patients



# def init_db():
#     # import all modules here that might define models so that
#     # they will be registered properly on the metadata.  Otherwise
#     # you will have to import them first before calling init_db()
#     import yourapplication.models
#     Base.metadata.create_all(bind=engine)
