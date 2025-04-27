-- Sample data insertion with two imaginary students (John Doe and Jane Smith)
-- If you have forked this, keep the order of insertion the same for your own data
-- You'll mess up the foreign keys if you don't properly insert your data.

-- My personal data is elsewhere.

-- 1. Insert Skill Categories
INSERT INTO SkillCategory (CategoryName) VALUES ('Programming Language');
INSERT INTO SkillCategory (CategoryName) VALUES ('Database');
INSERT INTO SkillCategory (CategoryName) VALUES ('Web Development');

-- 2. Insert Skills Make sure these match the SkillCategoryID's created above ^
INSERT INTO Skill (SkillCategoryID, SkillName) VALUES (1, 'Python');
INSERT INTO Skill (SkillCategoryID, SkillName) VALUES (1, 'Java');
INSERT INTO Skill (SkillCategoryID, SkillName) VALUES (2, 'SQL');
INSERT INTO Skill (SkillCategoryID, SkillName) VALUES (2, 'PostgreSQL');
INSERT INTO Skill (SkillCategoryID, SkillName) VALUES (3, 'HTML');
INSERT INTO Skill (SkillCategoryID, SkillName) VALUES (3, 'CSS');

-- 3. Insert the Example Person(s) Data
INSERT INTO Person (FirstName, LastName, Email, State, City) VALUES ('John', 'Doe', 'john.doe@email.com', 'IL', 'Chicago');
INSERT INTO Person (FirstName, LastName, Email, State, City) VALUES ('Jane', 'Smith', 'jane.smith@email.com', 'CA', 'San Francisco');

-- 4. Insert Education Institutions
INSERT INTO Education (InstitutionName, City, State) VALUES ('State University', 'Anytown', 'IL');
INSERT INTO Education (InstitutionName, City, State) VALUES ('Tech College', 'Techville', 'CA');

-- 5. Insert Degrees // careful when using PersonIDs and EducationIDs created above, they must match.
INSERT INTO Degree (PersonID, EducationID, DegreeName, Major, OverallGPA, Honors) VALUES (1, 1, 'B.S. Computer Science', 'Software Engineering', 3.80, 'Summa Cum Laude');
INSERT INTO Degree (PersonID, EducationID, DegreeName, Major, OverallGPA, Honors) VALUES (2, 2, 'A.S. Web Development', 'Web Design', 3.50, NULL);

-- 6. Insert PersonSkills // This is linking Persons to Skills through the junction table.
INSERT INTO PersonSkill (PersonID, SkillID) VALUES (1, 1); -- John Doe knows Python (SkillID 1)
INSERT INTO PersonSkill (PersonID, SkillID) VALUES (1, 3); -- John Doe knows SQL (SkillID 3)
INSERT INTO PersonSkill (PersonID, SkillID) VALUES (1, 4); -- John Doe knows PostgreSQL (SkillID 4)
INSERT INTO PersonSkill (PersonID, SkillID) VALUES (2, 1); -- Jane Smith knows Python (SkillID 1)
INSERT INTO PersonSkill (PersonID, SkillID) VALUES (2, 5); -- Jane Smith knows HTML (SkillID 5)
INSERT INTO PersonSkill (PersonID, SkillID) VALUES (2, 6); -- Jane Smith knows CSS (SkillID 6)