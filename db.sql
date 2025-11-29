CREATE DATABASE Sale_db;
GO

-- ===========================================
--
-- ===========================================

CREATE TABLE Suppliers (
    SupplierID INT IDENTITY (1, 1) PRIMARY KEY,
    CompanyName NVARCHAR(40),
    Phone NVARCHAR(20)
)

CREATE TABLE Categories (
    CategoryID INT IDENTITY (1, 1) PRIMARY KEY,
    CategoryName NVARCHAR(20),
    Description NVARCHAR(100)
)

CREATE TABLE Employees (
    EmployeeID INT IDENTITY (1, 1) PRIMARY KEY,
    ReportsTo INT,
    LastName NVARCHAR(20),
    FirstName NVARCHAR(20),
    Title NVARCHAR(20),
    CONSTRAINT FK_Employees_Employees FOREIGN KEY (ReportsTo) REFERENCES Employees(EmployeeID)
)

CREATE TABLE Shippers (
    ShipperID INT IDENTITY (1, 1) PRIMARY KEY,
    CompanyName NVARCHAR(20),
    Phone NVARCHAR(20)
)

-- ===========================================
-- CUSTOMERS AND ORDERS
-- ===========================================

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CompanyName NVARCHAR(40),
    TaxID NVARCHAR(20),
    CustomerType NVARCHAR(10),
    Address NVARCHAR (50),
    City NVARCHAR (20),
    Region NVARCHAR (20),
    PostalCode NVARCHAR (20),
    Country NVARCHAR (20),
    Phone NVARCHAR (20),
)

CREATE TABLE Orders (
    OrderId INT PRIMARY KEY,
    CustomerID INT NOT NULL,
    EmployeeID INT NOT NULL,
    OrderDate DATETIME,
    RequiredDate DATETIME,
    ShippedDate DATETIME,
    ShipVia INT,
    Freight MONEY,
    PaymentStatus NVARCHAR(10),
    CONSTRAINT FK_Orders_Customers FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    CONSTRAINT FK_Orders_Employees FOREIGN KEY (EmployeeID) REFERENCES  Employees(EmployeeID),
    CONSTRAINT FK_Orders_Shippers FOREIGN KEY  (ShipVia) REFERENCES  Shippers(ShipperID)
)

CREATE TABLE OrderDetails (
    OrderID INT,
    ProductID INT,
    UnitPrice MONEY,
    Quantity INT,
    Discount REAL,
    CONSTRAINT FK_OrderDetails_Orders FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    CONSTRAINT FK_OrderDetails_Products FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
)