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
StudentPhone INT, 
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
SessionTimeKey DATETIME NOT NULL,
TutorKey INT NOT NULL,
CourseKey CHAR(6),
SessionStatus CHAR(45),
SessionMaterialCovered CHAR(45),
PRIMARY KEY (SessionDateKey)
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
INSERT INTO RequestNote VALUES ();

-- Requests
INSERT INTO Requests VALUES();

-- Sessions
INSERT INTO Sessions VALUES();

-- StudentCourse
INSERT INTO StudentCourse VALUES();

-- Students
INSERT INTO Students VALUES();

-- TutorCourse
INSERT INTO TutorCourse VALUES('980010002','ITC255');

INSERT INTO TutorCourse VALUES('980010002','ENG211');

INSERT INTO TutorCourse VALUES('980010003','MAT107');

INSERT INTO TutorCourse VALUES('980010000','WEB110');

INSERT INTO TutorCourse VALUES('980010001','ITC220');

INSERT INTO TutorCourse VALUES('980010001','WEB110');

INSERT INTO TutorCourse VALUES('980010003','ITC110');
