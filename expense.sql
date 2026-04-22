create database expense_db;
use expense_db;
create table expenses (
id int auto_increment primary key,
title varchar(100),
amount int,
category varchar(50),
date DATE);
insert into expenses(title,amount,category,date)values
("Pizza",200,"Food","2026-04-14"),
("Bus",50,"Travel","2026-04-15"),
("Movie",300,"Entertainment","2026-04-16"),
("Book",199,"Study","2026-04-17"),
("Lip Balm",200,"Cosmetics","2026-04-18");
select * from expenses;