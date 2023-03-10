
drop table member;

create table member(
	id varchar(50) primary key,
	pwd varchar(50) not null,
	name varchar(50) not null,
	email varchar(50) unique,
	auth int
);

select * from member;

select id
from member
where id = 'abc';

select count(*)
from member
where id = 'abc';

select id, name, email, auth from member where id = "abc" and pwd = "123";