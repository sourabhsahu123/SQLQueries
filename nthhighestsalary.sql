create table employee
( emp_ID int
, emp_NAME varchar(50)
, DEPT_NAME varchar(50)
, SALARY int);

insert into employee values(101, 'Mohan', 'Admin', 4000);
insert into employee values(102, 'Rajkumar', 'HR', 3000);
insert into employee values(103, 'Akbar', 'IT', 4000);
insert into employee values(104, 'Dorvin', 'Finance', 6500);
insert into employee values(105, 'Rohit', 'HR', 3000);
insert into employee values(106, 'Rajesh',  'Finance', 5000);
insert into employee values(107, 'Preet', 'HR', 7000);
insert into employee values(108, 'Maryam', 'Admin', 4000);
insert into employee values(109, 'Sanjay', 'IT', 6500);
insert into employee values(110, 'Vasudha', 'IT', 7000);
insert into employee values(111, 'Melinda', 'IT', 8000);
insert into employee values(112, 'Komal', 'IT', 10000);
insert into employee values(113, 'Gautham', 'Admin', 2000);
insert into employee values(114, 'Manisha', 'HR', 3000);
insert into employee values(115, 'Chandni', 'IT', 4500);
insert into employee values(116, 'Satya', 'Finance', 6500);
insert into employee values(117, 'Adarsh', 'HR', 3500);
insert into employee values(118, 'Tejaswi', 'Finance', 5500);
insert into employee values(119, 'Cory', 'HR', 8000);
insert into employee values(120, 'Monica', 'Admin', 5000);
insert into employee values(121, 'Rosalin', 'IT', 6000);
insert into employee values(122, 'Ibrahim', 'IT', 8000);
insert into employee values(123, 'Vikram', 'IT', 8000);
insert into employee values(124, 'Dheeraj', 'IT', 11000);


SELECT  [emp_ID]
      ,[emp_NAME]
      ,[DEPT_NAME]
      ,[SALARY]
  FROM [sqlinterviewdb].[session7].[employee]

--We need to find 3rd highest salary employee.
select * from [sqlinterviewdb].[session7].[employee]
order by SALARY desc

select * from (
select TOP 2 * from [sqlinterviewdb].[session7].[employee]
order by SALARY desc)TT order by TT.SALARY asc

select TOP 1 * from (
select TOP 3 * from [sqlinterviewdb].[session7].[employee]
order by SALARY desc)TT order by TT.SALARY asc

--window function ranking

select  *,
rank() over(order by salary desc) 'rnk'
from [sqlinterviewdb].[session7].[employee]

select * from (
select  *,
rank() over(order by salary desc) 'rnk'
from [sqlinterviewdb].[session7].[employee]
)TT
where TT.rnk=2


--using CTE (Common Table Expression)

WITH CTE_EmpRank AS (
Select *,
rank() over(order by salary desc) 'rnk'
from [sqlinterviewdb].[session7].[employee]
)


SELECT * from CTE_EmpRank where rnk=2
