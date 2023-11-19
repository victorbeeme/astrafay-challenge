INSERT INTO astrafay-project.bitcoin_cash_data.staging_table
SELECT
  *
FROM
  `bigquery-public-data.crypto_bitcoin_cash.transactions`
WHERE
  TIMESTAMP(block_timestamp) >= TIMESTAMP(DATE_ADD(CURRENT_DATE(), INTERVAL -3 MONTH));