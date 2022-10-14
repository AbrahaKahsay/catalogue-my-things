-- create game table

 CREATE TABLE games(
  id INT GENERATED ALWAYS AS IDENTITY,
  multiplayer BOOLEAN,
  genre TEXT,
  author TEXT,
  source TEXT,
  label TEXT,
  archived BOOLEAN,
  publish_date DATE,
  last_played_at DATE,
  PRIMARY KEY(id)
 );

-- create authors table 
-- implemented an array column to serve as a connection of one-to-many
 CREATE TABLE authors(
  id INT GENERATED ALWAYS AS IDENTITY,
  firs_name TEXT,
  last_name TEXT,
  items TEXT[],
  PRIMARY KEY(id)
 );

CREATE TABLE music_album(
  id INT GENERATED ALWAYS IDENTITY PRIMARY KEY,
  genre INT,
  author INT,
  label INT,
  publish_date DATE,
  archived BOOLEAN,
  on_soptify BOOLEAN,
  CONSTRAINT genre_fk FOREIGN KEY(genre) REFERENCES genre(id),
  CONSTRAINT author_fk FOREIGN KEY(author) REFERENCES author(id),
  CONSTRAINT label_fk FOREIGN KEY(label) REFERENCES label(id)
  );

  CREATE TABLE genre(
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR
  );