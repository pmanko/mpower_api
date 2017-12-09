from flask import Flask
from flask_sqlalchemy import SQLAlchemy

app = Flask(__name__) #, instance_relative_config=True)

# if isfile(join('instance', 'flask_full.cfg')):
#     app.config.from_pyfile('flask_full.cfg')
# else:
#     app.config.from_pyfile('flask.cfg')

app.config.from_object('config')

app.secret_key = '12345678'

db = SQLAlchemy(app)

from app import views, models
