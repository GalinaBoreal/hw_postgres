CREATE TABLE IF NOT EXISTS Genre (
	id SERIAL PRIMARY KEY,
	name VARCHAR(20) NOT NULL
);

CREATE TABLE IF NOT EXISTS Musician (
	id SERIAL PRIMARY KEY,
	name VARCHAR(60) NOT NULL,
	description TEXT
);

CREATE TABLE IF NOT EXISTS GenreMusician (
	genre_id INTEGER REFERENCES Genre(id) not null,
	musician_id INTEGER REFERENCES Musician(id) not null,
	CONSTRAINT pk PRIMARY KEY (genre_id, musician_id)
);

create table if not exists Album (
	id SERIAL primary key,
	name VARCHAR(20) not null,
	relise DATE not null,
	description TEXT 
);

create table if not exists AlbumRecording (
	id SERIAL primary key,
	musician_id INTEGER REFERENCES Musician(id) not null,
	album_id INTEGER REFERENCES Album(id) not null,
	description TEXT
);

create table if not exists Track (
	id SERIAL primary key,
	name VARCHAR(20) not null,
	t_time TIME not null,
	album_id INTEGER REFERENCES Album(id) not null
);

create table if not exists Collection (
	id SERIAL primary key,
	name varchar(40) not null,
	relise DATE not null,
	description text,
	track_id INTEGER REFERENCES Track(id) not null
);
commit