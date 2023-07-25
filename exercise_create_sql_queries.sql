# Task 1
INSERT INTO `littlelemondm`.`Bookings` (`idBooking`, `idCustomer`, `BookingDate`, `TableNumber`) VALUES ('1', '1', '2022-10-10', '5');
INSERT INTO `littlelemondm`.`Bookings` (`idBooking`, `idCustomer`, `BookingDate`, `TableNumber`) VALUES ('2', '3', '2022-11-12', '3');
INSERT INTO `littlelemondm`.`Bookings` (`idBooking`, `idCustomer`, `BookingDate`, `TableNumber`) VALUES ('3', '2', '2022-10-11', '2');
INSERT INTO `littlelemondm`.`Bookings` (`idBooking`, `idCustomer`, `BookingDate`, `TableNumber`) VALUES ('4', '1', '2022-10-13', '2');

# Task 2
DROP PROCEDURE IF EXISTS CheckBooking;
DELIMITER //
CREATE PROCEDURE CheckBooking(IN bdate DATE, IN tnumber INT)
BEGIN
	SELECT 
	CASE WHEN (SELECT COUNT(*) FROM Bookings WHERE BookingDate = bdate AND  TableNumber = tnumber) > 0
    THEN CONCAT('Table ', tnumber ,' is already booked')
    ELSE CONCAT('Table ', tnumber, ' is free')
    END AS 'Booking status';
END //
DELIMITER ;
CALL CheckBooking('2022-10-10', 5);



# Task 3
DROP PROCEDURE IF EXISTS AddValidBooking;
DELIMITER //
CREATE PROCEDURE AddValidBooking(IN bdate DATE, IN tnumber INT)
BEGIN
	START TRANSACTION;
    IF (SELECT COUNT(*) FROM Bookings WHERE BookingDate = bdate AND  TableNumber = tnumber) > 0 THEN
		SELECT CONCAT('Table ', tnumber ,' is already booked') AS 'Booking status';
    ELSE
		SELECT CONCAT('Table ', tnumber, ' is free') AS 'Booking status';
	END IF;
    COMMIT;
END //
DELIMITER ;
CALL AddValidBooking('2022-10-10', 5);