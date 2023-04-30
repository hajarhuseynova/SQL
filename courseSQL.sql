create database courseMS;
use courseMS;
create table office(
id int auto_increment primary key,
nameOffice varchar(20),
phoneNumber varchar(20),
address varchar(20) default "Baku",
teacherAmount int
);
insert into office(nameOffice,phoneNumber,teacherAmount)
values("economy","0554085255",4),
("mathness","0554085252",2),
("grammer","0403044440",3);
select *from office;


create table teacher(
id int auto_increment primary key,
firstName varchar(10),
lastName varchar(15),
phoneNumber int,
address varchar(15) default "Ganja"
);
insert into teacher(firstName,lastName,phoneNumber)
values("hajar","huseynova","0554085255"),
("elxan","nazarli","0555005050"),
("elxan","zeynalov","0404004040");
select *from teacher;

 create table lesson(
 id int auto_increment primary key,
 lessonName varchar(10) not null,
 duration int check (duration>30 and duration<120),
 officeId int, 
 teacherId int,
 subjectId int,
 constraint fk1
 foreign key (officeId)
 references office(Id),
constraint fk2
 foreign key (teacherId)
 references teacher(Id),
 constraint fk3
 foreign key(subjectId)
 references subject(Id)
);
insert into lesson(lessonName,duration,officeId,teacherId,subjectId)
values ("math",35,1,2,1),
("program",45,2,1,2),
("english",100,3,2,1);
select *from lesson
where duration=100;
select *from lesson
where officeId=2;


create table subject(
id int auto_increment primary key,
subjectName varchar(15),
lectureHour int,
seminarHour int,
courseWork boolean
);
insert into subject(subjectName,lectureHour,seminarHour)
values("literature",2,3),
("history",1,3);
select *from subject;

create table subjectTeacher (
subjectId int,
teacherId int,
subjectAmount int check( subjectAmount>1 and subjectAmount<3),
constraint fk4
foreign key(subjectId)
references subject(Id),
constraint fk5
foreign key(teacherId)
references teacher(Id)
);
insert into subjectTeacher (subjectId,teacherId,subjectAmount)
values(1,2,2),
(2,1,2);
select *from subjectTeacher
order by teacherId;


