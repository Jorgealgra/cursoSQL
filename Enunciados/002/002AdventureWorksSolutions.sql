-----Ejercicios resueltos de consultas en SQL Server y base de datos Adventure Works-----

--Mostrar a todos los empleados que se encuentran en el departamento de manufactura y de aseguramiento de la calidad;

select e.BusinessEntityID, e.*, d.Name
from HumanResources.Employee e 
inner join HumanResources.EmployeeDepartmentHistory h on e.BusinessEntityID = h.BusinessEntityID
inner join HumanResources.Department d on d.DepartmentID = h.DepartmentID
and h.EndDate is null
and d.Name in ('Quality Assurance', 'Production');

--Indicar el listado de los empleados del sexo masculino y que son solteros;

select *
from HumanResources.Employee
where Gender  = 'M' and MaritalStatus = 'S';

--Empleados cuyo apellido sea con la letra "S";

select *
from HumanResources.Employee e 
inner join Person.Person p on e.BusinessEntityID = p.BusinessEntityID 
where p.LastName like '%S%';

--Los empleados que son del estado de Florida;

select pp.*,ps.Name from HumanResources.Employee he
inner join Person.Person pp on pp.BusinessEntityID = he.BusinessEntityID
inner join Person.BusinessEntityAddress pb on pb.BusinessEntityID = pp.BusinessEntityID
inner join Person.Address pa on pa.AddressID = pb.AddressID
inner join Person.StateProvince ps on ps.StateProvinceID = pa.StateProvinceID
where ps.Name = 'Florida';

--La suma de las ventas hechas por cada empleado, y agrupadas por año;

select pp.FirstName, sum(SalesQuota) as total_vendido, year(QuotaDate) as año
from Sales.SalesPersonQuotaHistory qh
inner join Person.Person pp on qh.BusinessEntityID = pp.BusinessEntityID
group by pp.BusinessEntityID, year(QuotaDate), pp.FirstName
order by pp.BusinessEntityID;

select qh.BusinessEntityID, pp.FirstName, pp.LastName, sum(qh.SalesQuota) as Ventas_Totales
from Sales.SalesPersonQuotaHistory qh
inner join Person.Person pp on qh.BusinessEntityID = pp.BusinessEntityID
group by qh.BusinessEntityID, pp.FirstName, LastName
Order by Ventas_Totales desc;

-- El producto más vendido;

select top 1 pp.ProductID, pp.Name, count(ss.ProductID) as veces_vendido
from Production.Product pp
inner join Sales.SalesOrderDetail ss on pp.ProductID = ss.ProductID
group by ss.ProductID, pp.Name, pp.ProductID
order by count(ss.ProductID) desc;

--El producto menos vendido;

select top 1 pp.ProductID, pp.Name, count(ss.ProductID) as veces_vendido
from Production.Product pp
inner join Sales.SalesOrderDetail ss on pp.ProductID = ss.ProductID
group by ss.ProductID, pp.Name, pp.ProductID
order by count(ss.ProductID) asc;

--Listado de productos por no de ventas ordenando de mayor a menor;

select pp.ProductID, pp.Name,pp.ProductNumber, pp.ListPrice, count(ss.ProductID) as veces_vendido
from Production.Product pp
inner join Sales.SalesOrderDetail ss on pp.ProductID = ss.ProductID
group by ss.ProductID, pp.Name, pp.ProductID,pp.ProductNumber, pp.ListPrice
order by count(ss.ProductID) desc;

--Las ventas por territorio;

select st.Name, sum(so.OrderQty * so.UnitPrice) as total_vendido
from Sales.SalesOrderHeader sh
inner join Sales.SalesOrderDetail so on sh.SalesOrderID = so.SalesOrderID
inner join Sales.SalesTerritory st on st.TerritoryID = sh.TerritoryID
group by st.TerritoryID, st.Name
order by sum(so.OrderQty * so.UnitPrice) desc;