USE LittleLemonDM;
SHOW TABLES;

# TASK 1
DROP VIEW IF EXISTS OrdersView;
CREATE VIEW OrdersView
AS (
	SELECT
	o.idOrder,
	o.Quantity,
	o.TotalCost
	FROM Orders o
	WHERE o.Quantity > 2
    );

# TASK 2
SELECT
c.idCustomer,
c.Name,
o.idOrder,
o.TotalCost,
m.MenuName,
mi.CourseName,
mi.DessertName
FROM Orders o
INNER JOIN Bookings b
ON o.idBooking = b.idBooking
INNER JOIN CustomerDetails c
ON c.idCustomer = b.idCustomer
INNER JOIN Menu m
ON o.idMenu = m.idMenu
INNER JOIN MenuItems mi
ON mi.idMenuItem = m.idMenuItem
WHERE o.TotalCost > 150
ORDER BY o.TotalCost;

# TASK 3
SELECT
m.MenuName
FROM Orders o
INNER JOIN Menu m
ON o.idMenu = m.idMenu
GROUP BY m.MenuName
HAVING COUNT(*) > 2;