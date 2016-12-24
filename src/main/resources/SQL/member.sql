create table member(
member_no int primary key,
nickname varchar2(100),
password varchar2(100),
sex char(1),
age int,
mypoint int default 0
);

create sequence member_no_seq increment by 1;
