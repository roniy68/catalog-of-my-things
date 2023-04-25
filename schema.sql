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
