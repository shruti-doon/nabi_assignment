from flask import Flask, jsonify
from flask_cors import CORS  # Add this import
from pymongo import MongoClient
from urllib.parse import quote_plus

app = Flask(__name__)
CORS(app)  # Enable CORS for all routes

# MongoDB Atlas connection
username = quote_plus('shruti23doon')
password = quote_plus('Shruti@23')
dbname = 'therapist_dashboard'
MONGODB_URI = f'mongodb+srv://{username}:{password}@patientdata.1807l.mongodb.net/{dbname}?retryWrites=true&w=majority'

try:
    client = MongoClient(MONGODB_URI)
    db = client[dbname]
    appointments_collection = db["appointments"]
    print("Successfully connected to MongoDB Atlas")
except Exception as e:
    print(f"Error connecting to MongoDB: {e}")

@app.route('/appointments', methods=['GET'])
def get_appointments():
    try:
        appointments = list(appointments_collection.find({}, {'_id': 0}))  # Exclude _id field
        return jsonify(appointments)
    except Exception as e:
        return jsonify({"error": str(e)}), 500

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=True)