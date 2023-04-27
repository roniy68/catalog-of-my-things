CREATE DATABASE mycatalog;

CREATE TABLE label(
  id INTEGER GENERATED ALWAYS AS IDENTITY,
  title VARCHAR,
  color VARCHAR,
  PRIMARY KEY(title)
);

CREATE TABLE book(
  id INTEGER GENERATED ALWAYS AS IDENTITY,
  name VARCHAR,
  genre VARCHAR,
  author VARCHAR,
  label VARCHAR REFERENCES label(title),
  publish_date DATE,
  archived BOOLEAN,
  publisher VARCHAR,
  cover_state VARCHAR,
  PRIMARY KEY(id)
);

CREATE TABLE author(
  id serial PRIMARY KEY,
  first_name VARCHAR(250),
  last_name VARCHAR(250),
  items VARCHAR[]
);

CREATE TABLE game(
  id serial PRIMARY KEY,
  author VARCHAR REFERENCES author(id),
  label VARCHAR REFERENCES label(title),
  genre VARCHAR REFERENCES genre(id),
  publish_date DATE,
  can_be_archived BOOLEAN,
  multiplayer BOOLEAN,
  last_played_at DATE
);