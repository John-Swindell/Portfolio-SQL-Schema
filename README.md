# Portfolio Database Schema: Skills & Education

This repository showcases database design and SQL skills. It provides a relational database schema designed to model personal information, educational background, and technical skills, suitable for a portfolio or personal tracking application. I've included some brief explainations here in the README and throughout the code's comments if you'd like to recreate this with your own data.

## Entity-Relationship Diagram (ERD)

The structure of the database can be seen below:

![ERD for Skills and Education Database](/erd/sql-erd-white-text.png)

**Table Informaiton:**
* `Person`: Stores basic contact information.
* `Education`: Details about educational institutions.
* `Degree`: Information about degrees obtained, linking `Person` and `Education`.
* `SkillCategory`: Classifies skills (e.g., 'Programming Language', 'Database').
* `Skill`: Represents individual skills, linked to a `SkillCategory`.
* `PersonSkill`: Just a junction table made to create a many-to-many relationship between `Person` and `Skill`.

## Database Schema (`schema.sql`)

The complete SQL `CREATE TABLE` statements for setting up this database structure can be found in the `sql` directory:

[sql/schema.sql](/sql/schema.sql)

This schema defines tables, columns, primary keys, foreign keys, and data types necessary to represent the relationships shown in the ERD.

## Sample SQL Queries (`sample_queries.sql`)

To demonstrate how data can be retrieved from this schema, example `SELECT` queries are provided. These queries show common operations like joining tables, filtering data, and aggregation:

[sql/sample_queries.sql](/sql/sample_queries.sql)

*(Optional: Briefly mention 1-2 interesting queries, e.g., "Examples include retrieving all skills for a person or finding everyone with a specific skill.")*

## Sample Data Insertion (`data_insertion.sql`)
*(Only include this section if you created the data_insertion.sql file)*

For testing purposes, sample `INSERT` statements are available to populate the database with some initial data:

[sql/data_insertion.sql](/sql/data_insertion.sql)
