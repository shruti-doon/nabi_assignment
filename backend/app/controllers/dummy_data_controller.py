from pymongo import MongoClient

client = MongoClient("mongodb://localhost:27017/")
db = client["therapist_dashboard"]
appointments_collection = db["appointments"]

dummy_appointments = [
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

appointments_collection.insert_many(dummy_appointments)