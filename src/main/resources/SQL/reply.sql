create table reply_test
(
replyno int primary key, --댓글번호
boardno int,--게시물 번호
replycont varchar2(2000),-- 댓글 4000바이트
regdate date default sysdate,-- 등록날짜
reparent int,-- 댓글부모번호
redepth int default 0,-- 댓글 레벨
reorder int default 1-- 댓글 순서
);

alter table reply_test add constraint fk_reply_test
foreign key(replyno) references test_board(bno);

create sequence replyno_seq increment by 1;

insert into reply_test(replyno, boardno, replycont, reparent)
values(replyno_seq.nextval, 27, '하야해', 27)

