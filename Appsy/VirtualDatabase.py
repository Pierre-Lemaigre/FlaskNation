# Virtual BD
list_patient = [
    dict(id=0, type="Mr", forename="Antoine", name="Dupond", birthDate="1998-09-30", knowing=0, relationship=1,
         profession=0, username="Antoine.Dupond@gmail.com",
         password="$pbkdf2-sha256$200000$J6T0Psf4nzMmxJiTklIqxQ$NBOTvTX5H3NnVwkh0ebcDZtRAdv7cRrpTc1fEOVsYaU"),
    dict(id=1, type="Mme", forename="Eva", name="Dupond", birthDate="1997-03-21", knowing=1, relationship=0,
         profession=1, username="Eva.Dupond@gmail.com",
         password="$pbkdf2-sha256$200000$J6T0Psf4nzMmxJiTklIqxQ$NBOTvTX5H3NnVwkh0ebcDZtRAdv7cRrpTc1fEOVsYaU"),
    dict(id=2, type="Enfant", forename="Tom", name="Dupond", birthDate="2019-02-02", knowing=1, relationship=-1,
         profession=2, username="Tom.Dupond@gmail.com",
         password="$pbkdf2-sha256$200000$J6T0Psf4nzMmxJiTklIqxQ$NBOTvTX5H3NnVwkh0ebcDZtRAdv7cRrpTc1fEOVsYaU")
]

next_consultation = dict(id=0, date="2019-12-27", hour="14h30", anxiety=2, payment="Carte", pice=45,
                         participants=[list_patient[0], list_patient[1]])
list_profession = [
    dict(id=0, label="Boucher"),
    dict(id=1, label="Electricien"),
    dict(id=2, label="Etudiant")
]

day_slots = [
    dict(id=0, h_debut="8h00", h_fin="8h30"),
    dict(id=1, h_debut="8h30", h_fin="9h00"),
    dict(id=4, h_debut="9h30", h_fin="10h00"),
    dict(id=9, h_debut="14h00", h_fin="14h30"),
    dict(id=10, h_debut="14h30", h_fin="15h00"),
    dict(id=18, h_debut="19h30", h_fin="20h00"),
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
