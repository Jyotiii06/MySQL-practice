create table students(
    stu_id int primary key,
    f_name varchar(40),
    l_name varchar(40),
    age int,
    course varchar(10),
);
insert into students values(34252,'Neece','Goblin',23,'MBA');
insert into students values(45323,'Alex','Purohit',43,'BCA');
insert into students values(34252,'Hanish','Thakur',21,'BBA');
insert into students values(34252,'Jyoti','Rawat',33,'B.Tech');
desc students;
select * from students;

