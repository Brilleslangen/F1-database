DROP VIEW IF EXISTS team_info;
DROP VIEW IF EXISTS car_part_weights;
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
	second_driver varchar (45));

CREATE TABLE employee (
	emp_id int (20) UNSIGNED UNIQUE AUTO_INCREMENT PRIMARY KEY,
	full_name varchar(45) NOT NULL,
	team_id int (20) UNSIGNED NOT NULL);

CREATE TABLE engine (
	engine_id int (20) UNSIGNED UNIQUE AUTO_INCREMENT PRIMARY KEY,
	manufacturer int (20) UNSIGNED NOT NULL,
	horsepower int (20) UNSIGNED NOT NULL,
	weight int (20) UNSIGNED NOT NULL);

CREATE TABLE chassis (
	chassis_id int(20) UNSIGNED UNIQUE AUTO_INCREMENT PRIMARY KEY,
	manufacturer int(20) UNSIGNED NOT NULL,
	length float(20) UNSIGNED NOT NULL,
	weight int(20) UNSIGNED NOT NULL);

CREATE TABLE wing_type (
	type_id int(20) UNSIGNED UNIQUE AUTO_INCREMENT PRIMARY KEY,
	type_name VARCHAR(45) NOT NULL,
	weight int(20) UNSIGNED NOT NULL);

CREATE TABLE wing (
	downforce int(20) UNSIGNED NOT NULL CHECK(downforce < 10),
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
	skirt_wings int (20) UNSIGNED);

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
		FOREIGN KEY (chassis) REFERENCES chassis(chassis_id),
	ADD CONSTRAINT car_fk2
		FOREIGN KEY (engine) REFERENCES engine(engine_id),
	ADD CONSTRAINT car_fk3
		FOREIGN KEY (front_wing) REFERENCES wing(wing_id),
	ADD CONSTRAINT car_fk4
		FOREIGN KEY (rear_wing) REFERENCES wing(wing_id),
	ADD CONSTRAINT car_fk5
		FOREIGN KEY (skirt_wings) REFERENCES wing(wing_id),
	ADD CONSTRAINT car_fk6
		FOREIGN KEY (owner) REFERENCES team(team_id);

# Mercedes
INSERT INTO team (team_name) VALUES ("Mercedes AMG");
INSERT INTO employee (full_name, team_id) VALUES ("Toto Wolff", 1);
INSERT INTO employee (full_name, team_id) VALUES ("Lewis Hamilton", 1);
INSERT INTO employee (full_name, team_id) VALUES ("Valtteri Bottas", 1);

UPDATE team 
	SET principal = 1,
		first_driver = 2,
		second_driver = 3
	WHERE team_id = 1;

# Mclaren
INSERT INTO team (team_name) VALUES ("Mclaren F1 Team");
INSERT INTO employee (full_name, team_id) VALUES ("Zak Brown", 2);
INSERT INTO employee (full_name, team_id) VALUES ("Lando Norris", 2);
INSERT INTO employee (full_name, team_id) VALUES ("Daniel Ricciardo", 2);

UPDATE team 
	SET principal = 4,
		first_driver = 5,
		second_driver = 6
	WHERE team_id = 2;

# Red Bull
INSERT INTO team (team_name) VALUES ("Red Bull Racing Honda");
INSERT INTO employee (full_name, team_id) VALUES ("Christian Horner", 3);
INSERT INTO employee (full_name, team_id) VALUES ("Max Verstappen", 3);
INSERT INTO employee (full_name, team_id) VALUES ("Sergio Perez", 3);
UPDATE team 
	SET principal = 7,
		first_driver = 8,
		second_driver = 9
	WHERE team_id = 3;

# Ferrari
INSERT INTO team (team_name) VALUES ("Scuderia Ferrari");
INSERT INTO employee (full_name, team_id) VALUES ("Mattia Binotto", 4);
INSERT INTO employee (full_name, team_id) VALUES ("Charles Leclerc", 4);
INSERT INTO employee (full_name, team_id) VALUES ("Carlos Sainz", 4);

UPDATE team 
	SET principal = 10,
		first_driver = 11,
		second_driver = 12
	WHERE team_id = 4;

# Haas
INSERT INTO team (team_name) VALUES ("Haas F1 team");
INSERT INTO employee (full_name, team_id) VALUES ("Günter Steiner", 5);
INSERT INTO employee (full_name, team_id) VALUES ("Mick Schumacher", 5);
INSERT INTO employee (full_name, team_id) VALUES ("Nikita Mazepin", 5);

UPDATE team 
	SET principal = 13,
		first_driver = 14,
		second_driver = 15
	WHERE team_id = 5;

# Adding Wings types
INSERT INTO wing_type (type_name, weight) VALUES ('Rear wing', 30);
INSERT INTO wing_type (type_name, weight) VALUES ('Front wing', 20);
INSERT INTO wing_type (type_name, weight) VALUES ('Side wing-set', 40);

# Adding Wings 
INSERT INTO wing (downforce, wing_type) VALUES (9, 1);
INSERT INTO wing (downforce, wing_type) VALUES (7, 1);
INSERT INTO wing (downforce, wing_type) VALUES (3, 1);
INSERT INTO wing (downforce, wing_type) VALUES (8, 2);
INSERT INTO wing (downforce, wing_type) VALUES (6, 2);
INSERT INTO wing (downforce, wing_type) VALUES (4, 2);
INSERT INTO wing (downforce, wing_type) VALUES (7, 3);
INSERT INTO wing (downforce, wing_type) VALUES (5, 3);
INSERT INTO wing (downforce, wing_type) VALUES (3, 3);
SELECT * from 	wing;

# Adding Chassis
INSERT INTO chassis (manufacturer, length, weight) VALUES (1, 5.0, 517);
INSERT INTO chassis (manufacturer, length, weight) VALUES (2, 4.9, 516);
INSERT INTO chassis (manufacturer, length, weight) VALUES (3, 4.7, 516);
INSERT INTO chassis (manufacturer, length, weight) VALUES (4, 4.8, 528);
INSERT INTO chassis (manufacturer, length, weight) VALUES (5, 5.1, 536);

# Adding Engines
INSERT INTO engine (manufacturer, horsepower, weight) VALUES (1, 1122, 145);
INSERT INTO engine (manufacturer, horsepower, weight) VALUES (3, 1086, 148);
INSERT INTO engine (manufacturer, horsepower, weight) VALUES (4, 922, 142);

# Adding Cars
INSERT INTO car (owner, model_name, chassis, engine, front_wing, rear_wing, skirt_wings) 
		VALUES (1, "W12", 1, 1, 2, 4, 8);
INSERT INTO car (owner, model_name, chassis, engine, front_wing, rear_wing, skirt_wings) 
		VALUES (2, "MCL35M", 2, 1, 1, 4, 7);
INSERT INTO car (owner, model_name, chassis, engine, front_wing, rear_wing, skirt_wings) 
		VALUES (3, "RB16", 3, 2, 2, 6, 9);
INSERT INTO car (owner, model_name, chassis, engine, front_wing, rear_wing, skirt_wings) 
		VALUES (4, "SF21", 4, 3, 3, 4, 7);
INSERT INTO car (owner, model_name, chassis, engine, front_wing, rear_wing, skirt_wings) 
		VALUES (5, "VF-21", 5, 3, 3, 6, null);

#  View of team information
CREATE VIEW team_info AS SELECT 
	team_name,
    (SELECT full_name FROM employee WHERE emp_id = principal) as principal,
    (SELECT full_name FROM employee WHERE emp_id = first_driver) as first_driver,
    (SELECT full_name FROM employee WHERE emp_id = second_driver) as second_driver,
    (SELECT COUNT(employee.emp_id) FROM employee WHERE employee.team_id = team.team_id) AS employees
FROM team;

# View of car part weights
CREATE VIEW car_part_weights AS
	SELECT 
		model_id, 
		chassis.weight AS chassis, 
		engine.weight AS engine,
		IFNULL((SELECT weight FROM wing, wing_type WHERE wing_id = front_wing AND wing.wing_type = wing_type.type_id), 0) AS front_wing,
		IFNULL((SELECT weight FROM wing, wing_type WHERE wing_id = rear_wing AND wing.wing_type = wing_type.type_id), 0) AS rear_wing,
		IFNULL((SELECT weight FROM wing, wing_type WHERE skirt_wings = wing.wing_id AND wing.wing_type = wing_type.type_id), 0) AS skirt_wings 
	FROM 
		car,
		chassis,
		engine
	WHERE
			car.chassis = chassis.chassis_id 
		AND car.engine = engine_id;

# View of car information
CREATE VIEW car_info AS 
	SELECT	team.team_name,
			model_name,
			engine.horsepower,
			(SELECT (chassis + engine + front_wing + rear_wing + skirt_wings) FROM car_part_weights WHERE car.model_id = car_part_weights.model_id) AS total_weight,
			chassis.length
	FROM 	car,
			team,
			engine, 
			chassis
	WHERE	car.owner = team.team_id 
		AND car.engine = engine.engine_id
		AND car.chassis = chassis.chassis_id;
		
# Team info
SELECT * FROM team_info;

# Car info
SELECT * FROM car_info;

# Teams and their cars missing parts
SELECT team_name, model_name FROM car, team
	WHERE (chassis IS NULL OR engine IS NULL OR front_wing IS NULL OR rear_wing IS NULL OR skirt_wings IS NULL) AND team_id = owner;