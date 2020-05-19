--The query shows the famous actor, producer etc. Tom Hanks' acting as a producer in imdb

select 	n.primaryname,
	   	n.birthyear,
		p.category,
		p.characters,
		t.titletype,
		t1.primarytitle,
		t.primarytitle,
		t.startyear,
		t.genres
from
 name_basics n (nolock)
inner join title_principals p (nolock) on n.nconst = p.nconst
inner join title_basics t (nolock) on p.tconst = t.tconst
left join title_episode e (nolock) on e.tconst = t.tconst
left join title_basics t1 (nolock) on t1.tconst = e.parenttconst
where n.primaryname = 'Tom Hanks' and p.category = 'producer'
order by startyear
limit 100