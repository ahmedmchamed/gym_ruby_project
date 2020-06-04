DROP TABLE IF EXISTS bookings;
DROP TABLE IF EXISTS members;
DROP TABLE IF EXISTS classes;
DROP TABLE IF EXISTS memberships;
DROP TABLE IF EXISTS staff;

CREATE TABLE staff (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    role INT
);

CREATE TABLE memberships (
    id SERIAL PRIMARY KEY,
    type VARCHAR(255),
    status BOOLEAN
);

CREATE TABLE classes (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    start_time 
    duration INT,
    intensity VARCHAR(255),
    workout VARCHAR(255),
    capacity INT,
    price INT
);

CREATE TABLE members (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    age INT
);

CREATE TABLE bookings (
    id SERIAL PRIMARY KEY,
    member_id INT REFERENCES members(id),
    class_id INT REFERENCES classes(id),
    membership_id INT REFERENCES memberships(id)
);