import datetime
from fastapi import APIRouter
from db import supabase_client

messages = APIRouter()

@messages.get("/")
async def root():
    return {"message": "Messages Part is working!"}