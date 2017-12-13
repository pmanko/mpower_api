from flask import Blueprint, render_template, make_response, jsonify, flash, redirect, url_for, request, current_app
from mpowerapi.models import *

@app.route('/api/v1.0/patients')
def patient_index():
    return jsonify(patients=[i.serialize for i in Patient.query.all()])

@app.route('/api/v1.0/patients/<int:id>')
def patient(id):
    return jsonify(Patient.query.filter_by(id=id).first().serialize)

@app.route('/api/v1.0/users')
def user_index():
    return jsonify(users=[i.serialize for i in User.query.all()])

@app.route('/api/v1.0/users/<int:id>')
def user(id):
    return jsonify(User.query.filter_by(id=id).first().serialize)
