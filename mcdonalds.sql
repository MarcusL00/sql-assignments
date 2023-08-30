use mcDonalds
Create table softDrinks(
softDrinkID int NOT NULL PRIMARY KEY,
ingredients varchar(30) NOT NULL,
price decimal NOT NULL,
productName varchar(30) NOT NULL)

Create table burgers(
burgerID int NOT NULL PRIMARY KEY,
bun varchar(30) NOT NULL,
patty varchar(30),
cheese varchar(30),
condiment1 varchar(30),
condiment2 varchar(30),
condiment3 varchar(30),
condiment4 varchar(30),
condiment5 varchar(30),
price decimal NOT NULL,
productName varchar(30) NOT NULL
)

Create table sidesAndDips(
sideAndDipID int NOT NULL PRIMARY KEY,
ingredients varchar(30) NOT NULL,
price decimal NOT NULL,
productName varchar(60) NOT NULL)

Create table reqStorage(
reqStorageID int NOT NULL PRIMARY KEY,
amount int NOT NULL,
productName varchar(30) NOT NULL)

Create table workers(
workerID int NOT NULL PRIMARY KEY,
firstName varchar(50) NOT NULL,
lastName varchar(70) NOT NULL,
email text NOT NULL,
phoneNumber varchar(8) NOT NULL,
userName varchar(255) NOT NULL,
password varchar(255) NOT NULL,
privileges varchar(30) NOT NULL)

Create table users(
userID int NOT NULL PRIMARY KEY,
balance decimal NOT NULL,
firstName varchar(50) NOT NULL,
lastName varchar(50) NOT NULL,
email text NOT NULL,
userName varchar(255) NOT NULL,
password varchar(255) NOT NULL
)

INSERT INTO burgers (burgerID, bun, patty, cheese, condiment1, condiment2, condiment3, condiment4, condiment5, price, productName)
VALUES
    (1, 'Hamburger bolle', 'Oksekødsbøf', 'Cheddar', 'Ketchup', 'Sennep', 'Hakkede løg', 'Pickles', 'Grillkrydderi', 15.00, 'Cheese burger'),
    (2, 'Big mac bolle', 'Oksekødsbøf', 'Cheddar', 'Big mac sovs', 'Hakkede løg', 'Salat', 'Pickles', 'Grillkrydderi', 39.00, 'Big Mac'),
    (3, 'Quarter pounder bolle', 'Sprød kylling', 'Cheddar', 'Salsasovs', 'Mayo', 'Salat', 'Vegetabilsk olie', NULL, 25.00, 'Chicken salsa cheese'),
    (4, 'Quarter pounder bolle', 'Paneret kylling brystkød', NULL, 'Mayo', 'Salat', 'Vegetabilisk olie', NULL, NULL, 30.00, 'Mc chicken'),
    (5, 'Hamburger bolle', 'Oksekødsbøf', 'Emmentaler', 'Ketchup', 'Sennep', 'Hakket løg rå', 'Hakket løg dehydreret', 'Pickles', 25.00, 'Double Super Cheese');

	-- Inserting data into the sidesAndDips table
INSERT INTO sidesAndDips (sideAndDipID, ingredients, price, productName)
VALUES
    (1, 'Salt', 25, 'Pommes Frites (Lille)'),
    (2, 'Salt', 28, 'Pommes Frites (Mellem)'),
    (3, 'Salt', 33, 'Pommes Frites (Stor)'),
    (4, 'Chili Cheese Tops', 13, 'Chili Cheese Tops (3 styks)'),
    (5, 'Chili Cheese Tops', 23, 'Chili Cheese Tops (6 styks)'),
    (6, 'Chili Cheese Tops', 55, 'Chili Cheese Tops (18 styks)'),
    (7, 'Cheddar dip', 8, 'Cheddar dip'),
    (8, 'Chili mayo', 8, 'Chili mayo'),
    (9, 'Barbecue sauce', 6, 'Barbecue sauce'),
    (10, 'Sursød sauce', 6, 'Sursød sauce');

	-- Inserting data into the softDrinks table
INSERT INTO softDrinks (softDrinkID, ingredients, price, productName)
VALUES
    (1, 'cola-sirup', 22, 'Coca-cola (Lille)'),
    (2, 'cola-sirup', 27, 'Coca-cola (Mellem)'),
    (3, 'cola-sirup', 32, 'Coca-cola (Stor)'),
    (4, 'cola-zero-sirup', 22, 'Coca-cola Zero (Lille)'),
    (5, 'cola-zero-sirup', 27, 'Coca-cola Zero (Mellem)'),
    (6, 'cola-zero-sirup', 32, 'Coca-cola Zero (Stor)'),
    (7, 'sprite-zero-sirup', 22, 'Sprite zero (Lille)'),
    (8, 'sprite-zero-sirup', 27, 'Sprite zero (Mellem)'),
    (9, 'sprite-zero-sirup', 32, 'Sprite zero (Stor)'),
    (10, 'fanta-sirup', 22, 'Fanta orange (Lille)'),
    (11, 'fanta-sirup', 27, 'Fanta orange (Mellem)'),
    (12, 'fanta-sirup', 32, 'Fanta orange (Stor)'),
    (13, 'fanta-sirup', 22, 'Aqua d’or 500 ml');

	-- Inserting data into the workers table
	INSERT INTO workers (workerID, firstName, lastName, email, phoneNumber, userName, password, privileges)
VALUES
    (1, 'John', 'Doe', 'john@example.com', 12345678, 'johndoe', 'password', 'Manager'),
    (2, 'Jane', 'Smith', 'jane@example.com', 87654321, 'janesmith', 'securepass', 'Employee');

	
	-- Inserting data into the users table
INSERT INTO users (userID, balance, firstName, lastName, email, userName, password)
VALUES
    (1, 100.00, 'Alice', 'Johnson', 'alice@example.com', 'alice123', 'password123'),
    (2, 150.00, 'Bob', 'Smith', 'bob@example.com', 'bobsmith', 'securepass456'),
    (3, 75.50, 'Charlie', 'Brown', 'charlie@example.com', 'charliebrown', 'strongpassword789');


	Create table softDrinksOrders(
softDrinkOrderID int NOT NULL PRIMARY KEY,
softDrinkID int FOREIGN KEY REFERENCES softDrinks(softDrinkID)
)
INSERT INTO softDrinksOrders( softDrinkOrderID, softDrinkID)
VALUES
(1,1),
(2,2),
(3,3),
(4,4),
(5,5),
(6,6),
(7,7),
(8,8),
(9,9),
(10,10),
(11,11),
(12,12),
(13,13)
Create table burgerOrders(
burgerOrderID int NOT NULL PRIMARY KEY,
burgerID int FOREIGN KEY REFERENCES burgers(burgerID)
)
INSERT INTO burgerOrders( burgerOrderID, burgerID)
VALUES
(1,1),
(2,2),
(3,3),
(4,4),
(5,5)

Create table sidesAndDipsOrders(
sidesAndDipOrderID int NOT NULL PRIMARY KEY,
sideAndDipID int FOREIGN KEY REFERENCES sidesAndDips(sideAndDipID)
)
INSERT INTO sidesAndDipsOrders(sidesAndDipOrderID, sideAndDipID)
VALUES
(1,1),
(2,2),
(3,3),
(4,4),
(5,5),
(6,6),
(7,7),
(8,8),
(9,9),
(10,10)

Create table WorkersOrders(
workerOrderID int NOT NULL PRIMARY KEY,
workerID int FOREIGN KEY REFERENCES workers(workerID)
)

INSERT INTO WorkersOrders(workerOrderID, workerID)
VALUES
(1, 1)

INSERT INTO WorkersOrders(workerOrderID, workerID)
VALUES
(2, 2)



SELECT * FROM softDrinks;
SELECT * FROM burgers;
SELECT * FROM sidesAndDips;
SELECT * FROM reqStorage;
SELECT * FROM workers;
SELECT * FROM users;

SELECT * FROM sidesAndDipsOrders
SELECT * FROM WorkersOrders
SELECT * FROM burgerOrders
SELECT * FROM softDrinksOrders

SELECT productName FROM softDrinks
WHERE softDrinkID = (SELECT softDrinkID FROM softDrinksOrders WHERE softDrinkID = 2);

SELECT sidesAndDipsOrders.sidesAndDipOrderID, sidesAndDips.productName, sidesAndDips.price
FROM sidesAndDipsOrders
INNER JOIN sidesAndDips on sidesAndDips.sideAndDipID= sidesAndDipsOrders.sideAndDipID

SELECT WorkersOrders.workerOrderID, workers.firstName, workers.lastName
FROM WorkersOrders
INNER JOIN workers on workers.workerID=WorkersOrders.workerID

SELECT burgerOrders.burgerOrderID, burgers.productName, burgers.price
FROM burgerOrders
INNER JOIN burgers ON burgers.burgerID=burgerOrders.burgerID

SELECT softDrinksOrders.softDrinkOrderID, softDrinks.productName,softDrinks.price
FROM softDrinksOrders
INNER JOIN softDrinks ON softDrinks.softDrinkID= softDrinksOrders.softDrinkOrderID
WHERE softDrinks.productName = 'Coca-cola (Lille)';



Create table Orders(
orderID int NOT NULL PRIMARY KEY,
softDrinkOrderID int FOREIGN KEY REFERENCES softDrinksOrders(softDrinkOrderID),
burgerOrderID int FOREIGN KEY REFERENCES burgerOrders(burgerOrderID),
sidesAndDipOrderID int FOREIGN KEY REFERENCES sidesAndDipsOrders(sidesAndDipOrderID),
workerOrderID int FOREIGN KEY REFERENCES WorkersOrders(workerOrderID),
userID int FOREIGN KEY REFERENCES users(userID)
)

SELECT Orders.burgerOrderID, Orders.sidesAndDipOrderID, Orders.softDrinkOrderID, Orders.workerOrderID
FROM Orders
INNER JOIN softDrinksOrders, burgerOrders, sidesAndDipsOrders, WorkersOrders ON Orders.softDrinkOrderID = sof

