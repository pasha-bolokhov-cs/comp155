-- Create the tables needed for Lab 14

CREATE TABLE customers (
  customer_id INTEGER
    CONSTRAINT customers_pk PRIMARY KEY,
  first_name VARCHAR2(10) NOT NULL,
  last_name VARCHAR2(10) NOT NULL,
  dob DATE,
  phone VARCHAR2(12)
);

CREATE TABLE order_status2 (
  id INTEGER
    CONSTRAINT order_status2_pk PRIMARY KEY,
  status VARCHAR2(20),
  last_modified DATE DEFAULT SYSDATE
);

-- insert sample data into customers table

INSERT INTO customers (
  customer_id, first_name, last_name, dob, phone
) VALUES (
  1, 'John', 'Brown', '01-JAN-1965', '800-555-1211'
);

INSERT INTO customers (
  customer_id, first_name, last_name, dob, phone
) VALUES (
  2, 'Cynthia', 'Green', '05-FEB-1968', '800-555-1212'
);

INSERT INTO customers (
  customer_id, first_name, last_name, dob, phone
) VALUES (
  3, 'Steve', 'White', '16-MAR-1971', '800-555-1213'
);

INSERT INTO customers (
  customer_id, first_name, last_name, dob, phone
) VALUES (
  4, 'Gail', 'Black', NULL, '800-555-1214'
);

INSERT INTO customers (
  customer_id, first_name, last_name, dob, phone
) VALUES (
  5, 'Doreen', 'Blue', '20-MAY-1970', NULL
);

-- commit the transaction
COMMIT;
