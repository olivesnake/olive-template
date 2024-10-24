from flask import Blueprint, jsonify

api = Blueprint('api', __name__)


@api.route("/api/greeting", methods=["GET"])
def greet_endpoint():
    return jsonify({"message": "hello world"})
