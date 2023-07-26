USE LittleLemonDM;
# SHOW TABLES;

# Task 1
DROP PROCEDURE IF EXISTS AddBooking;
DELIMITER //
CREATE PROCEDURE AddBooking(IN id INT, IN idcustomer INT, IN bdate DATE, IN tnumber INT)
BEGIN
	START TRANSACTION;
	INSERT INTO Bookings(idBooking, idCustomer, BookingDate, TableNumber)
	VALUES (id, idcustomer, bdate, tnumber);
    COMMIT;
END //
DELIMITER ;
CALL AddBooking(5, 3,"2022-12-30", 69);

# Task 2
DROP PROCEDURE IF EXISTS UpdateBooking;
DELIMITER //
CREATE PROCEDURE UpdateBooking(IN id INT, IN bdate DATE)
BEGIN
	START TRANSACTION;
	UPDATE Bookings
	SET BookingDate = bdate
	WHERE idBooking = id;
    COMMIT;
END //
DELIMITER ;
CALL UpdateBooking(5, '2022-12-17');

# Task 3
DROP PROCEDURE IF EXISTS CancelBooking;
DELIMITER //
CREATE PROCEDURE CancelBooking(IN id INT )
BEGIN
	START TRANSACTION;
	DELETE FROM Bookings WHERE idBooking = id;
    COMMIT;
END //
DELIMITER ;
CALL CancelBooking(5);