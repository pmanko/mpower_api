Debug=True
SQLALCHEMY_DATABASE_URI = 'mysql+pymysql://mpowerapi:mpowerapi@app-db:3306/mpowerapi'
SQLALCHEMY_TRACK_MODIFICATIONS = False
SQLALCHEMY_POOL_RECYCLE = 60
SQLALCHEMY_BINDS = {
    'mpower':        'mysql+pymysql://mpower:mpower@mpower-db:3306/mpower',
}
