CREATE VIEW ProfitByPizza AS
SELECT
    pizza_Size AS Size,
    pizza_CrustType AS Crust,
    SUM(p.pizza_CustPrice - p.pizza_BusPrice) AS Profit,
    DATE_FORMAT(ordertable_OrderDateTime, '%c/%Y') AS OrderMonth
FROM pizza p
JOIN ordertable o on p.ordertable_OrderID = o.ordertable_OrderID
GROUP BY p.pizza_Size, p.pizza_CrustType, OrderMonth
ORDER BY Profit;