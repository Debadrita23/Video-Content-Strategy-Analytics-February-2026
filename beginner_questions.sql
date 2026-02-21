
-- What are the top 5 keywords by average video views?
select keyword,
       round(avg(views),0) as avg_views
from video_stats
group by keyword
order by avg_views desc
limit 5;
-----------------------
-- Which videos have the highest like-to-view ratio, and what keywords do they use?
select title, published_at, keyword,
       round(100*(likes/views),2) as like_view_ratio      
from video_stats
where likes <> -1
and comments <> -1
order by like_view_ratio  desc
limit 10;
-----------------------------------
-- What is the average sentiment score for comments on videos published in the last 30 days?
/* The video table contains multiple values for a single video, with different keywords attached to it and the differing likes,comments. 
    It is assumed that the latest like and comments are the real values*/

with base as 
(select video_id, 
       max(title) as title, 
       group_concat(keyword) as keywords,
       max(published_at) as published_at, 
       max(likes) as likes, 
       max(views) as views
from video_stats
where published_at >= (select max(published_at) from video_stats) - interval 30 day
group by video_id
),
sentiment_score as (
select title, keywords,
       avg(sentiment) as avg_sentiment
from base
left join comments using (video_id)
group by title, keywords
)
select keywords, count(keywords)
from sentiment_score
where avg_sentiment =2
group by keywords
order by count(keywords);






-----------------------------------
-- Which keyword generates the most commented videos on average?

select title, keyword,
	sum(comments) as total_comments,
    count(distinct video_id) as total_videos,
    round(sum(comments)/count(distinct video_id),0) as comments_per_video
from video_stats
group by title, keyword
order by comments_per_video desc
limit 10;


-- Create a simple engagement score (views + likes + comments) and find top 10 videos?

select 
       title,
       keyword,
       (views + likes + comments) as engagement_score
from  video_stats
order by engagement_score desc
limit 10;





