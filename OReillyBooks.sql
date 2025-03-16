-- Create the OReillyBooks database statement
--CREATE DATABASE OReillyBooks;
-- Use the database
--USE OReillyBooks;

-- Create the tables

-- Table: Authors
CREATE OR ALTER TABLE authors (
  author_id INT PRIMARY KEY,
  author_name VARCHAR(100),
  Author_address VARCHAR(50)
);

-- Table: Books
CREATE OR ALTER  TABLE books (
  book_id INT PRIMARY KEY,
  book_title VARCHAR(100),
  author_id INT,
  rating DECIMAL(10,2),
  FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);

-- Table: Category
CREATE OR ALTER  TABLE category (
  category_id INT PRIMARY KEY,
  category_name VARCHAR(50)
);

-- Table: bookCategory
CREATE OR ALTER  TABLE book_category (
  book_id INT,
  category_id INT,
  FOREIGN KEY (book_id) REFERENCES books(book_id),
  FOREIGN KEY (category_id) REFERENCES category(category_id)
);

-- Add a new column
ALTER TABLE authors
ADD age int;

-- Modify a datatype of an existing column
--ALTER TABLE table_name
--ALTER sub_category VARCHAR(50);

-- Rename a column
--ALTER TABLE table_name
--RENAME COLUMN old_column_name TO new_column_name;

-- Add a new constraint to a column
--ALTER TABLE table_name
--ADD CONSTRAINT constraint_name constraint_type (column_name);

-- Modify an existing constraint
--ALTER TABLE table_name
--ALTER CONSTRAINT constraint_name [new_constraint];

-- Remove an existing column
--ALTER TABLE table_name
--DROP COLUMN column_name;

-- Add publication_year to the books table
ALTER TABLE books
ADD publication_year INT;

--Create dummy data
-- Inserting data into the authors table
INSERT OVERWRITE INTO authors (author_id, author_name) VALUES
(1, 'Stephanie Mitchell'),
(2, 'Paul Turner'),
(3, 'Julia Martinez'),
(4, 'Rui Machado'),
(5, 'Thomas Brown');

-- Inserting data into the books table
INSERT OVERWRITE INTO books (book_id, book_title,author_id, publication_year,rating)
VALUES
(1, 'Python Crash Course', 1, 2012, 4.5),
(2, 'Learning React', 2, 2014, 3.7),
(3, 'Hands-On Machine Learning with Scikit-Learn, Keras, and TensorFlow',
  3, 2017, 4.9),
(4, 'JavaScript: The Good Parts', 4, 2015, 2.8),
(5, 'Data Science for Business', 5, 2019, 4.2);

-- Inserting data into the category table
INSERT OVERWRITE INTO category (category_id, category_name) VALUES
(1, 'Programming'),
(2, 'Machine Learning'),
(3, 'Data Science'),
(4, 'Software Engineering'),
(5, 'Algorithms'),
(6, 'Computer Science');

-- Inserting data into the book_category table
INSERT OVERWRITE INTO book_category (book_id, category_id) VALUES
(1, 1),
(2, 1),
(3, 2),
(4, 1),
(5, 6)
(6, 3);