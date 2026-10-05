# ⚡ Household Energy Intelligence - Detailed Project Report

**Author:** Nitin Kohli

**Project type:** Internship-style end-to-end Data Analytics + Data Science project

## 1. Project Summary
I treated the supplied household electricity CSV as a small real-world analytics problem. The project moves from raw minute-level readings to cleaned time series, EDA, statistics, forecasting, high-use alerts, clustering, SQL, Excel and Power BI-ready outputs.

## 2. What the Numbers Mean
- **1,048,575 records:** total minute-level observations in the supplied file.
- **4,069 rows / 0.39%:** records affected by missing numeric values.
- **0.66 R²:** proportion of variance explained by the selected Gradient Boosting model on the time-based test period. It is not the same as accuracy.
- **40% MAE reduction:** the forecast error fell by about this percentage compared with using the same hour from the previous week as the baseline.
- **80% accuracy:** test accuracy of the high-consumption day Random Forest classifier, not forecasting accuracy.
- **3 clusters:** three daily usage-shape groups created with K-Means.
- **22% weekend uplift:** weekend average daily energy compared with weekday average daily energy.

## 3. Data Quality
The file has **1,048,575 rows**, **8 original measurement fields**, no duplicate rows and no duplicate timestamps. Nearly all recorded gaps are 1 minute apart. There is one long missing streak of about **62.0 hours**, which is why long gaps were not automatically invented with interpolation.

## 4. Cleaning
Short gaps (up to 60 minutes) were interpolated only for small-window analysis. Daily and hourly modeling used a 90% data-coverage rule. This keeps missing-data handling easy to explain during an interview.

## 5. EDA
Average daily energy is **26.57 kWh/day**. Weekend use is **30.52 kWh/day** compared with **25.01 kWh/day** on weekdays. A Welch t-test gives a very small p-value for this difference in the sample, so the observed weekday/weekend gap is statistically meaningful, while the project avoids claiming a specific causal reason.

## 6. Feature Engineering
The main forecasting features are:
- hour of day
- day of week
- month
- weekend flag
- lag 1 hour
- lag 24 hours
- lag 168 hours
- 24-hour rolling mean
- 168-hour rolling mean

Using lags is useful because electricity demand often depends on recent and weekly routines.

## 7. Forecasting Model Results

| Model | MAE | RMSE | R² |
|---|---:|---:|---:|
| 168-hour baseline | 0.572 | 0.897 | -0.004 |
| Random Forest | 0.364 | 0.520 | 0.663 |
| **Gradient Boosting** | **0.344** | **0.525** | **0.657** |
| ANN | 0.382 | 0.549 | 0.625 |

The final model is **Gradient Boosting** because it gives the lowest MAE and the strongest R² in this project.

## 8. ANN and LSTM
ANN is useful on the tabular feature set. LSTM is useful because it learns from a sequence of past observations. LSTM test R² is **0.58** with MAE **0.411 kWh**. The neural models are benchmarks; they are not selected just because they sound advanced.

## 9. High-Consumption Classification
A day above the training-set 75th percentile was marked as high-use. Random Forest achieved **80% accuracy**, **44% precision**, **48% recall** and **46.15 F1** on the time-based test period.

## 10. Clustering
Each day was converted into a 24-hour profile and normalized by its average level. K-Means then created **3 usage groups** across **723 usable daily profiles**. The cluster idea is to describe shape differences, not to claim that each cluster is a permanent household type.

## 11. SQL / Excel / Power BI
SQL was used to answer business questions from processed daily/hourly tables. Excel gives a quick recruiter-friendly summary. Power BI uses the same processed tables and is organized into three pages: overview, forecasting and sustainability patterns.

## 12. Sustainability
This project can support practical actions around peak demand, flexible-load scheduling and routine comparison. It does **not** estimate CO₂ or money saved because verified emissions factors, tariffs and household context are not present.

## 13. Resume Bullets

1. Analyzed **1,048,575+ minute-level household energy readings** using **Python, Pandas, NumPy, EDA and statistical analysis**, cleaning **0.39%** affected records and building daily/hourly datasets for business analysis.

2. Built an **hourly time-series forecasting pipeline** with **feature engineering, lag/rolling features, Random Forest, Gradient Boosting and ANN**, reaching **R² 0.66** and reducing MAE by **40%** versus a weekly-history baseline.

3. Benchmarked **ANN and LSTM** sequence models and added a **high-consumption classification** workflow, with Random Forest reaching **80% accuracy** on the time-based test period for energy-use alerts.

4. Used **K-Means clustering, SQL, Excel and Power BI-ready dashboards** to segment **723 daily load profiles into 3 usage patterns**, highlight a **22% weekend uplift**, and convert energy trends into practical sustainability actions.


## 14. HR / Interview Questions and Answers

### Q1. Tell me about this project in 60 seconds.
**Answer:** I worked on a household electricity dataset with over one million minute-level records. I cleaned the data, handled missing values with coverage checks, built daily and hourly views, performed EDA and statistical analysis, then created time-based forecasting, high-consumption alerts and K-Means usage clusters. I compared Random Forest, Gradient Boosting, ANN and LSTM models and selected Gradient Boosting as the practical forecasting model because it reduced MAE by about 40% versus the weekly-history baseline.

### Q2. Why did you choose this problem?
**Answer:** Electricity demand is easy to connect with a real business question: understanding where energy is used and anticipating the next demand level. It also gives a natural sustainability angle without needing to invent environmental numbers.

### Q3. Why did you use 90% coverage?
**Answer:** A daily total built from a day with large missing periods can be misleading. 90% is a simple quality rule that keeps almost-complete periods and removes very incomplete ones.

### Q4. Why not fill all missing values?
**Answer:** A long missing block of around 62 hours is too large to guess safely. Filling it could create a fake consumption curve.

### Q5. Why is time-based split important?
**Answer:** In forecasting, the model should learn from the past and be tested on later observations. Random splitting can accidentally let future patterns influence training.

### Q6. What is a lag 24 feature?
**Answer:** It is the energy value from 24 hours earlier. It gives the model a simple view of the same hour on the previous day.

### Q7. What is lag 168?
**Answer:** 168 hours is 7 days, so it captures the same hour from the previous week.

### Q8. What does R² 0.66 mean?
**Answer:** Roughly, the model explains 66% of the variance in the test-period target values. It does not mean the model is 66% accurate.

### Q9. What does the 40% improvement mean?
**Answer:** It means MAE is about 40% lower than the 168-hour baseline. It is an error reduction, not a claim of 40% prediction accuracy.

### Q10. Why Gradient Boosting over Random Forest?
**Answer:** Gradient Boosting gave the lowest MAE in the final comparison and a strong R², so it was the most practical choice for this dataset.

### Q11. Why use ANN?
**Answer:** The input is tabular numeric and calendar features, so a small ANN is a reasonable neural benchmark.

### Q12. Why use LSTM?
**Answer:** LSTM is designed for sequence data. Here it receives the previous 24 hourly energy values and learns temporal patterns.

### Q13. Why not CNN?
**Answer:** CNN is more naturally useful for image-like or spatial patterns. This dataset is mainly tabular and time-series, so using CNN would add complexity without a clear benefit.

### Q14. Why K-Means?
**Answer:** It is easy to explain and works well for grouping similar daily load shapes. I normalized each day so the clustering focuses on shape more than only scale.

### Q15. How did SQL help?
**Answer:** SQL made it easy to answer direct business questions like average daily use, top-consumption days and average load by hour, and I also used a window function for rolling averages.

### Q16. How did Power BI help?
**Answer:** Power BI turns the processed data into an interactive view for non-technical users. I structured it around energy overview, forecasting and sustainability patterns.

### Q17. What is the biggest project limitation?
**Answer:** The dataset tells me what happened, but not all the reasons. Weather, occupancy, tariffs and appliance context are missing, so I avoid claiming causation.

### Q18. What would you do next?
**Answer:** I would add weather and tariff data, then estimate real cost and carbon impact using verified factors. I would also test more advanced models only if they improve the business metric.

### Q19. Which Python libraries did you use?
**Answer:** Mainly Pandas, NumPy, Matplotlib, SciPy, Scikit-learn and PyTorch.

### Q20. If HR asks what you personally learned, what should you say?
**Answer:** I learned how to move from raw data to a complete project instead of stopping at EDA. The biggest learning was making model choice depend on test results and business use, not just the number of algorithms used.

## 15. One-line Project Pitch
**“Built an end-to-end household energy analytics project that turned 1M+ minute-level readings into clean datasets, demand forecasts, high-use alerts, usage clusters and Power BI-ready sustainability insights.”**
