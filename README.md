
[README.md](https://github.com/user-attachments/files/25455800/README.md)
# 📺 YouTube Content Strategy Analysis

> **Can data tell us what makes a YouTube video last?**  
> This project applies rigorous statistical methodology to a Kaggle YouTube dataset to test three original hypotheses about video performance drivers — content type, comment sentiment, and controversy dynamics.

-----

## 🧪 Hypotheses Tested

| # | Hypothesis | Primary Method |
|---|-----------|----------------|
| 1 | Active (educational) content drives higher daily views than passive (entertainment) content | Mann-Whitney U Test + OLS Regression |
| 2 | Higher positive comment sentiment is associated with greater long-term view accumulation | Spearman Rank Correlation + Kruskal-Wallis |
| 3 | Comment controversy has a non-linear (inverted-U) effect on video performance | Quadratic OLS + Interaction Modelling |

---

## 🛠️ Technical Highlights

### Statistical Methodology
- **Non-parametric testing** (Mann-Whitney U, Kruskal-Wallis) justified through Shapiro-Wilk normality checks and skewness analysis — avoiding the common mistake of applying t-tests to heavily skewed view-count data
- **Effect size reporting** via rank-biserial correlation alongside p-values, going beyond binary significance thresholds
- **Multiple classification models** (A/B/C) for ambiguous keyword groups, testing robustness of results to definitional assumptions
- **OLS regression with log-transformed outcome** (`log(views_per_day + 1)`) to handle right-skewed distributions and linearise the relationship
- **Quadratic regression** to detect non-linear inverted-U patterns in the controversy–performance relationship
- **Interaction modelling** (CCS × sentiment) to disentangle fandom debate from outrage-driven controversy

### Feature Engineering
- `views_per_day` — normalises for video age to separate momentum from legacy reach
- `all_time_percentile` — rank-normalised cumulative view score, robust to viral outliers
- `vpd_percentile` — current momentum signal, used to construct video archetypes
- `Comment Controversy Score (CCS)` — custom composite: `sentiment_variance × avg_comment_likes`, capturing both polarity and amplification
- `SWES (Sentiment-Weighted Engagement Score)` — alternative sentiment metric for robustness checks
- `sentiment_bucket` — tertile-based categorisation (Low / Medium / High) of positive comment share

### Video Performance Archetypes
Segmented the dataset into four performance archetypes using dual percentile ranking:

| Archetype | Criteria |
|-----------|----------|
| 🚀 Rising Star | High VPD percentile + recent upload |
| 🌲 Evergreen Winner | High all-time percentile + sustained VPD (90+ days old) |
| 🌇 Fading Star | High all-time + low VPD percentile |
| 🌱 Promising Newcomer | Low all-time + high VPD percentile |

---



## 🔬 Dataset

- **Source:** [YouTube Statistics — Kaggle]([https://www.kaggle.com/](https://www.kaggle.com/datasets/advaypatil/youtube-statistics?select=videos-stats.csv&utm_source=www.askdatadawn.com&utm_medium=newsletter&utm_campaign=3-detailed-data-portfolio-projects-ideas-datasets&_bhlid=ffadd7018c872d682dff31f64e706bfe6c33497b))
- **Scope:** ~1,900 videos across 40+ keyword categories
- **Features:** Views, likes, comments, publication date, keyword tags, and scraped comment sentiment scores



## 👤 Author

**Debadrita Deb**  
*Data Analyst | Statistical Modelling | Python*  
LinkedIn https://www.linkedin.com/in/debadrita-deb-021772195/
