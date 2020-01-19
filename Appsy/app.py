import locale

from flask import Flask, render_template, request, redirect, url_for, make_response
from flask_bootstrap import Bootstrap
from flask_breadcrumbs import Breadcrumbs, register_breadcrumb
from flask_login import LoginManager, login_user, login_required, current_user, logout_user
from flask_sqlalchemy import SQLAlchemy

import Connection
from CalendarManager import *
from VirtualDatabase import *

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

# Oracle BD Configuration
app.config['SQLALCHEMY_DATABASE_URI'] = 'oracle://system:Pierrot123@0.0.0.0:1521/PSYAPP'
database = SQLAlchemy(app=app)


def find_patient(id):
    for row in list_patient:
        if row['id'] == id:
            return row


# Render template + Ensure responses aren't cached
def custom_render_template(the_render_template):
    return after_request(make_response(the_render_template))


# Ensure responses aren't cached
@app.after_request
def after_request(response):
    response.headers["Cache-Control"] = "no-cache, no-store, must-revalidate"
    return response


# Load the connected user (utils for the login_manager)
@login_manager.user_loader
def load_user(id):
    return Connection.get_user_by_id(id)


# Handle the 404 Page not found error
@app.errorhandler(404)
def page_not_found(error):
    return custom_render_template(render_template('errors/404.html')), 404


# Utils to format a date to a "day day-number month year" format
@app.context_processor
def utility_processor():
    def format_date(date_to_format):
        if not isinstance(date_to_format, date):
            date_to_format = date.fromisoformat(date_to_format)

        return date_to_format.strftime("%A %d %B %Y")

    return dict(format_date=format_date)


# Utils to get today's date
@app.context_processor
def utility_processor():
    def get_today_date():
        return str(calendar_manager.get_today())

    return dict(today=get_today_date)


# Utils to get the list of all payment methods available
@app.context_processor
def utility_processor():
    def get_list_payment_method():
        # Todo get payment method from DB
        return list_payment_method

    return dict(get_list_payment_method=get_list_payment_method)


# Utils to get the list of all patient
@app.context_processor
def utility_processor():
    def get_list_patient():
        # Todo get patient from DB
        return list_patient

    return dict(get_list_patient=get_list_patient)


# Utils to get the list of all profession available
@app.context_processor
def utility_processor():
    def get_list_profession():
        # Todo get profession from DB
        return list_profession

    return dict(get_list_profession=get_list_profession)


# Utils to get the data of the current user
@app.context_processor
def utility_processor():
    def get_data_current_user():
        return find_patient(current_user.id)

    return dict(get_data_current_user=get_data_current_user)


# Manage connection process
@app.route('/', methods=['POST', 'GET'])
def go_to_connection():
    # By default lout the current user
    logout_user()

    # Try to login with username and password provided
    if request.method == 'POST':
        username = request.form['user']
        password = request.form['password']

        # Construct a User object if the username and password are valid
        user = Connection.get_user(username, password)

        # If connection element ok
        if user is not None:
            login_user(user)
            next = request.args.get('next')
            return redirect(next or url_for('go_to_home'))

        # If invalid username or password
        else:
            return custom_render_template(
                render_template('pages/connection.html', error="Mot de passe et/ou nom d'utilisateur invalid"))

    # First access
    else:
        return custom_render_template(render_template('pages/connection.html'))


# Display the home page
@app.route('/Accueil')
@login_required
@register_breadcrumb(app, '.', 'Accueil')
def go_to_home():
    # If connect as Psy
    if current_user.username == "admin":
        return custom_render_template(render_template('pages/home_psy.html', next_consultation=next_consultation))

    # If connect as patient
    else:
        return custom_render_template(render_template('pages/home_patient.html'))


# Display past appointments (for patient)
@app.route('/Rendez-vous_passes')
@login_required
@register_breadcrumb(app, '.Accueil.', 'Rendez-vous passés')
def go_to_past_appointments():
    return custom_render_template(render_template('pages/past_appointments_patient.html'))


# Display upcoming appointments (for patient)
@app.route('/Rendez-vous_futurs')
@login_required
@register_breadcrumb(app, '.Accueil.', 'Rendez-vous futurs')
def go_to_upcoming_appointments():
    return custom_render_template(render_template('pages/upcoming_appointments_patient.html'))


# Manage the adding of a new patient
@app.route('/Ajouter patient', methods=['POST', 'GET'])
@login_required
@register_breadcrumb(app, '.Accueil.', 'Ajouter patient')
def go_to_add_patient():
    # Save the new patient
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
        mail = request.form['mail']
        password = request.form['password']

        return redirect(url_for('go_to_home'))

    # Display adding patient page
    else:
        return custom_render_template(
            render_template('pages/add_patient.html'))


# Display the searched patient or the page to search a patient
@app.route('/Recherche patient', methods=['POST', 'GET'])
@login_required
@register_breadcrumb(app, '.Accueil.', 'Rechercher patient')
def go_to_search_patient():
    # If a search as been made
    if request.method == 'POST':

        # TODO Search
        search = request.form['search']

        return custom_render_template(
            render_template('pages/search_patient.html', match_patient=list_patient))

    else:
        return custom_render_template(render_template('pages/search_patient.html'))


# Manage the search or update of a patient
@app.route('/Afficher Modifier Patient/<int:id>', methods=['POST', 'GET'])
@login_required
@register_breadcrumb(app, '.Accueil.Rechercher patient.', 'Afficher - Modifier Patient')
def go_to_view_update_patient(id):
    # Update the patient's data
    if request.method == 'POST':

        # TODO Update
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
        mail = request.form['mail']
        password = request.form['password']

        # if password is not "":
        # Todo change password

        return redirect(url_for('go_to_home'))

    # Display the specified patient
    else:
        return render_template('pages/view_update_patient.html',
                               patient=find_patient(id))


# Delete a patient
@app.route('/Supprimer patient/<int:id>', methods=['POST'])
@login_required
def delete_patient(id):
    # TODO Delete id
    return redirect(url_for('go_to_home'))


# Manage the adding of a new consultation
@app.route('/Ajout consultation', methods=['POST', 'GET'])
@login_required
@register_breadcrumb(app, '.Accueil', 'Ajout consultation')
def go_to_add_consultation():
    # Setting up the new consultation
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
    # Go save the new consultation
    else:
        return custom_render_template(render_template('pages/add_consultation.html'))


# Save the new consultation
@app.route('/add_consultation', methods=['POST', 'GET'])
@login_required
def add_consultation():
    if request.method == 'POST':

        # TODO Add consultation
        data = request.form['data']
        id_time_slot = request.form['id_time_slot']

        return redirect(url_for('go_to_home'))

    # An error as occurred
    else:
        return redirect(url_for('go_to_home'))


# Manage the consulting form actions
@app.route('/Consulter/<int:id>', methods=['POST', 'GET'])
@login_required
# @register_breadcrumb(app, '.Accueil', 'Consulter')
def go_to_consulter(id):
    if request.method == 'POST':

        # Display the consulting form
        if 'id_consultation' in request.form:

            # Todo Get next consult
            id_consultation = request.form['id_consultation']

            return custom_render_template(
                render_template('pages/consulter.html', next_consultation=next_consultation))

        # Save consultation
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

    # An error as occurred
    else:
        return redirect(url_for('go_to_home'))


# Display the past/today/upcoming consultations
@app.route('/Mes consultations/<int:sort>/<int:nav>', methods=['POST', 'GET'])
@login_required
@register_breadcrumb(app, '.Accueil.a', 'Mes consultations')
def go_to_view_consultations(sort, nav):
    # TODO Get consultation

    # If a patient is specified
    if request.method == 'POST':

        id_patient = int(request.form['id_patient'])

        return custom_render_template(
            render_template('pages/view_consultations.html', list_consultations_patient=list_consultations_patient,
                            id_patient=id_patient, sort=sort))
    else:

        # If consultations are displayed by days
        if sort == 0:

            # Go to today
            if nav == 0:
                date = calendar_manager.get_today()

            # Go to earlier days
            elif nav == 1:
                date = calendar_manager.get_day_before()

            # Go to latter days
            else:
                date = calendar_manager.get_next_day()

            return custom_render_template(
                render_template('pages/view_consultations.html', list_consultations_day=list_consultations_day,
                                sort=sort, date=date, nav=calendar_manager.get_day_offset()))

        # If consultations are displayed by weeks
        elif sort == 1:

            # Go to current week
            if nav == 0:
                date = calendar_manager.get_week()

            # Go to earlier weeks
            elif nav == 1:
                date = calendar_manager.get_week_before()

            # Go to latter weeks
            else:
                date = calendar_manager.get_next_week()

            return custom_render_template(
                render_template('pages/view_consultations.html', list_consultations_week=list_consultations_week,
                                sort=sort, date=date, nav=calendar_manager.get_week_offset()))

        # If consultations are displayed by patient (awaiting a specific patient)
        else:
            return custom_render_template(
                render_template('pages/view_consultations.html', sort=sort))


# To logout the current user
@app.route('/Deconnexion')
@login_required
def logout():
    logout_user()
    return redirect(url_for('go_to_connection'))


# Handle the case the user access to an unauthorized page
@login_manager.unauthorized_handler
def unauthorized():
    return redirect(url_for('go_to_connection'))


# Display the coming soon page
@app.route('/coming_soon')
def coming_soon():
    return custom_render_template(render_template('pages/coming_soon.html'))


# Run the app
if __name__ == '__main__':
    app.run(debug=True)
