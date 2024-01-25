use album;

select *
from track;
select *
from album;

## join statement
select a.artist as Artist, a.title as Album, t.track_number as 'Track Num',
	t.title as Track, t.duration as Seconds
	from album as a
	join track as t on a.id= t.album_id
	order by a.artist, a.title, t.track_number;


