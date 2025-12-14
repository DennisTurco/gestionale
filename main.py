import threading
import webview
from app import create_app
from database.setup import run_migrations

def start_flask(app):
    app.run(host="127.0.0.1", port=5000, debug=False)

if __name__ == "__main__":
    app = create_app()

    # run migrations
    run_migrations()

    # Start Flask in a separate thread
    threading.Thread(target=start_flask, args=(app,), daemon=True).start()

    api = app.api
    webview.create_window(
        title="Management",
        url="http://127.0.0.1:5000",
        js_api=api,
    )

    webview.start()

