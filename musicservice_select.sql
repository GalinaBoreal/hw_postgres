--Задание 2
--Название и продолжительность самого длительного трека.
select name, t_time from track
where t_time = (select max(t_time) from track);

--Название треков, продолжительность которых не менее 3,5 минут.
select name, t_time from track
where t_time >= 210
order by t_time;

--Названия сборников, вышедших в период с 2018 по 2020 год включительно.
select name, relise from collection
where (relise between '2018-01-03 00:00:01' and '2020-01-05 23:59:59');

--Исполнители, чьё имя состоит из одного слова.
select name from musician
where name not like '% %';

--Название треков, которые содержат слово «мой» или «my».
select name from track
where upper(name) like '%MY%';

--Задание 3
--Количество исполнителей в каждом жанре.
select g.name, count(gm.musician_id) as musician
from genre g
join genremusician gm on g.id = gm.genre_id
group by g."name" 
order by musician desc 
;

select g.name, count(gm.musician_id) as musician
from genre g, genremusician gm
where g.id = gm.genre_id
group by g.name 
order by musician desc
;

--Количество треков, вошедших в альбомы 2019–2020 годов. Вариант 1
select shell.album_year, count(shell.id) as count_track
from (
select extract (year from a.relise) as album_year
       , t.id from track t
join album a on t.album_id = a.id 
where (a.relise between to_date ('2019-01-01 00:00:01', 'YYYY-MM-DD HH24:MI:SS') 
  and to_date ('2020-01-01 23:59:59', 'YYYY-MM-DD HH24:MI:SS'))
) shell 
group by shell.album_year
;
--Количество треков, вошедших в альбомы 2019–2020 годов. Вариант 2
select shell.album_year, count(shell.id) as count_track
from (
select extract (year from a.relise) as album_year
       , t.id from track t, album a
where t.album_id = a.id 
  and (a.relise between to_date ('2019-01-01 00:00:01', 'YYYY-MM-DD HH24:MI:SS') 
  and to_date ('2020-01-01 23:59:59', 'YYYY-MM-DD HH24:MI:SS'))
) shell 
group by shell.album_year
;

--Средняя продолжительность треков по каждому альбому.Вариант 1 
select a.name, round(avg(t.t_time), 0) as avg_time
from track t
join album a on t.album_id = a.id
group by a."name" 
order by a."name" 
;
--Средняя продолжительность треков по каждому альбому.Вариант 2
select a."name", round(avg(t.t_time), 0) as avg_time
from track t, album a
where t.album_id = a.id 
group by a."name"
order by a."name" 
;
--Все исполнители, которые не выпустили альбомы в 2020 году. Вариант 1
select m.name
  , extract (year from a.relise) as album_relise
from album a
join albumrecording ar on a.id = ar.album_id
join musician m on ar.musician_id = m.id
where extract (year from a.relise) != '2020'
;

--Все исполнители, которые не выпустили альбомы в 2020 году. Вариант 2
select m.name
  , extract (year from a.relise) as album_relise
from album a, albumrecording ar, musician m
where a.id = ar.album_id 
  and ar.musician_id = m.id
  and not extract (year from a.relise) = '2020'
;

--Названия сборников, в которых присутствует Beyonce. Вариант 1
select distinct m.name, c.name from musician m
join albumrecording a on a.musician_id = m.id
join track t on t.album_id = a.album_id 
join collectionrecording cr on cr.track_id = t.id
join collection c on c.id = cr.collection_id 
where m.name = 'Beyonce'
;

--Названия сборников, в которых присутствует Beyonce. Вариант 2
select distinct m."name", c."name" 
from musician m, albumrecording ar, album a, track t, collectionrecording cr, collection c  
where m.name = 'Beyonce'
  and a.id = ar.album_id 
  and ar.musician_id = m.id
  and t.album_id = a.id
  and cr.track_id = t.id
  and c.id = cr.collection_id
;

--Задание 4
--Названия альбомов, в которых присутствуют исполнители более чем одного жанра.
select a."name" as album, count(g.id) as num_of_genre 
from genre g
join genremusician gm on gm.genre_id = g.id
join albumrecording ar on ar.musician_id = gm.musician_id 
join album a on a.id = ar.album_id
group by a."name"
having count(g.id) > (select count(genre.id) 
  from genre
  join genremusician on genremusician.genre_id = genre.id
  join albumrecording on albumrecording.musician_id = genremusician.musician_id 
  join album on album.id = albumrecording.album_id
  group by album."name"
limit 1)
;

--Наименования треков, которые не входят в сборники.
select t.name as track_out_collection  
from track t
full outer join collectionrecording cr 
on t.id = cr.track_id 
where cr.track_id is null
;

--Исполнитель написавший самый короткий по продолжительности трек.
select m."name" as musician, t."name" as track, t.t_time 
from musician m
join albumrecording a on a.musician_id = m.id 
join track t on t.album_id = a.album_id 
where t_time = (select min(t_time) from track)
;

--Названия альбомов, содержащих наименьшее количество треков.
select  a.name as album, count(distinct t.id) as num_of_track from track t
join album a on a.id = t.album_id
group by a."name"
having count(distinct t.id) = (select count(track.id) from album
  join track on track.album_id = album.id 
  group by album."name" 
  order by count(track.id)
limit 1)
;