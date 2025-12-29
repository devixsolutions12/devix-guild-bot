FROM python:3.9-slim

WORKDIR /app

# Install system dependencies (if any needed for crypto/protobuf)
# git is often needed for some pip installs
RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

# Expose the Flask API port
EXPOSE 8080

# Run the bot
CMD ["python", "main.py"]
