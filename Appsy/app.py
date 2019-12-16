from flask import Flask, render_template, request
from flask_bootstrap import Bootstrap
from datetime import  datetime

app = Flask(__name__)
Bootstrap(app)

@app.context_processor
def inject_now():
    return dict(now=datetime.now())

@app.errorhandler(404)
def pageNotFound(erreur):
    return render_template('errors/404.html'), 404

@app.route('/')
def goToConnection():
    return render_template('pages/connection.html')

@app.route('/home', methods=['POST'])
def goToHome():
    user = request.form['user']
    if(user == "admin"):
        return render_template('pages/home_psy.html')
    else:
        return render_template('pages/home_patient.html', user=user)

if __name__ == '__main__':
    app.run()