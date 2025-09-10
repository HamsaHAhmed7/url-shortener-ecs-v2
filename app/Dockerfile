# ---------- Build stage ----------
FROM python:3.11-slim AS builder

WORKDIR /w
RUN apt-get update && apt-get install -y --no-install-recommends build-essential \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .
RUN pip install --upgrade pip \
 && pip install --no-cache-dir -r requirements.txt

COPY src/ ./src


# ---------- Runtime stage (debug) ----------
FROM python:3.11-slim

WORKDIR /app

ENV PYTHONPATH=/app \
    TABLE_NAME=changeme \
    AWS_REGION=us-east-1

COPY --from=builder /usr/local /usr/local
COPY --from=builder /w/src /app/src

# Run as non-root
RUN useradd -m appuser
USER appuser

EXPOSE 8080
CMD ["uvicorn", "src.main:app", "--host=0.0.0.0", "--port=8080"]
