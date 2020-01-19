from passlib.hash import pbkdf2_sha256
from User import User
from VirtualDatabase import list_patient


# TODO
def virtual_bd():
    users = list_patient
    users.append(dict(id=-1, username="admin",
                      password="$pbkdf2-sha256$200000$/z9HKAUgRCjlnDPGWEvJGQ$X9bvYVsmE2Z0lu9G9ONSJn7WnASJaHifqUVDPgDfe6Q"))
    return users


# Encrypt password
def crypt_password(plain_password):
    return pbkdf2_sha256.encrypt(plain_password, rounds=200000, salt_size=16)


# Return True if the plain_password is equals to encrypt_password, False else
def is_password_valid(plain_password, encrypt_password):
    return pbkdf2_sha256.verify(plain_password, encrypt_password)


# TODO
def get_user_from_virtual_bd(username):
    for row in virtual_bd():
        if row['username'] == username:
            return User(row["id"], row["username"], row["password"])
    return None


def get_user_by_id(id):
    # TODO
    # SELECT ID, USERNAME, PASSWORD FROM USERS WHERE ID = id
    for row in virtual_bd():
        if row['id'] == int(id):
            return User(row["id"], row["username"], row["password"])

    return None


def get_user(username, plain_password):
    # SELECT ID, USERNAME, PASSWORD FROM USERS WHERE USERNAME = username
    user = get_user_from_virtual_bd(username)

    if user is not None:

        id = user.id
        encrypt_password = user.password

        if is_password_valid(plain_password, encrypt_password):

            return User(id, username, encrypt_password)
        else:
            return None
    else:
        return None
