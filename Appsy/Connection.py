from User import User


# TODO
def virtual_bd():
    users = [
        dict(id=0, username="Arnaud", password="Test"),
        dict(id=1, username="admin", password="admin")
    ]
    return users


def crypt_password(plain_password):
    # TODO
    return plain_password


def is_password_valid(plain_password, encrypt_password):
    return crypt_password(plain_password) == encrypt_password


# TODO
def get_user_from_virtual_bd(username):
    for row in virtual_bd():
        if row['username'] == username:
            return User(row["id"], row["username"], row["password"])


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

    id = user.id
    encrypt_password = user.password

    if is_password_valid(plain_password, encrypt_password):
        return User(id, username, encrypt_password)
    else:
        return None
