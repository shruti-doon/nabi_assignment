from flask import jsonify
from app.services.database_service import appointments_collection
from flask import Blueprint

# Create a Blueprint for dummy data operations
dummy_data_bp = Blueprint('dummy_data', __name__)

@dummy_data_bp.route('/api/dummy-data', methods=['POST'])
def insert_dummy_data():
    # Clear existing data in the collection
    appointments_collection.delete_many({})

    # Define dummy data
    dummy_appointments = [
        {
            "patientName": "Rupa Singh",
            "gender" : "female",
            "age": "19y",
             "email": "rupanirgh@gmail.com",
            "notes": "Follow-up for April 2019.",
            "status": "today",
            "time":"10am - 11am",
            "date":"2024-03-23",
        },
        {
            "patientName": "Divya Bhaskar",
            "gender" : "female",
            "age": "23y",
             "email": "divyabhaskar@gmail.com",
            "notes": "Initial consultation.",
            "status": "upcoming",
            "time":"1pm - 2m",
            "date":"2024-03-20",
        },
        {
            "patientName": "john doe",
           "gender" : "male",
            "age": "21",
             "email": "johndoe@gmail.com",
            "notes": "routine checkup.",
            "status": "completed",
            "time":"10am - 11am",
            "date":"2024-03-19",
        }
    ]

    # Insert dummy data into the database
    result = appointments_collection.insert_many(dummy_appointments)
    return jsonify({"message": f"Inserted {len(result.inserted_ids)} dummy appointments."})