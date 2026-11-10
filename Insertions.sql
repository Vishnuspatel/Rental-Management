-- Artifically generated data to test table strucuture and constraints
-- Business Locations
INSERT INTO Locations
(Location_Name, Address, City, State, Zip_Code, Phone)
VALUES
('Asheville Downtown', '100 Patton Ave', 'Asheville', 'NC', '28801', '8285550101'),
('Charlotte Airport', '5501 Josh Birmingham Pkwy', 'Charlotte', 'NC', '28208', '7045550102'),
('Greenville Branch', '200 Airport Rd', 'Greenville', 'SC', '29607', '8645550103');


-- Vehicle Supply
INSERT INTO Vehicles
(VIN, Make, Model, Vehicle_Year, Color, Mileage, Vehicle_Type, Location_ID)
VALUES
('1HGCM82633A004352', 'Honda', 'Accord', 2023, 'Silver', 18500, 'Sedan', 1),
('1FTFW1E50NFA12345', 'Ford', 'F-150', 2024, 'Black', 12000, 'Truck', 1),
('2T1BURHE5JC123456', 'Toyota', 'Corolla', 2022, 'White', 32000, 'Sedan', 1),
('5YJ3E1EA7KF123456', 'Tesla', 'Model 3', 2023, 'Blue', 22000, 'Electric', 2),
('1N4AL3AP8JC123456', 'Nissan', 'Altima', 2021, 'Gray', 45000, 'Sedan', 2),
('3FA6P0H73JR123456', 'Ford', 'Fusion', 2020, 'Red', 61000, 'Sedan', 2),
('1C4RJFBG5FC123456', 'Jeep', 'Grand Cherokee', 2023, 'Black', 27000, 'SUV', 2),
('JM1GJ1U55F1123456', 'Mazda', 'Mazda6', 2019, 'White', 72000, 'Sedan', 3),
('WBA8E9G59GNU12345', 'BMW', '330i', 2024, 'Gray', 9000, 'Luxury', 3),
('KNDPMCAC5J7123456', 'Kia', 'Sportage', 2022, 'Blue', 35000, 'SUV', 3),
('1G1ZD5ST6JF123456', 'Chevrolet', 'Malibu', 2021, 'Black', 49000, 'Sedan', 1),
('4T1BF1FK5HU123456', 'Toyota', 'Camry', 2018, 'Silver', 85000, 'Sedan', 3);


-- Renter Information
INSERT INTO Customers
(First_Name, Middle_Name, Last_Name, License_No, License_State,
 License_Expiration, Phone, Email)
VALUES
('James', NULL, 'Wilson', 'W123456789', 'NC', '2028-05-15', '8285551001', 'jwilson@email.com'),
('Sarah', 'M', 'Davis', 'D987654321', 'NC', '2029-08-20', '8285551002', 'sdavis@email.com'),
('Michael', NULL, 'Brown', 'B456789123', 'SC', '2027-11-30', '8645551003', 'mbrown@email.com'),
('Emily', NULL, 'Johnson', 'J234567891', 'NC', '2030-01-10', '7045551004', 'ejohnson@email.com'),
('David', NULL, 'Miller', 'M345678912', 'GA', '2028-07-22', '4045551005', 'dmiller@email.com'),
('Ashley', NULL, 'Taylor', 'T567891234', 'SC', '2029-03-12', '8645551006', 'ataylor@email.com'),
('Robert', NULL, 'Anderson', 'A678912345', 'NC', '2027-09-05', '9195551007', 'randerson@email.com'),
('Jessica', NULL, 'Thomas', 'T789123456', 'TN', '2030-04-18', '6155551008', 'jthomas@email.com'),
('Daniel', NULL, 'Moore', 'M891234567', 'NC', '2028-12-01', '8285551009', 'dmoore@email.com'),
('Lauren', NULL, 'Martin', 'M912345678', 'SC', '2029-06-25', '8035551010', 'lmartin@email.com');


-- Reservation Information
INSERT INTO Rentals
(Customer_ID, VIN, Pickup_Location, Return_Location,
 Reservation_Date, Rental_Start_Date, Rental_End_Date,
 Actual_Return_Date, Rental_Rate, Discounts, Rental_Status)
VALUES
(1, '1HGCM82633A004352', 1, 1, '2026-11-05', '2026-11-08', '2026-11-12', NULL, 65.00, 10.00, 'Active'),
(2, '1FTFW1E50NFA12345', 1, 2, '2026-11-09', '2026-11-15', '2026-11-19', NULL, 110.00, 0.00, 'Booked'),
(3, '2T1BURHE5JC123456', 1, 1, '2026-10-20', '2026-10-22', '2026-10-25', '2026-10-25', 48.00, 5.00, 'Completed'),
(4, '5YJ3E1EA7KF123456', 2, 2, '2026-11-06', '2026-11-07', '2026-11-11', NULL, 95.00, 0.00, 'Active'),
(5, '1N4AL3AP8JC123456', 2, 3, '2026-10-15', '2026-10-18', '2026-10-21', '2026-10-22', 55.00, 0.00, 'Completed'),
(6, '3FA6P0H73JR123456', 2, 2, '2026-11-01', '2026-11-10', '2026-11-13', NULL, 52.00, 8.00, 'Cancelled'),
(7, '1C4RJFBG5FC123456', 2, 2, '2026-11-08', '2026-11-09', '2026-11-14', NULL, 85.00, 15.00, 'Active'),
(8, 'JM1GJ1U55F1123456', 3, 1, '2026-10-25', '2026-10-28', '2026-10-30', '2026-10-30', 45.00, 0.00, 'Completed');


-- Additional Charges
INSERT INTO Rental_Charges
(Rental_ID, Charge_Type, Description, Amount)
VALUES
(1, 'Insurance', 'Optional daily insurance coverage', 40.00),
(1, 'Fuel', 'Fuel refill charge', 25.00),
(3, 'Insurance', 'Optional insurance coverage', 30.00),
(5, 'Late Return', 'One additional day due to late return', 55.00),
(5, 'Fuel', 'Fuel refill charge', 20.00),
(7, 'Insurance', 'Optional daily insurance coverage', 50.00),
(8, 'Cleaning', 'Interior cleaning fee', 35.00);


-- Payment Methods
INSERT INTO Rental_Payments
(Rental_ID, Payment_Date, Payment_Amount, Payment_Method,
 Payment_Type, Payment_Status)
VALUES
(1, '2026-11-05', 100.00, 'Credit Card', 'Payment', 'Completed'),
(1, '2026-11-08', 150.00, 'Credit Card', 'Payment', 'Completed'),
(2, '2026-11-09', 100.00, 'Credit Card', 'Payment', 'Completed'),
(3, '2026-10-25', 169.00, 'Credit Card', 'Payment', 'Completed'),
(4, '2026-11-06', 200.00, 'Credit Card', 'Payment', 'Completed'),
(5, '2026-10-22', 240.00, 'Debit Card', 'Payment', 'Completed'),
(5, '2026-10-23', 55.00, 'Debit Card', 'Payment', 'Completed'),
(6, '2026-11-02', 100.00, 'Credit Card', 'Payment', 'Completed'),
(6, '2026-11-03', 100.00, 'Credit Card', 'Refund', 'Completed'),
(7, '2026-11-08', 150.00, 'Credit Card', 'Payment', 'Completed'),
(8, '2026-10-30', 125.00, 'Credit Card', 'Payment', 'Completed');


-- Vehicle Health
INSERT INTO Maintenance
(VIN, Service_Date, Reason, Description, Service_Provider,
 Parts_Cost, Labor_Cost, Other_Cost, Mileage_At_Service,
 Next_Service_Date, Next_Service_Mileage)
VALUES
('KNDPMCAC5J7123456', '2026-11-05', 'Routine', 'Oil change and tire rotation', 'Greenville Auto Service', 45.00, 60.00, 0.00, 35000, '2027-05-05', 40000),
('1HGCM82633A004352', '2026-09-15', 'Routine', 'Brake inspection and oil change', 'Asheville Auto Center', 75.00, 85.00, 0.00, 16000, '2027-03-15', 21000),
('1FTFW1E50NFA12345', '2026-10-10', 'Issue', 'Replacement of damaged side mirror', 'Asheville Auto Center', 180.00, 75.00, 0.00, 11500, NULL, NULL),
('WBA8E9G59GNU12345', '2026-11-08', 'Issue', 'Engine warning light inspection', 'Greenville BMW Service', 120.00, 150.00, 25.00, 9000, NULL, NULL),
('4T1BF1FK5HU123456', '2026-08-20', 'Routine', 'Oil change and brake inspection', 'Greenville Auto Service', 55.00, 70.00, 0.00, 82000, '2027-02-20', 87000);


-- Vehicle Location
INSERT INTO Vehicle_Status
(VIN, Location_ID, Status, Notes)
VALUES
('1HGCM82633A004352', 1, 'Rented', 'Currently rented, expected return November 12'),
('1FTFW1E50NFA12345', 1, 'Reserved', 'Booked for November 15 pickup'),
('2T1BURHE5JC123456', 1, 'Available', 'Returned and ready for rental'),
('5YJ3E1EA7KF123456', 2, 'Rented', 'Currently rented, expected return November 11'),
('1N4AL3AP8JC123456', 3, 'Available', 'Returned and ready for rental'),
('3FA6P0H73JR123456', 2, 'Available', 'Previous reservation cancelled'),
('1C4RJFBG5FC123456', 2, 'Rented', 'Currently rented, expected return November 14'),
('JM1GJ1U55F1123456', 1, 'Available', 'Returned and transferred to Asheville'),
('WBA8E9G59GNU12345', 3, 'Maintenance', 'Undergoing engine inspection'),
('KNDPMCAC5J7123456', 3, 'Available', 'Routine maintenance completed'),
('1G1ZD5ST6JF123456', 1, 'Available', 'Ready for rental'),
('4T1BF1FK5HU123456', 3, 'Available', 'Ready for rental');


-- Vehicle Status
INSERT INTO Vehicle_Transfers
(VIN, From_Location, To_Location, Transfer_Date, Arrival_Date, Transfer_Status)
VALUES
('JM1GJ1U55F1123456', 3, 1, '2026-10-31', '2026-11-01', 'Completed'),
('KNDPMCAC5J7123456', 3, 2, '2026-11-12', NULL, 'Pending'),
('1G1ZD5ST6JF123456', 1, 3, '2026-11-09', NULL, 'In Transit');