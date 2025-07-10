select *
from FINAL

--Esto estandariza la columna fat content

update FINAL
set [Item Fat Content] = 
	case 
		when [Item Fat Content] in ('LF','low fat') then 'Low Fat' 
		when [Item Fat Content] = 'reg' then 'Regular'
		else [Item Fat Content]
	end

select distinct [Item Fat Content]
from FINAL
-- Total Sales

select sum (sales)
from FINAL	

--Average sales

select CAST(AVG (sales)As decimal (10,1)) as Average_Sales 
from FINAL
WHERE [outlet establishment year] = 2022

-- # of Items

select COUNT(*) AS No_of_Items
from FINAL

--Average rating

select CAST(AVG (Rating) AS decimal (10,2)) as Average_Rating
from FINAL

--Total Sales by Fat Content 

select [Item Fat Content], CAST(sum (sales) as decimal (10,2)) AS total_sales,CAST(AVG (Sales) AS decimal (10,2)) as Average_Sales, CAST(AVG (Rating) AS decimal (10,2)) as Average_Rating, COUNT(*) AS No_of_Items
from FINAL
GROUP BY [Item Fat Content]
order by total_sales DESC

--Total Sales by Item Type

select [Item Type], sum (sales) AS total_sales,CAST(AVG (Sales) AS decimal (10,2)) as Average_Sales , CAST(AVG (Rating) AS decimal (10,2)) as Average_Rating, COUNT(*) AS No_of_Items
from FINAL
GROUP BY [Item Type]
order by total_sales DESC

--Fat Content by outlet for total sales

select [Outlet Location Type], [Item Fat Content], sum (sales) AS total_sales,CAST(AVG (Sales) AS decimal (10,2)) as Average_Sales , CAST(AVG (Rating) AS decimal (10,2)) as Average_Rating, COUNT(*) AS No_of_Items
from FINAL
GROUP BY [Outlet Location Type], [Item Fat Content]
order by total_sales DESC

-- Total Sales by outlet Establishment

select [Outlet Establishment Year],CAST(sum (sales) AS decimal (10,2)) as total_sales
from FINAL
group by [Outlet Establishment Year]
order by total_sales ASC

