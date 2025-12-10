class User:
    def __init__(self, id, role, username, name, surname, email, password):
        self.id = id
        self.role = role
        self.username = username
        self.name = name
        self.surname = surname
        self.email = email
        self.password = password

    def __repr__(self):
        return f"<User {self.id} {self.username}>"