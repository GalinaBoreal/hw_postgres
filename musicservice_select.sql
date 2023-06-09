--Задание 2
--Название и продолжительность самого длительного трека.
select name as track, t_time as max_time from track
where t_time = (select max(t_time) from track)
;

--Название треков, продолжительность которых не менее 3,5 минут.
select name as track, t_time
from track
where t_time >= 210
order by t_time
;

--Названия сборников, вышедших в период с 2018 по 2020 год включительно.
select name as collection, relise
from collection
where (relise between '2018-01-01 00:00:00' and '2020-12-31 23:59:59')
;

--Исполнители, чьё имя состоит из одного слова.
select name from musician
where name not like '% %';

--Название треков, которые содержат слово «мой» или «my».Вариант 1.
select name from track
where name ~~* 'MY'
or name ~~* '% MY%'
or name ~~* '%MY %'
or name ~~* 'MY'
;

--Название треков, которые содержат слово «мой» или «my».Вариант 2.
select t.name from track t
where string_to_array (lower(t.name), ' ') && array ['my', 'мой']
;

--Название треков, которые содержат слово «мой» или «my».Вариант 3 (не везде рабочий).
select name from track
where 1 = 1
  and regexp_like (name, '(\Wmy\W?|\W?my\W|\Wmy\W|^my$|\Wмой\W?|\W?мой\W|\Wмой\W|^мой$)', 'i')
;

--Задание 3
--Количество исполнителей в каждом жанре. Вариант 1.
select g.name as genre, count(gm.musician_id) as musician
from genre g
join genremusician gm on g.id = gm.genre_id
group by g."name"
order by musician desc
;

--Количество исполнителей в каждом жанре. Вариант 2.
select g.name as genre, count(gm.musician_id) as musician
from genre g, genremusician gm
where g.id = gm.genre_id
group by g.name
order by musician desc
;

--Количество треков, вошедших в альбомы 2019–2020 годов. Вариант 1
select count(shell.id) as count_track
from (
select extract (year from a.relise) as album_year
  , t.id from track t
join album a on t.album_id = a.id
where (a.relise between to_date ('2019-01-01 00:00:01', 'YYYY-MM-DD HH24:MI:SS')
  and to_date ('2020-12-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'))
) shell
;

--Количество треков, вошедших в альбомы 2019–2020 годов. Вариант 2
select count(shell.id) as count_track
from (
select extract (year from a.relise) as album_year
  , t.id from track t, album a
where t.album_id = a.id
  and (a.relise between to_date ('2019-01-01 00:00:01', 'YYYY-MM-DD HH24:MI:SS')
  and to_date ('2020-12-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'))
) shell
;

--Средняя продолжительность треков по каждому альбому.Вариант 1
select a.name as album, round(avg(t.t_time), 0) as avg_time
from track t
join album a on t.album_id = a.id
group by a."name"
order by a."name"
;

--Средняя продолжительность треков по каждому альбому.Вариант 2
select a."name" as album, round(avg(t.t_time), 0) as avg_time
from track t, album a
where t.album_id = a.id
group by a."name"
order by a."name"
;

--Все исполнители, которые не выпустили альбомы в 2020 году.
select m2."name"
from musician m2
where m2.id not in (
select m.id from musician m
join albumrecording ar on ar.musician_id = m.id
join album a on a.id = ar.album_id
where extract (year from a.relise ) = '2020'
)
;
--Названия сборников, в которых присутствует Beyonce. Вариант 1
select distinct m.name as musician, c.name as collection
from musician m
join albumrecording a on a.musician_id = m.id
join track t on t.album_id = a.album_id
join collectionrecording cr on cr.track_id = t.id
join collection c on c.id = cr.collection_id
where m.name = 'Beyonce'
;

--Названия сборников, в которых присутствует Beyonce. Вариант 2
select distinct m."name" as musician, c."name" as collection
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
select a.name as album, count(distinct t.id) as num_of_track from track t
join album a on a.id = t.album_id
group by a."name"
having count(distinct t.id) = (select count(track.id) from album
  join track on track.album_id = album.id
  group by album."name"
  order by count(track.id)
limit 1)
;