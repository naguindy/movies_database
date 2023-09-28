--Step 1 inspect genres 

select  genres from movies  limit 5;


select movieid, regexp_split_to_table(genres, '\|')
from movies limit 10;


drop table if exists genres; 
create table genres as(
select 
	movieid, 
	regexp_split_to_table(genres,'\|') as genre
from movies);

alter table genres 
add foreign key (movieid)
references movies(movieid); 


--1. Using a join display 5 movie titles with the lowest imdb ids 


select * from links order by imdbid limit 5; 

-- 2. Display count drama movies 

select count(genre) from genres where genre ='Drama' ;
-- Drama count = 4359


--3.Using join display all movie title that have tag fun 

select movies.title as movie_title, tags.tag as tag 
from movies 
join tags 
on movies.movieid = tags.movieid 
where tag ='fun'


-- Toy story, Avengers, lego movie, guardians of the galaxy, pulp fiction

--4. Using a JOIN find out which movie title is the first without a tag

select movies.title as movie_title, tags.tag as tag
from movies 
left join tags 
on movies.movieid  = tags.movieid 
where tag is null 
limit 1
;


--Using a JOIN display the top 3 genres and their average rating

select genres.genre as genre, avg(ratings.rating) as average_rating
from genres 
join ratings 
on genres.movieid = ratings.movieid
group by genre
order by average_rating desc 
limit 3
; 


--6. Using a JOIN display the top 10 movie titles by the number of ratings

select movies.movieid as id,movies.title  as movie_title, count(ratings.rating)  as count_rating
from movies 
join ratings 
on movies.movieid  = ratings.movieid 
group by movies.movieid , movies.title 
order by count_rating desc 
limit 10; 


--7. Using a JOIN display all of the Star Wars movies in order of average rating where the film was rated by at least 40 users
select movies.title as movie_title, avg(ratings.rating) as average_rating, count(ratings.rating) as count_ratings
from movies 
join ratings 
on movies.movieid = ratings.movieid 
group by movies.movieid , movies.title 
having movies.title like'%Star Wars%' and count(ratings.rating) >40 
;



--8 Create a derived table from one or more of the above queries

-- rating count 

create table rating_counts as (select movies.movieid ,movies.title  as movie_title, count(ratings.rating) as count_rating
from movies 
join ratings 
on movies.movieid  = ratings.movieid 
group by movies.movieid , movies.title 
order by count_rating desc 
limit 10)
; 
select * from rating_counts;
alter table rating_counts add foreign key (movieid) references movies(movieid);

create table top_ratings2 as (select rating_counts.movieid , rating_counts.movie_title , rating_counts.count_rating , ratings.rating ,ratings.userid
from  rating_counts
join ratings 
on rating_counts.movieid  = ratings.movieid 
order by movieid)
;
select count(*) from top_ratings2; 

alter table top_ratings2 add foreign key (movieid) references movies(movieid); 


create table top10_rating_genre as(select top_ratings2.* , movies.genres 
from top_ratings2
join movies  
on top_ratings2.movieid = movies.movieid);


select * from tags t 






  

 

















select * from links l ;