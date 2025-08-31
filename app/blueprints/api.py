from flask import Blueprint, jsonify

api = Blueprint('api', __name__, url_prefix='/api')


@api.route("/greeting", methods=["GET"])
def greet_endpoint():
    return jsonify({"message": "hello world"})
