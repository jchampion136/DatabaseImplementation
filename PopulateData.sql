INSERT INTO customer VALUES (1,'Andrew', 'Wilkes-Krier', '8642545861');
INSERT INTO customer VALUES (2,'Matt', 'Engers', '8644749953');
INSERT INTO customer VALUES (3,'Frank', 'Turner', '8642328944');
INSERT INTO customer VALUES (4,'Milo', 'Auckerman', '8648785679');

INSERT INTO baseprice VALUES ('Small', 'Thin', 3.00,0.50);
INSERT INTO baseprice VALUES ('Small', 'Original', 3.00,0.75);
INSERT INTO baseprice VALUES ('Small', 'Pan', 3.5,1.00);
INSERT INTO baseprice VALUES ('Small', 'Gluten-Free', 4.00,2.00);
INSERT INTO baseprice VALUES ('Medium', 'Thin', 5.00,1.00);
INSERT INTO baseprice VALUES ('Medium', 'Original', 5.00,1.50);
INSERT INTO baseprice VALUES ('Medium', 'Pan', 6.00,2.25);
INSERT INTO baseprice VALUES ('Medium', 'Gluten-Free', 6.25,3.00);
INSERT INTO baseprice VALUES ('Large', 'Thin', 8.00,1.25);
INSERT INTO baseprice VALUES ('Large', 'Original', 8.00,2.00);
INSERT INTO baseprice VALUES ('Large', 'Pan', 9.00,3.00);
INSERT INTO baseprice VALUES ('Large', 'Gluten-Free', 9.50,4.00);
INSERT INTO baseprice VALUES ('XLarge', 'Thin', 10.00,2.00);
INSERT INTO baseprice VALUES ('XLarge', 'Original', 10.00,3.00);
INSERT INTO baseprice VALUES ('XLarge', 'Pan', 11.50,4.50);
INSERT INTO baseprice VALUES ('XLarge', 'Gluten-Free', 12.50,6.00);

INSERT INTO discount VALUES (1, 'Employee', 15.00, 1);
INSERT INTO discount VALUES (2,'Lunch Special Medium', 1.00, 0);
INSERT INTO discount VALUES (3,'Lunch Special Large', 2.00, 0);
INSERT INTO discount VALUES (4,'Specialty Pizza', 1.50, 0);
INSERT INTO discount VALUES (5,'Happy Hour', 10.00, 1);
INSERT INTO discount VALUES (6,'Gameday Special', 20.00, 1);

INSERT INTO topping VALUES (1, 'Pepperoni',2.00,2.75,3.50,4.50,1.25,0.20,50,100);
INSERT INTO topping VALUES (2,'Sausage', 2.50, 3.00, 3.50, 4.25, 1.25, 0.15, 50, 100);
INSERT INTO topping VALUES (3,'Ham', 2.00, 2.50, 3.25, 4.00, 1.50, 0.15, 25, 78);
INSERT INTO topping VALUES (4,'Chicken', 1.50, 2.00, 2.25, 3.00, 1.75, 0.25, 25, 56);
INSERT INTO topping VALUES (5,'Green Pepper', 1.00, 1.50, 2.00, 2.50, 0.50, 0.02, 25, 79);
INSERT INTO topping VALUES (6,'Onion', 1.00, 1.50, 2.00, 2.75, 0.50, 0.02, 25, 85);
INSERT INTO topping VALUES (7,'Roma Tomato', 2.00, 3.00, 3.50, 4.50, 0.75, 0.03, 10, 86);
INSERT INTO topping VALUES (8,'Mushrooms', 1.50, 2.00, 2.50, 3.00, 0.75, 0.10, 50, 52);
INSERT INTO topping VALUES (9,'Black Olives', 0.75, 1.00, 1.50, 2.00, 0.60, 0.10, 25, 39);
INSERT INTO topping VALUES (10,'Pineapple', 1.00, 1.25, 1.75, 2.00, 1.00, 0.25, 0, 15);
INSERT INTO topping VALUES (11,'Jalapenos', 0.50, 0.75, 1.25, 1.75, 0.50, 0.05, 0, 64);
INSERT INTO topping VALUES (12,'Banana Peppers', 0.60, 1.00, 1.30, 1.75, 0.50, 0.05, 0, 36);
INSERT INTO topping VALUES (13,'Regular Cheese', 2.00, 3.50, 5.00, 7.00, 0.50, 0.12, 50, 250);
INSERT INTO topping VALUES (14,'Four Cheese Blend', 2.00, 3.50, 5.00, 7.00, 1.00, 0.15, 25, 150);
INSERT INTO topping VALUES (15,'Feta Cheese', 1.75, 3.00, 4.00, 5.50, 1.50, 0.18, 0, 75);
INSERT INTO topping VALUES (16,'Goat Cheese', 1.60, 2.75, 4.00, 5.50, 1.50, 0.20, 0, 54);
INSERT INTO topping VALUES (17,'Bacon', 1.00, 1.50, 2.00, 3.00, 1.50, 0.25, 0, 89);

INSERT INTO ordertable VALUES (1,NULL,'Dine-in','2025-03-05 12:03:00', 19.75,3.68,1);
INSERT INTO ordertable VALUES (2,NULL, 'Dine-in','2025-04-03 12:05:00',19.78,4.63,1);
INSERT INTO ordertable VALUES (3,1, 'Pickup','2025-04-03 21:30:00',89.28,19.80,1);
INSERT INTO ordertable VALUES (4,1,'Delivery','2025-04-20 19:11:00',86.19,20.99,1);
INSERT INTO ordertable VALUES (5,2,'Pickup','2025-03-02 17:30:00',28.70,7.84,1);
INSERT INTO ordertable VALUES (6,3,'Delivery','2025-03-02 18:17:00',25.81,3.64,1);
INSERT INTO ordertable VALUES (7,4, 'Delivery','2025-04-13 20:32:00',37.25,6.00,1);

INSERT INTO pickup VALUES (3,1);
INSERT INTO pickup VALUES (5,1);

INSERT INTO order_discount VALUES (1,3);
INSERT INTO order_discount VALUES (2,2);
INSERT INTO order_discount VALUES (2,4);
INSERT INTO order_discount VALUES (4,6);
/*INSERT INTO order_discount VALUES (4,4);
INSERT INTO order_discount VALUES (5,4);*/ /*Also Removed for not being an order discount*/
INSERT INTO order_discount VALUES (7,1);

INSERT INTO delivery VALUES (4, 115, 'Party Blvd', 'Anderson', 'SC',29621,1);
INSERT INTO delivery VALUES (6, 6745, 'Wessex St', 'Anderson', 'SC',29621,1);
INSERT INTO delivery VALUES (7,8879,'Suburban Home','Anderson','SC',29621,1);

INSERT INTO dinein VALUES (1,21);
INSERT INTO dinein VALUES (2,4);

INSERT INTO pizza VALUES (1,'Large', 'Thin', 'Completed', '2025-03-05 12:03:00', 19.75, 3.68, 1);
INSERT INTO pizza VALUES (2,'Medium', 'Pan', 'Completed', '2025-04-03 12:05:00', 12.85, 3.23, 2);
INSERT INTO pizza VALUES (3,'Small', 'Original', 'Completed', '2025-04-03 12:05:00', 6.93, 1.40, 2);
INSERT INTO pizza VALUES (4, 'Large', 'Original', 'Completed', '2025-03-03 21:30:00', 14.88, 3.30, 3);
INSERT INTO pizza VALUES (5, 'Large', 'Original', 'Completed', '2025-03-03 21:30:00', 14.88, 3.30, 3);
INSERT INTO pizza VALUES (6, 'Large', 'Original', 'Completed', '2025-03-03 21:30:00', 14.88, 3.30, 3);
INSERT INTO pizza VALUES (7, 'Large', 'Original', 'Completed', '2025-03-03 21:30:00', 14.88, 3.30, 3);
INSERT INTO pizza VALUES (8, 'Large', 'Original', 'Completed', '2025-03-03 21:30:00', 14.88, 3.30, 3);
INSERT INTO pizza VALUES (9, 'Large', 'Original', 'Completed', '2025-03-03 21:30:00', 14.88, 3.30, 3);
INSERT INTO pizza VALUES (10,'XLarge', 'Original', 'Completed', '2025-04-20 19:11:00', 27.94, 9.19, 4);
INSERT INTO pizza VALUES (11,'XLarge', 'Original', 'Completed', '2025-04-20 19:11:00', 31.50, 6.25, 4);
INSERT INTO pizza VALUES (12,'XLarge', 'Original', 'Completed', '2025-04-20 19:11:00', 26.75, 5.55, 4);
INSERT INTO pizza VALUES (13,'XLarge', 'Gluten-Free', 'Completed', '2025-03-02 17:30:00', 28.70, 7.84, 5);
INSERT INTO pizza VALUES (14,'Large', 'Thin', 'Completed', '2025-03-02 18:17:00', 25.81, 3.64, 6);
INSERT INTO pizza VALUES (15,'Large', 'Thin', 'Completed', '2025-04-13 20:32:00', 18.00, 2.75, 7);
INSERT INTO pizza VALUES (16,'Large', 'Thin', 'Completed', '2025-04-13 20:32:00', 19.25, 3.25, 7);

INSERT INTO pizza_topping VALUES (1,13,1);
INSERT INTO pizza_topping VALUES (1,1,0);
INSERT INTO pizza_topping VALUES (1,2,0);
INSERT INTO pizza_topping VALUES (2,15,0);
INSERT INTO pizza_topping VALUES (2,9,0);
INSERT INTO pizza_topping VALUES (2,7,0);
INSERT INTO pizza_topping VALUES (2,8,0);
INSERT INTO pizza_topping VALUES (2,12,0);
INSERT INTO pizza_topping VALUES (3,13,0);
INSERT INTO pizza_topping VALUES (3,4,0);
INSERT INTO pizza_topping VALUES (3,12,0);
INSERT INTO pizza_topping VALUES (4, 1, 0);
INSERT INTO pizza_topping VALUES (4, 13, 0);
INSERT INTO pizza_topping VALUES (5, 1, 0);
INSERT INTO pizza_topping VALUES (5, 13, 0);
INSERT INTO pizza_topping VALUES (6, 1, 0);
INSERT INTO pizza_topping VALUES (6, 13, 0);
INSERT INTO pizza_topping VALUES (7, 1, 0);
INSERT INTO pizza_topping VALUES (7, 13, 0);
INSERT INTO pizza_topping VALUES (8, 1, 0);
INSERT INTO pizza_topping VALUES (8, 13, 0);
INSERT INTO pizza_topping VALUES (9, 1, 0);
INSERT INTO pizza_topping VALUES (9, 13, 0);
INSERT INTO pizza_topping VALUES (10,1,0);
INSERT INTO pizza_topping VALUES (10,2,0);
INSERT INTO pizza_topping VALUES (10,14,0);
INSERT INTO pizza_topping VALUES (11,3,1);
INSERT INTO pizza_topping VALUES (11,10,1);
INSERT INTO pizza_topping VALUES (11,14,0);
INSERT INTO pizza_topping VALUES (12,4,0);
INSERT INTO pizza_topping VALUES (12,14,0);
INSERT INTO pizza_topping VALUES (12,17,0);
INSERT INTO pizza_topping VALUES (13,5,0);
INSERT INTO pizza_topping VALUES (13,6,0);
INSERT INTO pizza_topping VALUES (13,7,0);
INSERT INTO pizza_topping VALUES (13,8,0);
INSERT INTO pizza_topping VALUES (13,9,0);
INSERT INTO pizza_topping VALUES (13,16,0);
INSERT INTO pizza_topping VALUES (14,4,0);
INSERT INTO pizza_topping VALUES (14,5,0);
INSERT INTO pizza_topping VALUES (14,6,0);
INSERT INTO pizza_topping VALUES (14,8,0);
INSERT INTO pizza_topping VALUES (14,14,1);
INSERT INTO pizza_topping VALUES (15,14,1);
INSERT INTO pizza_topping VALUES (16,1,1);
INSERT INTO pizza_topping VALUES (16,13,0);

INSERT INTO pizza_discount VALUES (1, 3);
INSERT INTO pizza_discount VALUES (2, 2);
INSERT INTO pizza_discount VALUES (2, 4);
INSERT INTO pizza_discount VALUES (11, 4);
/*INSERT INTO pizza_discount VALUES (6, 6);*/ /*Might be just and Order Discount*/
INSERT INTO pizza_discount VALUES (13, 4);

