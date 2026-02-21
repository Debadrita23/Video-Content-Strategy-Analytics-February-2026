
-- Rising Stars
SELECT *
FROM view_percentiles
WHERE age_cohort IN ('0-7 days', '8-30 days')
  AND views_per_day_percentile >= 75
  AND cohort_view_percentile >= 75
ORDER BY views_per_day_percentile DESC;
-- ===============================

-- Evergreen Videos
SELECT *
FROM view_percentiles
WHERE age_cohort = '90+ days'
  AND all_time_percentile >= 75
  AND views_per_day_percentile >= 50
GROUP BY keyword
ORDER BY keyword_frequency DESC;
-- ===================================      

-- Fading Stars
SELECT *
FROM view_percentiles
WHERE all_time_percentile >= 75
  AND views_per_day_percentile <= 25
ORDER BY days_since_publication;

-- =================================

WITH consumption_type as (
select 
      *,
      CASE 
        WHEN keyword IN ('music', 'animals', 'bed', 'asmr', 'lofi', 'movies', 'food', 'reaction', 'marvel', 'mukbang') THEN 'passive'
        WHEN keyword IN ('gaming', 'education', 'chess', 'history', 'news', 'cnn', 'sports', 'mrbeast', 'apple', 'xbox', 'physics', 'crypto', 'trolling', 'cubes', 'biology',
        'minecraft', 'tech', 'business', 'how-to', 'game development', 'nintendo', 'interview', 'tutorial', 'finance', 'data science', 'machine learning', 'computer science') THEN 'active'
        ELSE 'unclassified'
      END AS consumption_type
from view_percentiles
)
SELECT 
    consumption_type,
    -- age_cohort,
    AVG(views_per_day_percentile) AS avg_vpd_percentile,
    AVG(cohort_view_percentile) AS avg_cohort_percentile,
    COUNT(*) AS video_count
FROM consumption_type
WHERE consumption_type IN ('passive', 'active')
GROUP BY consumption_type -- ,age_cohort
ORDER BY consumption_type -- ,age_cohort