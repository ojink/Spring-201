--부서별 사원수 조회
-- 영업부 5
-- 총무부 10

select department_id, nvl(department_name, '소속없음') department_name, count(employee_id) count
from employees e left outer join departments d using(department_id)
group by department_id, department_name;


--년도별 채용인원수 조회
--2020년 10
--2024년 2
select to_char(hire_date,'yyyy')||'년' unit, count(employee_id) count
from employees
group by to_char(hire_date,'yyyy')
order by unit
;
--월별 채용인원수 조회
--1월 10
--2월 5
select to_char(hire_date,'mm')||'월' unit, count(employee_id) count
from employees 
group by to_char(hire_date,'mm')
order by unit
;

-- 상위3위의 부서들
--rank over() :  1, 1, 3,3,3,6,
--dense_rank over() : 1, 1, 2,2,2,3,4, 5 
select rank, department_id, department_name
from (select  dense_rank() over( order by count(*) desc ) rank, department_id
      from employees
      group by department_id) e left outer join departments d using( department_id)
where rank <= 3      
;

--부서명, 입사월 
select to_char(hire_date, 'mm') unit, department_name
from employees e inner join (
            select rank, department_id
                   , '(TOP' || rank || ')' || department_name  department_name
            from (select  dense_rank() over( order by count(*) desc ) rank, department_id
                  from employees
                  group by department_id) e left outer join departments d using( department_id)
            where rank <= 3 ) r using( department_id )
;

select *
from ( select to_char(hire_date, 'mm') unit, department_name
        from employees e inner join (
            select rank, department_id
                   , '(TOP' || rank || ')' || department_name  department_name
            from (select  dense_rank() over( order by count(*) desc ) rank, department_id
                  from employees
                  group by department_id) e left outer join departments d using( department_id)
            where rank <= 3 ) r using( department_id ) )
pivot ( count(*) for unit in ( '01' "01월", '02' "02월", '03' "03월", '04' "04월", '05'  "05월", '06'  "06월"
                             ,  '07' "07월",'08' "08월", '09' "09월", '10' "10월",  '11' "11월",  '12'  "12월") )
;

select *
from ( select to_char(hire_date, 'mm') unit, department_name
        from employees e inner join (
            select rank, department_id
                   , '(TOP' || rank || ')' || department_name  department_name
            from (select  dense_rank() over( order by count(*) desc ) rank, department_id
                  from employees
                  group by department_id) e left outer join departments d using( department_id)
            where rank <= 3 ) r using( department_id ) )
pivot ( count(*) for unit in ( '01' "01월", '02' "02월", '03' "03월", '04' "04월", '05'  "05월", '06'  "06월"
                             ,  '07' "07월",'08' "08월", '09' "09월", '10' "10월",  '11' "11월",  '12'  "12월") )
;


--세로행 가로로, 가로행 세로로 변환 : pivot, unpivot
-- 열(가로행)로 된 데이터행 
select 5 "01월", 1 "02월", 0 "03월", 10 "04월", 2 "05월", 1 "06월"
        , 5 "07월", 1 "08월", 0 "09월", 1 "10월", 0 "11월", 5 "12월"
from dual;        
-- 열(가로행)로 된 데이터행 을 세로행으로 변경
/*
select 컬럼
from (조회할 데이터select문)
pivot/unpivot ( 집계함수표현식 for pivot/unpivot대상 in(행/열로 바꿀 열/행) )
*/
select *
from ( select 5 "01월", 1 "02월", 0 "03월", 10 "04월", 2 "05월", 1 "06월"
        , 5 "07월", 1 "08월", 0 "09월", 1 "10월", 0 "11월", 5 "12월"
        from dual )
unpivot( cnt for mm in ("01월", "02월", "03월", "04월", "05월", "06월"
        ,  "07월","08월", "09월", "10월",  "11월",  "12월") )
;

-- 행으로 이루어진 데이터행을 가로열로 변경
select *
from (select *
        from ( select 5 "01월", 1 "02월", 0 "03월", 10 "04월", 2 "05월", 1 "06월"
                , 5 "07월", 1 "08월", 0 "09월", 1 "10월", 0 "11월", 5 "12월"
                        from dual )
                unpivot( cnt for mm in ("01월", "02월", "03월", "04월", "05월", "06월"
                        ,  "07월","08월", "09월", "10월",  "11월",  "12월") ) )
pivot ( sum(cnt) for mm in ( '01월', '02월', '03월', '04월', '05월', '06월'
                        ,  '07월','08월', '09월', '10월',  '11월',  '12월' ) )                        
;
        
-- 부서별 사원수 
select department_id, count(*) count
from employees
group by department_id
;
select *
from ( select department_id, count(*) count
        from employees
        group by department_id )
pivot ( sum(count) for department_id in ( 10, 20, 30, 40, 50, 60, 70, 80, 90, 100, 110, null  ) )        
;

-- 입사월별 사원수 
select to_char(hire_date, 'mm') unit from employees
;

select *
from ( select to_char(hire_date, 'mm') unit from employees )
pivot ( count(*)  for unit in ( '01', '02', '03', '04', '05', '06'
                        ,  '07','08', '09', '10',  '11',  '12') )
;


