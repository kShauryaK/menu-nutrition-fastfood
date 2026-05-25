# Data

The clean dataset lives directly inside `../sql/01_seed_data.sql` as `INSERT`
statements, so the project runs entirely from SQL. This folder keeps the
original source files for reference.

## Files

| File | Description |
|------|-------------|
| `raw/FastFoodNutritionMenuV2.csv` | Original Kaggle source data. |
| `raw/FastFoodNutritionMenuV3.csv` | Original Kaggle source data. |
| `raw/cleaned_workbook.xlsx` | The Excel workbook where the team cleaned the data and built the health score. |

## Source

The raw data comes from the Fast Food Nutrition Menu dataset on Kaggle.

## Cleaning summary

The team cleaned the raw Kaggle data before loading it into SQL:

1. Removed rows that had no values.
2. Replaced `<1` entries with 0.
3. Filled blank cells with 0 (except Weight Watchers points).
4. Corrected inconsistent store names.

A composite `HealthScore` was then computed, along with `High Sodium` and
`High Cholesterol` flags and a `Protein per 100cal` field. The final 976 rows
are loaded by `../sql/01_seed_data.sql`.
