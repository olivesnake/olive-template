from flask import Flask, render_template
from flask_migrate import Migrate
from app.models import db
import os


def create_app():
    app = Flask(__name__)
    app.config['SECRET_KEY'] = os.environ.get("SECRET_KEY", "dev-key")
    app.config["SQLALCHEMY_DATABASE_URI"] = f"sqlite:///{app.instance_path}/app.db"
    app.config["SQLALCHEMY_TRACK_MODIFICATIONS"] = False

    db.init_app(app)
    Migrate(app, db)
    from app.blueprints.main import main
    from app.blueprints.api import api

    app.register_blueprint(main)
    app.register_blueprint(api)

    @app.errorhandler(404)
    def not_found(err):
        return render_template("404.html")

    return app
