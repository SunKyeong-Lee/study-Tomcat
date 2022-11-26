create database JAVA;
use JAVA;
create table User (
	userID varchar(30),
    userPassword varchar(50)
);
select * from User;

create table Book (
	title varchar(50),
    count int
);
select * from Book;