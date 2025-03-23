from flask import Blueprint
from app.controllers.appointment_controller import get_all_appointments, create_appointment
from app.controllers.dummy_data_controller import insert_dummy_data

dummy_data_routes = Blueprint('dummy_data_routes', __name__)

@dummy_data_routes.route('/insert-dummy-data', methods=['GET', 'POST'])  # Allow GET and POST requests
def insert_dummy_data_route():
    return insert_dummy_data()
appointment_routes = Blueprint('appointment_routes', __name__)

@appointment_routes.route('/appointments', methods=['GET'])
def get_appointments_route():
    return get_all_appointments()

@appointment_routes.route('/appointments', methods=['POST'])
def create_appointment_route():
    return create_appointment()