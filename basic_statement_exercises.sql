
-- Use the albums_db database.
SHOW databases;
USE albums_db;
SHOW tables;
Describe albums;
SELECT id FROM albums;
SELECT artist FROM albums;


-- What is the primary key for the albums table?
# The one that has a primary key is "id"


-- What does the column named 'name' represent?
#it represent a string tpye  
SELECT name FROM albums;

-- What do you think the sales column represents?
#it repsent how many albums they sold in the millions 

SELECT sales FROM albums;
-- Find the name of all albums by Pink Floyd.
#The dark side of the moon and The Wall
SELECT name FROM albums WHERE artist='Pink Floyd';

-- What is the year Sgt. Pepper's Lonely Hearts Club Band was released?

SELECT release_date FROM albums WHERE name="Sgt. Pepper's Lonely Hearts Club Band";
#1967
-- What is the genre for the album Nevermind?

#Grunge, Alternative rock
SELECT genre FROM albums WHERE name='Nevermind';

-- Which albums were released in the 1990s?

SELECT name FROM albums WHERE release_date='1990';

#The Immaculate Collection
-- Which albums had less than 20 million certified sales? Rename this column as low_selling_albums.


SELECT name FROM albums AS low_selling_albums WHERE sales < 20;
