import uvicorn
from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from pydantic import BaseModel
from typing import List
import random


app = FastAPI()


app.add_middleware(CORSMiddleware, 
                   allow_origins=["*"],
                   allow_credentials=True,
                   allow_methods = ["*"],
                   allow_headers = ["*"]
                   )

@app.get("/testing/")
def test_connection(input):
    print(f"connection found {input}")
    return "Message Recieved"