-- Operational database builder
DROP TABLE IF EXISTS Vehicle_Transfers CASCADE;
DROP TABLE IF EXISTS Vehicle_Status CASCADE;
DROP TABLE IF EXISTS Maintenance CASCADE;
DROP TABLE IF EXISTS Rental_Payments CASCADE;
DROP TABLE IF EXISTS Rental_Charges CASCADE;
DROP TABLE IF EXISTS Rentals CASCADE;
DROP TABLE IF EXISTS Customers CASCADE;
DROP TABLE IF EXISTS Vehicles CASCADE;
DROP TABLE IF EXISTS Locations CASCADE;


-- Business Locations
CREATE TABLE Locations (
    Location_ID INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    Location_Name VARCHAR(100) NOT NULL,
    Address VARCHAR(200),
    City VARCHAR(100) NOT NULL,
    State VARCHAR(15) NOT NULL,
    Zip_Code VARCHAR(5),
    Phone VARCHAR(10)
);


-- Vehicle Supply
CREATE TABLE Vehicles (
    VIN VARCHAR(17) PRIMARY KEY,
    Make VARCHAR(50) NOT NULL,
    Model VARCHAR(50) NOT NULL,
    Vehicle_Year INTEGER NOT NULL,
    Color VARCHAR(30),
    Mileage INTEGER NOT NULL DEFAULT 0,
    Vehicle_Type VARCHAR(30) NOT NULL,
    Date_Added DATE DEFAULT CURRENT_DATE,
    Location_ID INTEGER NOT NULL,

    FOREIGN KEY (Location_ID) REFERENCES Locations(Location_ID),
    CONSTRAINT valid_vin_length CHECK (LENGTH(VIN) = 17),
    CONSTRAINT valid_vehicle_year CHECK (Vehicle_Year BETWEEN 2000 AND 2800),
    CONSTRAINT nonnegative_mileage CHECK (Mileage >= 0)
);


-- Renter Information
CREATE TABLE Customers (
    Customer_ID INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    First_Name VARCHAR(50) NOT NULL,
    Middle_Name VARCHAR(50),
    Last_Name VARCHAR(50) NOT NULL,
    License_No VARCHAR(50) NOT NULL,
    License_State VARCHAR(50) NOT NULL,
    License_Expiration DATE NOT NULL,
    Phone VARCHAR(10),
    Email VARCHAR(100),

    CONSTRAINT unique_customer_license UNIQUE (License_No, License_State)
);


-- Reservation Information
CREATE TABLE Rentals (
    Rental_ID INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    Customer_ID INTEGER NOT NULL,
    VIN VARCHAR(17) NOT NULL,
    Pickup_Location INTEGER NOT NULL,
    Return_Location INTEGER NOT NULL,
    Reservation_Date DATE NOT NULL DEFAULT CURRENT_DATE,
    Rental_Start_Date DATE NOT NULL,
    Rental_End_Date DATE NOT NULL,
    Actual_Return_Date DATE,
    Rental_Rate NUMERIC(10,2) NOT NULL,
    Discounts NUMERIC(10,2) DEFAULT 0,
    Rental_Status VARCHAR(20) NOT NULL DEFAULT 'Booked',

    FOREIGN KEY (Customer_ID) REFERENCES Customers(Customer_ID),
    FOREIGN KEY (VIN) REFERENCES Vehicles(VIN),
    FOREIGN KEY (Pickup_Location) REFERENCES Locations(Location_ID),
    FOREIGN KEY (Return_Location) REFERENCES Locations(Location_ID),
    CHECK (Rental_End_Date >= Rental_Start_Date),
    CHECK (Actual_Return_Date IS NULL OR Actual_Return_Date >= Rental_Start_Date),
    CHECK (Rental_Rate >= 0),
    CHECK (Discounts >= 0),
    CHECK (Rental_Status IN ('Booked', 'Active', 'Completed', 'Cancelled'))
);


-- Additional Charges
CREATE TABLE Rental_Charges (
    Charge_ID INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    Rental_ID INTEGER NOT NULL,
    Charge_Type VARCHAR(50) NOT NULL,
    Description VARCHAR(200),
    Amount NUMERIC(10,2) NOT NULL,

    FOREIGN KEY (Rental_ID) REFERENCES Rentals(Rental_ID),
    CHECK (Amount >= 0)
);


-- Payment Methods
CREATE TABLE Rental_Payments (
    Payment_ID INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    Rental_ID INTEGER NOT NULL,
    Payment_Date DATE NOT NULL DEFAULT CURRENT_DATE,
    Payment_Amount NUMERIC(10,2) NOT NULL,
    Payment_Method VARCHAR(30),
    Payment_Type VARCHAR(20) NOT NULL DEFAULT 'Payment',
    Payment_Status VARCHAR(20) NOT NULL DEFAULT 'Completed',

    FOREIGN KEY (Rental_ID) REFERENCES Rentals(Rental_ID),
    CHECK (Payment_Amount > 0),
    CHECK (Payment_Type IN ('Payment', 'Refund')),
    CHECK (Payment_Status IN ('Completed', 'Pending', 'Failed'))
);


-- Vehicle Health
CREATE TABLE Maintenance (
    Maintenance_ID INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    VIN VARCHAR(17) NOT NULL,
    Service_Date DATE NOT NULL,
    Reason VARCHAR(20) NOT NULL,
    Description VARCHAR(300),
    Service_Provider VARCHAR(100),
    Parts_Cost NUMERIC(10,2) DEFAULT 0,
    Labor_Cost NUMERIC(10,2) DEFAULT 0,
    Other_Cost NUMERIC(10,2) DEFAULT 0,
    Mileage_At_Service INTEGER,
    Next_Service_Date DATE,
    Next_Service_Mileage INTEGER,

    FOREIGN KEY (VIN) REFERENCES Vehicles(VIN),
    CHECK (Reason IN ('Routine', 'Issue')),
    CHECK (Parts_Cost >= 0),
    CHECK (Labor_Cost >= 0),
    CHECK (Other_Cost >= 0),
    CHECK (Mileage_At_Service IS NULL OR Mileage_At_Service >= 0),
    CHECK (Next_Service_Mileage IS NULL OR Next_Service_Mileage >= 0)
);


-- Vehicle Location
CREATE TABLE Vehicle_Status (
    Status_ID INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    VIN VARCHAR(17) NOT NULL,
    Location_ID INTEGER NOT NULL,
    Status VARCHAR(20) NOT NULL,
    Status_Date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    Notes VARCHAR(300),

    FOREIGN KEY (VIN) REFERENCES Vehicles(VIN),
    FOREIGN KEY (Location_ID) REFERENCES Locations(Location_ID),
    CHECK (Status IN ('Available', 'Rented', 'Maintenance', 'Reserved', 'Retired', 'In Transit'))
);


-- Vehicle Status
CREATE TABLE Vehicle_Transfers (
    Transfer_ID INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    VIN VARCHAR(17) NOT NULL,
    From_Location INTEGER NOT NULL,
    To_Location INTEGER NOT NULL,
    Transfer_Date DATE NOT NULL,
    Arrival_Date DATE,
    Transfer_Status VARCHAR(20) NOT NULL DEFAULT 'Pending',

    FOREIGN KEY (VIN) REFERENCES Vehicles(VIN),
    FOREIGN KEY (From_Location) REFERENCES Locations(Location_ID),
    FOREIGN KEY (To_Location) REFERENCES Locations(Location_ID),
    CHECK (From_Location <> To_Location),
    CHECK (Arrival_Date IS NULL OR Arrival_Date >= Transfer_Date),
    CHECK (Transfer_Status IN ('Pending', 'In Transit', 'Completed', 'Cancelled'))
);