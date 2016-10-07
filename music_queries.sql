--1
select track.name, album.name from track, album where album.name = 'Nevermind' and track.album_id = album.id;

--2
select artist.name, instrument.name from instrument, artist_plays_instrument, artist where artist.id = artist_plays_instrument.artist_id and artist_plays_instrument.instrument_id = instrument.id;

--3
select * from track order by track.duration desc limit 1;

--4
select * from album where (album.year between date '1990-01-01' and date '1999-12-31');

--5
select * from album where album.lead_artist_id = 1 and (album.year between date '1990-01-01' and date '1999-12-31');

--6
select album.name, sum(track.duration) from track, album where track.album_id = album.id group by album.name;

--7
select * from track inner join album on track.album_id = album.id inner join productions on album.id = productions.album_id inner join artist on productions.artist_id = artist.id where artist.name = 'Nirvana';

--8
select album.name from album, productions where productions.album_id = album.id group by album.name having count(album.id) = 1;

--9
select album.name from album,artist where album.lead_artist_id = artist.id and artist.name = 'Nirvana';

--10
select * from album, productions, artist where artist.id = productions.artist_id and productions.album_id = album.id and artist.name = 'Jay-Z';

--11
select artist.name, count(productions.artist_id) from artist,productions where artist.id = productions.artist_id group by artist.name, productions.artist_id order by count(productions.artist_id) desc limit 5;

--12
select album.name from album, instrument, artist_plays_instrument where instrument.id = artist_plays_instrument.instrument_id and artist_plays_instrument.artist_id =  album.lead_artist_id and instrument.id = 2;

--13
select song.name, count(song.name) from song, track where song.id = track.song_id group by song.name order by count(song.name) desc limit 5;

--14
select song_writer.name, count(song_writer.name) from song, track, song_writer where track.song_id = song.id and song.writer_id = song_writer.id group by song_writer.name order by count(song_writer.name) desc limit 5;

--15
select song_writer.name, count(song.name) from song_writer, song where song_writer.id = song.writer_id group by song_writer.name order by count(song.name) desc limit 1;

--16
select artist.name, count(artist_plays_instrument.instrument_id) from artist,artist_plays_instrument where artist.id = artist_plays_instrument.artist_id group by artist.name order by count(artist_plays_instrument.instrument_id) desc limit 1;

-- 17
select A2.name from artist as A1, productions as P1, album, productions as P2, artist as A2 where A1.id = P1.artist_id and P1.album_id = album.id and album.id = P2.album_id and P2.artist_id = A2.id and A1.name <> A2.name and A1.name = 'Jay-Z';

--18
select A1.name, count(A2.name) from artist as A1, productions as P1, album, productions as P2, artist as A2 where A1.id = P1.artist_id and P1.album_id = album.id and album.id = P2.album_id and P2.artist_id = A2.id and A1.name <> A2.name group by A1.name order by count (A2.name) desc limit 1;

--BONUS
--What instruments are played for each track
select track.name, artist.name, instrument.name from track, album, productions, artist, artist_plays_instrument, instrument where track.album_id = album.id and album.id = productions.album_id and productions.artist_id = artist.id and artist.id = artist_plays_instrument.artist_id and artist_plays_instrument.instrument_id = instrument.id;

--How far apart were albums released for a given artist
(select album.year from album where album.id = 1) - (select album.year from album where album.id = 2);
