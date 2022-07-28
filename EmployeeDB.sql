-- Database: Employeer

-- DROP DATABASE IF EXISTS "Employeer";

CREATE DATABASE "Employeer"
    -- Database: EmployeeDB

-- DROP DATABASE IF EXISTS "EmployeeDB";

CREATE DATABASE "EmployeeDB"
    

CREATE TABLE Employees
(

emp_id bigserial ,
    first_name varchar(50),
    surname varchar(50),
    gender char(2),
    address varchar(50),
    email varchar (50),

    CONSTRAINT emp_key PRIMARY KEY (emp_id),
    CONSTRAINT email_unique UNIQUE (email),
    role_id integer REFERENCES Roles (role_id),
    depart_id integer REFERENCES Departments (depart_id),
    salary_id integer REFERENCES Salaries(salary_id),
    overtime_id  integer REFERENCES OvertimeHours (overtime_id)
    
);
insert into Employees(emp_id,first_name,surname,gender,address,email,role_id,salary_id,overtime_id,depart_id)
values
(1,'Nhlamulo','Ndhlovu','f','lenasia','nhlamu@gmail.com',14,141,142,2001),
(2,'Lesego','jones','m','orlando','lesego@otlook.com',24,241,242,2002),
(3,'nyiko','baloyi','f','638 protea glen','nyiko@yahoo.com',34,341,342,2003),
(4,'amu','nkuna','m','2720 grasmere','amu@gmail.com',44,441,442,2004),
(5,'benny','smith','m','54 orange farm','smith@gmail.com',54,541,542,2005),
 
(6,'gift','naidoo','f','127 kibler park','gift@yahoo.com',64,641,642,2006),
(7,'keletso','mokwena','f','87 pimville','mokwena@gmail.com',74,741,742,2007),
(8,'mitchell','brooks','f','56 waterfall','mitchell@gmail.com',84,841,842,2008),
(9,'kerry','scheepers','f','9 aukland park ','keryy@outlok.com',94,941,942,2009),
(10,'palesa','kalake','m','11 chromium ','palesa@yahoo.com',104,1041,1042,20010),
(11,'evans','kapa','m','120 sheffield','evans@outlook.com',114,1141,1142,20011),
(12,'david','may','m','barium street','david@gmail.com',124,1241,1242,20012),
(13,'lethabo','lebepe','f','51 private road','lethabo@gmail.com',134,1341,1342,20013),
(14,'nick','selowa','f','florapark','selowa@yahoo.com',144,1441,1442,20014),
(15,'lovey','nkuna','f','tzaneen','love@gmail.com',154,1541,1542,20015);
 

drop table Employees;

select * from Employees;

CREATE TABLE Departments
(
    depart_id bigserial,
    depart_name varchar(50),
    depart_city varchar(50),
    
    CONSTRAINT depart_key primary key(depart_id)
       --CONSTRAINT composite_key primary key(depart_name,depart_city)--

)


insert into Departments(depart_id,depart_name,depart_city)
values (2001,'HR','johannesburg'),(2002,'HR','pretoria'),(2003,'HR','polokwane'),(2004,'IT','pretoria'),(2005,'safety and security','Northwest'),
(2006,'hygiene','mpumalanga'),(2007,'sales','mpumalanga'),(2008,'Recruiting','pretoria'),(2009,'hygiene','north west'),(20010,'IT','limpopo'),(20011,'sales','kimberly'),
(20012,'hygiene','durban'),(20013,'safety andsecurity','durban'),(20014,'Housing','polokwane'),(20015,'IT','johannesburg');

select*from Departments;


CREATE TABLE Roles
(
role_id bigserial,
role_name varchar(50),
    constraint role_key primary key (role_id)

)

insert into Roles(role_name,role_id)
values ('HR',14),('admin',24),('clerk',34),('IT',44),('safety and security',54),
('concilor',64),('HR',74),('manager',84),('cleaner',94),('IT',104),('assistant hr',114),
('cleaner',124),('security',134),('manager',144),('Techinician',154);
select*from Roles;


CREATE TABLE Salaries(
salary_id  bigserial,
    salary_pa numeric,
    constraint salary_key primary key (salary_id)

)


insert into Salaries(salary_id,salary_pa)
values(141,150000),(241,170000),(341,100000),(441,34000),(541,11000),
(641,120000),(741,150000),(841,320000),(941,20000),(1041,35000),(1141,60000),
(1241,85000),(1341,70000),(1441,130000),(1541,340000);

CREATE TABLE OvertimeHours
(

overtime_id bigserial,
 overtime_hours time,
    constraint  overtime_key primary key (overtime_id)
)

insert into OvertimeHours(overtime_id,overtime_hours)
values(142,'00:00:00'),(242,'00:00:00'),(342,'00:00:00'),(442,'00:00:00'),(542,'00:00:00'),
(642,'00:00:00'),(742,'00:00:00'),(842,'00:00:00'),(942,'00:00:00'),(1042,'00:00:00'),(1142,'00:00:00'),
(1242,'00:00:00'),(1342,'00:00:00'),(1442,'00:00:00'),(1542,'00:00:00');

select*from OvertimeHours;




SELECT address, email,first_name
FROM Employees
WHERE address= 'lenasia';

-----left join----
SELECT depart_name as departmentname ,role_name as jobtitle,salary_pa as salaryfigure,
OvertimeHours.overtime_hours as overtimehoursworked

from Employees

LEFT JOIN   Departments 
ON   Employees.depart_id=Departments.depart_id
left join Roles
on employees.role_id=Roles.role_id
left join Salaries 
on Employees.salary_id=Salaries.salary_id
left join OvertimeHours
on Employees.overtime_id=OvertimeHours.overtime_id





















