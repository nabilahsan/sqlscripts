-- -- -- -- -- Major Changes -- -- -- -- --
-- Added NOT NULL to PKs.
-- Checking for same data constraints on all attributes.

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

-- Added
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

-- Added
CREATE TABLE Course (
CourseKey CHAR(6) NOT NULL ,
CourseName CHAR(45),
CourseDescription CHAR(45),
PRIMARY KEY (CourseKey)
);

-- Added
CREATE TABLE Ethnicity (
EthnicityKey CHAR(20) NOT NULL ,
EthnicityDescription CHAR(45),
PRIMARY KEY (EthnicityKey)
);

-- Cannot Add
-- ERROR 1215 (HY000): Cannot add foreign key constraint
CREATE TABLE TutorCourse (
TutorKey INT NOT NULL ,
CourseKey CHAR(6) NOT NULL ,
PRIMARY KEY (TutorKey, CourseKey),
FOREIGN KEY (CourseKey) REFERENCES Course,
FOREIGN KEY (TutorKey) REFERENCES Tutor
);

-- ERROR 1215 (HY000): Cannot add foreign key constraint
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
PRIMARY KEY (EthnicityKey, StudentKey), 
FOREIGN KEY (EthnicityKey) REFERENCES Ethnicity);


CREATE TABLE StudentCourse (
StudentKey INT NOT NULL ,
CourseKey CHAR(6) NOT NULL,
StudentCourseQuarter CHAR(45),
PRIMARY KEY (StudentKey, CourseKey),
FOREIGN KEY (StudentKey) REFERENCES Students
);

-- Added
CREATE TABLE Sessions (
SessionDateKey DATE NOT NULL,
SessionTimeKey DATETIME NOT NULL,
TutorKey INT NOT NULL,
CourseKey CHAR(6),
SessionStatus CHAR(45),
SessionMaterialCovered CHAR(45),
PRIMARY KEY (SessionDateKey)
);

-- Added
CREATE TABLE Requests (
RequestKey INT NOT NULL ,
RequestDate DATE,
CourseKey CHAR(6) ,
RequestStatus CHAR(45),
StudentKey INT ,
PRIMARY KEY (RequestKey)
);

-- Added
CREATE TABLE RequestNote (
RequestNoteKey DATETIME NOT NULL,
RequestID INT,
RequestNoteText CHAR(100),
PRIMARY KEY (RequestNoteKey)
);

,
PRIMARY KEY (EthnicityKey, StudentKey), 
FOREIGN KEY (EthnicityKey) REFERENCES Ethnicity);


CREATE TABLE StudentCourse (
StudentKey INT ,
CourseKey CHAR(6) ,
StudentCourseQuarter CHAR(45),
PRIMARY KEY (StudentKey,CourseKey),
FOREIGN KEY (StudentKey) REFERENCES Students
);

-- Added
CREATE TABLE Sessions (
SessionDateKey DATE ,
SessionTimeKey DATETIME,
TutorKey INT,
CourseKey CHAR(45),
SessionStatus CHAR(45),
SessionMaterialCovered CHAR(45),
PRIMARY KEY (SessionDateKey)
);

-- Added
CREATE TABLE Requests (
RequestKey INT ,
RequestDate DATE,
CourseKey CHAR(6) ,
RequestStatus CHAR(45),
StudentKey INT ,
PRIMARY KEY (RequestKey)
);

-- Added
CREATE TABLE RequestNote (
RequestNoteKey DATETIME ,
RequestID INT,
RequestNoteText CHAR(100),
PRIMARY KEY (RequestNoteKey)
);

