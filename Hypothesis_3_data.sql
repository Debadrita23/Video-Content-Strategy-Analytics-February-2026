select *
from view_percentiles
inner join advanced_sentiment_metrics
using (video_id)