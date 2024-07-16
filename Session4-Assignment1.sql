USE storefront;

/*Create a function to calculate number of orders in a month.
 Month and year will be input parameter to function.
 */
 
DELIMITER $$  
CREATE FUNCTION number_of_orders(order_month INT, order_year INT)
RETURNS INT
DETERMINISTIC
BEGIN 
	DECLARE order_count INT;
    SELECT COUNT(id) INTO order_count
    FROM orders
    WHERE MONTH(order_date) = order_month AND YEAR(order_date) = order_year;
    RETURN order_count;
END $$

SELECT number_of_orders(7, 2024) AS order_count;
SELECT number_of_orders(6, 2024) AS order_count;	


/*Create a function to return month in a year having
 maximum orders. Year will be input parameter.
 */
DELIMITER $$  
CREATE FUNCTION orders_in_year(order_year INT)
RETURNS INT
DETERMINISTIC
BEGIN 
	DECLARE order_count INT;
    SELECT COUNT(id) INTO order_count
    FROM orders
    WHERE YEAR(order_date) = order_year;
    RETURN order_count;
END $$

SELECT orders_in_year(2024) AS order_count;
SELECT orders_in_year(2023) AS order_count;
	
 