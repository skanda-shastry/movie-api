from flask import Blueprint, jsonify

error_bp = Blueprint('error', __name__)

@error_bp.app_errorhandler(404)
def not_found_error(error):
    return jsonify({'error': 'Not found'}), 404
