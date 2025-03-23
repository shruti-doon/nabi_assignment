from flask import jsonify, Blueprint, request
from app.services.database_service import appointments_collection

# Create a Blueprint for appointment operations
appointment_bp = Blueprint('appointment', __name__)

@appointment_bp.route('/api/appointments', methods=['GET'])
def get_appointments():
    appointments = list(appointments_collection.find({}, {'_id': 0}))
    return jsonify(appointments)

@appointment_bp.route('/api/appointments', methods=['POST'])
def add_appointment():
    new_appointment = request.json
    appointments_collection.insert_one(new_appointment)
    return jsonify({"message": "Appointment added successfully!"}), 201