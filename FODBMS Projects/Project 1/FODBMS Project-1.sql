Project Title - Gym Management System

Submitted By - Group - 8
Pranjal Mishra - 025026
Sarthak Jain  025029
Tanya Goel - 025034

/********************************************************************************************/

/* Top-down approach to Database designing. Creating a database for gym management system and creating entity relationship diagram for same. */

create database if not exists GYM ;

use GYM ;

/********************************************************************************************/

/* creating required tables. */

create table transaction_record( trans_id char(5) primary key, amount int(7), t_date date );

insert into transaction_record values ('T001',24000,'2022-02-02');
insert into transaction_record values ('T002',12000,'2022-02-09');
insert into transaction_record values ('T003',48000,'2022-02-15');
insert into transaction_record values ('T004',2000,'2022-02-20');
insert into transaction_record values ('T005',6000,'2022-02-24');


create table schedule( sched_id char(5) primary key, session varchar(50), days varchar(25), timings varchar(25) );

insert into schedule values ('S001','cardio','everyday','7:00-22:00');
insert into schedule values ('S002','aerobics','M W F','7:00-11:00');
insert into schedule values ('S003','weight traning','everyday','7:00-22:00');
insert into schedule values ('S004','abs','T T S','7:00-20:00');
insert into schedule values ('S005','crossfir','M W F','18:00-22:00');


create table trainer( train_id char(5) primary key, t_name varchar(50), salary int(7), email varchar(90) );

insert into trainer values ('TR001','Anant Chopra',20000,'anant1@gmail.com')
insert into trainer values ('TR002','Shivesh Sharma',10000,'shivesh2@gmail.com')
insert into trainer values ('TR003','Kavita Saxena',20000,'kavita3@gmail.com')
insert into trainer values ('TR004','Aman Chauhan',15000,'aman4@gmail.com')
insert into trainer values ('TR005','Deepak Kumar',15000,'deepak5@gmail.com')



create table member ( client_id char(5) primary key, cname varchar(25), gender char(10), age int (10), email varchar(100) );

insert into member values ('M001','Sarthak Kapoor','M',24,'sarthak1@gmail.com');
insert into member values ('M002','Anisha Gupta','F',22,'agupta12@gmail.com');
insert into member values ('M003','Pranjal Singh','M',23,'pran1234@gmail.com');
insert into member values ('M004','Rahul Malhotra','M',26,'rmalhotra1008@gmail.com');
insert into member values ('M005','Varnika Singhal','F',23,'varnikas1603@gmail.com');


create table membership ( reg_id char(5) primary key, name varchar(25), status char(10), r_date varchar(25) );

insert into membership values ('R001','Sarthak Kapoor','Active' ,'02-02-2022');
insert into membership values ('R002','Anisha Gupta','Active','09-02-2022');
insert into membership values ('R003','Pranjal Singh','Active','15-02-2022');
insert into membership values ('R004','Rahul Malhotra','Inactive','20-02-2022');
insert into membership values ('R005','Varnika Singhal','Active','24-02-2022');


/**********************************************************************************/

/* creating required relationship tables and stating assumptions for each table.*/

/*Every member will have a unique client ID and registration ID*/

create table relationship_member_membership ( client_id char(5) ,
                                             reg_id char(5) ,
                                             primary key (client_id),
                                             foreign key (client_id) references member (client_id) ,
                                             foreign key (reg_id) references membership (reg_id) );

insert into relationship_member_membership values ( 'M001','R001');
insert into relationship_member_membership values ( 'M002','R002');
insert into relationship_member_membership values ( 'M003','R003');
insert into relationship_member_membership values ( 'M004','R004');
insert into relationship_member_membership values ( 'M005','R005');

 

/*A member can change their trainer over a period of time and a trainer can have a multiple number of clients*/

create table relationship_member_trainer ( client_id char(5),
                                          train_id char(5) ,
                                          primary key (client_id, train_id),
                                          foreign key (client_id) references member (client_id),
                                          foreign key (train_id) references trainer (train_id) );

insert into relationship_member_trainer values ( 'M001','TR001');
insert into relationship_member_trainer values ( 'M002','TR002');
insert into relationship_member_trainer values ( 'M003','TR003');
insert into relationship_member_trainer values ( 'M004','TR004');
insert into relationship_member_trainer values ( 'M005','TR005');



/*Every trainer specializes in only one particular area*/

create table relationship_trainer_schedule ( train_id char(5),
                                          sched_id char(5) ,
                                          primary key (train_id),
                                          foreign key (train_id) references trainer (train_id),
                                          foreign key (sched_id) references schedule (sched_id) );

insert into relationship_trainer_schedule values ( 'TR001','S001');
insert into relationship_trainer_schedule values ( 'TR002','S002');
insert into relationship_trainer_schedule values ( 'TR003','S003');
insert into relationship_trainer_schedule values ( 'TR004','S004');
insert into relationship_trainer_schedule values ( 'TR005','S005');



/*A member can attend a multiple number of sessions*/

create table relationship_schedule_member ( sched_id char(5),
                                          client_id char(5) ,
                                          primary key (sched_id),
                                          foreign key (sched_id) references schedule (sched_id),
                                          foreign key (client_id) references member (client_id) );

insert into relationship_schedule_member values ( 'S001','M001');
insert into relationship_schedule_member values ( 'S002','M002');
insert into relationship_schedule_member values ( 'S003','M003');
insert into relationship_schedule_member values ( 'S004','M004');
insert into relationship_schedule_member values ( 'S005','M005');



/*Transaction ID will be unique for every bill*/

create table relationship_member_transaction_record ( client_id char(5),
                                          trans_id char(5) ,
                                          primary key (trans_id),
                                          foreign key (client_id) references member (client_id),
                                          foreign key (trans_id) references transaction_record (trans_id) );

insert into relationship_member_transaction_record values ( 'M001','T001');
insert into relationship_member_transaction_record values ( 'M002','T002');
insert into relationship_member_transaction_record values ( 'M003','T003');
insert into relationship_member_transaction_record values ( 'M004','T004');
insert into relationship_member_transaction_record values ( 'M005','T005');

/**********************************************************************************/

/* creating users and granting them access.*/

create user 'client1'@'localhost' identified by 'client1';
create user 'trainer1'@'localhost' identified by 'trainer1';
create user 'owner1'@'localhost' identified by 'owner1';
create user 'dba'@'localhost' identified by 'dba';

/* CLIENT*/
GRANT select ON GYM.schedule TO 'client1'@'localhost';
GRANT select ON GYM.trainer TO 'client1'@'localhost';
GRANT select ON GYM.transaction_record TO 'client1'@'localhost';

/*TRAINER*/
GRANT create, select, insert, update, delete, alter ON GYM.schedule TO 'trainer1'@'localhost';
GRANT create, select, insert, update, delete, alter ON GYM.member TO 'trainer1'@'localhost';

/*OWNER*/
GRANT create, drop, select, insert, update, delete, alter  ON *.*  TO 'owner1'@'localhost' with grant option;

/*DBA*/
GRANT create, drop, select, insert, update, delete, alter  ON *.*  TO 'dba'@'localhost' with grant option ;