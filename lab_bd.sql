CREATE TABLE Book (
book_id SERIAL,
genre VARCHAR NOT NULL,
price DECIMAL CHECK (price >= 0),
publication_year INT CHECK (publication_year > 0 AND publication_year <= EXTRACT(YEAR FROM CURRENT_DATE)),
PRIMARY KEY (book_id)
);
INSERT INTO Book (genre, price, publication_year) VALUES
('Science Fiction', 17.65, 1965),
('Science Fiction', 11.59, 1984),
('Dystopian', 12.50, 1949),
('Fantasy', 14.75, 1937);

CREATE TABLE Member (
member_id SERIAL,
name VARCHAR NOT NULL,
city VARCHAR NOT NULL,
PRIMARY KEY(member_id)
);

INSERT INTO Member (name, city) VALUES 
('Alice Johnson', 'New York'),
('Diana Wong', 'New York');

CREATE TABLE BookLoan (
loan_id SERIAL,
book_id INT NOT NULL,
member_id INT NOT NULL,
return_date DATE,
PRIMARY KEY (loan_id),
FOREIGN KEY (book_id) REFERENCES Book(book_id),
FOREIGN KEY (member_id) REFERENCES Member(member_id)
);

INSERT INTO BookLoan (book_id, member_id, return_date) VALUES
(1, 1, '2025-01-05'),
(3, 2, '2025-02-10'),
(2, 2, '2025-02-11');

ALTER TABLE Member
ADD COLUMN membership_type VARCHAR;
ALTER TABLE Book
ADD COLUMN title VARCHAR;
INSERT INTO Member (name, city) VALUES 
('Charlie Davis', 'California'),
('Bob Smith', 'Washington');
UPDATE Member
SET membership_type = 'Premium'
WHERE member_id = 1;

UPDATE Member
SET membership_type = 'Member'
WHERE member_id = 4;

UPDATE Member
SET membership_type = 'Premium'
WHERE member_id = 3;

UPDATE Member
SET membership_type = 'Member'
WHERE member_id = 2;
UPDATE Book
SET title = 'Dune'
WHERE book_id = 1;
UPDATE Book
SET title = '1984', publication_year = '1950'
WHERE book_id = 3;
UPDATE Book
SET title = 'The Hobbit'
WHERE book_id = 4;
UPDATE Book
SET title = 'Neuromancer'
WHERE book_id = 2;
