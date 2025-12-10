from app.models.User import User
from database.database_config import DatabaseConfig

class UserRepository:
    
    @staticmethod
    def get_all_users():
        conn = DatabaseConfig.get_connection()
        cur = conn.cursor()
        rows = cur.execute(
            '''
            SELECT 
                u.id,
                r.[name] AS role,
                u.username,
                u.[name],
                u.surname,
                u.email,
                u.password
            FROM 
                users u
                INNER JOIN user_roles r ON r.id = u.id_user_role
            '''
            ).fetchall()
        conn.close()
        return [User(row["id"], row["role"], row["username"], row["name"], row["surname"], row["email"], row["password"]) for row in rows]
    
    @staticmethod
    def delete_user(user_id):
        pass

    @staticmethod
    def add_user(user):
        pass