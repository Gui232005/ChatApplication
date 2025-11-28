import datetime
from fastapi import APIRouter
from db import supabase_client

calls = APIRouter()

@calls.get("/")
async def read_root():
    return {"message": "Calls Part is working!"}