# Fast Food Menu Nutrition Analysis (SQL)

A SQL project analyzing the nutritional profile of fast food menu items across major chains. Built for a 1 credit MBA course. The project loads a clean menu dataset, runs validation checks, then ranks chains and individual items on health metrics such as calories, protein density, sodium, and a composite health score.

## What this project does

The entire working pipeline is SQL, run in order:

1. **Schema.** Create the `menu` table.
2. **Seed.** Load all 976 menu items with `INSERT` statements.
3. **Data cleaning.** Validation queries that check for duplicate rows, missing values, blank rows, bad formatting, and values that break basic nutritional logic.
4. **Analysis.** Queries that compare chains on average health metrics and rank the best and worst individual menu items.

## Repository structure

```
.
├── README.md
├── LICENSE
├── data/
│   ├── README.md          Source and cleaning notes
│   └── raw/               Original Kaggle files and the cleaning workbook
└── sql/
    ├── 00_schema.sql       Create the menu table
    ├── 01_seed_data.sql    Load the 976 rows of data
    ├── 02_data_cleaning.sql   Validation and quality checks
    └── 03_analysis.sql        Ranking and comparison queries
```

## The dataset

All queries run on a single table called `menu`: 976 menu items across 6 chains (McDonalds, KFC, Burger King, Wendys, Taco Bell, Pizza Hut). Each row is one item with its nutrition facts plus a few derived fields: a composite health score, high sodium and high cholesterol flags, and protein per 100 calories.

The raw data comes from the Fast Food Nutrition Menu dataset on Kaggle. The team cleaned it, then computed the health score and flags. The data now lives directly inside `sql/01_seed_data.sql`, so the project runs entirely from SQL. The original source files are kept in `data/raw` for reference. See `data/README.md` for the source and cleaning steps.

## How to run it

Run the SQL files in order:

```
00_schema.sql  ->  01_seed_data.sql  ->  02_data_cleaning.sql  ->  03_analysis.sql
```

The queries use MySQL syntax (`REGEXP`, backtick quoting). Minor tweaks may be needed for other engines.

## Key analyses

| Query | Question it answers |
|-------|---------------------|
| Chain level performance | Which chains score best on average health? |
| Top 10 items | Which individual items are the healthiest? |
| Bottom 10 items | Which items score worst? |
| High cholesterol vs high sodium | How does each chain compare on flagged items? |
| Protein per 100 calories | Which chains offer the most protein dense food? |

## Authors

Add your team members here.

## License

Released under the MIT License. See `LICENSE`.
