from flask import jsonify, request
from bson import ObjectId
from app.services.database_service import appointments_collection

def get_all_appointments():
    appointments = list(appointments_collection.find())
    for appointment in appointments:
        appointment["_id"] = str(appointment["_id"])  # Convert ObjectId to string
    return jsonify(appointments)

def create_appointment():
    data = request.get_json()  # Get JSON data from the request
    if not data:
        return jsonify({"error": "No data provided"}), 400

    # Insert the new appointment into the database
    result = appointments_collection.insert_one(data)
    return jsonify({"message": "Appointment created", "id": str(result.inserted_id)}), 201