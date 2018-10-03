create table Student(
stuId CHAR(5) not null,
lastName CHAR(15),
firstName CHAR(15),
major CHAR(15),
credits NUMBER(3),
PRIMARY KEY (stuId)
);

--Insert data

insert into Student values('S1001', 'Smith', 'Tom', 'History', '90');
insert into Student values('S1002', 'Chin', 'Ann', 'Math', '36');
insert into Student values('S1005', 'Lee', 'Perry', 'History', '3');
insert into Student values('S1010', 'Burns', 'Edward', 'Art', '63');
insert into Student values('S1013', 'McCarthy', 'Owen', 'Math', '8');
insert into Student values('S1015', 'Jones', 'Mary', 'Math', '42');
insert into Student values('S1020', 'Rivera', 'Jane', 'CSC', '15');
--

create table Faculty(
facId char(5) not null,
name char(15),
department char(15),
faculRank char(25),
PRIMARY KEY (facId)
);
insert into values();
--

create table Classes(
classNumber char(10) not null,
facId char(5) not null,
schedule char(10),
room char(10),
PRIMARY KEY(classNumber, facId),
FOREIGN KEY (facId) REFERENCES Faculty(facId)
);
insert into values();
--

drop table Classes;

create table Enroll(
stuId CHAR(5) not null,
classNumber char(10) not null,
grade char(2) null,
PRIMARY KEY(stuId, classNumber),
FOREIGN KEY (stuId) REFERENCES Student(stuId) 
);

insert into values();
--

