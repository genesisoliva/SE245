CREATE TABLE parent (
    id INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL
);

CREATE TABLE child (
    id INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    parent1 INT,
    parent2 INT,
    FOREIGN KEY (parent1) REFERENCES Parent (id),
    FOREIGN KEY (parent2) REFERENCES Parent (id)
);
