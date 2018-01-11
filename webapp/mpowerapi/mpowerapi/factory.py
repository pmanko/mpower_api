import os
from flask import Flask, g
from flask_cors import CORS
from flask_oauthlib.contrib.oauth2 import bind_sqlalchemy
from .oauth2 import oauth2
from .server import current_user, User, Client, Grant, Token


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

    from mpowerapi.models import Patient, MpowerUser

    from mpowerapi.blueprints.api import api
    from mpowerapi.blueprints.static import static
    from mpowerapi.blueprints.oauth import oauth

    app.register_blueprint(api, url_prefix='/api/v1.0')
    app.register_blueprint(static, url_prefix='')
    app.register_blueprint(oauth, url_prefix='/oauth')

    oauth2.init_app(app)
    bind_sqlalchemy(oauth2, db.session, user=User, token=Token,
                        client=Client, grant=Grant, current_user=current_user)


    # register_cli(app)
    # register_teardowns(app)


    # @app.before_request
    # def load_current_user():
    #     user = User.query.get(1)
    #     g.user = user

    return app
