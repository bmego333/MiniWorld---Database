CREATE DATABASE MobileRepair;
USE MobileRepair;

CREATE TABLE CustomerInfo (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(50),
    PhoneNumber VARCHAR(15),
    Email VARCHAR(50)
);

CREATE TABLE DeviceInfo (
    DeviceID INT PRIMARY KEY,
    Brand VARCHAR(20),
    Model VARCHAR(30),
    IMEI_SerialNum VARCHAR(20),
    Reason_Problem VARCHAR(100)
);

CREATE TABLE TechnicianInfo (
    TechnicianID INT PRIMARY KEY,
    Name VARCHAR(50),
    AvailabilityStatus VARCHAR(20),
    RepairPreference VARCHAR(50)
);

CREATE TABLE InventoryInfo (
    PartID INT PRIMARY KEY,
    PartName VARCHAR(50),
    QuantityInStock INT,
    DateReceived DATE,
    DatePlacedOrder DATE,
    CostPerUnit DECIMAL(10,2),
    StatusOfInventory VARCHAR(20)
);

CREATE TABLE RepairOrderInfo (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    DeviceID INT,
    TechnicianID INT,
    RepairStatus VARCHAR(20),
    DateReceived DATE,
    DateReturned DATE,
    EstimatedCost DECIMAL(10,2),
    ActualCost DECIMAL(10,2),
    FOREIGN KEY (CustomerID) REFERENCES CustomerInfo(CustomerID),
    FOREIGN KEY (DeviceID) REFERENCES DeviceInfo(DeviceID),
    FOREIGN KEY (TechnicianID) REFERENCES TechnicianInfo(TechnicianID)
);

CREATE TABLE BillingInvoiceInfo (
    InvoiceID INT PRIMARY KEY,
    OrderID INT UNIQUE,
    TotalCost DECIMAL(10,2),
    PaymentMethod VARCHAR(20),
    PaymentStatus VARCHAR(20),
    DateOfPayment DATE,
    FOREIGN KEY (OrderID) REFERENCES RepairOrderInfo(OrderID)
);

CREATE TABLE RepairPartsUsedInfo (
    OrderID INT,
    PartID INT,
    QuantityUsed INT DEFAULT 1,
    PRIMARY KEY (OrderID, PartID),
    FOREIGN KEY (OrderID) REFERENCES RepairOrderInfo(OrderID),
    FOREIGN KEY (PartID) REFERENCES InventoryInfo(PartID)
);