CREATE VIEW ProfitByPizza AS
SELECT
    pizza_Size AS Size,
    pizza_CrustType AS Crust,
    SUM(p.pizza_CustPrice - p.pizza_BusPrice) AS Profit,
    DATE_FORMAT(ordertable_OrderDateTime, '%m/%Y') AS OrderMonth
FROM PIZZA P
JOIN ORDERTABLE O on P.ordertable_OrderID = O.ordertable_OrderID
GROUP BY P.pizza_Size, P.pizza_CrustType, OrderMonth
ORDER BY Profit;