import os
import mysql.connector
import logging

def test_db_connection():
    try:
        logging.info(f"DB Host: {os.environ['DB_HOST']}, User: {os.environ['DB_USER']}, Database: {os.environ['DB_NAME']}")

        conn = mysql.connector.connect(
            host=os.environ['DB_HOST'],
            user=os.environ['DB_USER'],
            password=os.environ['DB_PASSWORD'],
            database=os.environ['DB_NAME']
        )
        if conn.is_connected():
            print("Successfully connected to the database. test")
            print("DB Host:", {os.environ['DB_HOST']}," User:", {os.environ['DB_USER']}, "Database:", {os.environ['DB_NAME']})
            conn.close()
    except mysql.connector.Error as err:
        print(f"Error: {err}")

if __name__ == "__main__":
    test_db_connection()
