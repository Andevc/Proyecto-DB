from flask import Flask

def create_app():
    app = Flask(__name__)
    app.secret_key = "clave_secreta_para_flask"

    from src.routes import (
        admin_routes, api_dashborad,auth_routes, misc_routes, movie_routes, 
        session_routes, shopping_routes, user_routes
    )

    app.register_blueprint(admin_routes.bp)
    app.register_blueprint(api_dashborad.bp)
    app.register_blueprint(auth_routes.bp)
    app.register_blueprint(misc_routes.bp)
    app.register_blueprint(movie_routes.bp)
    app.register_blueprint(session_routes.bp)
    app.register_blueprint(shopping_routes.bp)
    app.register_blueprint(user_routes.bp)

    return app