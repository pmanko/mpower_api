from flask import Blueprint, render_template, make_response, jsonify, flash, redirect, url_for, request, current_app
from mpowerapi.models import *
from mpowerapi.oauth2 import oauth2

oauth = Blueprint('oauth', __name__)

# TODO: Ensure Secure @secure_required
@oauth.route('/authorize', methods=["GET", "POST"])
@oauth2.authorize_handler
def authorize(*args, **kwargs):
    # if request.method == 'GET':
    #     client_id = kwargs.get('client_id')
    #     client = Client.query.filter_by(client_id=client_id).first()
    #     kwargs['client'] = client
    #     return render_template('oauthorize.html', **kwargs)
    #
    # confirm = request.form.get('confirm', 'no')
    # return confirm == 'yes'

    # NOTICE: for real project, you need to require login
    if request.method == 'GET':
        # render a page for user to confirm the authorization
        return "Confirmed" #render_template('confirm.html')

    if request.method == 'HEAD':
        # if HEAD is supported properly, request parameters like
        # client_id should be validated the same way as for 'GET'
        response = make_response('', 200)
        response.headers['X-Client-ID'] = kwargs.get('client_id')
        return response

    confirm = request.form.get('confirm', 'no')
    return confirm == 'yes'

@oauth.route('/oauth/token', methods=['POST', 'GET'])
@oauth2.token_handler
def access_token():
    return {}

@oauth.route('/oauth/revoke', methods=['POST'])
@oauth2.revoke_handler
def revoke_token(): pass
