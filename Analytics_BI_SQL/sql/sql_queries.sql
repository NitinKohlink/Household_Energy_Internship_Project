-- Household Energy Internship Project
-- Simple queries for recruiter/interview walkthroughs.

SELECT AVG(daily_kwh) AS avg_daily_kwh
FROM daily_energy;

SELECT dayofweek, AVG(daily_kwh) AS avg_kwh
FROM daily_energy
GROUP BY dayofweek
ORDER BY avg_kwh DESC;

SELECT date, daily_kwh
FROM daily_energy
ORDER BY daily_kwh DESC
LIMIT 10;

SELECT hour, AVG(energy_kwh) AS avg_hourly_kwh
FROM hourly_energy
GROUP BY hour
ORDER BY avg_hourly_kwh DESC;

SELECT model, MAE_kWh, RMSE_kWh, R2
FROM model_results
ORDER BY MAE_kWh ASC;

SELECT date, daily_kwh,
       AVG(daily_kwh) OVER (ORDER BY date ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) AS rolling_7d_kwh
FROM daily_energy
ORDER BY date;
