-- If you're confused about what to do with these, head over to the README for an explaination. 

-- Below are some potential queries for my Skills and Education Database Schema
-- For the query examples throughout, PersonID = 3 will be used in the MySQL code, since it pulls my data.
-- If you choose to input my data, all of these queries will give you information about me. 
-- However, If you have forked this, ensure you use your own ID for your own respcetive data.


 Query 1: Get all skills for a specific person. 
-- The goal is joining Person -> PersonSkill -> Skill -> SkillCategory
SELECT
    p.FirstName,
    p.LastName,
    s.SkillName,
    sc.CategoryName
FROM Person p
JOIN PersonSkill ps ON p.PersonID = ps.PersonID
JOIN Skill s ON ps.SkillID = s.SkillID
JOIN SkillCategory sc ON s.SkillCategoryID = sc.SkillCategoryID
WHERE p.PersonID = 3; -- Change the PersonID to test with different people (1, 2)

-- Query 2: Get degree and institution details for John Swindell
-- Demonstrates joining Person -> Degree -> Education
SELECT
    p.FirstName,
    p.LastName,
    d.DegreeName,
    d.Major,
    d.OverallGPA,
    d.Honors,
    e.InstitutionName,
    e.City AS InstitutionCity,
    e.State AS InstitutionState
FROM Person p
JOIN Degree d ON p.PersonID = d.PersonID
JOIN Education e ON d.EducationID = e.EducationID
WHERE p.PersonID = 3; -- Change the PersonID to test

-- Query 3: Find all people who have a specific skill, my personal favorite, SkillName = 'Python'
-- Demonstrates joining Skill -> PersonSkill -> Person
SELECT
    p.FirstName,
    p.LastName,
    p.Email
FROM Skill s
JOIN PersonSkill ps ON s.SkillID = ps.SkillID
JOIN Person p ON ps.PersonID = p.PersonID
WHERE s.SkillName = 'Python'; -- Change the SkillName to test

-- Query 4: List all skills within a specific category. I'll use CategoryName = 'Database' since it seems fitting.
-- Demonstrates joining SkillCategory -> Skill
SELECT s.SkillName
FROM SkillCategory sc
JOIN Skill s ON sc.SkillCategoryID = s.SkillCategoryID
WHERE sc.CategoryName = 'Database'; -- Change the CategoryName to test

-- Query 5: Goal here is to count the number of skills listed for each person
-- Demonstrates aggregation (COUNT) and grouping (GROUP BY) with a LEFT JOIN (I've listed the reasoning below).
SELECT
    p.PersonID,
    p.FirstName,
    p.LastName,
    COUNT(ps.SkillID) AS NumberOfSkills
FROM Person p
LEFT JOIN -- Use LEFT JOIN to include people even if they have 0 skills listed
    PersonSkill ps ON p.PersonID = ps.PersonID
GROUP BY p.PersonID, p.FirstName, p.LastName -- Group by all non-aggregated selected columns
ORDER BY NumberOfSkills DESC; -- Order to see who has the most skills listed