from app.models.Customer import Customer
from database.database_config import DatabaseConfig

class CustomerRepository:
    
    @staticmethod
    def get_all_customers():
        conn = DatabaseConfig.get_connection()
        cur = conn.cursor()
        rows = cur.execute("SELECT * FROM customers").fetchall()
        conn.close()
        return [Customer(row["id"], row["firstname"], row["surname"],  row["user_type"], row["telephone"], row["email"]) for row in rows]
    
    @staticmethod
    def delete_customer(customer_id):
        pass

    @staticmethod
    def add_customer(customer):
        pass