CREATE TABLE cats (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    age INTEGER NOT NULL,
    color TEXT NOT NULL,
    breed TEXT NOT NULL
);

CREATE TABLE favorite_things (
    id INTEGER PRIMARY KEY,
    name TEXT,
    type TEXT,
    cat_id INTEGER,

    FOREIGN KEY (cat_id) REFERENCES cats(id)
);

INSERT INTO 
  cats (name, age, color, breed)
VALUES
    ('Lily', 6, 'tuxedo', 'DSH'),
    ('Zoey', 6, 'black', 'DSH'),
    ('Limbo', 7, 'black', 'DSH'),
    ('Squish', 2, 'black', 'DLH'),
    ('Moose', 15, 'gray tabby', 'DSH'),
    ('Jimmy', 1, 'black', 'DLH');

INSERT INTO
    favorite_things (name, type, cat_id)
VALUES
    ('mouse', 'toy', (SELECT id FROM cats WHERE name = 'Moose')),
    ('mouse', 'toy', (SELECT id FROM cats WHERE name = 'Jimmy')),
    ('mouse', 'toy', (SELECT id FROM cats WHERE name = 'Limbo')),
    ('twinkle stick', 'toy', (SELECT id FROM cats WHERE name = 'Lily')),
    ('twinkle stick', 'toy', (SELECT id FROM cats WHERE name = 'Squish')),
    ('twinkle stick', 'toy', (SELECT id FROM cats WHERE name = 'Zoey')),
    ('EN kibble', 'food', (SELECT id FROM cats WHERE name = 'Squish')),
    ('fuzzy blanket', 'bedding', (SELECT id FROM cats WHERE name = 'Moose')),
    ('bucket bed', 'bedding', (SELECT id FROM cats WHERE name = 'Lily'));