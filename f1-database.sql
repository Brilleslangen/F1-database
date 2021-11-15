
# Mercedes
INSERT INTO team (team_name) VALUES ("Mercedes AMG");
INSERT INTO employee (full_name, team_id) VALUES ("Toto Wolff", 1);
INSERT INTO employee (full_name, team_id) VALUES ("Lewis Hamilton", 1);
INSERT INTO employee (full_name, team_id) VALUES ("Valtteri Bottas", 1);

UPDATE team SET 
	principal = 1,
    first_driver = 2,
    second_driver = 3
WHERE team_id = 1;

# Mclaren
INSERT INTO team (team_name) VALUES ("Mclaren F1 Team");
INSERT INTO employee (full_name, team_id) VALUES ("Zak Brown", 2);
INSERT INTO employee (full_name, team_id) VALUES ("Lando Norris", 2);
INSERT INTO employee (full_name, team_id) VALUES ("Daniel Ricciardo", 2);

UPDATE team SET 
	principal = 4,
    first_driver = 5,
    second_driver = 6
WHERE team_id = 2;

