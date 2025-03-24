from flask import Flask, jsonify
from pymongo import MongoClient

app = Flask(__name__)

# Connect to MongoDB
client = MongoClient("mongodb://localhost:27017/")
db = client["therapist_dashboard"]
appointments_collection = db["appointments"]

@app.route("/appointments", methods=["GET"])
def get_appointments():
    appointments = list(appointments_collection.find())
    for appointment in appointments:
        appointment["_id"] = str(appointment["_id"])  # Convert ObjectId to string
    return jsonify(appointments)

@app.route('/insert-dummy-data', methods=['GET', 'POST'])
def insert_dummy_data():
    try:
        # Example dummy data
        dummy_data = [
    {
        "patientName": "Rupa Singh",
        "email": "rupanirgh@gmail.com",
        "age": "19",
        "gender": "female",
        "notes": "Follow-up for April.",
        "status": "today"
    },
    {
        "patientName": "Divya Bhaskar",
        "email": "divyabhaskar@gmail.com",
        "age": "23",
        "gender": "female",
        "notes": "Initial consultation.",
        "status": "upcoming"
    },
    {
        "patientName": "John Doe",
        "email": "johndoe@gmail.com",
        "age": "21",
        "gender": "male",
        "notes": "Routine checkup.",
        "status": "completed"
    }
]

        
        # Insert into your MongoDB collection
        result = db['your_collection_name'].insert_many(dummy_data)
        
        return jsonify({
            "message": "Dummy data inserted successfully",
            "inserted_count": len(result.inserted_ids)
        }), 200
        
    except Exception as e:
        return jsonify({
            "error": str(e)
        }), 500

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5001, debug=True)