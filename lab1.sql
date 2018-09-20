CREATE TABLE Tutor (
TutorKey INT ,
TutorLastName CHAR(45),
TutorFirstName CHAR(45),
TutorPhone INT,
TutorEmail CHAR(45),
TutorHireDate DATE,
TutorStatus CHAR(45),
PRIMARY KEY (TutorKey)
);

CREATE TABLE Course (
CourseKey CHAR(6) ,
CourseName CHAR(45),
CourseDescription CHAR(45),
PRIMARY KEY (CourseKey)
);

CREATE TABLE Ethnicity (
EthnicityKey CHAR(45) ,
EthnicityDescription CHAR(45),
PRIMARY KEY (EthnicityKey)
);

CREATE TABLE TutorCourse (
TutorKey INT ,
CourseKey CHAR(45) ,
KEY TutorKey (TutorKey),
KEY CourseKey (CourseKey),
CONSTRAINT CourseKey FOREIGN KEY (CourseKey) REFERENCES Course (CourseKey),
CONSTRAINT TutorKey FOREIGN KEY (TutorKey) REFERENCES Tutor (TutorKey) 
);

create table Students( 
StudentKey INT PRIMARY KEY, 
StudentFirstName CHAR(20), 
StudentLastName CHAR(20), 
StudentEmail CHAR(20), 
StudentPhone INT, 
StudentGender CHAR(5), 
StudentAge INT, 
StudentCitizen CHAR(5), 
StudentWorkerRetraining CHAR(20), 
EthnicityKey CHAR(20), 
FOREIGN KEY (EthnicityKey) REFERENCES Ethnicity);


CREATE TABLE StudentCourse (
StudentKey INT ,
CourseKey CHAR(6) ,
StudentCourseQuarter CHAR(45),
PRIMARY KEY (StudentKey,CourseKey),
KEY CourseKey (CourseKey,StudentKey),
CONSTRAINT StudentKey FOREIGN KEY (StudentKey) REFERENCES Student (StudentKey)
);

CREATE TABLE Sessions (
SessionDateKey DATE ,
SessionTimeKey DATEtime,
TutorKey INT,
CourseKey CHAR(45),
SessionStatus CHAR(45),
SessionMaterialCovered CHAR(45),
PRIMARY KEY (SessionDATEKey)
);

CREATE TABLE Requests (
RequestKey INT ,
RequestDate DATE,
CourseKey CHAR(6) ,
RequestStatus CHAR(45),
StudentKey INT ,
PRIMARY KEY (RequestKey),
KEY CourseKey_idx (CourseKey)
);

CREATE TABLE RequestNote (
RequestNoteKey DATEtime ,
RequestID INT,
RequestNoteText CHAR(100),
PRIMARY KEY (RequestNoteKey)
);

