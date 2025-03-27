    DROP SCHEMA IF EXISTS PizzaDB;
    CREATE SCHEMA PizzaDB;
    USE PizzaDB;

    CREATE TABLE CUSTOMER (
        customer_CustID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
        customer_FName VARCHAR(30) NOT NULL,
        customer_LName VARCHAR(30) NOT NULL,
        customer_PhoneNum VARCHAR(30) NOT NULL
    );

    CREATE TABLE BASEPRICE (
        baseprice_Size VARCHAR(30),
        baseprice_CrustType VARCHAR(30),
        baseprice_CustPrice DECIMAL(5,2) NOT NULL,
        baseprice_BusPrice DECIMAL(5,2) NOT NULL ,
        PRIMARY KEY (baseprice_Size,baseprice_CrustType)
    );

    CREATE TABLE DISCOUNT (
        discount_DiscountID INT PRIMARY KEY AUTO_INCREMENT,
        discount_DiscountName VARCHAR(30) NOT NULL,
        discount_Amount DECIMAL(5,2),
        discount_IsPercent TINYINT NOT NULL
    );

    CREATE TABLE TOPPING (
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

    CREATE TABLE ORDERTABLE (
        ordertable_OrderID INT PRIMARY KEY AUTO_INCREMENT,
        customer_CustID INT,
        ordertable_OrderType VARCHAR(30) NOT NULL,
        ordertable_OrderDateTime DATETIME,
        ordertable_CustPrice DECIMAL(5,2) NOT NULL,
        ordertable_BusPrice DECIMAL(5,2) NOT NULL,
        ordertable_IsComplete TINYINT(1) NOT NULL,
        CONSTRAINT ORDERTABLE_CUSTOMER_FK FOREIGN KEY (customer_CustID) REFERENCES CUSTOMER(customer_CustID)
    );

    CREATE TABLE PIZZA (
        pizza_PizzaID INT PRIMARY KEY AUTO_INCREMENT,
        pizza_Size VARCHAR(30) NOT NULL,
        pizza_CrustType VARCHAR(30) NOT NULL,
        pizza_PizzaState VARCHAR(30),
        pizza_PizzaDate DATETIME,
        pizza_CustPrice DECIMAL(5,2) NOT NULL,
        pizza_BusPrice DECIMAL(5,2) NOT NULL,
        ordertable_OrderID INT NOT NULL,
        CONSTRAINT PIZZA_BASEPRICE_FK FOREIGN KEY (pizza_Size, pizza_CrustType) REFERENCES BASEPRICE(baseprice_Size, baseprice_CrustType),
        CONSTRAINT PIZZA_ORDERTABLE_FK FOREIGN KEY (ordertable_OrderID) REFERENCES ORDERTABLE(ordertable_OrderID) ON DELETE CASCADE
    );

    CREATE TABLE PIZZA_TOPPING (
        pizza_PizzaID INT,
        topping_TopID INT,
        pizza_topping_IsDouble INT NOT NULL,
        PRIMARY KEY (pizza_PizzaID, topping_TopID),
        CONSTRAINT PIZZA_TOPPING_PIZZA_FK FOREIGN KEY (pizza_PizzaID) REFERENCES PIZZA (pizza_PizzaID) ON DELETE CASCADE,
        FOREIGN KEY PIZZA_TOPPING_TOPPING_FK (topping_TopID) REFERENCES TOPPING(topping_TopID)
    );

    CREATE TABLE PIZZA_DISCOUNT (
        pizza_PizzaID INT,
        discount_DiscountID INT,
        PRIMARY KEY (pizza_PizzaID, discount_DiscountID),
        CONSTRAINT PIZZA_DISCOUNT_PIZZA_FK FOREIGN KEY (pizza_PizzaID) REFERENCES pizza(pizza_PizzaID) ON DELETE CASCADE,
        CONSTRAINT PIZZA_DISCOUNT_DISCOUNT_FK FOREIGN KEY (discount_DiscountID) REFERENCES DISCOUNT(discount_DiscountID)
    );

    CREATE TABLE ORDER_DISCOUNT (
        ordertable_OrderID INT,
        discount_DiscountID INT,
        PRIMARY KEY (ordertable_OrderID, discount_DiscountID),
        CONSTRAINT ORDER_DISCOUNT_ORDERTABLE_FK FOREIGN KEY (ordertable_OrderID) REFERENCES ORDERTABLE(ordertable_OrderID) ON DELETE CASCADE,
        CONSTRAINT ORDER_DISCOUNT_DISCOUNT_FK FOREIGN KEY (discount_DiscountID) REFERENCES DISCOUNT(discount_DiscountID)
    );

    CREATE TABLE PICKUP (
        ordertable_OrderID INT PRIMARY KEY,
        pickup_IsPickedUP TINYINT NOT NULL,
        CONSTRAINT PICKUP_ORDERTABLE_FK FOREIGN KEY (ordertable_OrderID) REFERENCES ORDERTABLE(ordertable_OrderID) ON DELETE CASCADE
    );

    CREATE TABLE DELIVERY (
        ordertable_OrderID INT PRIMARY KEY,
        delivery_HouseNum INT NOT NULL,
        delivery_Street VARCHAR(30) NOT NULL,
        delivery_City VARCHAR(30) NOT NULL,
        delivery_State VARCHAR(2) NOT NULL,
        delivery_Zip INT NOT NULL,
        delivery_IsDelivered TINYINT NOT NULL,
        CONSTRAINT DELIVERY_ODERTABLE_FK FOREIGN KEY (ordertable_OrderID) References ORDERTABLE(ordertable_OrderID) ON DELETE CASCADE
    );

    CREATE TABLE DINEIN (
        ordertable_OrderID INT PRIMARY KEY ,
        dinein_TableNum INT NOT NULL,
        CONSTRAINT DINEIN_ORDERTABLE_FK FOREIGN KEY (ordertable_OrderID) REFERENCES ORDERTABLE(ordertable_OrderID) ON DELETE CASCADE
    );