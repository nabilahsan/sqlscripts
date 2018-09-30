-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
-- Oracle SQL edition
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
DROP TABLE Tutor CASCADE CONSTRAINTS;
DROP TABLE Course CASCADE CONSTRAINTS;
DROP TABLE Ethnicity CASCADE CONSTRAINTS;
DROP TABLE TutorCourse CASCADE CONSTRAINTS;
DROP TABLE Students CASCADE CONSTRAINTS;
DROP TABLE StudentCourse CASCADE CONSTRAINTS;
DROP TABLE Sessions CASCADE CONSTRAINTS;
DROP TABLE Requests CASCADE CONSTRAINTS;
DROP TABLE RequestNote CASCADE CONSTRAINTS;

CREATE TABLE Tutor (
    TutorKey NUMBER(10) NOT NULL ,
    TutorLastName CHAR(45),
    TutorFirstName CHAR(45),
    TutorPhone NUMBER(10),
    TutorEmail CHAR(45),
    TutorHireDate DATE,
    TutorStatus CHAR(45),
    PRIMARY KEY (TutorKey) );

CREATE TABLE Course (
    CourseKey CHAR(6) NOT NULL ,
    CourseName CHAR(45),
    CourseDescription CHAR(45),
    PRIMARY KEY (CourseKey) );

CREATE TABLE Ethnicity (
    EthnicityKey CHAR(20) NOT NULL ,
    EthnicityDescription CHAR(45),
    PRIMARY KEY (EthnicityKey) );

CREATE TABLE TutorCourse (
    TutorKey NUMBER(10) NOT NULL ,
    CourseKey CHAR(6) NOT NULL ,
    PRIMARY KEY (TutorKey, CourseKey),
    FOREIGN KEY (TutorKey) REFERENCES Tutor (TutorKey),
    FOREIGN KEY (CourseKey) REFERENCES Course (CourseKey) );

CREATE TABLE Students ( 
    StudentKey NUMBER(10) NOT NULL, 
    StudentFirstName CHAR(20), 
    StudentLastName CHAR(20), 
    StudentEmail CHAR(20), 
    StudentPhone NUMBER(10) NULL, 
    StudentGender CHAR(5), 
    StudentAge NUMBER(10), 
    StudentCitizen CHAR(5), 
    StudentWorkerRetraining CHAR(20), 
    EthnicityKey CHAR(20) NOT NULL,
    PRIMARY KEY (StudentKey) );

CREATE TABLE StudentCourse (
    StudentKey NUMBER(10) NOT NULL ,
    CourseKey CHAR(6) NOT NULL,
    StudentCourseQuarter CHAR(45),
    PRIMARY KEY (StudentKey, CourseKey),
    FOREIGN KEY (StudentKey) REFERENCES Students(StudentKey),
    FOREIGN KEY (CourseKey) REFERENCES Course(CourseKey) );    
    
    --
-- Special case: Had to redo this table.
--
CREATE TABLE Sessions (
    SessionDateKey DATE NOT NULL,
    SessionTimeKey DATE NOT NULL,
    TutorKey NUMBER(10) NOT NULL,
    CourseKey CHAR(6),
    StudentKey NUMBER(10) NULL,
    SessionStatus CHAR(45),
    SessionMaterialCovered CHAR(45) );

CREATE TABLE Requests (
    RequestKey NUMBER(10) NOT NULL ,
    RequestDate DATE,
    CourseKey CHAR(6),
    RequestStatus CHAR(45),
    StudentKey NUMBER(10) ,
    PRIMARY KEY (RequestKey) );

CREATE TABLE RequestNote (
    RequestNoteKey TIMESTAMP(0) NOT NULL,
    RequestID NUMBER(10),
    RequestNoteText CHAR(100),
    PRIMARY KEY (RequestNoteKey) );


  
--  Insert Data
--Tutor
INSERT INTO Tutor VALUES ( '980010000', 'Roberts', 'Martha', '2065551467', 'mroberts@yahoo.com', '01/JAN/10', 'Active' );
INSERT INTO Tutor VALUES ( '980010001', 'Brown', 'Susan', '2065553528', 'sb4@hotmail.com', '01/FEB/09', 'Active' );
INSERT INTO Tutor VALUES ( '980010002', 'Foster', 'Daniel', '2065553490', 'foster32@aol.com', '01/FEB/09', 'Active' );
INSERT INTO Tutor VALUES ( '980010003','Anderson', 'Nathan', '2065556320', 'NULL', '01/MAR/09', 'Inactive' );
INSERT INTO Tutor VALUES ( '980010004','Lewis', 'Ginger', '2065552985', 'ginger@hotmail.com', '15/MAR/09', 'Active' );

-- Course
INSERT INTO Course VALUES ( 'ITC110', 'Beginning Programming', 'Programming using C#' );
INSERT INTO Course VALUES ( 'ITC220', 'Introduction to Databases', 'Overview of databse design and topics' );
INSERT INTO Course VALUES ( 'ITC255', 'System Analytics', 'System Analysis and design' );
INSERT INTO Course VALUES ( 'MAT107', 'Applied Math', 'Applied Math for computers' );
INSERT INTO Course VALUES ( 'ENG211', 'Technical Writing', 'Technical Writing for IT' );
INSERT INTO Course VALUES ( 'WEB110', 'Beginning Web Page Design', 'Basic xhtml' );
INSERT INTO Course VALUES ( 'ITC226', 'Database Adminstration', 'SQL Server Adminstration' );

-- Ethnicity
INSERT INTO Ethnicity VALUES ( 'Caucasian', 'White, European Origin' );
INSERT INTO Ethnicity VALUES ( 'Asian', 'Chinese, Japanese, Korean, Southeast Asian' );
INSERT INTO Ethnicity VALUES ( 'AfrAmer', 'African American or Arican Origin' );
INSERT INTO Ethnicity VALUES ( 'Hispanic', 'Mexican, Central or South American, Caribbean' );
INSERT INTO Ethnicity VALUES ( 'Pacific', 'Pacific Islander' );
INSERT INTO Ethnicity VALUES ( 'Mideast', 'Arabic or Persian' );
INSERT INTO Ethnicity VALUES ( 'Other', 'Other or Not Disclosed' );

-- TutorCourse
INSERT INTO TutorCourse VALUES( '980010002','ITC255' );
INSERT INTO TutorCourse VALUES( '980010002','ENG211' );
INSERT INTO TutorCourse VALUES( '980010003','MAT107' );
INSERT INTO TutorCourse VALUES( '980010000','WEB110' );
INSERT INTO TutorCourse VALUES( '980010001','ITC220' );
INSERT INTO TutorCourse VALUES( '980010001','WEB110' );
INSERT INTO TutorCourse VALUES( '980010003','ITC110' );

-- Students
INSERT INTO Students VALUES( '990001000', 'Laura', 'Peterson', 'NULL', '2065559318', 'F','23','True','False','Caucasian' );
INSERT INTO Students VALUES( '990001002', 'Shanon','Carter','shanon@carter.org','2065554301', 'F','32','True','True','AfrAmer' );
INSERT INTO Students VALUES( '990001003', 'Sandy','Martinez','sandym@gmail.com','2065551158', 'F','18','True','False','Hispanic' );
INSERT INTO Students VALUES( '990001004', 'Lu','Nguyen','lstar@yahoo.com','2065552938', 'M','19','False','False','Asian' );
INSERT INTO Students VALUES( '990001005', 'Mark','Zulof','NULL',NULL, 'NULL',NULL,'NULL','NULL','NULL' );
INSERT INTO Students VALUES( '990001006', 'Patty','Taylor','p147@marketplace.com','2065552076', 'F','42','True','True','Caucasian' );
INSERT INTO Students VALUES( '990001007', 'Lawrence','Thomas','NULL',NULL, 'M','24','True','False','Caucasian' );
INSERT INTO Students VALUES( '990001008', 'Ron','Bradbury','rbradbury@mars.org','2065557296', 'M','53','True','False','Caucasian' );
INSERT INTO Students VALUES( '990001009', 'Juan','Carlos','carlos23@hotmail.com','2065559134', 'M','25','False','False','Hispanic' );
INSERT INTO Students VALUES( '990001010', 'Ly','Min','lymin@hotmail.com','2065552789', 'F','20','False','False','Asian' );

-- StudentCourse
INSERT INTO StudentCourse VALUES( '990001000', 'ITC220', 'Fall09' );
INSERT INTO StudentCourse VALUES( '990001000', 'ITC110', 'Fall09' );
INSERT INTO StudentCourse VALUES( '990001000', 'WEB110', 'Fall09' );
INSERT INTO StudentCourse VALUES( '990001002', 'ITC220', 'Fall09' );
INSERT INTO StudentCourse VALUES( '990001002', 'ITC110', 'Fall09' );
INSERT INTO StudentCourse VALUES( '990001004', 'MAT107', 'Fall09' );
INSERT INTO StudentCourse VALUES( '990001004', 'WEB110', 'Fall09' );
INSERT INTO StudentCourse VALUES( '990001007', 'ITC110', 'Fall09' );
INSERT INTO StudentCourse VALUES( '990001009', 'ITC110', 'Fall09' );
INSERT INTO StudentCourse VALUES( '990001009', 'ITC220', 'Fall09' );
INSERT INTO StudentCourse VALUES( '990001009', 'MAT107', 'Winter10' );
INSERT INTO StudentCourse VALUES( '990001002', 'ITC255', 'Winter10' );
INSERT INTO StudentCourse VALUES( '990001002', 'ENG211', 'Winter10' );
INSERT INTO StudentCourse VALUES( '990001003', 'ITC255', 'Winter10' );
INSERT INTO StudentCourse VALUES( '990001003', 'MAT107', 'Winter10' );
INSERT INTO StudentCourse VALUES( '990001005', 'MAT107', 'Winter10' );
INSERT INTO StudentCourse VALUES( '990001010', 'ITC255', 'Winter10' );
INSERT INTO StudentCourse VALUES( '990001010', 'ENG211', 'Winter10' );
INSERT INTO StudentCourse VALUES( '990001000', 'ITC255', 'Winter10' );
INSERT INTO StudentCourse VALUES( '990001000', 'MAT107', 'Winter10' );

-- Sessions
INSERT INTO Sessions VALUES ( TO_DATE('10/20/2009', 'mm/dd/yyyy'), TO_DATE('14:00', 'hh24:mi'),'980010001','WEB110','990001000','C','CSS' );
INSERT INTO Sessions VALUES(TO_DATE( '10/20/2009', 'mm/dd/yyyy'), TO_DATE('13:00', 'hh24:mi'),'980010003','ITC110','990001000','C','For next loop' );
INSERT INTO Sessions VALUES(TO_DATE( '11/20/2009', 'mm/dd/yyyy'),TO_DATE('10:30', 'hh24:mi'),'980010001','ITC220','990001002','C','Relations' );
INSERT INTO Sessions VALUES(TO_DATE( '11/5/2009', 'mm/dd/yyyy'),TO_DATE('10:00', 'hh24:mi'),'980010001','ITC220',NULL,'NS',NULL );
INSERT INTO Sessions VALUES(TO_DATE( '11/10/2009', 'mm/dd/yyyy'),TO_DATE('13:00', 'hh24:mi'),'980010004','MAT107','990001004','C','Binary Numbers' );
INSERT INTO Sessions VALUES(TO_DATE( '11/10/2009', 'mm/dd/yyyy'),TO_DATE('14:00', 'hh24:mi'),'980010001','WEB110','990001000','C','Web Forms' );
INSERT INTO Sessions VALUES(TO_DATE( '01/15/2010', 'mm/dd/yyyy'),TO_DATE('9:30', 'hh24:mi'),'980010002','ITC255','990001000','C','Use csases' );
INSERT INTO Sessions VALUES(TO_DATE( '01/20/2010', 'mm/dd/yyyy'),TO_DATE('11:00', 'hh24:mi'),'980010002','ENG211','990001003','C','Document structure' );
INSERT INTO Sessions VALUES(TO_DATE( '01/22/2010', 'mm/dd/yyyy'),TO_DATE('14:00', 'hh24:mi'),'980010004','MAT107','990001005','NS',NULL );
INSERT INTO Sessions VALUES(TO_DATE( '02/05/2010', 'mm/dd/yyyy'),TO_DATE('10:30', 'hh24:mi'),'980010002','ITC255','990001000','C','Feasibility' );
INSERT INTO Sessions VALUES(TO_DATE( '02/10/2010', 'mm/dd/yyyy'),TO_DATE('13:30', 'hh24:mi'),'980010004','MAT107',NULL,NULL,NULL );
INSERT INTO Sessions VALUES(TO_DATE( '02/10/2010', 'mm/dd/yyyy'),TO_DATE('14:00', 'hh24:mi'),'980010004','MAT107',NULL,NULL,NULL );
INSERT INTO Sessions VALUES(TO_DATE( '02/13/2010', 'mm/dd/yyyy'),TO_DATE('10:00', 'hh24:mi'),'980010002','ITC255',NULL,NULL,NULL );
INSERT INTO Sessions VALUES(TO_DATE( '02/14/2010', 'mm/dd/yyyy'),TO_DATE('11:00', 'hh24:mi'),'980010002','ENG211',NULL,NULL,NULL );

-- Requests
INSERT INTO Requests VALUES( '1001', '05/JAN/10', 'ITC226', 'Active','990001010' );

-- RequestNote
INSERT INTO RequestNote VALUES ( '06/JAN/10 2:00:00', '1001', 'Only offered once a year and not a lot of requests for this class' );
INSERT INTO RequestNote VALUES ( '10/JAN/10 10:00:00', '1001', 'No students available, because a capstone class would have to get someone off campus' );


--Answers

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
    -- -- -- -- -- --  Queries for LAB 1 -- -- -- -- -- -- 
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

/* DONE: Question a */
SELECT S.StudentFirstName, S.StudentLastName, S.StudentGender 
    FROM Students S
        WHERE StudentGender = 'M';

/* DONE: Question b */
SELECT SE. TutorKey, SE.CourseKey, SE.SessionDateKey, SE.StudentKey
    FROM Sessions SE
        WHERE SessionDateKey BETWEEN '01/NOV/09' AND '15/NOV/09';

/* DONE: Question c */

SELECT COUNT(*) AS TotalOver25
    FROM Students
        WHERE StudentAge > '25';

/* DONE: Question d */

SELECT SE.TutorKey AS TotalSessions
    FROM Sessions SE
        WHERE SE.SessionStatus = 'C'
    GROUP BY SE.TutorKey
        HAVING COUNT(*) < 4;

/* DONE: Question e */
-- Date is a keyword. Cannot use it as a column name

DROP VIEW vw_Sessions;

CREATE OR REPLACE VIEW vw_Sessions AS
    SELECT
        T.TutorLastName AS Tutor,
        SE.StudentKey AS Student,
        SE.SessionDateKey AS Datee,
        SE.SessionTimeKey AS Time,
        SE.CourseKey AS Course
        FROM Sessions SE, Tutor T;
        
SELECT * FROM Sessions;

/* DONE: Question f */

SELECT DISTINCT Tutor FROM vw_Sessions;

/* DONE: Question g */
DROP TRIGGER SessionHours;

CREATE TRIGGER SessionHours
    BEFORE INSERT ON Sessions
    REFERENCING NEW AS n
    FOR EACH ROW
        DECLARE
            sessionsSoFar INTEGER;
            projectedHours REAL;
        BEGIN
            sessionsSoFar := 0;
            SELECT MonthCount INTO sessionsSoFar 
            -- SELECT INTO Statement retrieves data from database tables and 
            -- assigns the data into a variable or collection. 
            -- In this case a variable (sessionsSoFar)
            -- FROM is refering to a table created
                
            -- SELECT TutorKey, COUNT(EXTRACT(MONTH FROM SessionDateKey)) AS MonthCount 
                
            -- This is the table created with fields TutorKey, MonthCount
                
            -- COUNT(EXTRACT(MONTH FROM SessionDateKey)) field gives the count of session tuples
            -- and is renamed to MonthCount with AS keyword
                FROM ( SELECT TutorKey, COUNT(EXTRACT(MONTH FROM SessionDateKey)) AS MonthCount FROM Sessions
                        -- This WHERE part cecks if the Sessions current row..
                        -- has the same month value as the one being inserted AND 
                        -- has the same TutorKey value as the one being inserted
                        -- this makes sure that the only tuples used are 
                        -- ones that contain the same TutorKey value as the new TutorKey 
                        WHERE EXTRACT(MONTH FROM SessionDateKey) = EXTRACT(MONTH FROM :n.SessionDateKey) AND TutorKey = :n.TutorKey
                        GROUP BY TutorKey); -- Each tutor has their own session count
            projectedHours := 0.5 * (sessionsSoFar + 1); -- +1 takes into account the new tuple being added
            IF (projectedHours > 60) THEN
                RAISE_APPLICATION_ERROR(-20000, 'This tutor cannot work more than 60 Hours');
            END IF;
            EXCEPTION
                WHEN NO_DATA_FOUND THEN
                BEGIN
                    DBMS_OUTPUT.PUT_LINE('Total session hours is vaild after insert.');
                END;
        END;