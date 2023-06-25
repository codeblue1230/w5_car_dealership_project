-- All the way at the bottom is where I added is_serviced to my car table and created the 
-- procedure to update the is_serviced boolean to true or false in the car table.  The rest of the 
-- page consists of the functions used to add all the data to each table

-- Function to insert into customer table
CREATE OR REPLACE FUNCTION put_in_customer(customer_id INTEGER, first_name VARCHAR, last_name VARCHAR, email VARCHAR, phone_number VARCHAR)
RETURNS void
AS $MAIN$
BEGIN
	INSERT INTO customer
	VALUES(customer_id, first_name, last_name, email, phone_number);
END;
$MAIN$
LANGUAGE plpgsql;

SELECT put_in_customer(1, 'Sam', 'Smith', 'samsmith12@yahoo.com', '(951)846-2737');
SELECT put_in_customer(2, 'Harry', 'Hope', 'harryhope@yahoo.com', '(877)943-8172');
SELECT put_in_customer(3, 'Will', 'Smith', 'willsmith891@yahoo.com', '(943)000-1723');
SELECT put_in_customer(4, 'Larry', 'Virden', 'larryvirden012@yahoo.com', '(473)882-1919');
SELECT put_in_customer(5, 'Shannon', 'Elvis', 'shannonelvis@yahoo.com', '(923)185-7438');
SELECT put_in_customer(6, 'Mark', 'Zuck', 'markzuck@yahoo.com', '(473)192-1029');
SELECT put_in_customer(7, 'William', 'Beesly', 'williambeesly@yahoo.com', '(374)192-1231');
SELECT put_in_customer(8, 'Larry', 'Bowden', 'larrybowden@yahoo.com', '(999)875-1012');

-- Funtion to insert into car table
CREATE OR REPLACE FUNCTION put_in_car(car_id INTEGER, color VARCHAR, year_ INTEGER, make VARCHAR, model VARCHAR, service_history BOOLEAN, customer_id INTEGER)
RETURNS void
AS $MAIN$
BEGIN
	INSERT INTO car
	VALUES(car_id, color, year_, make, model, service_history, customer_id);
END;
$MAIN$
LANGUAGE plpgsql;

SELECT put_in_car(1, 'red', 2020, 'Ford', 'F150', true, 1);
SELECT put_in_car(2, 'blue', 2008, 'Ford', 'Mustang', true, 2);
SELECT put_in_car(3, 'blue', 2018, 'Ford', 'Escape', true, 3);
SELECT put_in_car(4, 'black', 2015, 'Ford', 'Fusion', true, 4);

-- Function to insert into salesperson table
CREATE OR REPLACE FUNCTION put_in_salesperson(salesperson_id INTEGER, first_name VARCHAR, last_name VARCHAR, phone_number VARCHAR, email VARCHAR, cars_sold INTEGER)
RETURNS void
AS $MAIN$
BEGIN
	INSERT INTO salesperson
	VALUES(salesperson_id, first_name, last_name, phone_number, email, cars_sold);
END;
$MAIN$
LANGUAGE plpgsql;

SELECT put_in_salesperson(1, 'Lily', 'Smith', '(877)741-0091', 'lilysmithford@gmail.com', 80);
SELECT put_in_salesperson(2, 'Marshall', 'Willis', '(865)145-1758', 'marshallwillisford@gmail.com', 150);
SELECT put_in_salesperson(3, 'Ted', 'Mosby', '(777)7998-1938', 'tedmosbyford@gmail.com', 5);
SELECT put_in_salesperson(4, 'Jim', 'Halpert', '(102)182-5739', 'jimhalpertford@gmail.com', 254);

-- Function to insert into inventory table
CREATE OR REPLACE FUNCTION put_in_inventory(inventory_id INTEGER, price NUMERIC, color VARCHAR, year_ INTEGER, make VARCHAR, model VARCHAR, service_history VARCHAR, pre_owned BOOLEAN)
RETURNS void
AS $MAIN$
BEGIN
	INSERT INTO inventory
	VALUES(inventory_id, price, color, year_, make, model, service_history, pre_owned);
END;
$MAIN$
LANGUAGE plpgsql;

SELECT put_in_inventory(1, 40000, 'red', 2023, 'Ford', 'Focus', 'Excellent maintenance record', false);
SELECT put_in_inventory(2, 40000, 'blue', 2023, 'Ford', 'Focus', 'Excellent maintenance record', false);
SELECT put_in_inventory(3, 8000, 'black', 2010, 'Ford', 'Mustang', 'Unverified record', true);
SELECT put_in_inventory(4, 45000, 'black', 2023, 'Ford', 'Focus RS', 'Excellent maintenance record', false);

-- Function to insert into sales_invoice table
CREATE OR REPLACE FUNCTION put_in_sales_invoice(s_invoice_id INTEGER, customer_id INTEGER, inventory_id INTEGER, salesperson_id INTEGER)
RETURNS void
AS $MAIN$
BEGIN
	INSERT INTO sales_invoice
	VALUES(s_invoice_id, customer_id, inventory_id, salesperson_id);
END;
$MAIN$
LANGUAGE plpgsql;

SELECT put_in_sales_invoice(1, 5, 1, 2);
SELECT put_in_sales_invoice(2, 6, 2, 3);
SELECT put_in_sales_invoice(3, 7, 3, 1);
SELECT put_in_sales_invoice(4, 8, 4, 4);

-- Function to insert into mechanic table
CREATE OR REPLACE FUNCTION put_in_mechanic(mechanic_id INTEGER, first_name VARCHAR, last_name VARCHAR, price NUMERIC)
RETURNS void
AS $MAIN$
BEGIN
	INSERT INTO mechanic
	VALUES(mechanic_id, first_name, last_name, price);
END;
$MAIN$
LANGUAGE plpgsql;

SELECT put_in_mechanic(1, 'Marc', 'Griffen', 30);
SELECT put_in_mechanic(2, 'John', 'Griffen', 25);
SELECT put_in_mechanic(3, 'Joe', 'Smith', 40);
SELECT put_in_mechanic(4, 'Leia', 'Organa', 30);

-- Function to insert into parts table
CREATE OR REPLACE FUNCTION put_in_parts(parts_id INTEGER, part_name VARCHAR, price NUMERIC)
RETURNS void
AS $MAIN$
BEGIN
	INSERT INTO parts
	VALUES(parts_id, part_name, price);
END;
$MAIN$
LANGUAGE plpgsql;

SELECT put_in_parts(1, 'Oil Filter', 40);
SELECT put_in_parts(2, 'Air Filter', 10);
SELECT put_in_parts(3, 'Brake Pads', 100);
SELECT put_in_parts(4, 'Radiator Hose', 25);

-- Function to insert into the service table
CREATE OR REPLACE FUNCTION put_in_service(service_id INTEGER, service_provided VARCHAR, price NUMERIC)
RETURNS void
AS $MAIN$
BEGIN
	INSERT INTO service
	VALUES(service_id, service_provided, price);
END;
$MAIN$
LANGUAGE plpgsql;

SELECT put_in_service(1, 'Tire Rotation', 40);
SELECT put_in_service(2, 'Tune Up', 50);
SELECT put_in_service(3, 'Oil Change', 20);
SELECT put_in_service(4, 'Brake Job', 200);

-- Function to insert into the service_invoice table
CREATE OR REPLACE FUNCTION put_in_service_invoice(mec_service_id INTEGER, total_price NUMERIC, mechanic_id INTEGER, parts_id INTEGER, service_id INTEGER, customer_id INTEGER)
RETURNS void
AS $MAIN$
BEGIN
	INSERT INTO service_invoice
	VALUES(mec_service_id, total_price, mechanic_id, parts_id, service_id, customer_id);
END;
$MAIN$
LANGUAGE plpgsql;

SELECT put_in_service_invoice(1, 90, 1, 1, 3, 1);
SELECT put_in_service_invoice(2, 85, 2, 1, 3, 2);
SELECT put_in_service_invoice(3, 60, 3, NULL, 1, 1);
SELECT put_in_service_invoice(4, 360, 4, 3, 4, 1);

-- Delete service_history and add is_serviced column to car table
ALTER TABLE car
DROP COLUMN service_history;

ALTER TABLE car
ADD COLUMN is_serviced BOOLEAN;

-- Procedure to add true/false to is_serviced column
CREATE OR REPLACE PROCEDURE update_service(
	car_id_check INTEGER,
	service_check BOOLEAN
)
LANGUAGE plpgsql
AS $$
BEGIN
	UPDATE car
	SET is_serviced = service_check
	WHERE car_id = car_id_check;
	COMMIT;
END;
$$

CALL update_service(2, true);

SELECT *
FROM car;
	