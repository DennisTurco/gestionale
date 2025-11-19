from flask import Blueprint, render_template

from app.models.Customer import Customer

bp = Blueprint("clienti", __name__, url_prefix="/clienti")

# ---- lista clienti fittizia ----
CUSTOMERS: list[Customer] = [
    Customer(1, "Mario Rossi", "Azienda", "+39 333 1234567", "mario@example.com"),
    Customer(2, "Luca Bianchi", "Privato", "+39 345 9988776", "luca@example.com"),
    Customer(3, "Tech Solutions SRL", "Ditta / PA", "+39 02 778899", "info@techsol.it")
]

@bp.route("/")
def lista_clienti():
    return render_template("clienti.html", clienti=CUSTOMERS)
