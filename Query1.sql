--The query shows the famous actor, producer cem yilmaz's all apperances in tvepisodes in imdb

select
		n.primaryname,
		coalesce(b1.originaltitle, b.originaltitle) originaltitle,
		b.originaltitle,
		coalesce(b1.startyear, b.startyear) startyear,
		p.characters,
		b.titletype
from title_principals p (nolock)
inner join title_basics b (nolock) on b.tconst = p.tconst
inner join name_basics n (nolock) on n.nconst = p.nconst
left join title_episode e (nolock) on e.tconst = p.tconst
left join title_basics b1 (nolock) on b1.tconst = e.parenttconst
where n.primaryname = 'Cem Yilmaz' and b.titletype = 'tvEpisode'
order by coalesce(b1.startyear, b.StartYear)
limit 100