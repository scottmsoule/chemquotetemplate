from flask import Blueprint, jsonify, request
from .db import get_db_connection, close_db_connection

contacts_bp = Blueprint('contacts', __name__)

# Get all contacts
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

# Create a new contact
@contacts_bp.route('/contacts', methods=['POST'])
def create_contact():
    new_contact = request.json
    conn = get_db_connection()
    if conn is None:
        return jsonify({"error": "Database connection failed."}), 500

    try:
        cursor = conn.cursor()
        cursor.execute("""
            INSERT INTO Contacts (first_name, last_name, email, customer_id, contact_role, phone)
            VALUES (%s, %s, %s, %s, %s, %s)
        """, (new_contact['first_name'], new_contact['last_name'], new_contact['email'],
              new_contact['customer_id'], new_contact['contact_role'], new_contact['phone']))
        conn.commit()
        return jsonify({"message": "Contact created successfully."}), 201
    except Exception as e:
        return jsonify({"error": str(e)}), 400
    finally:
        close_db_connection(conn)

# Update an existing contact
@contacts_bp.route('/contacts/<int:id>', methods=['PUT'])
def update_contact(id):
    updated_contact = request.json
    conn = get_db_connection()
    if conn is None:
        return jsonify({"error": "Database connection failed."}), 500

    try:
        cursor = conn.cursor()
        cursor.execute("""
            UPDATE Contacts
            SET first_name = %s, last_name = %s, email = %s, customer_id = %s, contact_role = %s, phone = %s
            WHERE id = %s
        """, (updated_contact['first_name'], updated_contact['last_name'], updated_contact['email'],
              updated_contact['customer_id'], updated_contact['contact_role'], updated_contact['phone'], id))
        conn.commit()
        if cursor.rowcount == 0:
            return jsonify({"error": "Contact not found."}), 404
        return jsonify({"message": "Contact updated successfully."}), 200
    except Exception as e:
        return jsonify({"error": str(e)}), 400
    finally:
        close_db_connection(conn)

# Delete a contact
@contacts_bp.route('/contacts/<int:id>', methods=['DELETE'])
def delete_contact(id):
    conn = get_db_connection()
    if conn is None:
        return jsonify({"error": "Database connection failed."}), 500

    try:
        cursor = conn.cursor()
        cursor.execute("DELETE FROM Contacts WHERE id = %s", (id,))
        conn.commit()
        if cursor.rowcount == 0:
            return jsonify({"error": "Contact not found."}), 404
        return jsonify({"message": "Contact deleted successfully."}), 200
    except Exception as e:
        return jsonify({"error": str(e)}), 400
    finally:
        close_db_connection(conn)
