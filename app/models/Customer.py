class Customer:
    def __init__(self, id, name, user_type, telephone=None, email=None):
        self.id = id
        self.name = name
        self.user_type = user_type
        self.telephone = telephone
        self.email = email

    def __repr__(self):
        return f"<Customer {self.id} {self.name}>"