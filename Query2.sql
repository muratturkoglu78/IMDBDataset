--The query shows the famous tv series dexter's all episode average ratings group by writers (episode numvotes > 10000)

select 	b.primarytitle,
		b.titletype,
		b.genres,
		e.episodenumber,
		n1.primaryname writername,
		avg(r.averagerating) averageratingofepisode
from title_basics b (nolock)
inner join title_episode e (nolock) on e.parenttconst = b.tconst
inner join title_ratings r (nolock) on r.tconst = e.tconst
inner join
(
	select 	tconst,
			unnest(string_to_array(writers, ',')) as nconstwriters
	from title_crew
) c on c.tconst = e.tconst
inner join name_basics n1 (nolock) on n1.nconst = c.nconstwriters
where b.originaltitle = 'Dexter' and b.titletype = 'tvSeries'
group by 	b.primarytitle,
			b.titletype,
			b.genres,
			e.episodenumber,
			n1.primaryname
having sum(r.numvotes) > 10000
order by e.episodenumber
limit 100
