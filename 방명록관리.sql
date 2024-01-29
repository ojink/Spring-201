--规疙废 包府
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


-- 规疙废 梅何颇老沥焊 包府
create table board_file (
id          number constraint board_file_id_pk primary key,
filename    varchar2(300) not null,
filepath    varchar2(300) not null,
board_id    number constraint board_file_fk references board(id) on delete cascade
);


--规疙废 瘩臂 包府