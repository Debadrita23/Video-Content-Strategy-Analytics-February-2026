📺 YouTube Content Strategy Analysis

Can data tell us what makes a YouTube video last?
This project applies rigorous statistical methodology to a Kaggle YouTube dataset to test three original hypotheses about video performance drivers — content type, comment sentiment, and controversy dynamics.


🧪 Hypotheses Tested
#HypothesisPrimary Method1Active (educational) content drives higher daily views than passive (entertainment) contentMann-Whitney U Test + OLS Regression2Higher positive comment sentiment is associated with greater long-term view accumulationSpearman Rank Correlation + Kruskal-Wallis3Comment controversy has a non-linear (inverted-U) effect on video performanceQuadratic OLS + Interaction Modelling

🛠️ Technical Highlights
Statistical Methodology

Non-parametric testing (Mann-Whitney U, Kruskal-Wallis) justified through Shapiro-Wilk normality checks and skewness analysis — avoiding the common mistake of applying t-tests to heavily skewed view-count data
Effect size reporting via rank-biserial correlation alongside p-values, going beyond binary significance thresholds
Multiple classification models (A/B/C) for ambiguous keyword groups, testing robustness of results to definitional assumptions
OLS regression with log-transformed outcome (log(views_per_day + 1)) to handle right-skewed distributions and linearise the relationship
Quadratic regression to detect non-linear inverted-U patterns in the controversy–performance relationship
Interaction modelling (CCS × sentiment) to disentangle fandom debate from outrage-driven controversy

Feature Engineering

views_per_day — normalises for video age to separate momentum from legacy reach
all_time_percentile — rank-normalised cumulative view score, robust to viral outliers
vpd_percentile — current momentum signal, used to construct video archetypes
Comment Controversy Score (CCS) — custom composite: sentiment_variance × avg_comment_likes, capturing both polarity and amplification
SWES (Sentiment-Weighted Engagement Score) — alternative sentiment metric for robustness checks
sentiment_bucket — tertile-based categorisation (Low / Medium / High) of positive comment share

Video Performance Archetypes
Segmented the dataset into four performance archetypes using dual percentile ranking:
ArchetypeCriteria🚀 Rising StarHigh VPD percentile + recent upload🌲 Evergreen WinnerHigh all-time percentile + sustained VPD (90+ days old)🌇 Fading StarHigh all-time + low VPD percentile🌱 Promising NewcomerLow all-time + high VPD percentile

📁 Repository Structure
youtube-content-strategy-analysis/
│
├── Video_Content_Strategy.ipynb   # Main analysis notebook
├── README.md
└── data/
    ├── Hypothesis1_data.csv        # Video-level metrics
    ├── comments_aggregated.csv     # Per-video sentiment aggregates
    └── raw_datasets/
        └── comments_clean.csv      # Raw comment-level data

🔬 Dataset

Source: YouTube Statistics — Kaggle
Scope: ~1,900 videos across 40+ keyword categories
Features: Views, likes, comments, publication date, keyword tags, and scraped comment sentiment scores


📦 Dependencies
pythonpandas
numpy
matplotlib
seaborn
scipy
statsmodels
Install with:
bashpip install pandas numpy matplotlib seaborn scipy statsmodels

⚠️ Key Caveats

Correlation ≠ Causation: Sentiment and controversy may be consequences of view counts rather than causes (reverse causality). Results are associative, not causal.
Comment sampling: Only 10 comments per video were analysed — sentiment estimates carry noise, especially for high-volume videos.
Constructed metrics: CCS and SWES are custom proxies, not validated psychometric scales. Bucket thresholds are data-driven but nonetheless arbitrary.
No channel-level controls: Subscriber count, channel age, and upload frequency are unobserved confounders in all models.


👤 Author
[Your Name]
Data Analyst | Statistical Modelling | Python
LinkedIn · Portfolio
