# Use Amazon ECR Public base image
FROM public.ecr.aws/amazonlinux/amazonlinux:2023

# Install Python and required dependencies
RUN yum update -y
RUN yum install -y python39 python3-pip

# Set working directory
WORKDIR /app

# Install dependencies
COPY requirements.txt /app/
RUN pip3 install --upgrade pip
RUN pip3 install -r requirements.txt
RUN pip3 install python-dotenv

# Copy the project files into the container
COPY . /app/

# Expose the port your Django app runs on
EXPOSE 8000

# Run the Django server
CMD ["python3", "manage.py", "runserver", "0.0.0.0:8000"]

