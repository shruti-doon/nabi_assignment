from pymongo import MongoClient
from datetime import datetime
from typing import Optional
from pydantic import BaseModel
from urllib.parse import quote_plus

username = quote_plus('shruti23doon')
password = quote_plus('Shruti@23')
dbname = 'therapist_dashboard'
MONGODB_URI = f'mongodb+srv://{username}:{password}@patientdata.1807l.mongodb.net/{dbname}?retryWrites=true&w=majority'
client = MongoClient(MONGODB_URI)
db = client[dbname]
appointments_collection = db["appointments"]

class Appointment(BaseModel):
    patientName: str
    gender: str
    age: str
    email: str
    notes: str
    status: str 
    time: str
    date: str