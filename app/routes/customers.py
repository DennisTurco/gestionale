from flask import Blueprint, render_template

from app.repositories.CustomerRepository import CustomerRepository

bp = Blueprint("customers", __name__, url_prefix="/customers")

@bp.route("/")
def customers():
    data = CustomerRepository.get_all_customers()
    return render_template("customers.html", customers=data, active_page="customers")
