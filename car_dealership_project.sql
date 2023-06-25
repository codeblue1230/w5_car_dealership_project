CREATE TABLE customer (
  customer_id SERIAL PRIMARY KEY,
  first_name VARCHAR(100),
  last_name VARCHAR(100),
  email VARCHAR(100),
  phone_number VARCHAR(20)
);

CREATE TABLE car (
  car_id SERIAL PRIMARY KEY,
  color VARCHAR(50),
  year_ INTEGER,
  make VARCHAR(100),
  model VARCHAR(100),
  service_history BOOLEAN,
  customer_id INTEGER,
  FOREIGN KEY (customer_id)
    REFERENCES customer(customer_id)
);

CREATE TABLE salesperson (
  salesperson_id SERIAL PRIMARY KEY,
  first_name VARCHAR(100),
  last_name VARCHAR(100),
  phone_number VARCHAR(20),
  email VARCHAR(100),
  cars_sold INTEGER
);

CREATE TABLE inventory (
  inventory_id SERIAL PRIMARY KEY,
  price NUMERIC(10,2),
  color VARCHAR(50),
  year_ INTEGER,
  make VARCHAR(100),
  model VARCHAR(100),
  service_history VARCHAR(1000),
  pre_owned BOOLEAN
);

CREATE TABLE sales_invoice (
  s_invoice_id SERIAL PRIMARY KEY,
  customer_id INTEGER,
  inventory_id INTEGER,
  salesperson_id INTEGER,
  FOREIGN KEY (customer_id)
    REFERENCES customer(customer_id),
  FOREIGN KEY (inventory_id)
    REFERENCES inventory(inventory_id),
  FOREIGN KEY (salesperson_id)
    REFERENCES salesperson(salesperson_id)
);

CREATE TABLE mechanic (
  mechanic_id SERIAL PRIMARY KEY,
  first_name VARCHAR(100),
  last_name VARCHAR(100),
  price NUMERIC(5,2)
);

CREATE TABLE service (
  service_id SERIAL PRIMARY KEY,
  service_provided VARCHAR(100),
  price NUMERIC(10,2)
);

CREATE TABLE parts (
  parts_id SERIAL PRIMARY KEY,
  part_name VARCHAR(50),
  price NUMERIC(10,2)
);

CREATE TABLE service_invoice (
  mec_service_id SERIAL PRIMARY KEY,
  total_price NUMERIC(8,2),
  mechanic_id INTEGER,
  parts_id INTEGER,
  service_id INTEGER,
  customer_id INTEGER,
  FOREIGN KEY (mechanic_id)
    REFERENCES mechanic(mechanic_id),
  FOREIGN KEY (parts_id)
    REFERENCES parts(parts_id),
  FOREIGN KEY (service_id)
    REFERENCES service(service_id),
  FOREIGN KEY (customer_id)
    REFERENCES customer(customer_id)
);
