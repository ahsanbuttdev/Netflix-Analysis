drop table netflix_titles, show_directors, show_countries, show_cast, show_genres;

select * from netflix_titles;
select * from show_directors;
select * from show_countries;
select * from show_cast;
select * from show_genres;

select duration from netflix_titles 
where type = 'Movie';

SELECT * FROM netflix_titles
WHERE show_id IN (
    SELECT show_id 
    FROM netflix_titles 
    GROUP BY show_id 
    HAVING COUNT(*) > 1
)
ORDER BY show_id;

DELETE FROM netflix_titles
WHERE ctid NOT IN (
    SELECT MIN(ctid)
    FROM netflix_titles
    GROUP BY show_id, type, title, date_added, release_year, rating, duration -- add your other column names here
);


-- assigning primary key

alter table netflix_titles
add primary key(show_id)

-- adding foreign keys

ALTER TABLE show_cast
ADD CONSTRAINT fk_cast_netflix
FOREIGN KEY (show_id) REFERENCES netflix_titles(show_id);

ALTER TABLE show_genres
ADD CONSTRAINT fk_genres_netflix
FOREIGN KEY (show_id) REFERENCES netflix_titles(show_id);

ALTER TABLE show_countries
ADD CONSTRAINT fk_countries_netflix
FOREIGN KEY (show_id) REFERENCES netflix_titles(show_id);

ALTER TABLE show_directors
ADD CONSTRAINT fk_directors_netflix
FOREIGN KEY (show_id) REFERENCES netflix_titles(show_id);

-- top 10 movies by revenue

select title, release_year, revenue from netflix_titles
where type = 'Movie'
order by revenue desc
limit 10;

-- top 10 countries with worst revenue from movies other than 0

ALTER TABLE netflix_titles 
ALTER COLUMN revenue TYPE BIGINT USING revenue::numeric::bigint;

ALTER TABLE netflix_titles 
ALTER COLUMN budget TYPE BIGINT USING budget::numeric::bigint;

select n.title, s.country, n.revenue
from netflix_titles n
join show_countries s
on n.show_id = s.show_id
where type = 'Movie' and revenue > 0
order by revenue
limit 10

-- top 10 countries with movies popularity

select title, popularity
from netflix_titles 
where type = 'Movie'
order by popularity desc
limit 10

-- flop shows by ratings

select title, rating
from netflix_titles 
where rating between 0.1 and 4.9
order by rating

-- top 10 shows by rating

select title, rating
from netflix_titles 
order by rating desc
limit 10

-- shows with high revenue but low budget

select title, release_year, revenue, budget
from netflix_titles
where revenue > 0 and budget > 0 and budget < 100000
order by revenue desc
limit 10

-- year growth

select release_year, avg(revenue)
from netflix_titles
where type = 'Movie'
group by release_year
order by release_year

-- longer Tv shows by seasons

select title, release_year, duration
from netflix_titles
where duration = '2 Seasons'

select distinct(duration)
from netflix_titles

-- casts played in most number of movies

select count(distinct(n.title)), s.cast
from netflix_titles n
join show_cast s
on n.show_id = s.show_id
where n.type = 'Movie' and s.cast != 'Unknown'
group by s.cast
order by count(distinct(n.title)) desc
limit 10

select count(distinct(n.title)), s.cast
from netflix_titles n
join show_cast s
on n.show_id = s.show_id
where n.type = 'TV Show' and s.cast != 'Unknown'
group by s.cast
order by count(distinct(n.title)) desc
limit 10

SELECT COUNT(DISTINCT "cast")
FROM show_cast;

-- actor appears most in a specific genre

select s.cast, g.genres, count(distinct(s.show_id))
from show_cast s
join show_genres g
on s.show_id = g.show_id
where s.cast != 'Unknown'
group by s.cast, g.genres
order by count(distinct(s.show_id)) desc
limit 10

-- directors in most movies

select director from show_directors 
where director = 'Unknown'

select d.director, count(distinct(n.title))
from netflix_titles n
join show_directors d
on n.show_id = d.show_id
where n.type = 'TV Show' and d.director != 'Unknown'
group by d.director
order by count(distinct(n.title)) desc
limit 10


create view netflix_main as (
select * from netflix_titles
)

select * from netflix_main

create view casts as (
select * from show_cast
)

select * from casts

create view countries_data as (
select * from show_countries
)

select * from countries_data

create view genres_data as (
select * from show_genres
)

select * from genres_data

create view directors as (
select * from show_directors
)

select * from directors