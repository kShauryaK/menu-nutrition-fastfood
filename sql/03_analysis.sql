-- ============================================================
-- Analysis
-- Queries that compare chains and rank items on health metrics.
-- ============================================================

-- 1. Chain level performance (averages)
-- Average health and nutrition metrics per company, best first.
SELECT Company,
       COUNT(*)                     AS items,
       ROUND(AVG(HealthScore), 2)   AS avg_health_score,
       ROUND(AVG(Calories), 1)      AS avg_calories,
       ROUND(AVG(Protein), 1)       AS avg_protein,
       ROUND(AVG(Saturated_Fat), 1) AS avg_sat_fat,
       ROUND(AVG(Sodium), 0)        AS avg_sodium,
       ROUND(AVG(Sugars), 1)        AS avg_sugars
FROM   menu
GROUP  BY Company
ORDER  BY avg_health_score DESC;

-- 2. Bottom 10 performing items
-- Lowest health score items across all chains.
SELECT Company, Item, HealthScore, Calories, Saturated_Fat, Sodium, Sugars
FROM   menu
ORDER  BY HealthScore ASC
LIMIT  10;

-- 3. Top 10 performing items
-- Highest health score items across all chains.
SELECT Company, Item, HealthScore, Calories, Protein, Fiber, Sodium
FROM   menu
ORDER  BY HealthScore DESC
LIMIT  10;

-- 4. Chain performance: high cholesterol vs high sodium
-- Share of each chain's items flagged high cholesterol or high sodium.
SELECT
    Company,
    ROUND(AVG(High_Cholesterol) * 100, 1) AS avg_high_chol_pct,
    ROUND(AVG(High_Sodium) * 100, 1)      AS avg_high_sodium_pct,
    ROUND(AVG(Calories), 1)               AS avg_calories,
    ROUND(AVG(`Protein per 100cal`), 2)   AS avg_protein_per_100cal,
    ROUND(AVG(Sugars), 1)                 AS avg_sugars
FROM menu
GROUP BY Company
ORDER BY avg_high_chol_pct DESC;

-- 5. Health score ranking
-- Top 10 items ranked purely by health score.
SELECT Company, Item, HealthScore
FROM   menu
ORDER  BY HealthScore DESC
LIMIT  10;

-- 6. Protein per 100 calories
-- Protein density per company, most protein dense first.
SELECT Company,
       ROUND(SUM(Protein) / SUM(Calories) * 100, 2) AS protein_per_100cal
FROM   menu
GROUP  BY Company
ORDER  BY protein_per_100cal DESC;
