from flask import jsonify, request
from . import api_bp
from app.db import get_db_connection

@api_bp.route('/customers', methods=['GET'])
def get_customers():
    """Fetch all customers."""
    try:
        conn = get_db_connection()
        cursor = conn.cursor(dictionary=True)  # Use dictionary for row mapping
        cursor.execute("SELECT * FROM Customers;")
        rows = cursor.fetchall()
        cursor.close()
        return jsonify(rows)  # Return the list of customers
    except Exception as err:
        print(f"Database error is: {err}")
        return jsonify({"error": "Database error"}), 500

@api_bp.route('/customers/<int:customer_id>', methods=['GET'])
def get_customer(customer_id):
    """Fetch a single customer by ID."""
    try:
        conn = get_db_connection()
        cursor = conn.cursor(dictionary=True)
        cursor.execute("SELECT * FROM Customers WHERE id = %s;", (customer_id,))
        row = cursor.fetchone()
        cursor.close()
        if row:
            return jsonify(row)  # Return the customer data
        else:
            return jsonify({"error": "Customer not found"}), 404
    except Exception as err:
        print(f"Database error is: {err}")
        return jsonify({"error": "Database error"}), 500

@api_bp.route('/customers', methods=['POST'])
def add_customer():
    """Add a new customer."""
    data = request.get_json()
    try:
        conn = get_db_connection()
        cursor = conn.cursor()
        cursor.execute(
            "INSERT INTO Customers (name, email, phone) VALUES (%s, %s, %s);",
            (data['name'], data['email'], data['phone'])
        )
        conn.commit()
        cursor.close()
        return jsonify({"message": "Customer added successfully"}), 201
    except Exception as err:
        print(f"Database error is: {err}")
        return jsonify({"error": "Database error"}), 500

@api_bp.route('/customers/<int:customer_id>', methods=['PUT'])
def update_customer(customer_id):
    """Update an existing customer."""
    data = request.get_json()
    try:
        conn = get_db_connection()
        cursor = conn.cursor()
        cursor.execute(
            "UPDATE Customers SET name = %s, email = %s, phone = %s WHERE id = %s;",
            (data['name'], data['email'], data['phone'], customer_id)
        )
        conn.commit()
        cursor.close()
        return jsonify({"message": "Customer updated successfully"}), 200
    except Exception as err:
        print(f"Database error is: {err}")
        return jsonify({"error": "Database error"}), 500

@api_bp.route('/customers/<int:customer_id>', methods=['DELETE'])
def delete_customer(customer_id):
    """Delete a customer."""
    try:
        conn = get_db_connection()
        cursor = conn.cursor()
        cursor.execute("DELETE FROM Customers WHERE id = %s;", (customer_id,))
        conn.commit()
        cursor.close()
        return jsonify({"message": "Customer deleted successfully"}), 200
    except Exception as err:
        print(f"Database error is: {err}")
        return jsonify({"error": "Database error"}), 500
