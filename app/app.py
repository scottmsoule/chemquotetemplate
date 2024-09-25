from flask import Flask, render_template
from app.db import get_db_connection
from api import api_bp
import logging

logging.basicConfig(level=logging.INFO)

app = Flask(__name__)

# Register the API blueprint
app.register_blueprint(api_bp, url_prefix='/api')

@app.before_request
def before_request():
    """Create a new database connection before each request."""
    app.db_connection = get_db_connection()

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/contact-manager')
def contact_manager():
    return render_template('contact_manager.html') 

@app.teardown_appcontext
def close_db_connection(exception):
    """Close database connection at the end of the request."""
    db_conn = getattr(app, 'db_connection', None)
    if db_conn:
        db_conn.close()

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
