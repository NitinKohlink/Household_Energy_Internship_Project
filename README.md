# ⚡ Household Energy Intelligence & Sustainable Consumption Project

### 👨‍💻 Nitin Kohli | Internship-style Data Analytics + Data Science Portfolio

> A practical end-to-end project on **household electricity demand**, built from minute-level readings and taken through **Data Cleaning → EDA → Statistics → Feature Engineering → ML → ANN/LSTM → Forecasting → Clustering → SQL → Excel → Power BI → Sustainability Insights**.

---

## 🚀 Project at a Glance

| Metric | Result |
|---|---:|
| ⚡ Raw records | **1,048,575** |
| 📅 Time covered | **2006-12-16 → 2008-12-13** |
| 🧹 Rows with missing values | **4,069 (0.39%)** |
| ✅ Usable days | **725** at ≥90% coverage |
| 🕐 Usable hours | **17,402** at ≥90% coverage |
| 📈 Avg daily energy | **26.57 kWh** |
| 🗓️ Weekend uplift | **22.0%** |
| 🤖 Best forecast model | **Gradient Boosting** |
| 🎯 Best R² | **0.66** |
| 📉 MAE reduction | **40%** |

## 🌱 What is the business question?

The main question is simple: **How can historical household power data help explain demand, predict near-term energy use and identify usage patterns that are useful for better planning?**

The sustainability angle is intentionally realistic. There is no verified emissions factor in this file, so this project talks about **energy-demand reduction opportunities**, not made-up CO₂ savings.

---

## 🧰 Skills Used

**Python • Pandas • NumPy • Matplotlib • SciPy • EDA • Data Cleaning • Statistical Analysis • Feature Engineering • SQL • Excel • Power BI • Scikit-learn • Random Forest • Decision Tree • Gradient Boosting • ANN • LSTM • K-Means • Time Series Forecasting • Data Visualization • Sustainability Analytics**

---

## 🔄 Project Flow

```text
CSV Data
  ↓
Data Quality + Missing Values
  ↓
Datetime Cleaning
  ↓
Minute → Hour / Day Aggregation
  ↓
EDA + Statistics
  ↓
Feature Engineering
  ↓
ML Forecasting + High-Use Alerts
  ↓
ANN + LSTM Benchmark
  ↓
K-Means Usage Clustering
  ↓
SQL + Excel + Power BI
  ↓
Business + Sustainability Insights
```

---

## 🧹 Data Cleaning

- **1,048,575** total minute-level observations.
- **4,069 rows** contain missing numeric values, about **0.39%** of records.
- **0 duplicate rows** and **0 duplicate timestamps**.
- Recorded time gaps are 1-minute intervals.
- The longest missing streak is about **62.0 hours**.
- I only filled short gaps for small-window analysis and used a **90% coverage rule** before daily/hourly modeling.

---

## 📊 EDA & Statistics

### Peak demand
The highest average load sits in the evening, with the strongest average hours around **19:00–21:00**.

### Weekday vs Weekend
Average weekday use is **25.01 kWh/day** and weekend use is **30.52 kWh/day**, which is about **22% higher** on weekends.

### Correlation
Global active power vs voltage has a correlation of about **-0.40**. This is a relationship in the sample, not proof of causation.

![Daily trend](04_Visuals/eda/01_daily_energy_trend.png)

![Hourly profile](04_Visuals/eda/02_hourly_profile.png)

---

## 🤖 Machine Learning

I used an **80/20 time-based split**. That means earlier observations are used for training and later observations are used for testing.

| Model | MAE | RMSE | R² |
|---|---:|---:|---:|
| 168-hour baseline | 0.572 | 0.897 | -0.004 |
| Random Forest | 0.364 | 0.520 | 0.663 |
| **Gradient Boosting** | **0.344** | **0.525** | **0.657** |
| ANN | 0.382 | 0.549 | 0.625 |

✅ The Gradient Boosting model cut MAE by **40%** compared with the weekly-history baseline.

![Model comparison](04_Visuals/ml/08_model_mae.png)

### High-consumption alert
I marked a day as high-use when it crossed the training-set 75th percentile. Random Forest reached **80% accuracy** and **48% recall** on the high-use class.

![Confusion matrix](04_Visuals/ml/09_confusion_matrix.png)

---

## 🧠 Deep Learning

### ANN
A small `MLPRegressor` acts as the ANN benchmark. It uses the same time-based features as the tree models.

### LSTM
A small PyTorch LSTM uses the previous **24 hourly observations** to estimate the next hour. Test result: **R² 0.58**, MAE **0.411 kWh**.

### Why not CNN?
I did not add CNN just for a keyword. There is no image or clear spatial-grid structure here. A CNN would add complexity without a strong reason, so ANN and LSTM are the more sensible neural examples for this dataset.

---

## 🔵 K-Means Clustering

I converted each day into a **24-hour load profile**, normalized the profile and grouped days into **3 clusters**. This gives a simple view of different daily usage shapes.

![Clusters](04_Visuals/clustering/11_cluster_profiles.png)

---

## 🗃️ SQL

The SQL section includes simple recruiter-friendly questions plus a window-function example for a rolling 7-day average.

## 📗 Excel

The Excel workbook is organized around KPIs, daily energy, hourly energy, model results and cluster profiles.

## 📊 Power BI

The Power BI package contains the ready-to-import datasets and a three-page dashboard guide:

**Energy Overview → Forecasting → Sustainability Patterns**

A real `.pbix` file needs Power BI Desktop, so the repository does not pretend that a PBIX was generated here.

---

## 📁 GitHub Structure

```text
01_Data/
02_Notebooks/
03_Analytics_BI_SQL/
04_Visuals/
05_Documentation/
README.md
requirements.txt
.gitignore
```

Only **5 main folders** are used.

---

## ▶️ Run the project

```bash
pip install -r requirements.txt
```

Then open the notebooks in `02_Notebooks/` and run them in order.

---

## 🌍 Practical Sustainability Insights

- Focus energy-management checks on evening peak hours.
- Compare weekend and weekday routines instead of only looking at a monthly total.
- Use short-term forecasts to plan flexible loads earlier.
- Use load-pattern clusters to identify days that behave differently from the normal routine.

---

## 📌 Resume Version

1. Analyzed **1,048,575+ minute-level household energy readings** using **Python, Pandas, NumPy, EDA and statistical analysis**, cleaning **0.39%** affected records and building daily/hourly datasets for business analysis.

2. Built an **hourly time-series forecasting pipeline** with **feature engineering, lag/rolling features, Random Forest, Gradient Boosting and ANN**, reaching **R² 0.66** and reducing MAE by **40%** versus a weekly-history baseline.

3. Benchmarked **ANN and LSTM** sequence models and added a **high-consumption classification** workflow, with Random Forest reaching **80% accuracy** on the time-based test period for energy-use alerts.

4. Used **K-Means clustering, SQL, Excel and Power BI-ready dashboards** to segment **723 daily load profiles into 3 usage patterns**, highlight a **22% weekend uplift**, and convert energy trends into practical sustainability actions.


---

## 👤 Author
**Nitin Kohli**

Built as an internship-style portfolio project covering **Data Analytics, Data Science, Machine Learning, Deep Learning, Time Series Forecasting, SQL, Excel, Power BI and Sustainability Analytics**.
