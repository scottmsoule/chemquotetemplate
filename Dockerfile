FROM python:3.9

# Set the working directory
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . .

# Install the required packages
RUN pip install -r requirements.txt

# Command to run your app
CMD ["gunicorn", "-b", "0.0.0.0:5000", "app:app"]
