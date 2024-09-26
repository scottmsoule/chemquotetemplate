from flask import Flask
from .contacts import contacts_bp  # Make sure this is correctly referencing the contacts module

def create_app():
    app = Flask(__name__)
    app.register_blueprint(contacts_bp, url_prefix='/api')
    return app
