import os
import mysql.connector
from mysql.connector import Error
import logging

def get_db_connection():
    """Establish a database connection and return the connection object."""
    try:
        conn = mysql.connector.connect(
            host=os.environ['DB_HOST'],
            user=os.environ['DB_USER'],
            password=os.environ['DB_PASSWORD'],
            database=os.environ['DB_NAME']
        )
        if conn.is_connected():
            return conn
    except Error as e:
        logging.error(f"Error: {e}")
        return None
