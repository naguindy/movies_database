-- what is the data structure? display whole movie table 

select * from movies;

-- Display only title and genres of the first 10 entries from the movies table that is sorted alphabetically (starting from A) by the movie titles.

select  title , genres  from movies where title  like 'A%' limit 10;

--Display the total row count

select count(movieid) from movies ;


-- Display first 10 pure Drama movies. Only Drama is in the genre column.
-- Display the count of pure Drama movies.

select * from movies where genres in ('Drama') limit 10;

select count(movieid) from movies where genres in ('Drama'); 

--Display the count of drama movies that can also contain other genres.

select * from movies  where genres  like '%Drama%';

select count(movieid) from movies where genres like '%Drama%';


--Display the count of movies don’t have drama (in any combination) as assigned genre
select * from movies  where genres not like '%Drama%';

select count(movieid) from movies where genres not like '%Drama%';

--Display the count of movies that were released in 2003.

select * from movies  where year ='2003';
select count(movieid) from movies where year ='2003';


--Find all movies with a year lower 1910. 

select * from movies  where year < 1910;

--Retrieve all Star Wars movies from the movie table.

select * from movies m where title like '%Star Wars%';


--- Afternoon challenge 
--- select < col>, agg<col> 
--- from <table> 
--- where <condition on the row level> 
--- group by <column to group by> 
--- having <condition on the group level> 
--- order by < column for ordering> ASC / DSC 
--- limit <count of displayed rows> 


--- ##### Afternoon Challenge### 


--- 1.Display the total row count of the ratings table.

select count(movieid) from ratings ; 

--Display the total count of different genres combinations in the movies table.

select genres ,count(movieid) from movies group by (genres);

-- Display unique tags for movie with id equal 60756. Use tags table.

select distinct tag from tags where movieid = 60756;

--Display the count of movies in the years 1990-2000 using the movies table. Display year and movie_count.


select year, count(movieid) from movies group by (year)
having year between 1990 and 2000;

--Which year had the highest number of movies in the dataset?

--Display the year where most of the movies u=in the database are from.

select year, count (movieid) as  total_count from movies  group by year order by total_count desc  limit (1); 


--Display 10 movies with the most ratings. Use ratings table. Display movieid, count_movie_ratings.

select movieid, count(*) as count_movie_ratings from ratings group by movieid  order by count_movie_ratings desc limit (10);






--Display the top 10 highest rated movies by average that have at least 50 ratings. Display the movieid, average rating and rating count. Use the ratings table.



select movieid, avg(rating) as avg_rating from ratings group by movieid having count(rating) > 50 order by avg_rating desc limit (10) ;



--Create a view that is a table of only movies that contain drama as one of it’s genres. Display the first 10 movies in the view.

create or replace  view drama_movies as select * from movies 
where genres like '%Drama%' limit (10);


select * from drama_movies ;



-- top 10 movies have polarized ratings difference between mean and median? relation between tags and genres  

select movieid, count(*) as count_movie_ratings from ratings group by movieid order by count (*) desc ;











--
