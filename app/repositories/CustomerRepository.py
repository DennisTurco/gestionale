from app.models.Customer import Customer
from database.database_config import DatabaseConfig

class CustomerRepository:
    
    @staticmethod
    def get_all_customers():
        conn = DatabaseConfig.get_connection()
        cur = conn.cursor()
        rows = cur.execute(
            '''
            SELECT 
                c.id,
                t.[name] AS type,
                c.business_name,
                c.[name],
                c.surname,
                c.phone, 
                c.email,
                c.vat_number,
                c.tax_code,
                c.[address],
                c.city,
                c.province,
                c.region,
                c.country,
                c.landline,
                c.lat,
                c.lon
            FROM 
                customers c 
                INNER JOIN customer_types t ON t.id = c.id_customer_type
            '''
            ).fetchall()
        conn.close()
        return [Customer(row["id"], row["type"], row["business_name"], row["name"], row["surname"], row["phone"], row["email"], row["vat_number"], row["tax_code"], row["address"], row["city"], row["province"], row["region"], row["country"], row["landline"], row["lat"], row["lon"]) for row in rows]
    
    @staticmethod
    def delete_customer(customer_id):
        pass

    @staticmethod
    def add_customer(customer):
        pass