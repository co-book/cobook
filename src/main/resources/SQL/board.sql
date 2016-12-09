CREATE TABLE TEST_BOARD
(
   BNO        int primary key,
   TITLE      VARCHAR2 (20),
   WRITER     VARCHAR2 (20),
   CONTENT    CLOB,
   REGDATE    DATE,
   FILE_URL   VARCHAR2 (1000)
)

create sequence bno_seq increment by 1;
alter table test_board drop(content);

insert into TEST_BOARD values
(bno_seq.nextval, '제목', '을동이', '내용', sysdate, '파일이름');