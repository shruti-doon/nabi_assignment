from pymongo import MongoClient

client = MongoClient("mongodb://localhost:27017/")
db = client["therapist_dashboard"]
appointments_collection = db["appointments"]