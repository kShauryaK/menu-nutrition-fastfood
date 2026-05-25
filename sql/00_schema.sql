-- Schema for the `menu` table
-- Reconstructed from the columns referenced across the project queries.
-- Adjust column types to match how your data was actually loaded.

CREATE TABLE menu (
    Company             VARCHAR(100),   -- Restaurant chain name
    Item                VARCHAR(255),   -- Menu item name
    Calories            DECIMAL(8,2),   -- Total calories
    Total_Fat           DECIMAL(8,2),   -- Total fat (g)
    Saturated_Fat       DECIMAL(8,2),   -- Saturated fat (g)
    Cholesterol         DECIMAL(8,2),   -- Cholesterol (mg)
    Sodium              DECIMAL(8,2),   -- Sodium (mg)
    Sugars              DECIMAL(8,2),   -- Sugars (g)
    Fiber               DECIMAL(8,2),   -- Fiber (g)
    Protein             DECIMAL(8,2),   -- Protein (g)
    `Protein per 100cal` DECIMAL(8,2),  -- Protein density per 100 calories
    High_Cholesterol    TINYINT,        -- Flag: 1 if item is high cholesterol, else 0
    High_Sodium         TINYINT,        -- Flag: 1 if item is high sodium, else 0
    HealthScore         DECIMAL(8,2)    -- Composite health score
);
