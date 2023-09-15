-- CREATE TABLE credit_card_transactions (
--     "Time" INTEGER,
--     "V1" NUMERIC,
--     "V2" NUMERIC,
--     "V3" NUMERIC,
--     "V4" NUMERIC,
--     "V5" NUMERIC,
--     "V6" NUMERIC,
--     "V7" NUMERIC,
--     "V8" NUMERIC,
--     "V9" NUMERIC,
--     "V10" NUMERIC,
--     "V11" NUMERIC,
--     "V12" NUMERIC,
--     "V13" NUMERIC,
--     "V14" NUMERIC,
--     "V15" NUMERIC,
--     "V16" NUMERIC,
--     "V17" NUMERIC,
--     "V18" NUMERIC,
--     "V19" NUMERIC,
--     "V20" NUMERIC,
--     "V21" NUMERIC,
--     "V22" NUMERIC,
--     "V23" NUMERIC,
--     "V24" NUMERIC,
--     "V25" NUMERIC,
--     "V26" NUMERIC,
--     "V27" NUMERIC,
--     "V28" NUMERIC,
--     "Amount" NUMERIC,
--     "Class" INTEGER
-- );


-- ALTER TABLE credit_card_transactions
-- ALTER COLUMN "Amount" TYPE DECIMAL(10, 2);

-- ALTER TABLE credit_card_transactions
--     ALTER COLUMN "Time" TYPE DECIMAL,
--     ALTER COLUMN "V1" TYPE DECIMAL,
--     ALTER COLUMN "V2" TYPE DECIMAL,
--     ALTER COLUMN "V3" TYPE DECIMAL,
--     ALTER COLUMN "V4" TYPE DECIMAL,
--     ALTER COLUMN "V5" TYPE DECIMAL,
--     ALTER COLUMN "V6" TYPE DECIMAL,
--     ALTER COLUMN "V7" TYPE DECIMAL,
--     ALTER COLUMN "V8" TYPE DECIMAL,
--     ALTER COLUMN "V9" TYPE DECIMAL,
--     ALTER COLUMN "V10" TYPE DECIMAL,
--     ALTER COLUMN "V11" TYPE DECIMAL,
--     ALTER COLUMN "V12" TYPE DECIMAL,
--     ALTER COLUMN "V13" TYPE DECIMAL,
--     ALTER COLUMN "V14" TYPE DECIMAL,
--     ALTER COLUMN "V15" TYPE DECIMAL,
--     ALTER COLUMN "V16" TYPE DECIMAL,
--     ALTER COLUMN "V17" TYPE DECIMAL,
--     ALTER COLUMN "V18" TYPE DECIMAL,
--     ALTER COLUMN "V19" TYPE DECIMAL,
--     ALTER COLUMN "V20" TYPE DECIMAL,
--     ALTER COLUMN "V21" TYPE DECIMAL,
--     ALTER COLUMN "V22" TYPE DECIMAL,
--     ALTER COLUMN "V23" TYPE DECIMAL,
--     ALTER COLUMN "V24" TYPE DECIMAL,
--     ALTER COLUMN "V25" TYPE DECIMAL,
--     ALTER COLUMN "V26" TYPE DECIMAL,
--     ALTER COLUMN "V27" TYPE DECIMAL,
--     ALTER COLUMN "V28" TYPE DECIMAL,
--     ALTER COLUMN "Amount" TYPE DECIMAL(10, 2);


-- Import the CSV data into the table
-- COPY credit_card_transactions ("Time", "V1", "V2", "V3", "V4", "V5", "V6", "V7", "V8", "V9", "V10", "V11", "V12", "V13", "V14", "V15", "V16", "V17", "V18", "V19", "V20", "V21", "V22", "V23", "V24", "V25", "V26", "V27", "V28", "Amount", "Class") 
-- FROM 'C:\Users\sidne\OneDrive\Desktop\Documents\SQLite and Python\cust_segm_proj\cred_card_proj\creditcard.csv' 
-- DELIMITER ',' CSV HEADER

-- SELECT COUNT(*) FROM credit_card_transactions WHERE "Amount" IS NULL;

-- DELETE FROM credit_card_transactions WHERE "Amount" IS NULL;

-- SELECT "Amount", ( "Amount" - AVG("Amount") ) / NULLIF(STDDEV("Amount"), 0) AS z_score
-- FROM credit_card_transactions
-- GROUP BY "Amount"
-- HAVING ( "Amount" - AVG("Amount") ) / NULLIF(STDDEV("Amount"), 0) > 3;

-- SELECT "Class", COUNT(*) AS count
-- FROM credit_card_transactions
-- GROUP BY "Class";

-- SELECT AVG("Amount") AS mean_amount, MIN("Amount") AS min_amount, MAX("Amount") AS max_amount, STDDEV("Amount") AS std_amount
-- FROM credit_card_transactions;

-- COPY (
--    SELECT "Amount"
--    FROM credit_card_transactions
--    WHERE "Class" = 0 -- Select genuine transactions
-- ) TO 'C:\Users\sidne\OneDrive\Desktop\Documents\SQLite and Python\cust_segm_proj\cred_card_proj\cred_card_proj.csv' WITH CSV HEADER;

-- COPY (
--     SELECT EXTRACT(HOUR FROM TO_TIMESTAMP("Time")) AS hour, AVG("Amount") AS avg_amount
--     FROM credit_card_transactions
--     GROUP BY hour
--     ORDER BY hour
-- ) TO 'C:\Users\sidne\OneDrive\Desktop\Documents\SQLite and Python\cust_segm_proj\cred_card_proj\avg_trans_amt.csv' WITH CSV HEADER;

-- COPY (
--     SELECT corr("Amount", "V1") AS corr_amount_v1, corr("Amount", "V2") AS corr_amount_v2, corr("Amount", "V3") AS corr_amount_v3, corr("Amount", "V4") AS corr_amount_v4, corr("Amount", "V5") AS corr_amount_v5, corr("Amount", "V6") AS corr_amount_v6, corr("Amount", "V7") AS corr_amount_v7, corr("Amount", "V8") AS corr_amount_v8, corr("Amount", "V9") AS corr_amount_v9, corr("Amount", "V10") AS corr_amount_v10, corr("Amount", "V11") AS corr_amount_v11, corr("Amount", "V12") AS corr_amount_v12, corr("Amount", "V13") AS corr_amount_v13, corr("Amount", "V14") AS corr_amount_v14, corr("Amount", "V15") AS corr_amount_v15, corr("Amount", "V16") AS corr_amount_v16, corr("Amount", "V17") AS corr_amount_v17, corr("Amount", "V18") AS corr_amount_v18, corr("Amount", "V19") AS corr_amount_v19, corr("Amount", "V20") AS corr_amount_v20, corr("Amount", "V21") AS corr_amount_v21, corr("Amount", "V22") AS corr_amount_v22, corr("Amount", "V23") AS corr_amount_v23, corr("Amount", "V24") AS corr_amount_v24, corr("Amount", "V25") AS corr_amount_v25, corr("Amount", "V26") AS corr_amount_v26, corr("Amount", "V27") AS corr_amount_v27, corr("Amount", "V28") AS corr_amount_v28
--     FROM credit_card_transactions
-- )  TO 'C:\Users\sidne\OneDrive\Desktop\Documents\SQLite and Python\cust_segm_proj\cred_card_proj\corr_trans_amt.csv' WITH CSV HEADER;

-- SELECT COUNT(*) - COUNT("V28") AS missing_count
-- FROM credit_card_transactions;

-- ALTER TABLE credit_card_transactions
-- ADD COLUMN transaction_hour INTEGER;

-- UPDATE credit_card_transactions
-- SET transaction_hour = EXTRACT(HOUR FROM TO_TIMESTAMP("Time"));

SELECT * FROM credit_card_transactions LIMIT 25



