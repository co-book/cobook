create table review(
review_no int primary key,
ebook_no int,
user_no int,
title varchar2(100) not null,
content CLOB not null,
hit int default 0,
regdate date default sysdate,
replycnt int default 0,
evaluate int
);

create sequence review_no_seq increment by 1;

alter table review add(evaluate int);
desc review;