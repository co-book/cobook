create table love(
love_no int primary key,
user_no int,
board_no int,
board_name varchar2(100)
)

create sequence love_no_seq increment by 1;
