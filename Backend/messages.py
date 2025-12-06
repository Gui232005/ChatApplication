import datetime
from fastapi import APIRouter
from db import supabase_client

messages = APIRouter()

@messages.get("/")
async def root():
    return {"message": "Messages Part is working!"}

@messages.get("/list_messages")
async def list_messages():
    response = supabase_client.table("messages").select("*").execute()
    return response.data

@messages.post("/create_message")
async def create_message(sender_id: int, receiver_id: int, content: str):
    new_message = {
        "sender_id": sender_id,
        "receiver_id": receiver_id,
        "content": content,
        "timestamp": datetime.datetime.utcnow().isoformat()
    }
    response = supabase_client.table("messages").insert(new_message).execute()
    return response.data[0]

@messages.get("/get_message/{message_id}")
async def get_message(message_id: int):
    response = supabase_client.table("messages").select("*").eq("id", message_id).execute()
    if response.data:
        return response.data[0]
    return {"error": "Message not found"}

@messages.delete("/delete_message/{message_id}")
async def delete_message(message_id: int):
    response = supabase_client.table("messages").delete().eq("id", message_id).execute()
    return {"deleted": response.data}