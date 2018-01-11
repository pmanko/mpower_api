import os
from flask import Flask, g
from flask_cors import CORS

# from app.blueprints.mpowerapi import init_db


def create_app(config=None):
    app = Flask('mpowerapi')

    app.config.update(dict(
        Debug=True,
        SQLALCHEMY_DATABASE_URI = 'mysql+pymysql://mpowerapi:mpowerapi@app-db:3306/mpowerapi',
        SQLALCHEMY_TRACK_MODIFICATIONS = False,
        SQLALCHEMY_POOL_RECYCLE = 60,
        SQLALCHEMY_BINDS = {
            'mpower':        'mysql+pymysql://mpower:mpower@mpower-db:3306/mpower',
        }
    ))

    CORS(app)
    
    #app.config.update(config or {})
    app.config.from_envvar('MPOWERAPI_SETTINGS', silent=True)

    app.secret_key = '12345678'

    from mpowerapi.db import db
    db.init_app(app)

    # Reflect only the structure of the mPOWEr db.
    with app.app_context():
        db.reflect(bind='mpower')

    from mpowerapi.models import Patient, User

    from mpowerapi.blueprints.api import api
    from mpowerapi.blueprints.static import static

    app.register_blueprint(api, url_prefix='/api/v1.0')
    app.register_blueprint(static, url_prefix='')

    # register_cli(app)
    # register_teardowns(app)

    return app

#
# def register_blueprints(app):
#     """Register all blueprint modules
#     Reference: Armin Ronacher, "Flask for Fun and for Profit" PyBay 2016.
#     """
#     for name in find_modules('mpowerapi.blueprints'):
#         mod = import_string(name)
#         if hasattr(mod, 'bp'):
#             app.register_blueprint(mod.bp)
#     return None
#
#
# def register_cli(app):
#     @app.cli.command('initdb')
#     def initdb_command():
#         """Creates the database tables."""
#         init_db()
#         print('Initialized the database.')
#
#
# def register_teardowns(app):
#     @app.teardown_appcontext
#     def close_db(error):
#         """Closes the database again at the end of the request."""
#         if hasattr(g, 'sqlite_db'):
#             g.sqlite_db.close()
