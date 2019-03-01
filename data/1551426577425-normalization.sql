step one: CREATE TABLE bookshelves (id SERIAL PRIMARY KEY, name VARCHAR(255));
//create a second table in the books_app database named bookshelves

//retrieve unique bookshelf values from the books table and insert each one into the bookshelves table in the name column
step two:INSERT INTO bookshelves(name) SELECT DISTINCT bookshelf FROM books;

//add a column to the books table named bookshelf_id
step three:ALTER TABLE books ADD COLUMN bookshelf_id INT;

//prepare a connection between the two tables
step four:UPDATE books SET bookshelf_id=shelf.id FROM (SELECT * FROM bookshelves) AS shelf WHERE books.bookshelf = shelf.name;

//modify the books table by removing the column named bookshelf
step five:ALTER TABLE books DROP COLUMN bookshelf;


//modify the data type of the bookshelf_id in the books table, setting it as a foreign key which references the primary key in the bookshelves table
step six:ALTER TABLE books ADD CONSTRAINT fk_bookshelves FOREIGN KEY (bookshelf_id) REFERENCES bookshelves(id);