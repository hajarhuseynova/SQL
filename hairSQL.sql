create database hairMS;
use hairMS;
create table places(
id int auto_increment primary key,
namePlace varchar(20),
phoneNumber varchar(20),
address varchar(20) default "Ganja"
);
insert into places(namePlace,phoneNumber)
values("Beautytimeganja","0775901233"),
("Beauty_month","0554085255"),
("Ganja","0504085251");
select * from places
where namePlace  Like "%Ganja%";


create table procedures(
id int auto_increment primary key,
placeId int,
procedureType varchar(15),
constraint fk1
foreign key(placeId)
references places(id)

);
insert into procedures(procedureType ,placeId)
values ("hair",1),
("face",2),
("hair",1);
select * from procedures
where procedureType In ("hair");



create table employers(
id int auto_increment primary key,
firstName varchar(20) , 
lastName varchar(20),

reportsTo int default null,
extension varchar(20),
placeId int,
constraint fk2
foreign key(placeId)
references places(id),
constraint fk3
foreign key(reportsTo)
references employers(id)
);
insert into employers(firstName,lastName,reportsTo,extension,placeId)
values("Nicat","Soltanov",null,"Manager",1),
("Murad","Abdulkerimov",2,"Asistant",3),
("Hacar","Huseynova",null,"Manager",2),
("Elxan","Nazarli",1," Assistant",1);
select * from employers
where reportsTo is not null;




create table Register(
registerNumber int auto_increment primary key , 
employerID int, 
totalPrice int,
procedureId int, 
paymentNumber int, 
constraint fk4
foreign key(employerID)
references employers(id),
constraint fk5
foreign key(paymentNumber)
references payment(paymentNumber),
constraint fk6
foreign key(procedureId)
references procedures(id)
);
insert into Register(employerID, totalPrice,procedureId,paymentNumber)
values(2,40,3,5),
(2,30,3,5),
(4, 10,1,6);
select * from Register
where totalPrice >= 20  and employerID = 2;



create table customers(
id int auto_increment primary key,
firstName varchar(20),
lastName varchar(20),
address varchar(20) default "Ganja",
phoneNumber varchar(20)
);
insert into customers(firstName,lastName,phoneNumber)
values("Alim","Qasimov","0554085255"),
("Fazil","Huseynov","0504086266"),
("Farida","Axundova","0706139013"),
("Suleyman","Qasimov","0504087676");
select * from customers
limit 2;

create table payment(
paymentNumber int auto_increment primary key,
customerId int, 
amount int,
constraint fk7
foreign key(customerId)
references customers(id)
);
insert into payment(customerId,amount)
values(1,10),(4,20),(3,50),(2,100);
select * from payment 
where amount Between 10 and 20;