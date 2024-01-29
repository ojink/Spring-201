--공지글 관리
create table notice (
id       number constraint notice_id_pk primary key, 
title    varchar2(300) not null,
content  varchar2(4000) not null,
writer   varchar2(50) default 'admin1',
writedate date default sysdate,
readcnt  number default 0,
filepath varchar2(300),
filename varchar2(300),
root     number,
step     number default 1,
indent   number default 0,
rid      number,
constraint notice_writer_fk foreign key(writer) 
                        references member(user_id) 
                        -- 작성자인 회원정보를 삭제시 1. writer 컬럼에 null
                        --                         2. 해당 writer가 쓴 글을 모두 삭제
);

alter table notice add (
    root     number,
    step     number default 1,
    indent   number default 0,
    rid      number constraint notice_rid_fk references notice(id) on delete cascade
);

alter table notice add constraint notice_rid_fk foreign key(rid) 
                                references notice(id) on delete cascade;


select id, root, step, indent, rid
from notice;
update notice set root = id;
commit;

select count(*) from notice ;


select * from 
(select row_number() over(order by id) no,  name, n.* 
from notice n left outer join member m on n.writer = m.user_id
) n
where no between 375 and 384
order by no desc
;

select user_id from member where role ='ADMIN';
desc notice;
/*
alter table notice  modify(writer default 'admin');
*/
alter table notice modify( writer  default 'admin1' null );
alter table notice modify( writer  null );
alter table notice modify( writer  default 'admin1' );
alter table notice drop constraint notice_writer_fk;
alter table notice add constraint notice_writer_fk
                        foreign key(writer) 
                        references member(user_id) on delete set null; 
/*
drop table test;
create table test(
col1 varchar2(10) default 'val1' not null ,
col2 varchar2(10) default 'val2' 
);
insert into test values('이름1', '아이디1');
insert into test(col1) values('이름1');
insert into test values(default, default);
select * from test;
*/

create sequence seq_notice start with 1 increment by 1 nocache;\

create or replace trigger trg_notice 
    before insert on notice
    for each row
begin
    select seq_notice.nextval into :new.id from dual;
--    원글인경우만
    if ( :new.root is null ) then
        select seq_notice.currval into :new.root from dual;
    end if;
end;
/

insert into notice (title, content, writer)
values ( '테스트 공지글2', '테스트 공지글2입니다', 'admin2' );
insert into notice (title, content)
values ( '테스트 공지글', '테스트 공지글입니다' );
commit;

select * from notice;

--공지글정보, 작성자 이름 조회
select row_number() over(order by id) no,  name, n.* 
from notice n left outer join member m on n.writer = m.user_id
order by no desc
;







