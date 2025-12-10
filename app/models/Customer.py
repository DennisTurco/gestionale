class Customer:
    def __init__(self, id, type, business_name, name, surname, phone, email, vat_number, tax_code, address, city, province, region, country, landline, lat, lon):
        self.id = id
        self.business_name = business_name
        self.name = name
        self.surname = surname
        self.type = type
        self.phone = phone
        self.email = email
        self.vat_number = vat_number
        self.tax_code = tax_code
        self.address = address
        self.city = city
        self.province = province
        self.region = region
        self.country = country
        self.landline = landline
        self.lat = lat
        self.lon = lon

    def __repr__(self):
        return f"<Customer {self.id} {self.name}>"