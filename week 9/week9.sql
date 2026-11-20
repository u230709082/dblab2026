USE COMPANY;
DELIMITER $$
CREATE PROCEDURE SelectCustomerByCountry  (IN c varchar(45))
BEGIN
     SELECT*from customers
     where Country=c;
END $$
DELIMITER ;     

SET @country = "Spain";
SELECT @country;
CALL SelectCustomerByCountry (@country);
SELECT @country;


DELIMITER $$
CREATE PROCEDURE GetOrderCountByShipper (IN shipper varchar(45), OUT count INT )
BEGIN
     SELECT COUNT(OrderID) INTO count
     FROM Orders 
     JOIN Shippers on Orders.ShipperID = Shippers.ShipperID
     WHERE ShipperName= shipper;
END $$
DELIMITER;

select SipperName from Shippers;
SET @order_cnt =0;
SELECT @order_cnt;
CALL GetOrderCountByShipper("United Package",@order_cnt);
select @order_cnt ;


DELIMITER $$

CREATE PROCEDURE GetCustomerSalesOut (
    IN inCustomerID INT,
    OUT outName VARCHAR(255),
    OUT outSales FLOAT
)
BEGIN
    SELECT CustomerName INTO outName
    FROM Customers
    WHERE CustomerID = inCustomerID;

    SELECT IFNULL(SUM(p.Price * od.Quantity), 0) INTO outSales
    FROM Orders o
    JOIN OrderDetails od ON o.OrderID = od.OrderID
    JOIN Products p ON p.ProductID = od.ProductID
    WHERE o.CustomerID = inCustomerID;
END $$

DELIMITER ;

CALL GetCustomerSalesOut(5, @name, @sales);

SELECT @name, @sales;


     

