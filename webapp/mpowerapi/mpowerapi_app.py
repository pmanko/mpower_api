import os
from mpowerapi.factory import create_app
# from mpowerapi.models import db

app = create_app(os.getenv('FLASK_CONFIG') or 'default')

from mpowerapi.models import db

@app.shell_context_processor
def make_shell_context():
    return dict(app=app, db=db)
