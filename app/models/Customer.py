class Customer:
    def __init__(self, id, name, surname, user_type, telephone=None, email=None):
        self.id = id
        self.name = name
        self.surname = surname
        self.user_type = user_type
        self.telephone = telephone
        self.email = email

    def __repr__(self):
        return f"<Customer {self.id} {self.name}>"