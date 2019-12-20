from flask import Flask, render_template, request, session, redirect, url_for, Blueprint
from flask_breadcrumbs import Breadcrumbs, register_breadcrumb, default_breadcrumb_root
from flask_bootstrap import Bootstrap
from datetime import datetime
from connection import Connection

app = Flask(__name__)

# For Bootstrap
Bootstrap(app)

# For breadcrumbs
Breadcrumbs(app=app)

# accueil = Blueprint('accueil', __name__, url_prefix='/Accueil')
# default_breadcrumb_root(accueil, '.')

# For sessions
app.secret_key = "cPG38`t'\*-["  # any secret key


@app.context_processor
def inject_now():
    return dict(now=datetime.now())


@app.errorhandler(404)
def page_not_found(error):
    return render_template('errors/404.html'), 404


@app.route('/', methods=['POST', 'GET'])
def go_to_connection():
    if request.method == 'POST':
        user = request.form['user']
        password = request.form['password']
        if Connection.is_password_valid(user, password):
            session['username'] = user
            return redirect(url_for('go_to_home'))
        else:
            return render_template('pages/connection.html', error="Mot de passe et/ou nom d'utilisateur invalid")
    else:
        return render_template('pages/connection.html')


@app.route('/Accueil')
@register_breadcrumb(app, '.', 'Accueil')
def go_to_home():
    if 'username' in session:
        if session['username'] == "admin":
            return render_template('pages/home_psy.html')
        else:
            return render_template('pages/home_patient.html', user=session['username'])
    else:
        return redirect(url_for('go_to_connection'))


@app.route('/Rendez-vous_passes')
@register_breadcrumb(app, '.Accueil', 'Rendez-vous passés')
def go_to_past_appointments():
    return render_template('pages/past_appointments_patient.html')


@app.route('/Rendez-vous_futurs')
@register_breadcrumb(app, '.Accueil.', 'Rendez-vous futurs')
def go_to_upcoming_appointments():
    return render_template('pages/upcoming_appointments_patient.html')


@app.route('/Deconnexion')
def logout():
    session.pop('username', None)
    return redirect(url_for('go_to_connection'))


@app.route('/coming_soon')
def coming_soon():
    return render_template('pages/coming_soon.html')


if __name__ == '__main__':
    app.run()
