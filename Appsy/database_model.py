from flask_sqlalchemy import SQLAlchemy, Model
from app import oracle_database


class Patient(oracle_database.Model):
    __tablename__ = 'patient'
    email = oracle_database.Column(oracle_database.String(50), primary_key=True)
    nom = oracle_database.Column(oracle_database.String(50), nullable=False)
    prenom = oracle_database.Column(oracle_database.String(50), nullable=False)
    age = oracle_database.Column(oracle_database.Integer, nullable=False)
    adresse = oracle_database.Column(oracle_database.String(128), nullable=False)
    connaissance = oracle_database.Column(oracle_database.String(30), nullable=False)
    classification = oracle_database.Column(oracle_database.String(10), nullable=False)

    id_profession = oracle_database.Column(oracle_database.Integer, oracle_database.ForeignKey('profession.id'),
    nullable=False)

    def __repr__(self):
        return "<Patient(email='%s', nom='%s', prenom='%s', age='%d', \
                    adresse='%', connaissance='%s', classification='%s')>" \
                    % (self.email, self.nom, self.prenom, self.age,
                       self.adresse, self.connaissance, self.classification)


class Profession(oracle_database.Model):
    __tablename__ = 'profession'
    id_profession = oracle_database.Column(oracle_database.Integer, primary_key=True)
    profession = oracle_database.Column(oracle_database.String(50), nullable=False)

    def __repr__(self):
        return "<Profession(id='%d', Nom='%s')>" % (self.id_profession, self.profession)
