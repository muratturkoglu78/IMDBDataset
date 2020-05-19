--The query shows the top 20 best documentary titles (movies, series etc.) equal to after the year 2000

with title_b as
(
	select
	tconst,
	primarytitle,
	unnest(string_to_array(genres, ',')) as genres
	from title_basics
)
select
b3.primarytitle,
b.primarytitle,
b3.titletype,
e.seasonnumber,
e.episodenumber,
b3.startyear,
r.averagerating,
r.numvotes
from title_b b
inner join title_episode e (nolock) on e.tconst = b.tconst
inner join title_basics b3 (nolock) on b3.tconst = e.parenttconst
inner join title_ratings r (nolock) on r.tconst = b.tconst
where b.genres = 'Documentary' and b3.startyear >=2000
order by r.averagerating desc
limit 20