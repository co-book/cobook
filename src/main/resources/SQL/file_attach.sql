create table file_attach(
file_no int primary key,
filename varchar2(100),
fileurl varchar2(200),
board_no int
);

create sequence file_no_seq increment by 1;

alter table file_attach add(board_no int);