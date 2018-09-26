-- -- -- -- -- Major Changes -- -- -- -- --
-- Added NOT NULL to PKs.
-- Checking for same data constraints on all attributes.


-- Add PK on table the FK is referencing to
-- 
-- For Example:
-- Change this: FOREIGN KEY (TutorKey) REFERENCES Tutor
-- To this: FOREIGN KEY (TutorKey) REFERENCES Tutor (TutorKey),
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
    -- -- -- -- -- -- CREATE TABLES -- -- -- -- -- -- 
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

CREATE TABLE Tutor (
TutorKey INT NOT NULL ,
TutorLastName CHAR(45),
TutorFirstName CHAR(45),
TutorPhone INT,
TutorEmail CHAR(45),
TutorHireDate DATE,
TutorStatus CHAR(45),
PRIMARY KEY (TutorKey)
);

CREATE TABLE Course (
CourseKey CHAR(6) NOT NULL ,
CourseName CHAR(45),
CourseDescription CHAR(45),
PRIMARY KEY (CourseKey)
);

CREATE TABLE Ethnicity (
EthnicityKey CHAR(20) NOT NULL ,
EthnicityDescription CHAR(45),
PRIMARY KEY (EthnicityKey)
);


CREATE TABLE TutorCourse (
TutorKey INT NOT NULL ,
CourseKey CHAR(6) NOT NULL ,
PRIMARY KEY (TutorKey, CourseKey),
FOREIGN KEY (TutorKey) REFERENCES Tutor (TutorKey),
FOREIGN KEY (CourseKey) REFERENCES Course (CourseKey)
);


create table Students( 
StudentKey INT NOT NULL, 
StudentFirstName CHAR(20), 
StudentLastName CHAR(20), 
StudentEmail CHAR(20), 
StudentPhone INT NULL, 
StudentGender CHAR(5), 
StudentAge INT, 
StudentCitizen CHAR(5), 
StudentWorkerRetraining CHAR(20), 
EthnicityKey CHAR(20) NOT NULL,
PRIMARY KEY (StudentKey)
);

CREATE TABLE StudentCourse (
StudentKey INT NOT NULL ,
CourseKey CHAR(6) NOT NULL,
StudentCourseQuarter CHAR(45),
PRIMARY KEY (StudentKey, CourseKey),
FOREIGN KEY (StudentKey) REFERENCES Students(StudentKey),
FOREIGN KEY (CourseKey) REFERENCES Course(CourseKey)
);

CREATE TABLE Sessions (
SessionDateKey DATE NOT NULL,
SessionTimeKey TIME NOT NULL,
TutorKey INT NOT NULL,
CourseKey CHAR(6),
StudentKey INT NULL,
SessionStatus CHAR(45),
SessionMaterialCovered CHAR(45)
);

CREATE TABLE Requests (
RequestKey INT NOT NULL ,
RequestDate DATE,
CourseKey CHAR(6) ,
RequestStatus CHAR(45),
StudentKey INT ,
PRIMARY KEY (RequestKey)
);

CREATE TABLE RequestNote (
RequestNoteKey DATETIME NOT NULL,
RequestID INT,
RequestNoteText CHAR(100),
PRIMARY KEY (RequestNoteKey)
);

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
    -- -- -- -- -- -- INSERT VALUES -- -- -- -- -- -- 
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

-- Tutor
INSERT INTO Tutor VALUES ('980010000', 'Roberts', 'Martha', '2065551467', 'mroberts@yahoo.com', '2010-1-6', 'Active');

INSERT INTO Tutor VALUES ('980010001', 'Brown', 'Susan', '2065553528', 'sb4@hotmail.com', '2009-2-1', 'Active');

INSERT INTO Tutor VALUES ('980010002', 'Foster', 'Daniel', '2065553490', 'foster32@aol.com', '2009-2-1', 'Active');

INSERT INTO Tutor VALUES ('980010003','Anderson', 'Nathan', '2065556320', 'NULL', '2009-3-2', 'Inactive');

INSERT INTO Tutor VALUES ('980010004','Lewis', 'Ginger', '2065552985', 'ginger@hotmail.com', '2009-3-15', 'Active');

-- Course
INSERT INTO Course VALUES ('ITC110', 'Beginning Programming', 'Programming using C#');

INSERT INTO Course VALUES ('ITC220', 'Introduction to Databases', 'Overview of databse design and topics');

INSERT INTO Course VALUES ('ITC255', 'System Analytics', 'System Analysis and design');

INSERT INTO Course VALUES ('MAT107', 'Applied Math', 'Applied Math for computers');

INSERT INTO Course VALUES ('ENG211', 'Technical Writing', 'Technical Writing for IT');

INSERT INTO Course VALUES ('WEB110', 'Beginning Web Page Design', 'Basic xhtml');

INSERT INTO Course VALUES ('ITC226', 'Database Adminstration', 'SQL Server Adminstration');

-- Ethnicity
INSERT INTO Ethnicity VALUES ('Caucasian', 'White, European Origin');

INSERT INTO Ethnicity VALUES ('Asian', 'Chinese, Japanese, Korean, Southeast Asian');

INSERT INTO Ethnicity VALUES ('AfrAmer', 'African American or Arican Origin');

INSERT INTO Ethnicity VALUES ('Hispanic', 'Mexican, Central or South American, Caribbean');

INSERT INTO Ethnicity VALUES ('Pacific', 'Pacific Islander');

INSERT INTO Ethnicity VALUES ('Mideast', 'Arabic or Persian');

INSERT INTO Ethnicity VALUES ('Other', 'Other or Not Disclosed');

-- RequestNote
INSERT INTO RequestNote VALUES ('2010-1-6 2:00:00', '1001', 'Only offered once a year and not a lot of requests for this class');

INSERT INTO RequestNote VALUES ('2010-1-10 10:00:00', '1001', 'No students available, because a capstone class would have to get someone off campus');

-- Requests
INSERT INTO Requests VALUES('1001', '2010-1-5', 'ITC226', 'Active','990001010' );

-- Sessions
INSERT INTO Sessions VALUES('2009-10-20','14:00:00','980010001','WEB110','990001000','C','CSS');

INSERT INTO Sessions VALUES('2009-10-20','13:00:00','980010001','ITC110','990001000','C','For next loop');

INSERT INTO Sessions VALUES('2009-11-20','10:30:00','980010001','ITC220','990001002','C','Relations');

INSERT INTO Sessions VALUES('2009-11-5','10:00:00','980010001','ITC220',NULL,'NS',NULL);

INSERT INTO Sessions VALUES('2009-11-10','13:00:00','980010001','MAT107','990001004','C','Binary Numbers');

INSERT INTO Sessions VALUES('2009-11-10','14:00:00','980010001','WEB110','990001000','C','Web Forms');

INSERT INTO Sessions VALUES('2010-1-15','9:30:00','980010001','ITC255','990001000','C','Use cases');

INSERT INTO Sessions VALUES('2010-1-20','11:00:00','980010001','ENG211','990001003','C','Document structure');

INSERT INTO Sessions VALUES('2010-1-22','14:00:00','980010001','MAT107','990001005','NS',NULL);

INSERT INTO Sessions VALUES('2010-2-5','10:30:00','980010001','ITC255','990001000','C','Feasibility');

INSERT INTO Sessions VALUES('2010-2-10','13:30:00','980010001','MAT107',NULL,NULL,NULL);

INSERT INTO Sessions VALUES('2010-2-10','14:00:00','980010001','MAT107',NULL,NULL,NULL);

INSERT INTO Sessions VALUES('2010-2-13','10:00:00','980010001','ITC255',NULL,NULL,NULL);

INSERT INTO Sessions VALUES('2010-2-14','11:00:00','980010001','ENG211',NULL,NULL,NULL);

-- StudentCourse
INSERT INTO StudentCourse VALUES('990001000', 'ITC220', 'Fall09');

INSERT INTO StudentCourse VALUES('990001000', 'ITC110', 'Fall09');

INSERT INTO StudentCourse VALUES('990001000', 'WEB110', 'Fall09');

INSERT INTO StudentCourse VALUES('990001002', 'ITC220', 'Fall09');

INSERT INTO StudentCourse VALUES('990001002', 'ITC110', 'Fall09');

INSERT INTO StudentCourse VALUES('990001004', 'MAT107', 'Fall09');

INSERT INTO StudentCourse VALUES('990001004', 'WEB110', 'Fall09');

INSERT INTO StudentCourse VALUES('990001007', 'ITC110', 'Fall09');

INSERT INTO StudentCourse VALUES('990001009', 'ITC110', 'Fall09');

INSERT INTO StudentCourse VALUES('990001009', 'ITC220', 'Fall09');

INSERT INTO StudentCourse VALUES('990001009', 'MAT107', 'Winter10');

INSERT INTO StudentCourse VALUES('990001002', 'ITC255', 'Winter10');

INSERT INTO StudentCourse VALUES('990001002', 'ENG211', 'Winter10');

INSERT INTO StudentCourse VALUES('990001003', 'ITC255', 'Winter10');

INSERT INTO StudentCourse VALUES('990001003', 'MAT107', 'Winter10');

INSERT INTO StudentCourse VALUES('990001005', 'MAT107', 'Winter10');

INSERT INTO StudentCourse VALUES('990001010', 'ITC255', 'Winter10');

INSERT INTO StudentCourse VALUES('990001010', 'ENG211', 'Winter10');

INSERT INTO StudentCourse VALUES('990001000', 'ITC255', 'Winter10');

INSERT INTO StudentCourse VALUES('990001000', 'MAT107', 'Winter10');

-- Students
INSERT INTO Students VALUES('990001000', 'Laura', 'Peterson', 'NULL', '2065559318', 'F','23','True','False','Caucasian' );

INSERT INTO Students VALUES('990001002', 'Shanon','Carter','shanon@carter.org','2065554301', 'F','32','True','True','AfrAmer');

INSERT INTO Students VALUES('990001003', 'Sandy','Martinez','sandym@gmail.com','2065551158', 'F','18','True','False','Hispanic');

INSERT INTO Students VALUES('990001004', 'Lu','Nguyen','lstar@yahoo.com','2065552938', 'M','19','False','False','Asian');

INSERT INTO Students VALUES('990001005', 'Mark','Zulof','NULL',NULL, 'NULL',NULL,'NULL','NULL','NULL');

INSERT INTO Students VALUES('990001006', 'Patty','Taylor','p147@marketplace.com','2065552076', 'F','42','True','True','Caucasian');

INSERT INTO Students VALUES('990001007', 'Lawrence','Thomas','NULL',NULL, 'M','24','True','False','Caucasian');

INSERT INTO Students VALUES('990001008', 'Ron','Bradbury','rbradbury@mars.org','2065557296', 'M','53','True','False','Caucasian');

INSERT INTO Students VALUES('990001009', 'Juan','Carlos','carlos23@hotmail.com','2065559134', 'M','25','False','False','Hispanic');

INSERT INTO Students VALUES('990001010', 'Ly','Min','lymin@hotmail.com','2065552789', 'F','20','False','False','Asian');

-- TutorCourse
INSERT INTO TutorCourse VALUES('980010002','ITC255');

INSERT INTO TutorCourse VALUES('980010002','ENG211');

INSERT INTO TutorCourse VALUES('980010003','MAT107');

INSERT INTO TutorCourse VALUES('980010000','WEB110');

INSERT INTO TutorCourse VALUES('980010001','ITC220');

INSERT INTO TutorCourse VALUES('980010001','WEB110');

INSERT INTO TutorCourse VALUES('980010003','ITC110');

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
    -- -- -- -- -- --  Queries for LAB 1 -- -- -- -- -- -- 
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

/* Question a */
SELECT StudentFirstName, StudentLastName, StudentGender 
FROM Students
WHERE StudentGender = 'M';

/* Question b */
SELECT TutorKey, CourseKey, SessionDateKey, StudentKey
FROM Sessions
WHERE SessionDateKey 
BETWEEN '2009-11-1' and '2009-11-15';

/* Question c*/
SELECT count(*) AS totalOver25
FROM Students
WHERE StudentAge > '25';

/*Question d*/
-- Returns Empty Set. Will need to confirm.
SELECT TutorKey AS TotalSessions
FROM Sessions
WHERE SessionStatus = 'C'
GROUP BY TutorKey
HAVING count(*) < 4;

/*Question e*/
CREATE VIEW vw_Sessions
AS SELECT TutorLastName AS Tutor, 
StudentKey AS Student,
SessionDateKey AS Date,
SessionTimeKey AS Time,
CourseKey AS Course
FROM Sessions, Tutor;

SELECT * FROM vw_Sessions;