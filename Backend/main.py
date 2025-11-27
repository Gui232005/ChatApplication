from fastapi import FastAPI
from users import router as users_router

app = FastAPI()

@app.get("/")
async def root():
    return {"message": "Welcome to the User Management API"}

app.include_router(users_router, prefix="/users", tags=["users"])