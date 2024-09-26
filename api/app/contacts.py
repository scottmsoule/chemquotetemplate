from flask import Blueprint, jsonify
from .db import get_db_connection, close_db_connection

contacts_bp = Blueprint('contacts', __name__)

@contacts_bp.route('/contacts', methods=['GET'])
def get_contacts():
    conn = get_db_connection()
    if conn is None:
        return jsonify({"error": "Database connection failed."}), 500

    try:
        cursor = conn.cursor(dictionary=True)
        cursor.execute("SELECT * FROM Contacts")
        contacts = cursor.fetchall()
        return jsonify(contacts)
    finally:
        close_db_connection(conn)
