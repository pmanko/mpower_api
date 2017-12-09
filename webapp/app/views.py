from flask import render_template, make_response, jsonify, flash, redirect, url_for, request
from app import app, db
from app.models import Patient

@app.route('/hello')
def hello():
    return 'Welcome to mPOWEr!'

@app.route('/api/v1.0/patient/1')
def patient():
    return jsonify(Patient.first())
