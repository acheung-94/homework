CREATE TABLE cats (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    age INTEGER NOT NULL,
    color TEXT NOT NULL,

)

CREATE TABLE favorite_things (
    cat_id INTEGER,
    id INTEGER PRIMARY KEY,
    name TEXT,
    type TEXT,

    FOREIGN KEY (cat_id) REFERENCES cats(id)
);