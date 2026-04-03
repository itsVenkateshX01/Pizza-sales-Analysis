-- Group the orders by date and calculate the average number of pizzas ordered per day.

SELECT 
    ROUND(AVG(order_placed), 0)
FROM
    (SELECT 
        orders.order_date,
            SUM(order_details.quantity) AS order_placed
    FROM
        orders
    JOIN order_details ON orders.order_id = order_details.order_id
    GROUP BY order_date) AS order_quantity;