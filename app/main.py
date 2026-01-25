from fastapi import FastAPI

app = FastAPI(title="API Server", version="1.0.0")


@app.get("/home")
def home():
    return {"status": "ok", "service": "api-server"}