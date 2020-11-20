-- Create Table Product
CREATE TABLE Product (
	Product_id VARCHAR2(20)  CONSTRAINT pk_product PRIMARY KEY,
	Product_name VARCHAR2(20) NOT NULL,
	Price Number CHECK (Price > 0)
);
-- Create Table Customer
CREATE TABLE Customer (
	Customer_id VARCHAR2(20)  CONSTRAINT pk_customer PRIMARY KEY,
	Customer_name VARCHAR2(20) NOT NULL,
	Customer_tel Number
);
-- Create Table Orders
CREATE TABLE Orders (
	Customer_id VARCHAR2(20),
	Product_id VARCHAR2(20),
	Quantity Number,
	Total_amount Number
	CONSTRAINT fk1_orders FOREIGN KEY (Customer_id) REFERENCES Customer (Customer_id)
	CONSTRAINT fk2_orders FOREIGN KEY (Product_id) REFERENCES Product (Product_id)
);

Alter Table Orders CONSTRAINT pk_orders PRIMARY KEY(Customer_id ,Product_id);

--Add a column Category to the PRODUCT table
ALTER TABLE Product ADD Category VARCHAR2(100);

-- Add a column OrderDate (DATE)  to the ORDERS table which have SYSDATE as a default value.
ALTER TABLE Orders ADD OrderDate DATE DEFAULT GETDATE();