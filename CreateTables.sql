    /*DROP SCHEMA IF EXISTS PizzaDB;
    CREATE SCHEMA PizzaDB;
    USE PizzaDB;*/

    CREATE TABLE customer (
        customer_CustID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
        customer_FName VARCHAR(30) NOT NULL,
        customer_LName VARCHAR(30) NOT NULL,
        customer_PhoneNum VARCHAR(30) NOT NULL
    );

    CREATE TABLE baseprice (
        baseprice_Size VARCHAR(30),
        baseprice_CrustType VARCHAR(30),
        baseprice_CustPrice DECIMAL(5,2) NOT NULL,
        baseprice_BusPrice DECIMAL(5,2) NOT NULL ,
        PRIMARY KEY (baseprice_Size,baseprice_CrustType)
    );

    CREATE TABLE discount (
        discount_DiscountID INT PRIMARY KEY AUTO_INCREMENT,
        discount_DiscountName VARCHAR(30) NOT NULL,
        discount_Amount DECIMAL(5,2),
        discount_IsPercent TINYINT NOT NULL
    );

    CREATE TABLE topping (
        topping_TopID INT PRIMARY KEY AUTO_INCREMENT,
        topping_TopName VARCHAR(30) NOT NULL,
        topping_SmallAMT DECIMAL(5,2) NOT NULL,
        topping_MedAMT DECIMAL(5,2) NOT NULL,
        topping_LgAMT DECIMAL(5,2) NOT NULL,
        topping_XLAMT DECIMAL(5,2) NOT NULL,
        topping_CustPrice DECIMAL(5,2) NOT NULL,
        topping_BusPrice DECIMAL(5,2) NOT NULL,
        topping_MinINVT INT,
        topping_CurINVT INT
    );

    CREATE TABLE ordertable (
        ordertable_OrderID INT PRIMARY KEY AUTO_INCREMENT,
        customer_CustID INT,
        ordertable_OrderType VARCHAR(30) NOT NULL,
        ordertable_OrderDateTime DATETIME,
        ordertable_CustPrice DECIMAL(5,2) NOT NULL,
        ordertable_BusPrice DECIMAL(5,2) NOT NULL,
        ordertable_IsComplete TINYINT(1) NOT NULL,
        CONSTRAINT ordertable_customer_fk FOREIGN KEY (customer_CustID) REFERENCES customer(customer_CustID)
    );

    CREATE TABLE pizza (
        pizza_PizzaID INT PRIMARY KEY AUTO_INCREMENT,
        pizza_Size VARCHAR(30) NOT NULL,
        pizza_CrustType VARCHAR(30) NOT NULL,
        pizza_PizzaState VARCHAR(30),
        pizza_PizzaDate DATETIME,
        pizza_CustPrice DECIMAL(5,2) NOT NULL,
        pizza_BusPrice DECIMAL(5,2) NOT NULL,
        ordertable_OrderID INT NOT NULL,
        CONSTRAINT pizza_baseprice_fk FOREIGN KEY (pizza_Size, pizza_CrustType) REFERENCES baseprice(baseprice_Size, baseprice_CrustType),
        CONSTRAINT pizza_ordertable_fk FOREIGN KEY (ordertable_OrderID) REFERENCES ordertable(ordertable_OrderID) ON DELETE CASCADE
);


    CREATE TABLE pizza_topping (
        pizza_PizzaID INT,
        topping_TopID INT,
        pizza_topping_IsDouble INT NOT NULL,
        PRIMARY KEY (pizza_PizzaID, topping_TopID),
        CONSTRAINT pizza_topping_pizza_fk FOREIGN KEY (pizza_PizzaID) REFERENCES pizza (pizza_PizzaID) ON DELETE CASCADE,
        CONSTRAINT pizza_topping_topping_fk FOREIGN KEY (topping_TopID) REFERENCES topping(topping_TopID)
    );

    CREATE TABLE pizza_discount (
        pizza_PizzaID INT,
        discount_DiscountID INT,
        PRIMARY KEY (pizza_PizzaID, discount_DiscountID),
        CONSTRAINT pizza_discount_pizza_fk FOREIGN KEY (pizza_PizzaID) REFERENCES pizza (pizza_PizzaID) ON DELETE CASCADE,
        CONSTRAINT pizza_discount_discount_fk FOREIGN KEY (discount_DiscountID) REFERENCES discount(discount_DiscountID)
    );

    CREATE TABLE order_discount (
        ordertable_OrderID INT,
        discount_DiscountID INT,
        PRIMARY KEY (ordertable_OrderID, discount_DiscountID),
        CONSTRAINT order_discount_ordertable_fk FOREIGN KEY (ordertable_OrderID) REFERENCES ordertable(ordertable_OrderID) ON DELETE CASCADE,
        CONSTRAINT order_discount_discount_fk FOREIGN KEY (discount_DiscountID) REFERENCES discount(discount_DiscountID)
    );

    CREATE TABLE pickup (
        ordertable_OrderID INT PRIMARY KEY,
        pickup_IsPickedUP TINYINT NOT NULL,
        CONSTRAINT pickup_ordertable_fk FOREIGN KEY (ordertable_OrderID) REFERENCES ordertable(ordertable_OrderID) ON DELETE CASCADE
    );

    CREATE TABLE delivery (
        ordertable_OrderID INT PRIMARY KEY,
        delivery_HouseNum INT NOT NULL,
        delivery_Street VARCHAR(30) NOT NULL,
        delivery_City VARCHAR(30) NOT NULL,
        delivery_State VARCHAR(2) NOT NULL,
        delivery_Zip INT NOT NULL,
        delivery_IsDelivered TINYINT NOT NULL,
        CONSTRAINT delivery_ordertable_fk FOREIGN KEY (ordertable_OrderID) References ordertable(ordertable_OrderID) ON DELETE CASCADE
    );

    CREATE TABLE dinein (
        ordertable_OrderID INT PRIMARY KEY ,
        dinein_TableNum INT NOT NULL,
        CONSTRAINT dinein_ordertable_fk FOREIGN KEY (ordertable_OrderID) REFERENCES ordertable(ordertable_OrderID) ON DELETE CASCADE
    );