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
 )