-- ============================================================
-- Data Cleaning
-- Validation checks run before analysis to confirm the data is
-- clean, complete, and logically consistent.
-- ============================================================

-- 1. Duplicate rows
-- Finds items that appear more than once for the same company.
SELECT Company, Item, COUNT(*) AS n
FROM   menu
GROUP  BY Company, Item
HAVING COUNT(*) > 1;

-- 2. Null value check
-- Flags rows missing a key identifier or core metric.
SELECT *
FROM   menu
WHERE  COALESCE(Item, '') = ''
   OR  Calories IS NULL
   OR  Company IS NULL;

-- 3. Completely blank rows
-- Catches rows where every core field is empty.
SELECT *
FROM   menu
WHERE  COALESCE(Company, '')     = ''
  AND  COALESCE(Item, '')        = ''
  AND  COALESCE(Calories, '')    = ''
  AND  COALESCE(Total_Fat, '')   = ''
  AND  COALESCE(Sodium, '')      = ''
  AND  COALESCE(Cholesterol, '') = ''
  AND  COALESCE(Protein, '')     = '';

-- 4. Bad formatting in Calories
-- Surfaces any Calories value that is not a clean number.
SELECT *
FROM   menu
WHERE  Calories NOT REGEXP '^-?[0-9]+(\\.[0-9]+)?$';

-- 5. Logic checks
-- Flags values that break basic nutritional logic.
SELECT *
FROM   menu
WHERE  Calories < 0
   OR  Sodium   < 0
   OR  Protein  > Calories;
