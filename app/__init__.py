from flask import Flask

def create_app():
    app = Flask(__name__)

    # Route Home
    from app.routes.main import bp as main_bp
    app.register_blueprint(main_bp)

    # Error Handlers
    from app.routes import error_page
    error_page.register_error_handlers(app)

    # Route Customer
    from app.routes.customers import bp as customers_bp
    app.register_blueprint(customers_bp)

    # Route User
    from app.routes.users import bp as users_bp
    app.register_blueprint(users_bp)

    # API PyWebView
    from app.api import Api
    app.api = Api()

    return app
