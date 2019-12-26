from flask import Flask, render_template, request, redirect, url_for, make_response
from flask_breadcrumbs import Breadcrumbs, register_breadcrumb
from flask_bootstrap import Bootstrap
from datetime import datetime

from flask_login import LoginManager, login_user, login_required, current_user, logout_user

import Connection
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

list_patient = [
    dict(id=0, type="Mr", forename="Antoine", name="Dupond", birthDate="1998-09-30", knowing=0, relationship=1,
         profession=0),
    dict(id=1, type="Mme", forename="Eva", name="Dupond", birthDate="1997-03-21", knowing=1, relationship=0,
         profession=1),
    dict(id=3, type="Enfant", forename="Tom", name="Dupond", birthDate="2019-02-02", knowing=1, relationship=-1,
         profession=2)
]


def find_patient(id):
    for row in list_patient:
        if row['id'] == id:
            return row


def custom_render_template(the_render_template):
    return after_request(make_response(the_render_template))


# Ensure responses aren't cached
@app.after_request
def after_request(response):
    response.headers["Cache-Control"] = "no-cache, no-store, must-revalidate"
    return response


@login_manager.user_loader
def load_user(id):
    return Connection.get_user_by_id(id)


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

        user = Connection.get_user(username, password)
        if user is not None:
            login_user(user)
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
@register_breadcrumb(app, '.Accueil.', 'Rendez-vous passés')
def go_to_past_appointments():
    return custom_render_template(render_template('pages/past_appointments_patient.html'))


@app.route('/Rendez-vous_futurs')
@login_required
@register_breadcrumb(app, '.Accueil.', 'Rendez-vous futurs')
def go_to_upcoming_appointments():
    return custom_render_template(render_template('pages/upcoming_appointments_patient.html'))


@app.route('/Ajouter patient', methods=['POST', 'GET'])
@login_required
@register_breadcrumb(app, '.Accueil.', 'Ajouter patient')
def go_to_add_patient():
    if request.method == 'POST':

        # TODO Add patient
        name = request.form['name']
        type = request.form['type']
        relationship = request.form['relationship']
        forename = request.form['forename']
        birthDate = request.form['birthDate']
        knowing = request.form['knowing']
        profession = request.form['profession']

        return redirect(url_for('go_to_home'))
    else:
        return custom_render_template(render_template('pages/add_patient.html'))


@app.route('/Recherche patient', methods=['POST', 'GET'])
@login_required
@register_breadcrumb(app, '.Accueil.', 'Rechercher patient')
def go_to_search_patient():
    if request.method == 'POST':

        # TODO Search
        search = request.form['search']

        return custom_render_template(render_template('pages/search_patient.html', list_patient=list_patient))
    else:
        return custom_render_template(render_template('pages/search_patient.html'))


@app.route('/Afficher Modifier Patient/<int:id>', methods=['POST', 'GET'])
@login_required
@register_breadcrumb(app, '.Accueil.Rechercher patient.', 'Afficher - Modifier Patient')
def go_to_view_update_patient(id):
    if request.method == 'POST':

        # TODO Update
        type = request.form['type']
        relationship = request.form['relationship']
        profession = request.form['profession']

        return redirect(url_for('go_to_home'))
    else:
        return render_template('pages/view_update_patient.html', patient=find_patient(id))


@app.route('/Supprimer patient/<int:id>', methods=['POST'])
@login_required
def go_to_delete_patient(id):
    # TODO Delete id
    return redirect(url_for('go_to_home'))


@app.route('/Deconnexion')
@login_required
def logout():
    logout_user()
    return redirect(url_for('go_to_connection'))


@login_manager.unauthorized_handler
def unauthorized():
    return redirect(url_for('go_to_connection'))


@app.route('/coming_soon')
def coming_soon():
    return custom_render_template(render_template('pages/coming_soon.html'))


if __name__ == '__main__':
    app.run()
