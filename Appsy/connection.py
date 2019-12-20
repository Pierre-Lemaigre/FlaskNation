class Connection:

    @classmethod
    def is_password_valid(cls, username, password):
        try:
            users = {"Arnaud": "Test", "admin": "admin"}
            return password == users[username]
        except KeyError:
            pass
