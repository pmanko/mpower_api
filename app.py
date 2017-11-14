
#!flask/bin/python
from flask import Flask, jsonify
app = Flask(__name__)

patients = [
    {
        'id': 1,
        'first_name': 'Piotr',
        'last_name': 'Mankowski'
    },
    {
        'id': 2,
        'first_name': 'Bob',
        'last_name': 'Dole'
    }
]


@app.route('/hello')
def hello():
    return 'Welcome to mPOWEr!'

@app.route('/api/v1.0/patients', methods=['GET'])
def get_tasks():
    return jsonify({'patients': patients})

if __name__ == '__main__':
    app.run(host='0.0.0.0', debug=True)
