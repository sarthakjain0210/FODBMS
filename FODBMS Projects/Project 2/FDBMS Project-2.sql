Project Title - Auto Parts Orders

Submitted By - Group 8
Pranjal Mishra - 025026
Sarthak Jain  025029
Tanya Goel - 025034

/********************************************************************************************/

/* Bottom-up approach to data modelling. Normalization of auto parts orders details and creating entity relationship diagram for same. */

create database if not exists APO ;

use APO ;

/********************************************************************************************/

/* creating required tables. */

create table invoices( bill_no int(5) primary key, B_date date, comapny_code int(5), order_total_price int(7) );

insert into invoices values ( 10088, '2022-02-23', 123, 232000);
insert into invoices values ( 10089, '2022-02-24', 234, 12000);
insert into invoices values ( 10090, '2022-02-25', 345, 202500);

create table companies ( company_code int(5) primary key, company_name varchar(30), company_address varchar(60), company_city varchar(20), company_state varchar(15) );

insert into companies values ( 123,'Mothersun Sumi','251 interplace complex Pune','Pune','Maharashtra');
insert into companies values ( 234,'Minda','34 Radhu Palace Hyderabad','Hyderabad','Telangana');
insert into companies values ( 345,'TATA Motors','79 shahajanpur chennai','Chennai','Tamil Nadu');
 
create table items ( item_id int(4) primary key, item_description varchar(20), item_price int(5) );

insert into items values ( 34,'Semiconductor',8);
insert into items values ( 56,'Glass Panes',20);
insert into items values ( 45,'Car Frame',1000);
insert into items values ( 23,'Light assembly',30);
insert into items values ( 16,'wiring',25);
insert into items values ( 28,'Engine assembly',2000);

create table quantity ( bill_no int(5), item_id int(4) primary key, item_quantity int(6) );

insert into quantity values ( '10088','34','15000');
insert into quantity values ( '10088','56','600');
insert into quantity values ( '10088','45','100');
insert into quantity values ( '10089','23','400');
insert into quantity values ( '10090','16','100');
insert into quantity values ( '10090','28','100');

/**********************************************************************************/

/* creating required relationship tables and stating assumptions for each table.*/

/*Every bill number is unique*/

create table relationship_invoices_items  ( bill_no int(5) ,
                                             item_id int(4) ,
                                             primary key (bill_no, item_id),
                                             foreign key (bill_no) references invoices (bill_no) ,
                                             foreign key (item_id) references items (item_id) );

insert into relationship_invoices_items values ( '10088','34');
insert into relationship_invoices_items values ( '10088','56');
insert into relationship_invoices_items values ( '10088','45');
insert into relationship_invoices_items values ( '10089','23');
insert into relationship_invoices_items values ( '10090','16');
insert into relationship_invoices_items values ( '10090','28');

/*Every item id is unique*/

create table relationship_items_companies ( item_id int(4) ,
                                             company_code int(5) ,
                                             primary key (item_id),
                                             foreign key (item_id) references items (item_id) ,
                                             foreign key (company_code) references companies (company_code) );

insert into relationship_items_companies values ('34','123');
insert into relationship_items_companies values ('56','123');
insert into relationship_items_companies values ('45','123');
insert into relationship_items_companies values ('23','234');
insert into relationship_items_companies values ('16','345');
insert into relationship_items_companies values ('28','345');

/*

create table relationship_companies_quantity ( company_code int(5) ,
                                             item_id int(4) ,
                                             primary key (company_code, item_id),
                                             foreign key (company_code) references companies (company_code) ,
                                             foreign key (item_id) references quantity (item_id) );

insert into relationship_companies_quantity values ('123','34');
insert into relationship_companies_quantity values ('123','56');
insert into relationship_companies_quantity values ('123','45');
insert into relationship_companies_quantity values ('234','23');
insert into relationship_companies_quantity values ('345','16');
insert into relationship_companies_quantity values ('345','28');

/**********************************************************************************/
