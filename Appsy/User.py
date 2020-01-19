from flask_login import UserMixin


# User object that extend UserMixin to provide a valid user object to the login_manager
class User(UserMixin):

    # Constructor
    def __init__(self, id, username, password):
        self.id = id
        self.username = username
        self.password = password

    # Getter
    def get(self):
        return self
