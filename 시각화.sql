--부서별 사원수 조회
-- 영업부 5
-- 총무부 10

select department_id, nvl(department_name, '소속없음') department_name, count(employee_id) count
from employees e left outer join departments d using(department_id)
group by department_id, department_name;
