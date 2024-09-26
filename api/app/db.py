import os
import mysql.connector
from mysql.connector import Error

def get_db_connection():
    try:
        connection = mysql.connector.connect(
            host=os.getenv('DB_HOST'),
            user=os.getenv('DB_USER'),
            password=os.getenv('DB_PASSWORD'),
            database=os.getenv('DB_NAME'),
            charset='utf8mb4' 
        )
        return connection
    except Error as e:
        print(f"Error: {e}")
        return None

def close_db_connection(connection):
    if connection:
        connection.close()
