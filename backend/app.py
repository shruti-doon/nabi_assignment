from flask import Flask, jsonify
from app.routes import appointment_routes, dummy_data_routes
from app.services.database_service import client
def create_app():
    app = Flask(__name__)
    app.register_blueprint(appointment_routes.appointment_bp)
    app.register_blueprint(dummy_data_routes.dummy_data_bp)
    # Health check route
    @app.route('/api/health', methods=['GET'])
    def health_check():
        try:
            # Ping the MongoDB server to check the connection
            client.admin.command('ping')
            return jsonify({"status": "healthy", "message": "Connected to MongoDB!"})
        except Exception as e:
            return jsonify({"status": "unhealthy", "message": str(e)}), 500
    return app

app = create_app()

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=5000, debug=True)