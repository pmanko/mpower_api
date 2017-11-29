
#!flask/bin/python
from flask import Flask, jsonify
app = Flask(__name__)

patients = [
    {
        'id': 1,
        'MRN': 123,
        'first_name': 'Patient',
        'last_name': 'One',
        'phone1': '9081111111',
        'consent_checked': 1,
        'gender': 'F',
        'birthdate': '1984-12-11'
    }
]


@app.route('/hello')
def hello():
    return 'Welcome to mPOWEr!'

@app.route('/api/v1.0/patients/1', methods=['GET'])
def get_tasks():
    return jsonify(patients[0])

if __name__ == '__main__':
    app.run(host='0.0.0.0', debug=True)
