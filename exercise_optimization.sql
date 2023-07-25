USE LittleLemonDM;
# SHOW TABLES;

# TASK 1
DELIMITER //
DROP PROCEDURE IF EXISTS GetMaxQuantity;
CREATE PROCEDURE GetMaxQuantity()
BEGIN
SELECT MAX(Quantity) FROM Orders;
END//
DELIMITER ;
CALL GetMaxQuantity();

# TASK 2
PREPARE GetOrderDetail FROM 'SELECT idOrder, Quantity, TotalCost FROM Orders WHERE idOrder = ?';
SET @id = 1;
EXECUTE GetOrderDetail USING @id;

# TASK 3
DROP PROCEDURE IF EXISTS CancelOrder;
DELIMITER //
CREATE PROCEDURE CancelOrder(IN id INT)
BEGIN
DELETE FROM Orders WHERE idOrder = id;
SELECT 'ORDER ' + id + ' is cancelled' AS 'Confirmation';
END//
DELIMITER ;
CALL CancelOrder(5);