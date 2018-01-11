from flask import Blueprint, render_template, make_response, jsonify, flash, redirect, url_for, request, current_app
from mpowerapi.models import *

api = Blueprint('api', __name__)

@api.route('/patients')
def patient_index():
    return jsonify(patients=[i.serialize for i in Patient.query.all()])

@api.route('/patients/<int:id>')
def patient(id):
    return jsonify(Patient.query.filter_by(id=id).first().serialize)

@api.route('/users')
def user_index():
    return jsonify(users=[i.serialize for i in MpowerUser.query.all()])

@api.route('/users/<int:id>')
def user(id):
    return jsonify(MpowerUser.query.filter_by(id=id).first().serialize)
