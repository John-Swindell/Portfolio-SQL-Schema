# python_scripts/run_sample_queries.py
try:
    # This assumes db_connector.py is in the same directory
    from db_connector import connect_db, DEFAULT_DB_NAME
except ImportError:
    print(
        "Error: db_connector.py not found or not configured correctly. Make sure you have copied 'db_connector.py.example' to 'db_connector.py' and filled in your credentials.")
    exit()

from mysql.connector import Error
import os

# Configuration
# Database name comes from db_connector
DATABASE_NAME = DEFAULT_DB_NAME

# Determine the project root directory
# Assumes the script run_sample_queries.py is in 'python_scripts/' and '/sql' is a sibling
SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))
PROJECT_ROOT = os.path.dirname(SCRIPT_DIR)

# Path to your sample queries SQL file, inside the 'sql/' subdirectory
SQL_DIR = os.path.join(PROJECT_ROOT, "sql")
SAMPLE_QUERIES_FILE_PATH = os.path.join(SQL_DIR, "sample_queries.sql")



def execute_and_print_queries(filepath):
    """
    Reads SQL queries from a file, executes them, and prints the results.
    """
    if not os.path.exists(filepath):
        print(f"Error: SQL file not found at {filepath}")
        return

    conn = connect_db(DATABASE_NAME)  # connect_db defaults to DEFAULT_DB_NAME
    if not conn:
        print(f"Failed to connect to database '{DATABASE_NAME}'. Cannot run queries.")
        print("Please ensure 'db_connector.py' is configured correctly.")
        return

    cursor = None
    try:
        with open(filepath, 'r') as file:
            sql_script = file.read()

        raw_statements = sql_script.split(';')
        queries_with_titles = []

        for stmt_block in raw_statements:
            if not stmt_block.strip():
                continue

            lines = stmt_block.strip().splitlines()
            title_candidates = []
            query_lines = []

            for line in lines:
                stripped_line = line.strip()
                if stripped_line.startswith('--'):
                    # Capture comments that might serve as a title, but only if they appear before actual query lines
                    if not query_lines:  # Only consider comments if no query lines have been found for this block yet
                        title_candidates.append(stripped_line.lstrip('--').strip())
                elif stripped_line:  # This is part of the query
                    query_lines.append(line)

            actual_query = "\n".join(query_lines).strip()

            if actual_query:
                # Use the last comment encountered before the query as the title, or a default
                current_title = title_candidates[-1] if title_candidates else "Untitled Query"
                if not title_candidates and not actual_query.upper().startswith("SELECT"):
                    current_title = f"Executing: {actual_query.split()[0]} statement"
                queries_with_titles.append({"title": current_title, "query": actual_query})

        cursor = conn.cursor()

        for item in queries_with_titles:
            title, query = item["title"], item["query"]
            print(f"\n--- {title} ---")
            print(f"Executing SQL:\n{query}\n")

            try:
                cursor.execute(query)
                if query.strip().upper().startswith("SELECT"):
                    results = cursor.fetchall()
                    if results:
                        columns = [desc[0] for desc in cursor.description]
                        # Basic formatting for table output
                        col_widths = {col: len(col) for col in columns}
                        for row_data in results:
                            for i, col_val in enumerate(row_data):
                                col_widths[columns[i]] = max(col_widths[columns[i]], len(str(col_val)))

                        header = " | ".join(f"{col:{col_widths[col]}}" for col in columns)
                        print(header)
                        print("-" * len(header))

                        for row in results:
                            print(" | ".join(f"{str(col):{col_widths[columns[i]]}}" for i, col in enumerate(row)))
                    else:
                        print("No results found.")
                else:
                    conn.commit()
                    print(f"Query executed successfully (Affected rows: {cursor.rowcount}).")
            except Error as e:
                print(f"Error executing query:\n{query}\nError: {e}")

    except Error as e:  # Catch database errors more broadly here
        print(f"Database error: {e}")
    except Exception as e:
        print(f"An unexpected error occurred: {e}")
    finally:
        if cursor:
            cursor.close()
        if conn and conn.is_connected():
            conn.close()


if __name__ == "__main__":
    print("This script will execute queries from 'sample_queries.sql' against the configured database.")
    print(f"Looking for SQL file at: {SAMPLE_QUERIES_FILE_PATH}")
    execute_and_print_queries(SAMPLE_QUERIES_FILE_PATH)
