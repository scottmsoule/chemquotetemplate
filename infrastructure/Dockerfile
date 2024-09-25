FROM python:3.9

# Set the working directory
WORKDIR /app

# Copy the requirements file into the container
COPY ./app/requirements.txt .

# Install the required packages
RUN pip install -r requirements.txt

# Copy the rest of the application code into the container
COPY ./app .

# Command to run your app
CMD ["gunicorn", "-b", "0.0.0.0:5000", "app:app"]
