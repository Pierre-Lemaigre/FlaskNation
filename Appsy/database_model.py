from flask_sqlalchemy import SQLAlchemy, Model
from datetime import datetime
from app import database


a_exerce = database.Table('historique_profession',
                          database.Column('id_profession', database.ForeignKey('profession.id_profession'), primary_key=True),
                          database.Column('email', database.ForeignKey('patient.email'), primary_key=True))


seances = database.Table('seances',
                         database.Column('id_consultation', database.ForeignKey('consultation.id_consultation'), primary_key=True),
                         database.Column('email', database.ForeignKey('patient.email'), primary_key=True))


class Patient(database.Model):
    __tablename__ = 'patient'
    email = database.Column(database.String(50), primary_key=True)
    mot_de_passe = database.Column(database.String(50))
    nom = database.Column(database.String(50), nullable=False)
    prenom = database.Column(database.String(50), nullable=False)
    age = database.Column(database.Integer, nullable=False)
    adresse = database.Column(database.String(128), nullable=False)
    connaissance = database.Column(database.String(30), nullable=False)
    classification = database.Column(database.String(10), nullable=False)
    id_profession = database.Column(database.Integer, database.ForeignKey('profession.id'),
                                    nullable=False)
    historique_profession = database.relationship('Profession', secondary=a_exerce,
                                                  backref=database.backref('a_exerce', lazy='dynamic'))
    historique_seance = database.relationship('Consultation', secondary=seances,
                                              backref=database.backref('Seance', lazy='dynamic'))

    def __repr__(self):
        return "<Patient(email='%s', nom='%s', prenom='%s', age='%d', \
                    adresse='%', connaissance='%s', classification='%s')>" \
                    % (self.email, self.nom, self.prenom, self.age,
                       self.adresse, self.connaissance, self.classification)


class Profession(database.Model):
    __tablename__ = 'profession'
    id_profession = database.Column(database.Integer, primary_key=True)
    profession = database.Column(database.String(50), nullable=False)

    def __repr__(self):
        return "<Profession(id='%d', Nom='%s')>" % (self.id_profession, self.profession)


class Creneau_horaire(database.Model):
    __tablename__ = 'creneau_horaire'
    id_creneau_horaire = database.Column(database.Integer, primary_key=True)
    heure_debut_creneau = database.Column(database.Integer, nullable=False)
    heure_fin_creneau = database.Column(database.Integer, nullable=False)
    jour_de_la_semaine = database.Column(database.Integer, nullable=False)

    def __repr__(self):
        return "<Creneau_horaire(date_debut_creneau='%d',\
            date_fin_creneau='%d', jour_de_la_semaine='%s')>" % \
            (self.date_debut_creneau, self.date_fin_creneau,
             self.jour_de_la_semaine)


class Consultation(database.Model):
    __tablename__ = 'consultation'
    id_consultation = database.Column(database.Integer, primary_key=True)
    date_consultation = database.Column(database.DateTime, default=datetime.utcnow, nullable=False)
    comportement = database.Column(database.String(20), nullable=False)
    remarque = database.Column(database.String(200), nullable=False)
    anxiete = database.Column(database.Integer, nullable=False)
    posture = database.Column(database.String(20), nullable=False)
    id_creneau_horaire = database.Column(database.Integer, database.ForeignKey='creneau_horaire.id_creneau_horaire',nullable=False)

    def __repr__(self):
        return "<Consultation(date_consultation='%')>" % ()
