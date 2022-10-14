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

 -- Labels Table
CREATE TABLE labels(
    id INT GENERATED ALWAYS AS IDENTITY,
    title VARCHAR(50),
    color VARCHAR(50),
    PRIMARY KEY(id)
);
-- Books Table
CREATE TABLE books(
    id INT GENERATED ALWAYS AS IDENTITY,
    publish_date DATE NOT NULL,
    archived BOOLEAN,
    cover_state VARCHAR(150),
    publisher VARCHAR(150),
    book_color VARCHAR(50),
    books_id INT,
    PRIMARY KEY(id),
    CONSTRAINT fk_labels FOREIGN KEY(books_id) REFERENCES labels(id)
);

-- Index to improvve performance of the relationship between labels and books

CREATE INDEX book_label_idx ON books(labels_id);