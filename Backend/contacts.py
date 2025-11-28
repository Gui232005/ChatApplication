import datetime
from fastapi import APIRouter
from db import supabase_client

router = APIRouter()

@router.get("/")
async def read_root():
    return {"message": "Contacts Part is working!"}

