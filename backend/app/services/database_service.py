from pymongo import MongoClient
from pymongo.errors import ServerSelectionTimeoutError

# Create MongoDB client with error handling
try:
    client = MongoClient('mongodb://localhost:27017/')
    db = client['therapist_db']
    appointments_collection = db['appointments']
except ServerSelectionTimeoutError as e:
    print("Could not connect to MongoDB:", e)

def get_appointments():
    try:
        return list(appointments_collection.find())
    except Exception as e:
        print(f"Error fetching appointments: {e}")
        return []

def add_appointment(data):
    try:
        return appointments_collection.insert_one(data)
    except Exception as e:
        print(f"Error adding appointment: {e}")
        raise