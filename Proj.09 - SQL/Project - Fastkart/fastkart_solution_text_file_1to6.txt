--1. List top 3 products based on QuantityAvailable. (ProductId, ProductName, QuantityAvailable)

SELECT ProductId, ProductName, QuantityAvailable 
FROM Products 
ORDER BY QuantityAvailable DESC
LIMIT 3;

-------------------------------------------

--2.Display EmailId of those customers who have done more than 10 purchases. (EmailId, Total_Transactions)

SELECT EmailId, count(QuantityPurchased) as Total_Transactions
FROM PurchaseDetails
GROUP BY EmailId
HAVING count(QuantityPurchased) > 10

-------------------------------------------

--3. List the total QuantityAvailable category wise in descending order. (Name of the category, QuantityAvailable)

SELECT CategoryName, SUM(QuantityAvailable) as Total_Quantity_Available
FROM Products
INNER JOIN Categories
ON Products.CategoryId = Categories.CategoryId	
GROUP BY Categories.CategoryId
ORDER BY sum(QuantityAvailable) DESC;

----------------------------------------------

--4. Display ProductId, ProductName, CategoryName, Total_Purchased_Quantity for the product which has been sold maximum in terms of quantity.

SELECT 
	Products.ProductId, 
	Products.ProductName, 
	Categories.CategoryName, 
	SUM(PurchaseDetails.QuantityPurchased) as Total_Purchased_Quantity 
FROM Products
JOIN PurchaseDetails
ON Products.ProductId = PurchaseDetails.ProductId
JOIN Categories
ON Products.CategoryId = Categories.CategoryId
GROUP BY Products.ProductId
ORDER BY Total_Purchased_Quantity DESC
LIMIT 1;

-----------------------------------------------

--5. Display the number of Male and Female Customers in Fastkart.

SELECT Gender, COUNT(RoleId) as Count_of_Customers 
FROM Users
WHERE RoleId = 2
GROUP BY Gender;

-----------------------------------------------

--6. Display ProductId, ProductName, Price and Item_Classes of all the products where item_classes are as follows:
/*If the price of an item is less than 2000 then "Affordable",
  If the price of an item is in between 2000 and 50,000 then "High End Stuff",
  If the price of an item is more than 50,000 then "Luxury".*/

SELECT 
	ProductId, 
	ProductName, 
	Price,
CASE
	WHEN Price < 2000 THEN 'Affordable'
	WHEN Price BETWEEN 2000 AND 50000 THEN 'High End Stuff'
	WHEN Price > 50000 THEN 'Luxury'
    ELSE NULL
	end as Item_Classes
FROM Products
ORDER BY Price;

---------------------------------------------------------------------------------------


