# DatabaseImplementation
A database is being created for the Pizzas 'R US Chain. This assignment is implemented for CPSC-4620 Databasing Course.

The database application you are creating will be used by Pizzas-R-Us to track the day-to-day operations
of their pizzeria. For this assignment you will use the descriptions and ERD below to create and populate
the database needed by Pizzas-R-Us.
Pizzas-R-Us:
The most obvious thing that needs to be tracked as part of this database system is the information about
each pizza. A pizza has a crust type (thin, original, pan, gluten free) and a size (small, medium, large, x-
large). A pizza has an associated price and cost to the company, both of which are determined by the size
of the pizza and the toppings on the pizza. A pizza can be in two states: completed by the kitchen or still
being processed by the kitchen. Each pizza can have multiple toppings. Each topping has a name, a price
to the customer, a price to the business, an amount used for each pizza size, a minimum inventory level,
and a current inventory level (which is updated whenever a pizza is ordered). The same topping can be
on many pizzas (i.e., several pizzas can have pepperoni on them). A customer can request extra of any
topping, which is always a double amount. Cheese counts as a topping (there is no free cheese in this
organization).
Pizzas belong to orders. An order can be for dine in, pickup, or delivery. An order can have multiple pizzas
on it. An order can be marked as complete once all its pizzas are complete. Each order has a total cost to
the business, which is calculated by adding up the costs of each pizza. Each order should have a
timestamp for when the food was ordered (so the kitchen can prioritize orders). Each order also has a
total price to the customer, which is calculated by adding the prices of each pizza. If an order is for a dine
in customer, then we need to know the table number. If an order is for pickup, then it needs to have a
pickup customer associated with it. That customer must have a name and a phone number. If an order is
for delivery, then it must have a delivery customer associated with it and include a name, phone number
and address. A customer can have many orders, since the information is saved for the next time they
order pizza. A customer could have some pickup orders, and some delivery orders. While other pizza
places might allow a customer to save multiple addresses, Pizzas-R-Us only allows a customer to have one
address. Note, we don’t need any customer information for a dine in customer. When designing your
database, the type of order should be used as your discriminator.
Furthermore, Pizzas-R-Us offers discounts. Discounts can be applied to individual pizzas or an entire
order; although you can’t apply to same discount to both a pizza and an order. Discounts have a name
and either a dollar amount off or a percentage off. A pizza or order can have multiple discounts applied
to it, and a discount can be applied to many pizzas or orders. Order discounts are applied to the entire
order after all the pizza discounts have been applied.
The pizzeria also needs to track the base prices for their pizzas. Each pizza needs a base price (to the
customer) and a base cost (to the business) based on the crust type and pizza size. To compute the price
of a pizza, you would look at the size and crust of the pizza and find the corresponding base price. To that
you would add the price for each topping on the pizza (accounting for double topping quantities). Finally,
you would apply any discounts to the pizza. To find the total for the order, you would add up the price for
each pizza, then apply any discounts that apply to the order. While the base prices and topping prices will
change over time, those changes should not be reflected in past orders. So, a pizza’s price should be
calculated once and saved. To find the cost of a pizza to the business, the same process is used, with base
cost instead of base price. Discounts do not lower the cost of the order to a business.
Based on the information above, a database design team has created the following ERD:
The pizzeria is under new management and will be very closely monitoring profitability. To make this
easier to do, you will need to implement three views. Management would like reports (aka views) on:
• Popular Toppings: rank order of all the toppings (accounting for extra toppings) from most
popular to least popular
• Profit by Pizza: a summary of the profit by pizza size and crust type over a selected time period
ordered by profit from most profitable to least profitable
• Profit by Order Type: a summary of the profit for each of the three types of orders by month with
a grand total over all the orders at the pizzeria
The views will be used in Part 3 of the project.
Requirements:
1. Create an SQL script file that has the statements necessary to build the tables and
relationships shown in the ERD. You must match the table names, fields and types
EXACTLY. This is the database you will use in Part 3. Remember to include any
constraints that you need for the database. The script should include the SQL to create a
database schema called PizzaDB. Name this file “CreateTables.sql”
2. Create an SQL script file that maps your tables onto a set of standard views. You must
create these views with the following view names and column names.
• ToppingPopularity: rank order of all the toppings (accounting for extra toppings)
by ToppingCount-from most popular to least popular-and then but Topping
alphabetically.
• ProfitByPizza: a summary of the profit by pizza size and crust type each month and
ordered by profit from most profitable to least profitable.
• ProfitByOrderType: a summary of the profit for each of the three types of orders
by month with a grand total over all the orders at the pizzeria ordered by customer
type and profit.
DO NOT Change the view names or the column names shown above. Name this file
“CreateViews.sql”. If you’ve populated your tables correctly, your view output will
match the output shown!
3. IF you plan to use stored procedures, triggers or functions to help populate the data in your
tables, you must put this code along with the appropriate DELIMETER statements into a
separate file named “CreateSPs.sql”. The code in CreateSPs will execute after the
CreateTables and CreateViews scripts are executed, but before the PopulateData script
This ensures that your stored procedures and triggers are available to use in the
PopulateData script file to initialize your tables with data. CreateSPs.sql should be empty
(but present) if you are not using any stored SQL code.
SPECIAL NOTE: Graduate and Honors students, you must define AND use:
• 2 Stored Procedures
• 2 Stored Functions
• 2 Update Triggers (on 2 different tables)
• 2 Insert Triggers (on 2 different tables)
This code must be active AND used to receive full credit. REMEMBER, your stored
procedures and triggers will execute while the PopulateData script is running, so they
should do something useful related to entering data!
4. Create an SQL script that has the statements necessary to populate your database with the
starter data provided below. Name this file “PopulateData.sql”
5. Create an SQL script that will DROP each table and view in your database. This will be
helpful when there are errors in your create or populate scripts and you need to reset the
entire database. Name this file “DropTables.sql”
The autograder will execute your SQL in order: CreateTables, then CreateViews, then CreateSPs, then
PopulateData, and finally DropTables. Be aware that the autograder will be running on an Ubuntu virtual
machine, meaning that the database names ARE case sensitive! Which also means the case of the file
names MUST be exactly as shown above