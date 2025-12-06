from fastapi import FastAPI
from users import router as users_router
from contacts import router as contacts_router
from messages import messages as messages_router

app = FastAPI()

@app.get("/")
async def root():
    return {"message": "Welcome to the User Management API"}

app.include_router(users_router, prefix="/users", tags=["users"])
app.include_router(contacts_router, prefix="/contacts", tags=["contacts"])
app.include_router(messages_router, prefix="/messages", tags=["messages"])