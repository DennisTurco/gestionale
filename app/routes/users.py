from flask import Blueprint, render_template

from app.repositories.UserRepository import UserRepository

bp = Blueprint("users", __name__, url_prefix="/users")

@bp.route("/")
def users():
    data = UserRepository.get_all_users()
    return render_template("users.html", users=data, active_page="users")
