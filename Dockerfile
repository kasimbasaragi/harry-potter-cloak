# Use an official Python image as the base
FROM python:3.9

# Set the working directory inside the container
WORKDIR /app

# Copy requirements.txt first to leverage Docker caching
COPY requirements.txt /app/

# Install necessary system dependencies for OpenCV and Pygame
RUN apt-get update && apt-get install -y \
    libgl1-mesa-glx libglib2.0-0 libsdl2-dev \
    && rm -rf /var/lib/apt/lists/* \
    && pip install --upgrade pip \
    && pip install --no-cache-dir -r requirements.txt

# Copy the entire project into the container
COPY . /app/

# Expose necessary ports if required (for web apps, if applicable)
EXPOSE 5000

# Set the default command to run a Python script (adjust as needed)
CMD ["python", "simpleWebcam.py"]
