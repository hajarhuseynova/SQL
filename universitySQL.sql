create database uniMS;
use uniMS;
create table qroup(
id int auto_increment primary key,
qNumber varchar(10),
count int not null check(count<30)
);
create table students(
id int auto_increment primary key,
firstName varchar(10),
lastName varchar(15),
address varchar(150) default "Ganja",
qroupId int,
constraint fk1
foreign key(qroupId)
references qroup(id)
);
create table teacher(
id int auto_increment primary key,
firstName varchar(10),
lastName varchar(15),
Prof varchar(20),
startDate date
);
create table lesson(
id int auto_increment primary key,
IdTeacher int,
IdQroup int,
subjectNum varchar(10),
lectureHour int,
seminar int,
lab int,
constraint fk2
foreign key(IdTeacher)
references teacher(id),
constraint fk3
foreign key(IdQroup)
references qroup(id) 
);
insert into qroup(qNumber,count)
values("692.21E",4),
("692.22E",24),
("693.21E",15);
select *from qroup;
insert into qroup(qNumber,count)
values("695.21E",4),
("696.22E",24),
("697.21E",15);
insert into students(firstName,lastName,qroupId)
values("Hajar","Huseynova",1),
("Elxan","Nazarli",2),
("Nicat","Soltanov",3);
select *from students;
insert into teacher(firstName,lastName,prof,startDate)
values("Nubar","Kishiyeva","Database","2022-10-08"),
("Sevinc","Mustafayeva","Security","2005-9-07");
select *from teacher;
alter table teacher
add
salary decimal not null;
select firstName,lastName from teacher
where id=1;
select firstName,lastName from teacher
where  startDate=month("2022-10-21");



