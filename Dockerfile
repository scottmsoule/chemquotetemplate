# Example Dockerfile
FROM python:3.9

# Set the working directory
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . .

# Install the required packages
RUN pip install -r requirements.txt

# Command to run your app
CMD ["flask", "run", "--host=0.0.0.0"]
