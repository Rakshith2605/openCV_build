FROM python:3.9-slim

WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y \
    libgl1-mesa-glx \
    libglib2.0-0 \
    && rm -rf /var/lib/apt/lists/*

# Install OpenCV
RUN pip install --no-cache-dir opencv-python-headless

# Set working directory for mounted volumes
VOLUME ["/app/input", "/app/output"]

# Default command
CMD ["bash"]

