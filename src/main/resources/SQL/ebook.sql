--ebook table
create table ebook(
EBOOK_NO int primary key,
TITLE varchar2(100),
AUTHOR varchar2(20),
PUBLISHER varchar2(20),
PUBLISHEDDATE date default sysdate,
IMAGE_NO int,
INTRO varchar2(2000),
CASH int default 0,
CATEGORY varchar2(100)
)

create sequence ebook_no_seq increment by 1;