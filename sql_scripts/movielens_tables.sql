
DROP TABLE IF EXISTS movies;
CREATE TABLE movies ( 
    movieId INT primary key ,
    title VARCHAR(255), 
    genres VARCHAR(255), 
    year INT

); 
 \COPY movies FROM './data/movies.csv' DELIMITER ',' CSV HEADER;

DROP TABLE IF EXISTS links;
CREATE TABLE links (
        movieId INT REFERENCES movies(movieid), 
        imdbId  INT,
        tmdbId  INT
); 
 \COPY links FROM './data/links.csv' DELIMITER ',' CSV HEADER;

DROP TABLE IF EXISTS ratings;
CREATE TABLE ratings (
    userId INT, 
    movieId INT REFERENCES movies(movieid), 
    rating NUMERIC, 
    time_stamp INT
); 
\COPY ratings FROM './data/ratings.csv' DELIMITER ',' CSV HEADER;


DROP TABLE IF EXISTS tags;
CREATE TABLE tags (
    userId INT, 
    movieId INT REFERENCES movies(movieid), 
    tag VARCHAR(255),
    time_stamp INT
); 
\COPY tags FROM './data/tags.csv' DELIMITER ',' CSV HEADER;



