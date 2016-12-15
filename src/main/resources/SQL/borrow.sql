create table borrow(
borrow_no int primary key,
userno int,
borrowdate date default sysdate,
period int default 30,
cash int default 0
);

create sequence borrow_no_seq increment by 1;