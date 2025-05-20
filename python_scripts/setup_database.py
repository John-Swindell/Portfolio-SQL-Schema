# python_scripts/setup_database.py
try:
    # This assumes db_connector.py is in the same directory
    from db_connector import connect_db, DEFAULT_DB_NAME  # Import DEFAULT_DB_NAME
except ImportError:
    print(
        "Error: db_connector.py not found or not configured correctly.")
    exit()

from mysql.connector import Error
import os

# Configuration
# Database name comes from db_connector.py
DATABASE_NAME = DEFAULT_DB_NAME

# Determine the project root directory
SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))
PROJECT_ROOT = os.path.dirname(SCRIPT_DIR)

# Paths to your SQL files, now relative to the PROJECT_ROOT and inside the 'sql/' subdirectory
SQL_DIR = os.path.join(PROJECT_ROOT, "sql")
SCHEMA_FILE = os.path.join(SQL_DIR, "schema.sql")
SAMPLE_DATA_FILE = os.path.join(SQL_DIR, "sample_data_insertion.sql")
PERSONAL_DATA_FILE = os.path.join(SQL_DIR, "personal_data_insertion.sql")



def execute_sql_from_file(cursor, filepath):
    """
    Reads SQL statements from a file and executes them.
    Handles multi-statement files (separated by ';').
    """
    if not os.path.exists(filepath):
        print(f"Error: SQL file not found at {filepath}")
        return False
    try:
        with open(filepath, 'r') as file:
            sql_script = file.read()

        statements = [stmt.strip() for stmt in sql_script.split(';') if stmt.strip()]

        for statement in statements:
            if statement:
                try:
                    cursor.execute(statement)
                except Error as e:
                    print(
                        f"Error executing statement: {statement[:100]}...\n{e}")
                    return False  # Indicate failure
        return True  # Indicate success
    except Exception as e:
        print(f"An unexpected error occurred while reading/executing {filepath}: {e}")
        return False


def main():
    conn = connect_db(DATABASE_NAME)  # connect_db defaults to DEFAULT_DB_NAME
    if not conn:
        print(f"Failed to connect to database '{DATABASE_NAME}'. Exiting setup.")
        return

    cursor = None
    try:
        cursor = conn.cursor()
        print(f"\nConnected to database '{DATABASE_NAME}'.")

        # 1. Create schema
        print(f"\nExecuting schema from '{SCHEMA_FILE}'...")
        if execute_sql_from_file(cursor, SCHEMA_FILE):
            conn.commit()
            print("Schema creation successful.")
        else:
            print("Schema creation failed. Please check errors above. Exiting setup.")
            return

        # 2. Insert sample data
        choice_sample = input(f"\nDo you want to insert sample data from '{SAMPLE_DATA_FILE}'? (y/n): ").strip().lower()
        if choice_sample == 'y':
            print(f"\nInserting sample data from '{SAMPLE_DATA_FILE}'...")
            if execute_sql_from_file(cursor, SAMPLE_DATA_FILE):
                conn.commit()
                print("Sample data insertion successful.")
            else:
                print("Sample data insertion failed.")

        # 3. Insert personal data
        # The file 'personal_data_insertion.sql' is specific to my data.
        # Skip this if you don't want my data, and you just want your own.
        choice_personal = input(
            f"\nDo you want to insert personal data from '{PERSONAL_DATA_FILE}'? (This is example data specific to the original author) (y/n): ").strip().lower()
        if choice_personal == 'y':
            print(f"\nInserting personal data from '{PERSONAL_DATA_FILE}'...")
            if execute_sql_from_file(cursor, PERSONAL_DATA_FILE):
                conn.commit()
                print("Personal data insertion successful.")
            else:
                print("Personal data insertion failed.")

        print("\nDatabase setup process completed.")
        print(f"You should now be able to connect to the '{DATABASE_NAME}' database and find your tables and data.")

    except Error as e:
        print(f"An error occurred during database setup: {e}")
    except Exception as e:
        print(f"An unexpected error occurred: {e}")
    finally:
        if cursor:
            cursor.close()
        if conn and conn.is_connected():
            conn.close()


if __name__ == "__main__":
    print("This script will set up the database schema and optionally populate it with data.")
    main()
