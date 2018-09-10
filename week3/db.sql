
DROP database IF EXISTS mobile_company;
CREATE database mobile_company;
USE mobile_company;

CREATE TABLE departments(
  id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE employess(
  id INT NOT NULL AUTO_INCREMENT,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  email VARCHAR(100),
  job_title VARCHAR(50) ,
  dept_id INT NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (dept_id) REFERENCES departments(id)
);

CREATE TABLE customers(
  id INT NOT NULL AUTO_INCREMENT,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  email VARCHAR(100),
  phone VARCHAR(50) ,
  Address VARCHAR(200) ,
  PRIMARY KEY (id)
);

CREATE TABLE subscriptions(
  id INT NOT NULL AUTO_INCREMENT,
  customer_id INT NOT NULL,
  employee_id INT NOT NULL,
  status VARCHAR(50) NOT NULL,
  start_date DATE NOT NULL,
  end_date DATE NOT NULL,
  FOREIGN KEY (customer_id) REFERENCES customers(id),
  FOREIGN KEY (employee_id) REFERENCES employess(id),
  PRIMARY KEY (id)
);
