DROP TABLE IF EXISTS employee;
DROP TABLE IF EXISTS car;
DROP TABLE IF EXISTS wing;
DROP TABLE IF EXISTS wing_type;
DROP TABLE IF EXISTS chassis;
DROP TABLE IF EXISTS engine;
DROP TABLE IF EXISTS team;

CREATE TABLE team (
team_id int (20) UNSIGNED NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
team_name varchar (45) NOT NULL,
principal varchar (45),
first_driver varchar (45),
second_driver varchar (45)
);

CREATE TABLE employee (
emp_id int (20) UNSIGNED UNIQUE AUTO_INCREMENT PRIMARY KEY,
full_name varchar(45) NOT NULL,
team_id int (20) UNSIGNED NOT NULL UNIQUE 
);

CREATE TABLE engine (
engine_id int (20) UNSIGNED UNIQUE AUTO_INCREMENT PRIMARY KEY,
manufacturer int (20) UNSIGNED NOT NULL,
horsepower int (20) UNSIGNED NOT NULL,
weight int (20) UNSIGNED NOT NULL
);

CREATE TABLE chassis (
chassis_id int(20) UNSIGNED UNIQUE AUTO_INCREMENT PRIMARY KEY,
manufacturer int(20) UNSIGNED NOT NULL,
length int(20) UNSIGNED NOT NULL,
weight int(20) UNSIGNED NOT NULL);

CREATE TABLE wing_type (
type_id int(20) UNSIGNED UNIQUE AUTO_INCREMENT PRIMARY KEY,
type_name VARCHAR(45) NOT NULL,
weight int(20) UNSIGNED NOT NULL);

CREATE TABLE wing (
downforce int(20) UNSIGNED NOT NULL,
wing_type int(20) UNSIGNED NOT NULL, 
wing_id int(20) UNSIGNED UNIQUE NOT NULL AUTO_INCREMENT,
PRIMARY KEY (downforce, wing_type));

CREATE TABLE car (
model_id int (20) UNSIGNED UNIQUE AUTO_INCREMENT PRIMARY KEY,
owner int (20) UNSIGNED NOT NULL,
model_name varchar (45) NOT NULL,
chassis int (20) UNSIGNED,
engine int (20) UNSIGNED,
front_wing int (20) UNSIGNED,
rear_wing int (20) UNSIGNED,
skirt_wings int (20) UNSIGNED
);

ALTER TABLE employee
ADD CONSTRAINT employee_fk1
FOREIGN KEY (team_id) REFERENCES team(team_id);

ALTER TABLE engine
ADD CONSTRAINT engine_fk1
FOREIGN KEY (manufacturer) REFERENCES team(team_id);

ALTER TABLE chassis
ADD CONSTRAINT chassis_fk1
FOREIGN KEY(manufacturer) REFERENCES team(team_id);

ALTER TABLE wing
ADD CONSTRAINT wing_fk1
FOREIGN KEY (wing_type) REFERENCES wing_type(type_id);

ALTER TABLE car 
ADD CONSTRAINT car_fk1
FOREIGN KEY (chassis) REFERENCES chassis(chassis_id);

ALTER TABLE car 
ADD CONSTRAINT car_fk2
FOREIGN KEY (engine) REFERENCES engine(engine_id);

ALTER TABLE car 
ADD CONSTRAINT car_fk3
FOREIGN KEY (front_wing) REFERENCES wing(wing_id);

ALTER TABLE car 
ADD CONSTRAINT car_fk4
FOREIGN KEY (rear_wing) REFERENCES wing(wing_id);

ALTER TABLE car 
ADD CONSTRAINT car_fk5
FOREIGN KEY (skirt_wings) REFERENCES wing(wing_id);

ALTER TABLE car
ADD CONSTRAINT car_fk6
FOREIGN KEY (owner) REFERENCES team(team_id);