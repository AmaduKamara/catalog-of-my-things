CREATE DATABASE catalog;

CREATE TABLE genres (
	id  INT GENERATED ALWAYS AS IDENTITY,
	name VARCHAR(100),
	PRIMARY KEY(id)
);

CREATE TABLE author (
	id  INT GENERATED ALWAYS AS IDENTITY,
	first_name VARCHAR(100),
	last_name VARCHAR(100),
	PRIMARY KEY(id)
);

CREATE TABLE item (
	id  INT GENERATED ALWAYS AS IDENTITY,
	genre_id INT,
	author_id INT,
	publish_date DATE,
	archived BOOLEAN,
	PRIMARY KEY(id),
	FOREIGN KEY (genre_id) REFERENCES genres (id),
	FOREIGN KEY (author_id) REFERENCES author (id),
);

CREATE TABLE music_albums (
	id  INT,
	name VARCHAR(100),
	on_spotify BOOLEAN,
	FOREIGN KEY(id) REFERENCES item(id)
);

CREATE TABLE games (
	id  INT,
	multiplayer BOOLEAN,
	last_played_at DATE,
	FOREIGN KEY(id) REFERENCES item(id)
);

CREATE TABLE books (
	id  INT,
	publisher VARCHAR(100),
	cover_state VARCHAR(100),
	FOREIGN KEY(id) REFERENCES item(id)
);

CREATE TABLE labels (
	id  INT,
	title VARCHAR(100),
	color VARCHAR(100),
	FOREIGN KEY(id) REFERENCES item(id)
);