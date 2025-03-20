# Use official Python image
FROM python:3.9-slim

# Set working directory
WORKDIR /app

# Install dependencies
COPY requirements.txt /app/
RUN pip install --upgrade pip
RUN pip install -r requirements.txt
RUN pip install python-dotenv

# Copy the project files into the container
COPY . /app/

# Expose the port your Django app runs on
EXPOSE 8000

# Run the Django server
CMD ["python3", "manage.py", "runserver", "0.0.0.0:8000"]

