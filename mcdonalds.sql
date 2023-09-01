USE master;
GO

IF EXISTS (SELECT name FROM master.sys.databases WHERE name = N'McDonalds')
	DROP DATABASE McDonalds;
GO

CREATE DATABASE McDonalds
GO

USE McDonalds;
GO

		-- CREATES TABLE FOR DRINKS
CREATE TABLE Drinks(
	DrinkID INT NOT NULL PRIMARY KEY,
	Ingredients VARCHAR(30) NOT NULL,
	Price DECIMAL NOT NULL,
	ProductName VARCHAR(30) NOT NULL
);
		
		-- CREATES TABLE FOR BURGERS
CREATE TABLE Burgers(
	BurgerID INT NOT NULL PRIMARY KEY,
	Bun VARCHAR(30) NOT NULL,
	Patty VARCHAR(30),
	Cheese VARCHAR(30),
	Sauce VARCHAR(30),
	Onion VARCHAR(30),
	Pickles VARCHAR(30),
	Seasoning VARCHAR(30),
	Price DECIMAL NOT NULL,
	ProductName VARCHAR(30) NOT NULL
);

-- CREATES SIDES AND DIPS TABLE

CREATE TABLE Sides(
	SideID INT NOT NULL PRIMARY KEY,
	Ingredients VARCHAR(30) NOT NULL,
	Price DECIMAL NOT NULL,
	ProductName VARCHAR(60) NOT NULL
);

-- CREATES TABLE FOR USERS

CREATE TABLE Users(
	UserID INT NOT NULL PRIMARY KEY,
	Balance DECIMAL NOT NULL,
	FirstName VARCHAR(50) NOT NULL,
	LastName VARCHAR(50) NOT NULL,
	Email TEXT NOT NULL)
;
-- INSERTION OF DATA --

-- INSERTS DATA INTO BURGERS TABLE
INSERT INTO Burgers (BurgerID, Bun, Patty, Cheese, Sauce, Onion , Pickles, Seasoning, Price, ProductName)
VALUES
	(1, 'Hamburger bolle', 'Oksekødsbøf', 'Cheddar', 'Ketchup', 'Hakkede løg', 'Pickles', 'Grillkrydderi', 15.00, 'Cheeseburger'),
	(2, 'Big mac bolle', 'Oksekødsbøf', 'Cheddar', 'Big mac sovs', 'Hakkede løg', 'Pickles', 'Grillkrydderi', 39.00, 'Big Mac'),
	(3, 'Quarter pounder bolle', 'Sprød kylling', 'Cheddar', 'Salsasovs', 'Salat', NULL, NULL, 25.00, 'Chicken Salsa'),
	(4, 'Quarter pounder bolle', 'Paneret kylling brystkød', 'mayo', 'Hakkede løg', NULL, NULL, NULL, 30.00, 'Mc chicken'),
	(5, 'Hamburger bolle', 'Oksekødsbøf', 'Emmentaler', 'Ketchup', 'Hakkede løg', NULL, NULL, 25.00, 'Double Cheese');

-- INSERTS DATA INTO THE SIDES AND DIPS TABLE

INSERT INTO Sides (SideID, Ingredients, Price, ProductName)
VALUES
	(1, 'Salt', 25, 'Pommes Frites'),
	(2, 'Chili Cheese Tops', 23, 'ChiliCheese Tops'),
	(3, 'Cheddar dip', 8, 'Cheddar dip'),
	(4, 'Barbecue sauce', 6, 'Barbecue sauce'),
	(5, 'Sursød sauce', 6, 'Sursød sauce');

--INSERTS DATA INTO THE DRINKS TABLE

INSERT INTO Drinks (DrinkID, Ingredients, Price, ProductName)
VALUES
	(1, 'cola-sirup', 22, 'Coca-cola'),
	(2, 'fanta-sirup', 22, 'Fanta orange'),
	(3, 'sprite-sirup', 22, 'Sprite zero'),
	(4, 'cola-sirup', 22, 'Coca-cola zero'),
	(5, 'Vand', 22, 'Aqua d’or 500 ml');

-- INSERTS DATA INTO USER TABLE

INSERT INTO Users (UserID, Balance, FirstName, LastName, Email)
VALUES
	(1, 100.00, 'Alice', 'Johnson', 'alice@example.com'),
	(2, 150.00, 'Bob', 'Smith', 'bob@example.com'),
	(3, 500.00, 'Charlie', 'Brown', 'charlie@example.com');

-- ORDERS TABLE

CREATE TABLE Orders (

	OrderID INT PRIMARY KEY
	);

-- INSERTS DATA INTO THE ORDER TABLE

INSERT INTO Orders(OrderID)
	VALUES
	(1),
	(2),
	(3),
	(4),
	(5),
	(6),
	(7),
	(8),
	(9),
	(10),
	(11),
	(12),
	(13);

-- CREATING Drink Orders Table

CREATE TABLE drinkOrders (
	OrderID INT,
	drinkOrderID INT,
	PRIMARY KEY (orderID, drinkOrderID),
	FOREIGN KEY (orderID) REFERENCES Orders(orderID),
	FOREIGN KEY (drinkOrderID) REFERENCES drinks(drinkID))

-- INSERTING DATA INTO DRINK ORDERS

INSERT INTO drinkOrders( OrderID, drinkOrderID)
VALUES
	(1,1),
	(2,2),
	(3,3);
	
-- Burger Orders Table

CREATE TABLE BurgerOrders (
	OrderID INT,
	BurgerOrderID INT,
	PRIMARY KEY (OrderID, BurgerOrderID),
	FOREIGN KEY (OrderID) REFERENCES Orders(OrderID), 
	FOREIGN KEY (BurgerOrderID) REFERENCES Burgers(BurgerID)
);

-- INSERTING DATA INTO BURGER ORDERS

INSERT INTO BurgerOrders( OrderID, BurgerOrderID)
VALUES
	(1,1),
	(2,2),
	(3,3),
	(4,4),
	(5,5);

-- SIDES ORDER TABLE

CREATE TABLE SidesOrder (
	OrderID INT,
	SidesOrderID INT,
	PRIMARY KEY (OrderID, SidesOrderID),
	FOREIGN KEY (OrderID) REFERENCES Orders(OrderID), 
	FOREIGN KEY (SidesOrderID) REFERENCES Sides(SideID)		
);

-- INSERTING DATA INTO SIDES ORDERS

INSERT INTO SidesOrder(OrderID, SidesOrderID)
VALUES
	(1,1),
	(2,2),
	(3,3),
	(4,4),
	(5,5);

-- CREATES ORDER DETAIL TABLE TO SPECIFY HOW MANY OF THE ITEMTYPE IS BEING ORDERED 

CREATE TABLE OrderDetail (
	OrderID INT,
	ItemID INT,
	ItemType VARCHAR(20),
	Quantity INT,
	PRIMARY KEY (OrderID, ItemID, ItemType),
	FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);
-- INSERTING THE DATA INTO THE ORDER DETAILS 
INSERT INTO OrderDetail (OrderID, ItemID, ItemType, Quantity)
VALUES
	(1, 1, 'Burger', 2), 
	(1, 3, 'Burger', 4), 
	(1, 1, 'Side', 2),    
	(1, 4, 'Side', 2),     
	(1, 2, 'Drink', 1);    
GO

-- STORED PROCEDURES --

-- GETS PRODUCT NAME AND PRICE FROM BURGERS
CREATE PROCEDURE SelectBurgers
AS
    SELECT ProductName, Price
    FROM Burgers;
GO

CREATE PROCEDURE SelectSides
AS
    SELECT ProductName, Price
    FROM Sides;
GO

CREATE PROCEDURE SelectDrinks
AS
	SELECT ProductName, Price
    FROM Drinks;
GO

CREATE PROCEDURE SelectBurgersName
    @BurgerID INT
AS
    SELECT ProductName
    FROM Burgers
    WHERE BurgerID = @BurgerID;
GO

CREATE PROCEDURE SelectBurgersIngredients
    @ProductName VARCHAR(30)
AS
    SELECT Bun, Patty, Cheese, Sauce, Onion, Pickles, Seasoning
    FROM Burgers
    WHERE ProductName = @ProductName;
GO

CREATE PROCEDURE SelectSidesIngredients
    @ProductName VARCHAR(30)
AS
    SELECT Ingredients
    FROM Sides
    WHERE ProductName = @ProductName;
GO

CREATE PROCEDURE SelectDrinksIngredients
    @ProductName VARCHAR(30)
AS
    SELECT Ingredients
    FROM sides
    WHERE ProductName = @ProductName;
GO

-- END OF STORED PROCEDURES


-- RECIVING DATA FROM THE DIFFERENT TABLES DEPENDING ON WHAT ITEMTYPE IS PICKED --
-- Basically means that when the item type equals burger than it will retrive the burger product name and will do the same with drinks
SELECT
    Od.OrderID,
    CASE WHEN Od.ItemType = 'Burger' THEN B.ProductName
         WHEN Od.ItemType = 'Side' THEN S.ProductName
         WHEN Od.ItemType = 'Drink' THEN D.ProductName
    END AS ItemName,
    od.Quantity AS ItemQuantity
FROM
		OrderDetail od
	LEFT JOIN
		Burgers B ON od.ItemID = B.BurgerID AND od.ItemType = 'Burger'
	LEFT JOIN
		Sides S ON od.ItemID = S.SideID AND od.ItemType = 'Side'
	LEFT JOIN
		Drinks D ON od.ItemID = D.DrinkID AND od.ItemType = 'Drink';
