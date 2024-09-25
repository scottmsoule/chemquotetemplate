import logging
from flask import jsonify, request
from . import api_bp
from app.db import get_db_connection  # Import the connection function

# Configure logging
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

@api_bp.route('/contacts', methods=['GET'])
def get_contacts():
    try:
        conn = get_db_connection()
        cursor = conn.cursor(dictionary=True)  # Use dictionary cursor
        cursor.execute("SELECT * FROM Contacts;")
        rows = cursor.fetchall()

        return jsonify(rows), 200  # Return all contacts as JSON

    except Exception as e:
        logger.error(f"Error retrieving contacts: {e}")
        return jsonify({"error": "An error occurred while retrieving contacts."}), 500
    finally:
        cursor.close()
        conn.close()

@api_bp.route('/contacts/<int:contact_id>', methods=['GET'])
def get_contact(contact_id):
    try:
        conn = get_db_connection()
        cursor = conn.cursor(dictionary=True)  # Use dictionary cursor
        cursor.execute("SELECT * FROM Contacts WHERE id = %s", (contact_id,))
        row = cursor.fetchone()

        if row:
            return jsonify(row), 200  # Return the specific contact
        return jsonify({"error": "Contact not found"}), 404

    except Exception as e:
        logger.error(f"Error retrieving contact with ID {contact_id}: {e}")
        return jsonify({"error": "An error occurred while retrieving the contact."}), 500
    finally:
        cursor.close()
        conn.close()

@api_bp.route('/contacts', methods=['POST'])
def create_contact():
    try:
        data = request.get_json()
        conn = get_db_connection()
        cursor = conn.cursor()
        cursor.execute(
            "INSERT INTO Contacts (customer_id, first_name, last_name, email, phone, role) VALUES (%s, %s, %s, %s, %s, %s)",
            (data['customer_id'], data['first_name'], data['last_name'], data['email'], data['phone'], data['role'])
        )
        conn.commit()
        return jsonify({"message": "Contact created successfully"}), 201

    except Exception as e:
        logger.error(f"Error creating contact: {e}")
        return jsonify({"error": "An error occurred while creating the contact."}), 500
    finally:
        cursor.close()
        conn.close()

@api_bp.route('/contacts/<int:contact_id>', methods=['PUT'])
def update_contact(contact_id):
    try:
        data = request.get_json()
        conn = get_db_connection()
        cursor = conn.cursor()
        cursor.execute(
            "UPDATE Contacts SET customer_id = %s, first_name = %s, last_name = %s, email = %s, phone = %s, role = %s WHERE id = %s",
            (data['customer_id'], data['first_name'], data['last_name'], data['email'], data['phone'], data['role'], contact_id)
        )
        conn.commit()

        if cursor.rowcount > 0:
            return jsonify({"message": "Contact updated successfully"}), 200
        else:
            return jsonify({"error": "Contact not found"}), 404

    except Exception as e:
        logger.error(f"Error updating contact with ID {contact_id}: {e}")
        return jsonify({"error": "An error occurred while updating the contact."}), 500
    finally:
        cursor.close()
        conn.close()

@api_bp.route('/contacts/<int:contact_id>', methods=['DELETE'])
def delete_contact(contact_id):
    try:
        conn = get_db_connection()
        cursor = conn.cursor()
        cursor.execute("DELETE FROM Contacts WHERE id = %s", (contact_id,))
        conn.commit()

        if cursor.rowcount > 0:
            return jsonify({"message": "Contact deleted successfully"}), 200
        else:
            return jsonify({"error": "Contact not found"}), 404

    except Exception as e:
        logger.error(f"Error deleting contact with ID {contact_id}: {e}")
        return jsonify({"error": "An error occurred while deleting the contact."}), 500
    finally:
        cursor.close()
        conn.close()
