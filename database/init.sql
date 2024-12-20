use remsdb; 

-- Enable foreign key checks (default in MySQL)
SET FOREIGN_KEY_CHECKS=1;

-- Create the 'member' table
CREATE TABLE IF NOT EXISTS member (
    uname VARCHAR(45) NOT NULL,
    password VARCHAR(45) NOT NULL,
    email VARCHAR(45) NOT NULL,
    phone VARCHAR(45) NOT NULL,
    PRIMARY KEY (uname)
);

-- Create the 'property' table
CREATE TABLE IF NOT EXISTS property (
    ID SERIAL NOT NULL,
    uname VARCHAR(45) NOT NULL,
    propertytype VARCHAR(45) NOT NULL,
    location VARCHAR(45) NOT NULL,
    budget VARCHAR(45) NOT NULL,
    description VARCHAR(225) NOT NULL,
    link VARCHAR(225) NOT NULL,
    status BOOLEAN DEFAULT false NOT NULL,
    PRIMARY KEY (ID)
);

-- Create the 'propertydeals' table
CREATE TABLE IF NOT EXISTS propertydeals (
    ID SERIAL NOT NULL,
    buyer VARCHAR(45) NOT NULL,
    PRIMARY KEY (ID)
);

-- Insert admin user if it doesn't already exist
INSERT INTO member (uname, password, email, phone)
SELECT 'admin', 'admin', 'admin@example.com', '98XXXXXX89'
WHERE NOT EXISTS (
    SELECT 1
    FROM member
    WHERE uname = 'admin'
);

