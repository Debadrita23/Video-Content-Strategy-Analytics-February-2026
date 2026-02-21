/*  Hypothesis 1: Passive vs Active Consumption 
           1.Do passive videos get higher average views (adjusted for age)?
		   2.Do active videos get higher engagement intensity?  */
WITH consumption_type as (
select 
      *,
      timestampdiff(DAY,published_at,'2022-08-24') AS days_since_publication,
      CASE 
        WHEN keyword IN ('music', 'animals', 'bed', 'asmr', 'lofi', 'movies', 'food', 'reaction', 'marvel', 'mukbang') THEN 'passive'
        WHEN keyword IN ('gaming', 'education', 'chess', 'history', 'news', 'cnn', 'sports', 'mrbeast', 'apple', 'xbox', 'physics', 'crypto', 'trolling', 'cubes', 'biology',
        'minecraft', 'tech', 'business', 'how-to', 'game development', 'nintendo', 'interview', 'tutorial', 'finance', 'data science', 'machine learning', 'computer science') THEN 'active'
        ELSE 'unclassified'
      END AS consumption_type,
      round((likes/views)*100,2) as like_to_view_perc,
	  round((likes+comments)/views*100,2) as engagement_intensity
from video_stats
)
select *,
       case when  days_since_publication = 0 then views
			else round(views/days_since_publication,0)
       end as views_per_day,
       
       case when days_since_publication <= 7 then '0-7 days'
			when days_since_publication between 8 and 30 then '8-30 days' 
			when days_since_publication between 31 and 90 then '31-90 days' 
			else '90+ days' end AS age_cohort
from consumption_type;


select * from video_stats 
where comments = -1;

select * from video_stats 
where likes < 0;

select count(distinct keyword) from video_stats;