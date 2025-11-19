from flask import Flask

def create_app():
    app = Flask(__name__)

    # Route Home
    from app.routes.main import bp as main_bp
    app.register_blueprint(main_bp)

    # Route Customer
    from app.routes.clienti import bp as clienti_bp
    app.register_blueprint(clienti_bp)

    # API PyWebView
    from app.api import Api
    app.api = Api()

    return app
