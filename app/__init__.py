from flask import Flask
from .routes import main
from .blueprints.api import api
import os


def create_app():
    app = Flask(__name__)
    app.config['SECRET_KEY'] = os.urandom(32).hex()
    app.register_blueprint(main)
    app.register_blueprint(api)

    return app
