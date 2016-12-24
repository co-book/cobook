create table star(
star_no int primary key,
starpoint int not null,
user_no int,
reply_no int, 
ebook_no int
)

create sequence star_no_seq increment by 1;
