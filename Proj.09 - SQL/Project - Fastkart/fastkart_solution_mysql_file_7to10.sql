-- continue from 7th question

use fastkart;

/*
7) Write a quary to display ProductId, ProductName, CategoryName, Old_Price (Price)
and new price as per the following criteria: 
a) if the categroy is 'Motors', decrease the rpice by 3000
b) if the categroy is 'Electronics', increase the price by 50
c) if the categroy is ' Fashion', increase the price by 150
For the rest of the categories, price remains same.*/

select P.ProductId, P.ProductName, C.CategoryName, P.Price as Old_Price,
case 
	when C.CategoryName = 'Motors' then (P.Price - 3000) 
	when C.CategoryName = 'Electronics' then (P.Price + 50) 
	when C.CategoryName = 'Fashion' then (P.Price + 150) 
    else P.Price 
    end as New_Price
from Products P
inner join Categories C
on P.CategoryId = C.CategoryId;

------------------------------------------------------------------------

/*
8) Display the percentage of females present among all users. 
Round upto 2 decimal places. Add '%' sign while displaying the percentage.*/

select 
((select count(Gender) from Users where Gender = 'F') * 100 / (select count(Gender) from Users))
as Female_Percentage_among_all_users
from Users
where Gender = 'F'
group by Gender;

-----------------------------------------------------------------------------

/*
9) Display the average balance for both card types for those records only where CVVNumber > 333 
and NameOnCard ends with the alphabet 'e'.*/

select CardType, avg(Balance) as Average_Balance
from CardDetails
where CVVNumber > 333
and NameOnCard like '%e'
group by CardType;

------------------------------------------------------------------

/*
10) What is the second most valuable item available which does not belong to the 'Motor' category.
Value of an item = Price*QuantityAvailable. Display ProductName, CategoryName, Value.*/

select P.ProductName, C.CategoryName,
case when C.CategoryName != 'Motors' then (P.Price * P.QuantityAvailable) -- Price * QuantityAvailable = Value
end as Value
from Products P
inner join Categories C
on P.CategoryId = C.CategoryId
where C.CategoryName != 'Motors'
order by Value desc
limit 1,1;

------------------------------------------------------------------------



