CREATE TABLE Person (
    PersonID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(20),
    LastName VARCHAR(20),
    Email VARCHAR(60),
    State CHAR(2),
    City VARCHAR(50)
);

CREATE TABLE Education (
    EducationID INT AUTO_INCREMENT PRIMARY KEY,
    InstitutionName VARCHAR(50),
    City VARCHAR(50),
    State CHAR(2)
);

CREATE TABLE SkillCategory (
    SkillCategoryID INT AUTO_INCREMENT PRIMARY KEY,
    CategoryName VARCHAR(50)
);

CREATE TABLE Skill (
    SkillID INT AUTO_INCREMENT PRIMARY KEY,
    SkillCategoryID INT,
    SkillName VARCHAR(60),
    FOREIGN KEY (SkillCategoryID) REFERENCES SkillCategory(SkillCategoryID)
);

CREATE TABLE Degree (
    DegreeID INT AUTO_INCREMENT PRIMARY KEY,
    PersonID INT,
    EducationID INT,
    DegreeName VARCHAR(50),
    Major VARCHAR(30),
    OverallGPA DECIMAL(3, 2), -- e.g., 3 digits total, 2 after the decimal (like 3.75)
    Honors VARCHAR(60),
    FOREIGN KEY (PersonID) REFERENCES Person(PersonID),
    FOREIGN KEY (EducationID) REFERENCES Education(EducationID)
);

CREATE TABLE PersonSkill (
    PersonSkillID INT AUTO_INCREMENT PRIMARY KEY,
    PersonID INT,
    SkillID INT,
    FOREIGN KEY (PersonID) REFERENCES Person(PersonID),
    FOREIGN KEY (SkillID) REFERENCES Skill(SkillID)
);
