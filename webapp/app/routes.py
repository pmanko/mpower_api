from app import app

@app.route('/')
def index():
    return "Hello, World!"

@app.route('/index')

@app.route('/hello')
def hello():
    return 'Welcome to mPOWEr!'

@app.route('/patientss')
def patients():
    return "Patient List!"
