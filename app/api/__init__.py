from flask import Blueprint

api_bp = Blueprint('api', __name__)

from . import contacts  # or other route files
from . import customers
