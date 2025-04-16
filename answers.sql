-- Question 1: Achieving First Normal Form (1NF)
-- ---------------------------------------
-- Original Table: ProductDetail (OrderID, CustomerName, Products)
-- Problem: The Products column has multiple comma-separated values which violates 1NF

-- Step 1: Create a new table that represents one product per row
CREATE TABLE ProductDetail_1NF (
    OrderID INT,
    CustomerName VARCHAR(100),
    Product VARCHAR(50)
);

-- Step 2: Insert normalized rows (split products into separate rows)
INSERT INTO ProductDetail_1NF (OrderID, CustomerName, Product)
VALUES 
    (101, 'Amos Clinton', 'Laptop'),
    (101, 'Amos Clinton', 'Mouse'),
    (102, 'Faith Mecha', 'Tablet'),
    (102, 'Faith Mecha', 'Keyboard'),
    (102, 'Faith Mecha', 'Mouse'),
    (103, 'Gloria odongo', 'Phone');

-- Result: Now each row holds only one product, achieving 1NF


-- ---------------------------------------
-- Question 2: Achieving Second Normal Form (2NF)
-- ---------------------------------------
-- Original Table: OrderDetails (OrderID, CustomerName, Product, Quantity)
-- Problem: CustomerName depends only on OrderID — partial dependency

-- Step 1: Create a Customers table to hold customer info (to remove partial dependency)
CREATE TABLE Customers (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
);

-- Step 2: Insert distinct customer records
INSERT INTO Customers (OrderID, CustomerName)
VALUES
    (101, 'Amos Clinton'),
    (102, 'Faith Mecha'),
    (103, 'Gloria odongo');

-- Step 3: Create an OrderItems table that holds product and quantity
CREATE TABLE OrderItems (
    OrderID INT,
    Product VARCHAR(50),
    Quantity INT,
    FOREIGN KEY (OrderID) REFERENCES Customers(OrderID)
);

-- Step 4: Insert product and quantity data into OrderItems
INSERT INTO OrderItems (OrderID, Product, Quantity)
VALUES 
    (101, 'Laptop', 2),
    (101, 'Mouse', 1),
    (102, 'Tablet', 3),
    (102, 'Keyboard', 1),
    (102, 'Mouse', 2),
    (103, 'Phone', 1);
