# Power BI Dashboard Guide

## Dashboard name
**Household Energy Intelligence - Consumption & Forecasting**

### Page 1 - Energy Overview
- KPI cards: usable days, average daily kWh, weekend uplift, missing-rate
- Daily energy trend
- Average hourly load
- Month / weekday / weekend slicers

### Page 2 - Forecasting
- Actual vs predicted hourly energy
- Model comparison (MAE, RMSE, R2)
- Feature importance

### Page 3 - Sustainability Patterns
- Weekday vs weekend energy
- Daily usage clusters
- Peak-hour callout
- High-consumption day count

## Import these files
- `01_Data/processed/daily_energy.csv`
- `01_Data/processed/hourly_energy.csv`
- `01_Data/processed/model_results.csv`
- `01_Data/processed/cluster_profiles.csv`

## Simple DAX
```DAX
Avg Daily Energy = AVERAGE(daily_energy[daily_kwh])

Weekend Uplift % =
VAR WeekdayEnergy = CALCULATE([Avg Daily Energy], daily_energy[is_weekend] = 0)
VAR WeekendEnergy = CALCULATE([Avg Daily Energy], daily_energy[is_weekend] = 1)
RETURN DIVIDE(WeekendEnergy - WeekdayEnergy, WeekdayEnergy)
```

Power BI Desktop is required to save a real `.pbix` file, so this repository provides the ready data + layout rather than pretending a PBIX was generated here.
