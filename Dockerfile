# Use the official Python image from the Docker Hub
FROM python:3.9-slim

# Set the working directory
WORKDIR /app

# Copy the requirements file into the container
COPY requirements.txt .

# Install the required packages
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code into the container
COPY . .

# Expose the port that Flask/Gunicorn will listen on
EXPOSE 80

# Command to run the Flask application using Gunicorn
CMD ["gunicorn", "-b", "0.0.0.0:80", "main:app"]
