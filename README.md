# API Server Python

A minimal FastAPI-based Python web server for DevOps exercises. This server provides a simple `/home` endpoint and is designed for containerized deployment scenarios.

## Application Details

- **Framework**: FastAPI with Uvicorn server
- **Port**: 8000
- **Health Check Endpoint**: `/home`
- **Container Image**: `ghcr.io/octo-training/api-server-python:latest`

## API Endpoints

### GET /home

Health check endpoint that returns service status.

**Response:**
```json
{
  "status": "ok",
  "service": "api-server"
}
```

**Status Code:** `200` - Service is healthy

## Local Development (Optional)

If you want to run the application locally for testing:

1. **Install dependencies**:
   ```bash
   pip install fastapi==0.128.0 uvicorn[standard]==0.40.0
   ```

2. **Run the application**:
   ```bash
   uvicorn app.main:app --host 0.0.0.0 --port 8000
   ```

3. **Test the endpoint**:
   ```bash
   curl http://localhost:8000/home
   ```

## Container Information

The application runs in a container with the following specifications:
- **Base Image**: `python:3.13-slim`
- **User**: Non-root user (UID 1000)
- **Port**: 8000
- **Health Check**: Uses `/home` endpoint

## Dependencies

- FastAPI web framework
- Uvicorn ASGI server

---

*This application is designed for DevOps training exercises. The container image is pre-built and available for deployment scenarios.*
