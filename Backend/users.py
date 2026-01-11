# This will be my backend
import datetime
from fastapi import APIRouter
from db import supabase_client

router = APIRouter()

@router.get("/")
async def read_root():
    return {"message": "User Part is working!"}

@router.get("/list_client")
async def list_client():
    response = supabase_client.table("users").select("*").execute()
    return response.data

@router.get("/getuserImage/{username}")
async def get_user_image(username: str):
    response = supabase_client.table("users").select("profile_picture").eq("username", username).execute()
    if response.data:
        return response.data[0]
    return {"error": "User not found"}

@router.get("/getuserStatus/{username}")
async def get_user_status(username: str):
    response = supabase_client.table("users").select("status").eq("username", username).execute()
    if response.data:
        return response.data[0]
    return {"error": "User not found"}

@router.get("/getuser/{username}")
async def get_user(username: str):
    response = supabase_client.table("users").select("*").eq("username", username).execute()
    if response.data:
        return response.data[0]
    return {"error": "User not found"}

@router.post("/adduser/{username}/{password}")
async def add_user(username: str, password: str):
    new_user = {
        "username": username,
        "password": password,
        "created_at": datetime.datetime.utcnow().isoformat()
    }
    response = supabase_client.table("users").insert(new_user).execute()
    return response.data[0]

@router.delete("/deleteuser/{user_id}")
async def delete_user(user_id: int):
    response = supabase_client.table("users").delete().eq("id", user_id).execute()
    return {"deleted": response.data}

# Update user information

@router.post("/updateuser/{username}")
async def update_user(username: str):
    response = supabase_client.table("users").update({"username": username}).eq("username", username).execute()
    return {"updated": response.data}

@router.post("/updateuser/{profile_picture}")
async def update_profile_picture(profile_picture: str):
    response = supabase_client.table("users").update({"profile_picture": profile_picture}).eq("profile_picture", profile_picture).execute()
    return {"updated": response.data}

@router.post("/updateuser/{user}/{status}")
async def update_status(status: str):
    response = supabase_client.table("users").update({"status": status}).eq("status", status).execute()
    return {"updated": response.data}

@router.post("/updateuser/{is_online}")
async def update_is_online(is_online: bool):
    response = supabase_client.table("users").update({"is_online": is_online}).eq("is_online", is_online).execute()
    return {"updated": response.data}

@router.post("/updateuser/{last_seen_at}")
async def update_last_seen_at(last_seen_at: str):
    response = supabase_client.table("users").update({"last_seen_at": last_seen_at}).eq("last_seen_at", last_seen_at).execute()
    return {"updated": response.data}


@router.post("/login/{username}/{password}")
async def login(username: str, password: str):
    response = supabase_client.table("users").select("*").eq("username", username).execute()

    if response.data and len(response.data) > 0:
        user = response.data[0]
        if str(user.get('password')) == password:
            return {"message": "Login successful", "user": user}

    return {"error": "Invalid credentials"}