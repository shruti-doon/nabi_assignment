from flask import Flask
from app.routes import appointment_routes
from .controllers.dummy_data_controller import dummy_data_bp

def create_app():
    app = Flask(__name__)
    app.register_blueprint(appointment_routes)
    app.register_blueprint(dummy_data_bp)
    return app