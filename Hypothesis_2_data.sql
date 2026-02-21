select video_id,
       count(*) as total_comments_analyzed,
       sum(likes) as total_comment_likes,
       round(avg(likes),0) as avg_comment_likes,
       sum(case when sentiment =2 then 1 else 0 end) as positive_comments,
       sum(case when sentiment =1 then 1 else 0 end) as neutral_comments,
       sum(case when sentiment =0 then 1 else 0 end) as negative_comments,
       round(avg(sentiment),2) as avg_sentiment_score,
       round( variance(sentiment), 2) as sentiment_variance,
	   round(SUM(CASE WHEN sentiment = 2 THEN 1 ELSE 0 END) * 100.0 / COUNT(*),1) AS pct_positive_comment
from comments
group by video_id
