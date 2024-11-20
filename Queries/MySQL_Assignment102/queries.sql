select * from emp

-- Query 1 select ename , dept  , sal+300 as SALARY_INCREMENT from emp

-- Query 2 select ename , dept from emp where dept in (10,30) order by ename

-- Query 3 select empno, ename , sal , sal+(sal*0.15) as New_Salary  , sal*0.15 as Increment from emp

-- Query 4 select concat(ename , ' earns ' , sal , ' monthly') from emp

-- Query 5 select Max(sal)-Min(sal) as DIFFERENCE FROM EMP

-- Query 6 select ename from emp where mgr in (select empno from emp where ename  = 'KING' AND mgr is null);

--Query 7
/*select ename , sal+(sal*0.15) Salary_Increment
from emp
where sal > (select avg(sal) from emp)*/


--Query  8 
/*select * from emp
select ename , (sal-200)+comm 
from emp
*/


-- Query 9
/*select ename , sal+(sal*0.20)+500 
from emp*/

-- Query 10

-- Updation 
/*select * from emp where job  = 'ANALYST'
update emp set comm = 0.00
where job  = 'ANALYST'

update emp set comm = NULL
where job = 'MANAGER'*/

-- Query 10
/*
select ename , sal 
from emp
where sal =  sal + comm
*/


-- Query 11
-- select ename , sal*12  as YEARLY_INCOME
-- from emp




select * from  emp where dept in (select deptno from dept where dname  = 'RESEARCH')
select * from dept 

SELECT dept, MIN(sal) 
FROM emp 
GROUP BY dept 
HAVING MIN(sal) = 
    (SELECT MIN(sal) 
     FROM emp 
     WHERE dept = 20);


	 select dept , MIN(sal)
	 from emp  
	 group by dept 
	 having MIN(sal) = (
		
			select  MIN(sal) 
			from emp 
			where dept in (
					select deptno 
					from dept 
					where dname = 'RESEARCH'
					)
			)
	 


SELECT  ename, sal, dept 
FROM  emp 
 WHERE  sal  in (SELECT   MIN(sal) 
FROM  emp 
	 	 	GROUP  BY  dept); 


			