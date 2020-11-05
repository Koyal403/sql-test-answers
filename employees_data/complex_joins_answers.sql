-- Questions at
-- https://www.w3resource.com/sql-exercises/employee-database-exercise/subqueries-exercises-on-employee-database.php#SQLEDITOR


SELECT
  *
FROM
  koyal.countries
LIMIT
  100;
----------------******************************************-------------------
  ----------------******************************************-------------------
  ----------------******************************************-------------------
  ----------------******************************************-------------------
select
  E.employee_id,
  E.first_name,
  E.job_id,
  J.JOB_TITLE,
  (CURRENT_DATE - E.HIRE_DATE) as 'dt' --   date_format(curdate(), '%y/%m/%d') - date_format( hire_date, '%y/%m/%d') as 'EXP'
from
  koyal.employees E
  LEFT JOIN koyal.JOBS J ON E.JOB_ID = J.JOB_ID
where
  J.JOB_TITLE LIKE '%MANAGER';
----------------******************************************-------------------
  ----------------******************************************-------------------
  ----------------******************************************-------------------
  ----------------******************************************-------------------
select
  two.*,
  locations.CITY
from
  locations
  left join (
    select
      one.*,
      jobs.JOB_TITLE
    from
      jobs
      right join (
        select
          e.EMPLOYEE_ID,
          e.FIRST_NAME,
          e.SALARY,
          e.DEPARTMENT_ID,
          e.JOB_ID,
          e.HIRE_DATE,
          d.DEPARTMENT_NAME,
          d.LOCATION_ID,
          CURRENT_DATE - E.HIRE_DATE AS 'EXP'
        from
          employees e
          left join departments d on e.DEPARTMENT_ID = d.DEPARTMENT_ID
      ) as one on jobs.JOB_ID = one.JOB_ID
    where
      jobs.JOB_TITLE like "%MANAGER%"
      or jobs.JOB_TITLE like "%CLERK%"
  ) as two on locations.LOCATION_ID = two.LOCATION_ID
where
  locations.CITY = 'SEATTLE'
  AND two.EXP > 050000;
----------------******************************************-------------------
  ----------------******************************************-------------------
  ----------------******************************************-------------------
  ----------------******************************************-------------------
select
  tab_1.*,
  locations.city
FROM
  locations
  right join (
    select
      e.EMPLOYEE_ID,
      e.FIRST_NAME,
      e.SALARY,
      e.DEPARTMENT_ID,
      d.DEPARTMENT_NAME,
      d.LOCATION_ID
    from
      employees e
      left join departments d on e.DEPARTMENT_ID = d.DEPARTMENT_ID
  ) as tab_1 on locations.location_id = tab_1.location_id
WHERE
  locations.CITY = "seattle"
  and tab_1.DEPARTMENT_NAME = "finance"
  and tab_1.salary * 12 > 28000
  and tab_1.salary != 2800
  and tab_1.salary != 6900 ----------------******************************************-------------------
  ----------------******************************************-------------------
  ----------------******************************************-------------------
  ----------------******************************************-------------------
