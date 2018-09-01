-- HYF Databses - week1 homework 

-- CREATE DATABASE IF NOT EXISTS DB_todo;

DROP DATABASE IF EXISTS DB_todo;
CREATE DATABASE IF NOT EXISTS DB_todo;

USE DB_todo;

DROP TABLE IF EXISTS Tags;

CREATE TABLE Tags (
  id INT NOT NULL AUTO_INCREMENT,
  name varchar(60) NOT NULL,
  PRIMARY KEY (id)
);
 
 INSERT INTO Tags(name) VALUES
  ('Home'),
  ('Work' ),
  ('Freetime'),
  ('Food'),
  ('Travel');
  
DROP TABLE IF EXISTS Todos;

CREATE TABLE Todos (
  id INT NOT NULL AUTO_INCREMENT,
  text varchar(128) NOT NULL,
  done BOOLEAN DEFAULT FALSE,
  tag_id INT,
  PRIMARY KEY (id),
  FOREIGN KEY(tag_id) REFERENCES Tags(id)
);

INSERT INTO Todos(text, tag_id) VALUES
  ('wake up early ', 1),
  ('solve SQL  bug to select from users' ,2),
  ('add a new server',2),
  ('meeting with advertisment company',2),
  ('visit my friend',3);