from flask import Flask, render_template, request, session, redirect, url_for, make_response
from flask_breadcrumbs import Breadcrumbs, register_breadcrumb
from flask_bootstrap import Bootstrap
from datetime import datetime

from flask_login import LoginManager, login_user, login_required, current_user, logout_user

from User import User

app = Flask(__name__)

# For Bootstrap
Bootstrap(app)

# For breadcrumbs
Breadcrumbs(app=app)

# For sessions
app.secret_key = "cPG38`t'\*-["  # any secret key

# For login
login_manager = LoginManager()
login_manager.init_app(app)

# TODO
users = [
    dict(id=0, username="Arnaud", password="Test"),
    dict(id=1, username="admin", password="admin")
]


def check_user(id):
    for row in users:
        if row['id'] == int(id):
            return User(row["id"], row["username"], row["password"])

    return None


def is_password_valid(username, password):
    for row in users:
        if row["username"] == username and row["password"] == password:
            return True

    return False


def custom_render_template(the_render_template):
    return after_request(make_response(the_render_template))


# Ensure responses aren't cached
@app.after_request
def after_request(response):
    response.headers["Cache-Control"] = "no-cache, no-store, must-revalidate"
    return response


@login_manager.user_loader
def load_user(id):
    return check_user(id)


@app.context_processor
def inject_now():
    return dict(now=datetime.now())


@app.errorhandler(404)
def page_not_found(error):
    return custom_render_template(render_template('errors/404.html')), 404


@app.route('/', methods=['POST', 'GET'])
def go_to_connection():
    logout_user()
    if request.method == 'POST':
        username = request.form['user']
        password = request.form['password']

        # Todo
        if is_password_valid(username, password):
            login_user(User(0, username, password))
            next = request.args.get('next')
            return redirect(next or url_for('go_to_home'))
        else:
            return custom_render_template(
                render_template('pages/connection.html', error="Mot de passe et/ou nom d'utilisateur invalid"))
    else:
        return custom_render_template(render_template('pages/connection.html'))


@app.route('/Accueil')
@login_required
@register_breadcrumb(app, '.', 'Accueil')
def go_to_home():
    if current_user.username == "admin":
        return custom_render_template(render_template('pages/home_psy.html'))
    else:
        return custom_render_template(render_template('pages/home_patient.html'))


@app.route('/Rendez-vous_passes')
@login_required
@register_breadcrumb(app, '.Accueil', 'Rendez-vous passés')
def go_to_past_appointments():
    return custom_render_template(render_template('pages/past_appointments_patient.html'))


@app.route('/Rendez-vous_futurs')
@login_required
@register_breadcrumb(app, '.Accueil.', 'Rendez-vous futurs')
def go_to_upcoming_appointments():
    return custom_render_template(render_template('pages/upcoming_appointments_patient.html'))


@app.route('/Deconnexion')
@login_required
def logout():
    logout_user()
    return redirect(url_for('go_to_connection'))


@login_manager.unauthorized_handler
def unauthorized():
    return go_to_connection()


@app.route('/coming_soon')
def coming_soon():
    return custom_render_template(render_template('pages/coming_soon.html'))


if __name__ == '__main__':
    app.run()
