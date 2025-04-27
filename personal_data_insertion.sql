-- Ensure the Skill Categories 1- Programming Language, 2- Database), 3- Web Development exist
-- If you don't want to instantiate them yourself, simply input the sample_data_insertion first, then this file.


-- The rest of this will assume that the sample_data_insertion script has already run successfully.

-- Add Skills specific to me, John Swindell. This matches 1:1 with the sample ID's.
-- Check existing Skill IDs first if you want to reuse them.
-- Finally, assumes that the AUTO_INCREMENT values continue sequentially.

-- 1. Insert Person Data for John Swindell // ID should be 3
INSERT INTO Person (FirstName, LastName, Email, State, City)
VALUES ('John', 'Swindell', 'Jswindell28@gmail.com', 'IL', 'Morris');

-- 2. Insert Education Institution Data for SNHU // ID should be 3
INSERT INTO Education (InstitutionName, City, State)
VALUES ('Southern New Hampshire University', 'Manchester', 'NH');

-- 3. Insert New Skills // These are skills specific to me I didn't include in the sample data.
-- Assumes existing SkillCategoryIDs: 1=Programming Language, 2=Database, 3=Web Development
-- SkillID = 7
INSERT INTO Skill (SkillCategoryID, SkillName) VALUES (1, 'C#');
-- SkillID = 8
INSERT INTO Skill (SkillCategoryID, SkillName) VALUES (2, 'MySQL');
-- SkillID = 9
INSERT INTO Skill (SkillCategoryID, SkillName) VALUES (3, 'JavaScript');
-- SkillID = 10
INSERT INTO Skill (SkillCategoryID, SkillName) VALUES (1, 'R');
-- SkillID = 11
INSERT INTO Skill (SkillCategoryID, SkillName) VALUES (1, 'Lua');
-- SkillID = 12
INSERT INTO Skill (SkillCategoryID, SkillName) VALUES (2, 'SQLite');

-- 4. Insert Degree Data for John Swindell
INSERT INTO Degree (PersonID, EducationID, DegreeName, Major, OverallGPA, Honors)
VALUES (
    3,                                      
    3,                                      
    'Bachelor of Science',                
    'Computer Science',                  
    4.00,                                   
    'President''s List: 2024 - 2025'        
);

-- 5. Insert PersonSkill Links for John Swindell
-- Links PersonID=3 (John Swindell // me) to the relevant SkillIDs.
-- I'll include some brief comments saying what links where for in case you've forked this.
-- For adding yourself to this database, replace the first value with your ID, and the second value matching the skill.

INSERT INTO PersonSkill (PersonID, SkillID) VALUES (3, 1);  -- Link John Swindell to Python
INSERT INTO PersonSkill (PersonID, SkillID) VALUES (3, 2);  -- Link John Swindell to Java
INSERT INTO PersonSkill (PersonID, SkillID) VALUES (3, 7);  -- Link John Swindell to C#
INSERT INTO PersonSkill (PersonID, SkillID) VALUES (3, 3);  -- Link John Swindell to SQL
INSERT INTO PersonSkill (PersonID, SkillID) VALUES (3, 8);  -- Link John Swindell to MySQL
INSERT INTO PersonSkill (PersonID, SkillID) VALUES (3, 9);  -- Link John Swindell to JavaScript
INSERT INTO PersonSkill (PersonID, SkillID) VALUES (3, 5);  -- Link John Swindell to HTML
INSERT INTO PersonSkill (PersonID, SkillID) VALUES (3, 6);  -- Link John Swindell to CSS
INSERT INTO PersonSkill (PersonID, SkillID) VALUES (3, 10); -- Link John Swindell to R
INSERT INTO PersonSkill (PersonID, SkillID) VALUES (3, 11); -- Link John Swindell to Lua
INSERT INTO PersonSkill (PersonID, SkillID) VALUES (3, 12); -- Link John Swindell to SQLite

