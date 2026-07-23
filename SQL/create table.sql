create database banking_db;

use banking_db;

create table account_holder_data (
Account_holder_name varchar(100) not null,
Account_number int not null,
Email varchar(200),
Age tinyint not null

);




select * from account_holder_data ;
