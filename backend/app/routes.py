from flask import Blueprint
from app.controllers.appointment_controller import get_all_appointments, create_appointment
from app.controllers.dummy_data_controller import insert_dummy_data  # Import the dummy data controller

# Define appointment routes
appointment_routes = Blueprint('appointment_routes', __name__)

@appointment_routes.route('/appointments', methods=['GET'])
def get_appointments_route():
    return get_all_appointments()

@appointment_routes.route('/appointments', methods=['POST'])
def create_appointment_route():
    return create_appointment()

# Define dummy data routes
dummy_data_routes = Blueprint('dummy_data_routes', __name__)

@dummy_data_routes.route('/insert-dummy-data', methods=['GET','POST'])
def insert_dummy_data_route():
    return insert_dummy_data()