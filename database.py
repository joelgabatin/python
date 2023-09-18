import mysql.connector

class Database:
    def __init__(self):
        self.db = mysql.connector.connect(
            host="localhost",
            user="root",
            password="",
            database="elako_db",
            port=3308
        )

    def insert_data(self, table_name, **data):
        cursor = self.db.cursor()
        try:
            # Dynamically create the SQL query for insertion based on the table_name
            column_names = ', '.join(data.keys())
            value_placeholders = ', '.join(['%s'] * len(data))
            insert_query = f"INSERT INTO {table_name} ({column_names}) VALUES ({value_placeholders})"
            values = tuple(data.values())

            cursor.execute(insert_query, values)
            self.db.commit()
            return True
        except Exception as e:
            self.db.rollback()
            return False
        finally:
            cursor.close()

    def fetch_all_data(self, table_name):
        cursor = self.db.cursor(dictionary=True)
        cursor.execute(f"SELECT * FROM {table_name}")
        data = cursor.fetchall()
        cursor.close()
        return data

    #Update Row by getting the column name and vale
    def update_data(self, table_name, where_column, where_value, **data):
        cursor = self.db.cursor()
        try:
            # Dynamically create the SQL query for update based on the table_name
            set_clause = ', '.join([f"{key} = %s" for key in data.keys()])
            update_query = f"UPDATE {table_name} SET {set_clause} WHERE {where_value} = %s"
            values = tuple(list(data.values()) + [where_column])

            # For debugging purposes, print or log the query and values
            print("Update Query:", update_query)
            print("Update Values:", values)

            cursor.execute(update_query, values)
            self.db.commit()
            return True
        except Exception as e:
            # For debugging purposes, print or log the error message
            print("Error updating data:", str(e))
            self.db.rollback()
            return False
        finally:
            cursor.close()

    # Delete Row by getting the column name and vale
    def delete_data(self, table_name, where_column, where_value):
        cursor = self.db.cursor()
        try:
            # Dynamically create the SQL query for delete based on the table_name
            delete_query = f"DELETE FROM {table_name} WHERE {where_column} = %s"
            cursor.execute(delete_query, (where_value,))
            self.db.commit()
            return True
        except Exception as e:
            self.db.rollback()
            return False
        finally:
            cursor.close()

# You can define other database-related functions as needed.
