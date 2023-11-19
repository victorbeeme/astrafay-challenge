CREATE or REPLACE TABLE astrafay-project.bitcoin_cash_data.staging_table AS
SELECT
 *
FROM
  `bigquery-public-data.crypto_bitcoin_cash.transactions`
WHERE
  TIMESTAMP(block_timestamp) >= TIMESTAMP(DATE_ADD(CURRENT_DATE(), INTERVAL -3 MONTH));