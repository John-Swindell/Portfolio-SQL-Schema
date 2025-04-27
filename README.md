# Portfolio Database Schema: Skills & Education (MySQL)

This repository showcases database design and SQL skills. It provides a relational database schema designed to model personal information, educational background, and technical skills, suitable for a portfolio or personal tracking application. I've included some brief explainations here in the README and throughout the code's comments if you'd like to recreate this with your own data.

## Entity-Relationship Diagram (ERD)

The structure and relationships within the database are visualized below:

![ERD for Skills and Education Database](/erd/sql-erd-white-text.png)

**Table Information:**

* `Person`: Stores basic personal and contact information.
* `Education`: Details about educational institutions attended.
* `Degree`: Information about degrees obtained, linking `Person` and `Education`.
* `SkillCategory`: Classifies skills (e.g., 'Programming Language', 'Database', 'Web Development').
* `Skill`: Represents individual skills, linked to a `SkillCategory`.
* `PersonSkill`: A junction table creating the many-to-many relationship between `Person` and `Skill`.

## Database Schema (`schema.sql`)

The complete MySQL `CREATE TABLE` statements for setting up this database structure. Defines tables, columns, primary keys, foreign keys, and data types.

[schema.sql](/sql/schema.sql)

## Data Insertion Files

SQL `INSERT` statements are provided to populate the database:

* **`sample_data_insertion.sql`**: Contains data for two fictional individuals (John Doe, Jane Smith) to demonstrate table population and relationships.
    [sample_data_insertion.sql](/sql/sample_data_insertion.sql)
* **`personal_data_insertion.sql`**: Contains INSERT statements tailored for my specific portfolio data based on my resume at the time of creation.
    [personal_data_insertion.sql](/sql/personal_data_insertion.sql)

## Sample SQL Queries (`sample_queries.sql`)

Example `SELECT` queries demonstrating how data can be retrieved from this schema, including table joins, filtering, and aggregation.

[sample_queries.sql](/sql/sample_queries.sql)

## Usage

1.  Connect to your MySQL database server.
2.  Run the `schema.sql` script to create the tables.
3.  Run the `sample_data_insertion.sql` script to populate with sample data for testing.
4.  Run the `personal_data_insertion.sql` script for my specific portfolio data.
5.  Use the `sample_queries.sql` as a reference for interacting with the data.
