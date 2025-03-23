from pymongo import MongoClient
from datetime import datetime
from typing import Optional
from pydantic import BaseModel

client = MongoClient("mongodb://localhost:27017/")
db = client["therapist_dashboard"]
appointments_collection = db["appointments"]

class Appointment(BaseModel):
    patientName: str
    gender: str
    age: str
    email: str
    notes: str
    status: str  # "today", "upcoming", or "completed"
    time: str
    date: str