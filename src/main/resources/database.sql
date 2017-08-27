
create database real_estate_db;
use real_estate_db;

-- Table: users
CREATE TABLE users (
  id       INT          NOT NULL AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(255) NOT NULL,
  email VARCHAR(100),
  password VARCHAR(255) NOT NULL
)
  ENGINE = InnoDB;

-- Table: roles
CREATE TABLE roles (
  id   INT          NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL
)
  ENGINE = InnoDB;

-- Table for mapping user and roles: user_roles
CREATE TABLE user_roles (
  user_id INT NOT NULL,
  role_id INT NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users (id),
  FOREIGN KEY (role_id) REFERENCES roles (id),

  UNIQUE (user_id, role_id)
)
ENGINE = InnoDB;

-- Table: addresses
CREATE TABLE addresses (
  id   INT          NOT NULL AUTO_INCREMENT PRIMARY KEY,
  city VARCHAR(255) NOT NULL,
  state VARCHAR(2) NOT NULL,
  zip VARCHAR(10) NOT NULL
)
  ENGINE = InnoDB;

CREATE TABLE real_estates (
   id   INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
   area DOUBLE NOT NULL,
  dateIn DATE NOT NULL,
  initPrice DOUBLE NOT NULL,
  nrooms TINYINT(4) NOT NULL,
  type VARCHAR(100) NOT NULL,
  userDesc LONGTEXT NOT NULL,
  photoName VARCHAR(100) NOT NULL,
  fullAddress LONGTEXT NOT NULL,
  owner_id INT(11) NULL DEFAULT NULL,

  FOREIGN KEY (owner_id) REFERENCES users (id)
)
  ENGINE = InnoDB;



-- Insert data

INSERT INTO users VALUES (1, 'proselyte', 'victory.silenko@gmail.com', '$2a$11$uSXS6rLJ91WjgOHhEGDx..VGs7MkKZV68Lv5r1uwFu7HgtRn3dcXG');

INSERT INTO roles VALUES (1, 'ROLE_USER');
INSERT INTO roles VALUES (2, 'ROLE_ADMIN');

INSERT INTO user_roles VALUES (1, 2);

insert into real_estates values (1, 50, '2017-05-26', 3000, 2, 'flat', 'Good new flat with 2 big rooms', 'home01.jpg', 'Kyiv, Pushkinska str, 38, flat 86', null);
insert into real_estates values (2, 70, '2017-05-29', 5000, 3, 'flat', 'Good new flat with 3 rooms', 'home02.jpg', 'Kyiv, Sumska str, 18, flat 5', null);
insert into real_estates values (3, 36, '2017-05-30', 2000, 1, 'flat', 'Just gostinka', 'home03.jpg', 'Kharkiv, Ivanova str, 380, flat 77', null);
