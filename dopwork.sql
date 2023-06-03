CREATE TABLE IF NOT EXISTS Department (
	id SERIAL PRIMARY KEY,
	name VARCHAR(20) NOT null unique
);

CREATE TABLE IF NOT EXISTS Employee (
	id SERIAL PRIMARY KEY,
	name VARCHAR(20) NOT null,
	department_id INTEGER REFERENCES Department(id) not null,
	manager_id INTEGER REFERENCES Employee(id) not null
);
commit