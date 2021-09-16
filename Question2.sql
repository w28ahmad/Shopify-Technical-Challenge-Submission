-- QUESTION 2A
SELECT COUNT(*) AS Total FROM [Orders]
JOIN [Shippers] ON [Shippers].ShipperID = [Orders].ShipperID
WHERE ShipperName = 'Speedy Express';

-- Result: 54


-- QUESTION 2B
SELECT LastName, Max(Count) AS OrderCount FROM 
  (SELECT EmployeeID, COUNT(*) AS Count FROM [Orders]
	  GROUP BY EmployeeID) AS EmployeeOrderCount
JOIN [Employees] ON [Employees].EmployeeID = [EmployeeOrderCount].EmployeeID

-- Result: Peacock	had 40 Orders



-- Question 2C
SELECT ProductName, SUM([OrderDetails].Quantity) AS "Quantity" FROM [Orders]
JOIN [Customers] ON [Customers].CustomerID = [Orders].CustomerID
JOIN [OrderDetails] ON [OrderDetails].OrderID = [Orders].OrderID
JOIN [Products] ON [Products].ProductID = [OrderDetails].ProductID
WHERE [Customers].Country IS 'Germany'
GROUP BY [OrderDetails].ProductID
ORDER BY Quantity DESC
LIMIT 1

-- Result: Boston Crab Meat was the most ordered product from Germany

