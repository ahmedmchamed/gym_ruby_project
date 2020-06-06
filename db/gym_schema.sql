DROP TABLE IF EXISTS bookings;
DROP TABLE IF EXISTS dates;
DROP TABLE IF EXISTS gymclasses;
DROP TABLE IF EXISTS members;
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

CREATE TABLE members (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    age INT
);

CREATE TABLE gymclasses (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    duration INT,
    intensity VARCHAR(255),
    workout VARCHAR(255),
    price INT
);

CREATE TABLE dates (
    id SERIAL PRIMARY KEY,
    time VARCHAR(255)
);

CREATE TABLE bookings (
    id SERIAL PRIMARY KEY,
    member_id INT REFERENCES members(id),
    staff_id INT REFERENCES staff(id),
    capacity INT,
    gymclass_id INT REFERENCES gymclasses(id) ON DELETE CASCADE,
    dates_id INT REFERENCES dates(id) ON DELETE CASCADE,
    membership_id INT REFERENCES memberships(id) ON DELETE CASCADE
);