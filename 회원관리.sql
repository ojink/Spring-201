--drop table member;
rename  hanul_member to member;
desc hanul_member;
alter table member add ( 
   role varchar2(10) default 'USER' not null, -- USER/ADMIN
   gender varchar2(3) default '��' not null,
   profile varchar2(300)
);

select to_char(sysdate, 'yyyy-mm-dd') from dual;

select user_id, name, user_pw from member;
alter table member modify ( user_pw varchar2(300) null );

select * from member;
--where user_id ='hong2023' and user_pw = '1234';
--where user_id ='hanul201' and user_pw = '0000';

update member
set email = 'ojink2@naver.com'
where user_id != 'hong2023';
commit;

select user_id, email, name, social,role, profile from member;
desc member;

-- �Ҽȷα��ν� id �� ���̸� ����ؼ� user_id �� �÷������� �����ϱ�
alter table member modify( user_id varchar2(100) );
alter table member modify (email null);

select user_id, name, role from member;

