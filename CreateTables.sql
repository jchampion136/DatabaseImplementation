    DROP SCHEMA IF EXISTS PizzaDB;
    CREATE SCHEMA PizzaDB;
    USE PizzaDB;

    CREATE TABLE CUSTOMER (
        customer_CustID INT PRIMARY KEY AUTO_INCREMENT,
        customer_FNAME VARCHAR(30) NOT NULL,
        customer_LNAME VARCHAR(30) NOT NULL,
        customer_PhoneNum VARCHAR(30) NOT NULL
    );

    CREATE TABLE BASEPRICE (
        baseprice_Size VARCHAR(30),
        baseprice_CrustType VARCHAR(30),
        baseprice_CustPrice NUMERIC(5,2) NOT NULL,
        baseprice_BusPrice NUMERIC(5,2) NOT NULL ,
        PRIMARY KEY (baseprice_Size,baseprice_CrustType)
    );

    CREATE TABLE DISCOUNT (
        discount_DiscountID INT PRIMARY KEY AUTO_INCREMENT,
        discount_DiscountName VARCHAR(30) NOT NULL,
        discount_Amount NUMERIC(5,2) NOT NULL,
        discount_isPercent TINYINT NOT NULL
    );

    CREATE TABLE TOPPING (
        topping_TopID INT PRIMARY KEY AUTO_INCREMENT,
        topping_TopName VARCHAR(30) NOT NULL,
        topping_SmallAMT NUMERIC(5,2) NOT NULL,
        topping_MedAMT NUMERIC(5,2) NOT NULL,
        topping_LgAMT NUMERIC(5,2) NOT NULL,
        topping_XLAMT NUMERIC(5,2) NOT NULL,
        topping_CustPrice NUMERIC(5,2) NOT NULL,
        topping_BusPrice NUMERIC(5,2) NOT NULL,
        topping_MinINVT INT,
        topping_CurINVT INT
    );

    CREATE TABLE ORDERTABLE (
        ordertable_OrderID INT PRIMARY KEY AUTO_INCREMENT,
        customer_custID INT,
        ordertable_OrderType VARCHAR(30) NOT NULL,
        ordertable_OrderDateTime DATETIME,
        ordertable_CustPrice NUMERIC(5,2) NOT NULL,
        ordertable_BusPrice NUMERIC(5,2) NOT NULL,
        ordertable_isComplete TINYINT(1) NOT NULL,
        FOREIGN KEY (customer_custID) REFERENCES CUSTOMER(customer_CustID)
    );

    CREATE TABLE PIZZA (
        pizza_PizzaID INT PRIMARY KEY AUTO_INCREMENT,
        pizza_Size VARCHAR(30) NOT NULL,
        pizza_CrustType VARCHAR(30) NOT NULL,
        pizza_PizzaState VARCHAR(30),
        pizza_PizzaDate DATETIME,
        pizza_CustPrice NUMERIC(5,2) NOT NULL,
        pizza_BusPrice NUMERIC(5,2) NOT NULL,
        ordertable_OrderID INT NOT NULL,
        FOREIGN KEY (pizza_Size, pizza_CrustType) REFERENCES BASEPRICE(baseprice_Size, baseprice_CrustType),
        FOREIGN KEY (ordertable_OrderID) REFERENCES ORDERTABLE(ordertable_OrderID)
    );

    CREATE TABLE PIZZA_TOPPING
    (
        pizza_PizzaID INT,
        topping_TopID INT,
        pizza_topping_isDouble INT NOT NULL,
        PRIMARY KEY (pizza_PizzaID, topping_TopID),
        FOREIGN KEY (pizza_PizzaID) REFERENCES PIZZA (pizza_PizzaID),
        FOREIGN KEY (topping_TopID) REFERENCES TOPPING(topping_TopID)
    );

    CREATE TABLE PIZZA_DISCOUNT (
        pizza_PizzaID INT,
        discount_DiscountID INT,
        PRIMARY KEY (pizza_PizzaID, discount_DiscountID),
        FOREIGN KEY (pizza_PizzaID) REFERENCES pizza(pizza_PizzaID),
        FOREIGN KEY (discount_DiscountID) REFERENCES DISCOUNT(discount_DiscountID)
    );

    CREATE TABLE ORDER_DISCOUNT (
        ordertable_OrderID INT,
        discount_DiscountID INT,
        PRIMARY KEY (ordertable_OrderID, discount_DiscountID),
        FOREIGN KEY (ordertable_OrderID) REFERENCES ORDERTABLE(ordertable_OrderID),
        FOREIGN KEY (discount_DiscountID) REFERENCES DISCOUNT(discount_DiscountID)
    );

    CREATE TABLE PICKUP (
        ordertable_OrderID INT PRIMARY KEY,
        pickup_isPickedUP TINYINT NOT NULL,
        FOREIGN KEY (ordertable_OrderID) REFERENCES ORDERTABLE(ordertable_OrderID)
    );

    CREATE TABLE DELIVERY (
        ordertable_OrderID INT PRIMARY KEY,
        delivery_HouseNum INT NOT NULL,
        delivery_Street VARCHAR(30) NOT NULL,
        delivery_City VARCHAR(30) NOT NULL,
        delivery_State VARCHAR(2) NOT NULL,
        delivery_ZIP INT NOT NULL,
        delivery_isDelivered TINYINT NOT NULL,
        FOREIGN KEY (ordertable_OrderID) References ORDERTABLE(ordertable_OrderID)
    );

    CREATE TABLE DINEIN (
        ordertable_OrderID INT PRIMARY KEY ,
        dinein_TableNum INT NOT NULL,
        FOREIGN KEY (ordertable_OrderID) REFERENCES ORDERTABLE(ordertable_OrderID)
    );