import supabase
from fastapi import FastAPI
app = FastAPI()
SUPABASE_URL = "https://zutiqrctwqybbfuosvgp.supabase.co"
SUPABASE_KEY = "sb_publishable_Qo8cB1VtQuEcPnTBgLbNPg_GgeAYRzH"

@app.get("/create_client")
async def create_client():
    client = supabase.table("User").insert({

    })

@app.get("/client")
async def listClient():
