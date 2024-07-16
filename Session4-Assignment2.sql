USE storefront;

/* Create a Stored procedure to retrieve average sales of each product 
in a month. Month and year will be input parameter to function.
*/

DELIMITER $$
CREATE PROCEDURE averge_sale_product(IN order_month INT, order_year INT)
BEGIN
	SELECT i.product_id, AVG(i.price) as average_price
    FROM orders o
    INNER JOIN items i
    ON o.id = i.order_id
    WHERE YEAR(o.order_date) = order_year AND MONTH(order_date) = order_month
	GROUP BY i.product_id;
END $$	
#DROP PROCEDURE averge_sale_product; 

CALL averge_sale_product(7, 2024);
CALL averge_sale_product(6, 2024);


/*Create a stored procedure to retrieve table having order detail with
 status for a given period. Start date and end date will be input parameter. 
 Put validation on input dates like start date is less than end date. 
 If start date is greater than end date take first date of month as start date.
 */
 
 DELIMITER $$
 CREATE PROCEDURE order_information(IN start_date DATE, end_date DATE)
 BEGIN
	IF start_date > end_date THEN
		SET start_date = DATE_FORMAT(end_date, "%Y-%M-01");
	END IF;
    
	SELECT p.id, p.name, i.order_id, i.status
    FROM product p
    INNER JOIN items i
    ON p.id = i.product_id
    INNER JOIN orders o
    ON o.id = i.order_id
    WHERE order_date BETWEEN start_date AND end_date;
END $$

# DROP PROCEDURE order_information;

CALL order_information('2024-06-01', '2024-07-15');
CALL order_information('2024-07-01', '2024-06-28');
