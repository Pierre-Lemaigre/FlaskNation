import locale

from flask import Flask, render_template, request, redirect, url_for, make_response
from flask_bootstrap import Bootstrap
from flask_breadcrumbs import Breadcrumbs, register_breadcrumb
from flask_login import LoginManager, login_user, login_required, current_user, logout_user

import Connection
from CalendarManager import *

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

# For calendar
calendar_manager = CalendarManager()
locale.setlocale(locale.LC_ALL, 'fr_FR.utf8')

# Virtual BD
next_consultation = dict(id=0, date="2019-12-27", hour="14h30", anxiety=2, payment="Carte", pice=45, type="Mr",
                         forename="Antoine", name="Dupond")

list_patient = [
    dict(id=0, type="Mr", forename="Antoine", name="Dupond", birthDate="1998-09-30", knowing=0, relationship=1,
         profession=0),
    dict(id=1, type="Mme", forename="Eva", name="Dupond", birthDate="1997-03-21", knowing=1, relationship=0,
         profession=1),
    dict(id=2, type="Enfant", forename="Tom", name="Dupond", birthDate="2019-02-02", knowing=1, relationship=-1,
         profession=2)
]

list_profession = [
    dict(id=0, label="Boucher"),
    dict(id=1, label="Electricien"),
    dict(id=2, label="Etudiant")
]

day_slots = [
    dict(id=0, label="8h00 - 8h30"),
    dict(id=1, label="8h30 - 9h00"),
    dict(id=4, label="9h30 - 10h00"),
    dict(id=9, label="14h00 - 14h30"),
    dict(id=10, label="14h30 - 15h00"),
    dict(id=18, label="19h30 - 20h00"),
]

list_consultations_day = [
    dict(id=0, date="2019-12-27", hour="14h30", anxiety=2, type=0, payment="Carte", pice=45, participant=0),
    dict(id=1, date="2019-12-27", hour="10h00", anxiety=5, type=1, payment="Chèque", pice=30, participant=1),
    dict(id=2, date="2019-12-27", hour="16h30", anxiety=8, type=2, payment="Cash", pice=45, participant=2),
    dict(id=3, date="2019-12-27", hour="19h30", anxiety=10, type=0, payment="Carte", pice=45, participant=0),
]

list_consultations_week = [
    dict(day=0, date="2019-12-23", list_consultations_day=list_consultations_day),
    dict(day=1, date="2019-12-24", list_consultations_day=list_consultations_day),
    dict(day=2, date="2019-12-25", list_consultations_day=list_consultations_day),
    dict(day=3, date="2019-12-26", list_consultations_day=list_consultations_day),
    dict(day=4, date="2019-12-27", list_consultations_day=list_consultations_day),
    dict(day=5, date="2019-12-28", list_consultations_day=list_consultations_day),
]

list_consultations_patient = [
    dict(id=0, date="2020-01-01", hour="14h30", anxiety=2, type=0, payment="Carte", pice=45, participant=1),
    dict(id=1, date="2020-02-02", hour="10h00", anxiety=5, type=1, payment="Chèque", pice=30, participant=1),
    dict(id=2, date="2020-03-03", hour="16h30", anxiety=8, type=2, payment="Cash", pice=45, participant=1),
    dict(id=3, date="2020-04-04", hour="19h30", anxiety=10, type=0, payment="Carte", pice=45, participant=0),
]

list_payment_method = [
    dict(id=0, label="Carte"),
    dict(id=1, label="Chèque"),
    dict(id=2, label="Cash")
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


@app.errorhandler(404)
def page_not_found(error):
    return custom_render_template(render_template('errors/404.html')), 404


@app.context_processor
def utility_processor():
    def format_date(date_to_format):
        if not isinstance(date_to_format, date):
            date_to_format = date.fromisoformat(date_to_format)

        return date_to_format.strftime("%A %d %B %Y")

    return dict(format_date=format_date)


@app.context_processor
def utility_processor():
    def get_today_date():
        return str(calendar_manager.get_today())

    return dict(today=get_today_date)


@app.context_processor
def utility_processor():
    def get_list_payment_method():
        # Todo get payment method from DB
        return list_payment_method

    return dict(get_list_payment_method=get_list_payment_method)


@app.context_processor
def utility_processor():
    def get_list_patient():
        # Todo get patient from DB
        return list_patient

    return dict(get_list_patient=get_list_patient)


@app.context_processor
def utility_processor():
    def get_list_profession():
        # Todo get profession from DB
        return list_profession

    return dict(get_list_profession=get_list_profession)


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
        return custom_render_template(render_template('pages/home_psy.html', next_consultation=next_consultation))
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
        profession1 = request.form['profession1']
        profession2 = request.form['profession2']
        profession3 = request.form['profession3']
        profession4 = request.form['profession4']
        profession5 = request.form['profession5']

        return redirect(url_for('go_to_home'))
    else:
        return custom_render_template(
            render_template('pages/add_patient.html'))


@app.route('/Recherche patient', methods=['POST', 'GET'])
@login_required
@register_breadcrumb(app, '.Accueil.', 'Rechercher patient')
def go_to_search_patient():
    if request.method == 'POST':

        # TODO Search
        search = request.form['search']

        return custom_render_template(render_template('pages/search_patient.html'))
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
        return render_template('pages/view_update_patient.html',
                               patient=find_patient(id))


@app.route('/Supprimer patient/<int:id>', methods=['POST'])
@login_required
def delete_patient(id):
    # TODO Delete id
    return redirect(url_for('go_to_home'))


@app.route('/Ajout consultation', methods=['POST', 'GET'])
@login_required
@register_breadcrumb(app, '.Accueil', 'Ajout consultation')
def go_to_add_consultation():
    if request.method == 'POST':

        # TODO Get day_slots
        wanted_date = request.form['wanted_date']
        consultation_type = int(request.form['consultation_type'])
        participants1 = int(request.form['participants1'])
        participants2 = int(request.form['participants2'])
        participants3 = int(request.form['participants3'])
        participants = [participants1, participants2, participants3]

        # TODO if consultation_type = 1 (consult de couple) get participants2 (girlfriend/boyfriend)

        data = dict(wanted_date=wanted_date, consultation_type=consultation_type, participants=participants)

        return custom_render_template(
            render_template('pages/add_consultation.html', data=data, day_slots=day_slots))
    else:
        return custom_render_template(render_template('pages/add_consultation.html'))


@app.route('/add_consultation', methods=['POST', 'GET'])
@login_required
def add_consultation():
    if request.method == 'POST':
        # TODO Add consultation
        data = request.form['data']
        id_time_slot = request.form['id_time_slot']

        return redirect(url_for('go_to_home'))


@app.route('/Consulter/<int:id>', methods=['POST', 'GET'])
@login_required
# @register_breadcrumb(app, '.Accueil', 'Consulter')
def go_to_consulter(id):
    if request.method == 'POST':

        if 'id_consultation' in request.form:

            # Todo Get next consult
            id_consultation = request.form['id_consultation']
            return custom_render_template(
                render_template('pages/consulter.html', next_consultation=next_consultation))
        else:

            # TODO Post consultation
            id_consultation = id
            anxiety = request.form['anxiety']
            payment = request.form['payment']
            price = request.form['price']
            keywords = request.form['keywords']
            behaviors = request.form['behaviors']
            postures = request.form['postures']

            return redirect(url_for('go_to_home'))
    else:
        return redirect(url_for('go_to_home'))


@app.route('/Mes consultations/<int:sort>/<int:nav>', methods=['POST', 'GET'])
@login_required
@register_breadcrumb(app, '.Accueil.a', 'Mes consultations')
def go_to_view_consultations(sort, nav):
    # TODO Get consultation
    if request.method == 'POST':

        id_patient = int(request.form['id_patient'])

        return custom_render_template(
            render_template('pages/view_consultations.html', list_consultations_patient=list_consultations_patient,
                            id_patient=id_patient, sort=sort))
    else:
        if sort == 0:
            if nav == 0:
                date = calendar_manager.get_today()
            elif nav == 1:
                date = calendar_manager.get_day_before()
            else:
                date = calendar_manager.get_next_day()

            return custom_render_template(
                render_template('pages/view_consultations.html', list_consultations_day=list_consultations_day,
                                sort=sort, date=date, nav=calendar_manager.get_day_offset()))
        elif sort == 1:
            if nav == 0:
                date = calendar_manager.get_week()
            elif nav == 1:
                date = calendar_manager.get_week_before()
            else:
                date = calendar_manager.get_next_week()

            return custom_render_template(
                render_template('pages/view_consultations.html', list_consultations_week=list_consultations_week,
                                sort=sort, date=date, nav=calendar_manager.get_week_offset()))
        else:
            return custom_render_template(
                render_template('pages/view_consultations.html', sort=sort))


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
