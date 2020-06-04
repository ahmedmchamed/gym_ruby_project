DROP TABLE IF EXISTS bookings;
DROP TABLE IF EXISTS members;
DROP TABLE IF EXISTS classes;
DROP TABLE IF EXISTS memberships;
DROP TABLE IF EXISTS staff;

CREATE TABLE staff (
    id PRIMARY KEY,
    first_name VARCHAR(255),
    last_name VARCHAR(255);
    privilege_level INT
);

CREATE TABLE memberships (
    id PRIMARY KEY,
    type VARCHAR(255),
    status BOOLEAN
);

CREATE TABLE classes (
    id PRIMARY KEY,
    name VARCHAR(255),
    duration INT,
    intensity VARCHAR(255),
    workout VARCHAR(255),
    price INT
);

CREATE TABLE members (
    id PRIMARY KEY,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    age INT
);

CREATE TABLE bookings (
    id PRIMARY KEY,
    member_id INT REFERENCES members(id),
    class_id INT REFERENCES classes(id),
    membership_id INT REFERENCES memberships(id)
);