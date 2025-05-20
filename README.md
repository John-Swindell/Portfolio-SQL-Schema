# Portfolio SQL Schema & Python Interaction Project

This repository showcases database design with SQL and programmatic interaction using Python. It provides a relational database schema for personal, educational, and skill information, along with scripts for setup, data population, and querying.

## Table of Contents
* [Database Schema Overview](#database-schema-overview)
    * [Entity-Relationship Diagram (ERD)](#entity-relationship-diagram-erd)
    * [Table Information](#table-information)
    * [Schema File](#database-schema-schemasql)
    * [Data Insertion Files](#data-insertion-files)
    * [Sample SQL Queries](#sample-sql-queries-sample_queriessql)
* [Python Scripts & Automated Usage](#python-scripts--automated-usage)
    * [Features](#features)
    * [Technologies Used](#technologies-used)
    * [Setup and Usage (with Python Scripts)](#setup-and-usage-with-python-scripts)
    * [Sample Python Script Outputs](#sample-python-script-outputs)
* [Manual SQL Usage](#manual-sql-usage)

---

## Database Schema Overview

### Entity-Relationship Diagram (ERD)

The structure and relationships within the database are visualized below:

![ERD for Skills and Education Database](/erd/sql-erd-white-text.png)

### Table Information:

* `Person`: Stores basic personal and contact information.
* `Education`: Details about educational institutions attended.
* `Degree`: Information about degrees obtained, linking `Person` and `Education`.
* `SkillCategory`: Classifies skills (e.g., 'Programming Language', 'Database', 'Web Development').
* `Skill`: Represents individual skills, linked to a `SkillCategory`.
* `PersonSkill`: A junction table creating the many-to-many relationship between `Person` and `Skill`.

### Database Schema (`schema.sql`)

The complete MySQL `CREATE TABLE` statements for setting up this database structure. Defines tables, columns, primary keys, foreign keys, and data types.

[View schema.sql](/sql/schema.sql)

### Data Insertion Files

SQL `INSERT` statements are provided to populate the database:

* **`sample_data_insertion.sql`**: Contains data for two fictional individuals (John Doe, Jane Smith) to demonstrate table population and relationships.
  [View sample_data_insertion.sql](/sql/sample_data_insertion.sql)
* **`personal_data_insertion.sql`**: Contains INSERT statements tailored for my specific portfolio data based on my resume at the time of creation.
  [View personal_data_insertion.sql](/sql/personal_data_insertion.sql)

### Sample SQL Queries (`sample_queries.sql`)

Example `SELECT` queries demonstrating how data can be retrieved from this schema, including table joins, filtering, and aggregation.

[View sample_queries.sql](/sql/sample_queries.sql)

---

## Python Scripts & Automated Usage

This project includes Python scripts to automate database setup, data population, and query execution, offering a more programmatic way to interact with the SQL schema.

### Features

* **Python Integration:**
    * Automated database setup (`python_scripts/setup_database.py`).
    * Execution of sample SQL queries (`python_scripts/run_sample_queries.py`) showcasing data retrieval, joins, and aggregation.
    * Modular database connection logic (`python_scripts/db_connector.py.example`).
* **Cloud Compatibility:** Designed to work with a MySQL-compatible cloud database like TiDB Cloud (or a local MySQL server).

### Technologies Used

* **Database:** MySQL (with TiDB Cloud)
* **Scripting:** Python 3.13
* **Python Libraries:**
    * `mysql-connector-python` (see `requirements.txt`)

### Setup and Usage (with Python Scripts)

Follow these steps to set up and run this project using the Python scripts:

1.  **Clone the Repository:**
    ```bash
    git clone https://github.com/John-Swindell/Portfolio-SQL-Schema.git
    cd Portfolio-SQL-Schema
    ```

2.  **Set up your Database Server:**
    * **Cloud Option (TiDB Cloud is what I used):**
        * You get a free Serverless Tier cluster on [TiDB Cloud](https://tidbcloud.com/), you just have to add the DB. (You can also choose literally any other MySQL-compatible cloud provider if you prefer).
        * Get your database connection details (host, user, password, port).
        * Ensure your IP address is allowlisted in the cloud provider's network settings.
        * If your provider requires a specific CA certificate for SSL connections (like TiDB Cloud), download it and place it in the root of this project directory (e.g., name it `isrgrootx1.pem`).
    * **Local Option:**
        * Ensure you have a local MySQL server installed and running.
        * Create a database (e.g., `portfolio_db`) and a user with privileges to access it.
        * I highly recommend using Linux for this, everything works so much more smoothly.

3.  **Configure Database Connection:**
    * Navigate to the `python_scripts/` directory.
    * Make a copy of `db_connector.py.example` and rename it to `db_connector.py`.
    * Open `python_scripts/db_connector.py` and update the placeholder variables at the top with your database credentials and settings as instructed in the file's comments.

4.  **Create Python Virtual Environment & Install Dependencies:**
    * I highly recommend you use a virtual environment. From the project root (`Portfolio-SQL-Schema/`):
        ```bash
        python -m venv venv
        # On Windows
        venv\Scripts\activate
        # On macOS/Linux
        source venv/bin/activate
        ```
    * Install the required Python packages:
        ```bash
        pip install -r requirements.txt
        ```

5.  **Run Database Setup Script:**
    * Execute the setup script to create the database schema and populate data. From the project root:
        ```bash
        python python_scripts/setup_database.py
        ```
    * Follow the on-screen prompts to insert sample and/or personal data.

6.  **Run Sample Queries Script:**
    * Execute the script to see the sample queries in action. From the project root:
        ```bash
        python python_scripts/run_sample_queries.py
        ```

### Sample Python Script Outputs

Here are a few examples of the output from `run_sample_queries.py`:

**1. Get all skills for a specific person:**
![Query 1 Output](script_output_images/query_1.png) **2. Count the number of skills listed for each person:**
![Query 5 Output](script_output_images/query_5.png) **(Add more screenshots as you see fit)**

---

## Manual SQL Usage

For those who prefer to interact with the database directly using SQL commands:

1.  Connect to your MySQL database server.
2.  Run the `sql/schema.sql` script to create the tables.
3.  Run the `sql/sample_data_insertion.sql` script to populate with sample data for testing.
4.  Optionally, run the `sql/personal_data_insertion.sql` script for the author's specific portfolio data.
5.  Use the queries in `sql/sample_queries.sql` as a reference or execute them directly for interacting with the data.

