# Data Dictionary

| Column | Meaning | Unit / Type |
|---|---|---|
| Date | Reading date | DD/MM/YYYY |
| Time | Reading time | HH:MM:SS |
| Global_active_power | Average household active power for the minute | kW |
| Global_reactive_power | Average household reactive power | kW |
| Voltage | Average voltage | V |
| Global_intensity | Average current intensity | A |
| Sub_metering_1 | Energy used by sub-meter 1 | Wh |
| Sub_metering_2 | Energy used by sub-meter 2 | Wh |
| Sub_metering_3 | Energy used by sub-meter 3 | Wh |

## Project-created fields
- `daily_kwh`: daily energy = sum of minute active power / 60.
- `coverage_pct`: available minute records / 1440 * 100.
- `hour`: hour of day.
- `dayofweek`: Monday=0 ... Sunday=6.
- `is_weekend`: 1 for Saturday/Sunday.
- `lag_1`, `lag_24`, `lag_168`: previous time steps used for forecasting.
- `rolling_24`, `rolling_168`: rolling mean using past observations only.
