--방명록 관리
create table board (
id         number constraint board_id_pk primary key,
title      varchar2(300) not null,
content    varchar2(4000) not null,
writer     varchar2(50) constraint board_writer_fk references member(user_id)
                            on delete set null,
writedate  date default sysdate,
readcnt    number default 0
);

create sequence seq_board start with 1 increment by 1 nocache;
create or replace trigger trg_board 
    before insert on board
    for each row
begin
    select seq_board.nextval into :new.id from dual;
end;
/

create sequence seq_board_file start with 1 increment by 1 nocache;
create or replace trigger trg_board_file 
    before insert on board_file
    for each row
begin
    select seq_board_file.nextval into :new.id from dual;
end;
/


-- 방명록 첨부파일 관리
create table board_file (
id          number constraint board_file_id_pk primary key,
filename    varchar2(300) not null,
filepath    varchar2(300) not null,
board_id    number constraint board_file_fk references board(id) on delete cascade
);

-- 방명록 댓글 관리
insert into board( title, content, writer )
values ( '방명록 글1','방명록 글입니다','hong2023' )
;
insert into board( title, content, writer )
values ( '방명록 글2','방명록 글입니다','park2023' )
;
commit;

select user_id from member;

select  id, board_id, filename from board_file;

select (select count(*) from board_file f where f.board_id = b.id) filecnt, b.* 
from (select b.*, name, row_number() over(order by id) no
	  from board b left outer join member m on b.writer = m.user_id  ) b
order by no desc
;


insert into board ( title, content, writer)
select title, content, writer from board;

commit;


