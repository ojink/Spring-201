-- ���, �����, �Ի�����, �μ���, �������� ��ȸ
select employee_id, last_name, first_name, hire_date, d.department_id, department_name, job_title
from employees e, departments d, jobs j
where e.department_id = d.department_id(+) and e.job_id = j.job_id
and d.department_id = 100
;

select employee_id, last_name, first_name, hire_date, d.department_id, department_name, job_title
from employees e left outer join departments d on e.department_id = d.department_id
inner join jobs j using( job_id )
;

select e.*, department_name
from employees e left outer join departments d
on e.department_id = d.department_id
where d.department_id = 100
;

select employee_id, last_name, first_name, hire_date, department_id, department_name
from employees e left outer join departments d
using ( department_id )
;

select e.*, department_name
from employees e left outer join departments d
using ( department_id )
;

-- �μ���(department_name), ��������(job_title) �߰���ȸ�ǰ� ������ �ϼ��ϱ�
select department_name, job_title, last_name||' '||first_name name, e.* 
from employees e left outer join departments d on e.department_id = d.department_id
inner join jobs j  on j.job_id = e.job_id
;


select * from departments;

-- ����� �ִ� �μ���� ��ȸ (�μ��ڵ�,�μ���)
select distinct department_id, nvl(department_name, '�ҼӾ���') department_name
from employees e left outer join departments d using(department_id)
order by department_name;


