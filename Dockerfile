# Use official Python runtime as base image
FROM python:3.13-slim

# Install uv
COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /usr/local/bin/

# Set working directory
WORKDIR /app

# Create non-root user
RUN useradd --create-home --uid 1000 appuser

# Copy dependency files
COPY pyproject.toml ./

# Install only production dependencies without building the project
RUN uv venv && \
    uv pip install fastapi==0.128.0 uvicorn[standard]==0.40.0

# Copy application code
COPY app/ ./app/

# Change to non-root user
USER appuser

# Expose port
EXPOSE 8000

# Set PATH to include virtual environment
ENV PATH="/app/.venv/bin:$PATH"

# Run the application directly with Python
CMD ["python", "-m", "uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]