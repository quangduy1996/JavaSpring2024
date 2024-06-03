use demoapp

CREATE TABLE tbl_user (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    date_of_birth DATE,
    gender VARCHAR(50),
    phone VARCHAR(50),
    email VARCHAR(255),
    username VARCHAR(255),
    password VARCHAR(255),
    status VARCHAR(50),
    type VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE tbl_address (
    id INT AUTO_INCREMENT PRIMARY KEY,
    apartment_number VARCHAR(50),
    floor VARCHAR(50),
    building VARCHAR(50),
    street_number VARCHAR(50),
    street VARCHAR(255),
    city VARCHAR(255),
    country VARCHAR(255),
    address_type VARCHAR(50),
    user_id INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES tbl_user(id)
);

CREATE TABLE tbl_role (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255)
);

CREATE TABLE tbl_permission (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255)
);

CREATE TABLE tbl_group (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255),
    role_id INT,
    FOREIGN KEY (role_id) REFERENCES tbl_role(id)
);

CREATE TABLE tbl_user_has_role (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    role_id INT,
    FOREIGN KEY (user_id) REFERENCES tbl_user(id),
    FOREIGN KEY (role_id) REFERENCES tbl_role(id)
);

CREATE TABLE tbl_role_has_permission (
    id INT AUTO_INCREMENT PRIMARY KEY,
    role_id INT,
    permission_id INT,
    FOREIGN KEY (role_id) REFERENCES tbl_role(id),
    FOREIGN KEY (permission_id) REFERENCES tbl_permission(id)
);

CREATE TABLE tbl_user_has_group (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    group_id INT,
    FOREIGN KEY (user_id) REFERENCES tbl_user(id),
    FOREIGN KEY (group_id) REFERENCES tbl_group(id)
);

INSERT INTO tbl_role (name) VALUES ('sysadmin'), ('admin'), ('manager'), ('user');

INSERT INTO tbl_role_has_permission (role_id, permission_id) VALUES 
('4', '2'),
('4', '3'),
('4', '4'),
('4', '6'),
('4', '7');


INSERT INTO tbl_permission (name) VALUES 
('Full Access'), 
('View'), 
('Add'), 
('Update'), 
('Delete'), 
('Upload'), 
('Import'), 
('Export'), 
('Send'), 
('Share');


INSERT INTO tbl_user (first_name, last_name, date_of_birth, gender, phone, email, username, password, status, type) VALUES
('John', 'Doe', '1990-01-01', 'Male', '1234567890', 'john.doe@example.com', 'johndoe', 'password123', 'active', 'admin'),
('Jane', 'Smith', '1992-02-02', 'Female', '0987654321', 'jane.smith@example.com', 'janesmith', 'password456', 'inactive', 'user'),
('Alice', 'Johnson', '1985-03-03', 'Female', '1231231234', 'alice.johnson@example.com', 'alicejohnson', 'password789', 'active', 'user'),
('Bob', 'Brown', '1980-04-04', 'Male', '4564564567', 'bob.brown@example.com', 'bobbrown', 'password321', 'active', 'admin'),
('Charlie', 'Davis', '1995-05-05', 'Male', '7897897890', 'charlie.davis@example.com', 'charliedavis', 'password654', 'inactive', 'user'),
('David', 'Wilson', '1988-06-06', 'Male', '1010101010', 'david.wilson@example.com', 'davidwilson', 'password987', 'active', 'user'),
('Eve', 'Moore', '1993-07-07', 'Female', '1212121212', 'eve.moore@example.com', 'evemoore', 'password111', 'inactive', 'admin'),
('Frank', 'Taylor', '1979-08-08', 'Male', '1313131313', 'frank.taylor@example.com', 'franktaylor', 'password222', 'active', 'user'),
('Grace', 'Anderson', '1996-09-09', 'Female', '1414141414', 'grace.anderson@example.com', 'graceanderson', 'password333', 'inactive', 'admin'),
('Hank', 'Thomas', '1987-10-10', 'Male', '1515151515', 'hank.thomas@example.com', 'hankthomas', 'password444', 'active', 'user'),
('Ivy', 'Jackson', '1994-11-11', 'Female', '1616161616', 'ivy.jackson@example.com', 'ivyjackson', 'password555', 'inactive', 'admin'),
('Jack', 'White', '1986-12-12', 'Male', '1717171717', 'jack.white@example.com', 'jackwhite', 'password666', 'active', 'user'),
('Karen', 'Harris', '1989-01-13', 'Female', '1818181818', 'karen.harris@example.com', 'karenharris', 'password777', 'inactive', 'admin'),
('Leo', 'Martin', '1991-02-14', 'Male', '1919191919', 'leo.martin@example.com', 'leomartin', 'password888', 'active', 'user'),
('Mia', 'Garcia', '1993-03-15', 'Female', '2020202020', 'mia.garcia@example.com', 'miagarcia', 'password999', 'inactive', 'admin'),
('Nick', 'Martinez', '1982-04-16', 'Male', '2121212121', 'nick.martinez@example.com', 'nickmartinez', 'password000', 'active', 'user'),
('Olivia', 'Robinson', '1984-05-17', 'Female', '2222222222', 'olivia.robinson@example.com', 'oliviarobinson', 'password1234', 'inactive', 'admin'),
('Paul', 'Clark', '1981-06-18', 'Male', '2323232323', 'paul.clark@example.com', 'paulclark', 'password5678', 'active', 'user'),
('Quinn', 'Rodriguez', '1978-07-19', 'Female', '2424242424', 'quinn.rodriguez@example.com', 'quinnrodriguez', 'password9101', 'inactive', 'admin'),
('Ray', 'Lewis', '1977-08-20', 'Male', '2525252525', 'ray.lewis@example.com', 'raylewis', 'password1122', 'active', 'user'),
('Sara', 'Lee', '1983-09-21', 'Female', '2626262626', 'sara.lee@example.com', 'saralee', 'password3344', 'inactive', 'admin'),
('Tom', 'Walker', '1997-10-22', 'Male', '2727272727', 'tom.walker@example.com', 'tomwalker', 'password5566', 'active', 'user'),
('Uma', 'Hall', '1980-11-23', 'Female', '2828282828', 'uma.hall@example.com', 'umahall', 'password7788', 'inactive', 'admin'),
('Vince', 'Allen', '1976-12-24', 'Male', '2929292929', 'vince.allen@example.com', 'vinceallen', 'password9900', 'active', 'user'),
('Wendy', 'Young', '1998-01-25', 'Female', '3030303030', 'wendy.young@example.com', 'wendyyoung', 'password12345', 'inactive', 'admin'),
('Xander', 'King', '1987-02-26', 'Male', '3131313131', 'xander.king@example.com', 'xanderking', 'password67890', 'active', 'user'),
('Yara', 'Scott', '1990-03-27', 'Female', '3232323232', 'yara.scott@example.com', 'yarascott', 'password10101', 'inactive', 'admin'),
('Zane', 'Green', '1981-04-28', 'Male', '3333333333', 'zane.green@example.com', 'zanegreen', 'password12121', 'active', 'user'),
('Anna', 'Perez', '1995-05-29', 'Female', '3434343434', 'anna.perez@example.com', 'annaperez', 'password14141', 'inactive', 'admin'),
('Brian', 'White', '1992-06-30', 'Male', '3535353535', 'brian.white@example.com', 'brianwhite', 'password16161', 'active', 'user');


