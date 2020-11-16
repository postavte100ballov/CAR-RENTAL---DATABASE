--Car Rental System
--Table for defining whether car is available for hiring
CREATE TABLE car_availability (
	availability_id INTEGER PRIMARY KEY,
	type VARCHAR(32),
	reason VARCHAR(32)
);
-- Table for checking validity of insurance document
CREATE TABLE car_insurance (              
	insurance_id INTEGER PRIMARY KEY,  
	certificate_type VARCHAR(32),
	validity BOOLEAN
);
--Table storing information where car pick points are located
CREATE TABLE location_city (
	city_id INTEGER PRIMARY KEY,
	city_name VARCHAR(32),
	address VARCHAR(32)
);
--Table for providing data about the specific brand of the car
CREATE TABLE brand(
brand_id  INT,
brand_name VARCHAR(32),
country VARCHAR(32),
PRIMARY KEY (brand_id)             
);
--Table of payment bills issued for each car reservation
CREATE TABLE payment (
	payment_id INTEGER PRIMARY KEY,
	price DECIMAL(12),
	payment_type VARCHAR(32),
	final_bill DECIMAL(12)
);
--Table for getting information about fees
CREATE TABLE fee_type(
	fee_id INTEGER PRIMARY KEY,
	description VARCHAR(32),
	fee_amount DECIMAL(12)
);
--Table calculating sum of additional fees gained by car user
CREATE TABLE total_fee(
payment_id INT,
fee_id INT,
FOREIGN KEY (fee_id) REFERENCES fee_type(fee_id), --Foreign key linking to fee_id from fee_type table
FOREIGN KEY (payment_id) REFERENCES payment(payment_id) --Foreign key connecting to payment_id from payment table

);
--Table for choosing a car
CREATE TABLE rental_car (
	car_id INTEGER PRIMARY KEY,
	name VARCHAR(32),
	brand_id INTEGER,
	year DECIMAL(4),
	availability_state INTEGER,
	price_per_day DECIMAL(4),
	insurance_id INTEGER,
	location_city INTEGER,
	FOREIGN KEY (brand_id) REFERENCES brand(brand_id), --to connect brand_id from brand table
	FOREIGN KEY (availability_state) REFERENCES car_availability(availability_id),--to connect availability_id from car_availability
	FOREIGN KEY (insurance_id) REFERENCES car_insurance(insurance_id), --to connect insurance_id from car_insurance
	FOREIGN KEY (location_city) REFERENCES location_city(city_id)--to connect city_id from location_city

);
--Table for storing personal details of the customer using services of organization
CREATE TABLE customer(
customer_id INT,
fname VARCHAR(32),
lname VARCHAR(32),
telephone VARCHAR(32),
PRIMARY KEY (customer_id)
);
--Table for creating car booking records for customers
CREATE TABLE car_reservation(
reservation_id INT,
car_id INT,
customer_id INT,
start_date  DATE,
finish_date   DATE,
payment_id INT,
PRIMARY KEY (reservation_id),
FOREIGN KEY (car_id) REFERENCES rental_car(car_id), --foreign key used for linkage with rental_car table
FOREIGN KEY (customer_id) REFERENCES customer(customer_id), --FK referring to customer table 
FOREIGN KEY (payment_id) REFERENCES payment(payment_id) --FK payment_id connected to payment table
);



--Table for getting data about left feedback
CREATE TABLE feedback(
feedback_id INT,
car_id INT,
customer_id INT,
content VARCHAR(32),
PRIMARY KEY (feedback_id), --each records has unique id number
FOREIGN KEY (car_id) REFERENCES rental_car(car_id), --FK for referring to car about which the feedback is written 
FOREIGN KEY (customer_id) REFERENCES customer(customer_id) --FK pointing to customer details from customer table           
);









