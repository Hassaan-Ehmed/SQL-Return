-- Stored Procedure Example 
create procedure spGetEmployees -- procedure name starting with 'sp' prefix
as -- not alising
begin -- scope start
select * from emp -- query OR quries
end -- scope end

execute spGetEmployees; -- calling procedure


-- Stored Procedure with parameter

create procedure spGetEmpByID
@empid int -- parameter variable
as begin
select * from emp where empno = @empid -- compare with empno that are comming from parameter 
end

execute spgetEmpByID 7900; -- after 1 space give his parameter

create procedure spGetEmpUnderManager
@MANAGER_NAME varchar(10)
as begin
select * from emp 
where mgr in (
	select empno 
		from emp 
			where ename = @MANAGER_NAME
			)
end

execute spGetEmpUnderManager 'BLAKE';

 

-- Stored Procedure Multiple Parammeter

create procedure spGetEmpByNameID
@id int,
@Name varchar(50)
as begin
select * from emp where empno = @id AND ename = @Name;
end

execute spGetEmpByNameID 7008,'ASLAM'  

-- Altering Exsisiting Procedure to update new logic!

Alter procedure spGetEmpByNameID
@id int,
@Name varchar(50)
-- with encryption
as begin
select ename , sal  from emp where empno = @id OR ename = @Name;
end

execute spGetEmpByNameID 08,'ASLAM';  

sp_helptext spGetEmpByNameID;


drop procedure spGetEmpUnderManager; 

-- sp_helptext spGetEmpUnderManager;



create procedure spEmpFromDept
@DepartmentName varchar(50)
as begin

select * from emp where dept in (select deptno from dept where dname  = @DepartmentName);

end

select * from dept
execute spEmpFromDept 'RESEARCH';

sp_helptext spspEmpFromDept

alter procedure spEmpFromDept
@DepartmentName varchar(50)
with encryption
as begin

select * from emp where dept in (select deptno from dept where dname = @DepartmentName);

end



sp_helptext spEmpFromDept;
drop procedure spEmpFromDept;
