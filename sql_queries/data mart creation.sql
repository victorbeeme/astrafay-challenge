CREATE OR REPLACE TABLE astrafay-project.bitcoin_cash_data.data_mart AS
SELECT
  COALESCE(o.address, i.address) AS address,
  COALESCE(total_output_value, 0) - COALESCE(total_input_value, 0) AS balance
FROM (
  SELECT
    address,
    SUM(output.value) AS total_output_value
  FROM
    `astrafay-project.bitcoin_cash_data.staging_table`,
    UNNEST(outputs) AS output,
    UNNEST(output.addresses) AS address
  WHERE
    NOT is_coinbase
  GROUP BY
    address
) o
FULL OUTER JOIN (
  SELECT
    address,
    SUM(input.value) + SUM(fee) AS total_input_value
  FROM
    `astrafay-project.bitcoin_cash_data.staging_table`,
    UNNEST(inputs) AS input,
    UNNEST(input.addresses) AS address
  WHERE
    NOT is_coinbase
  GROUP BY
    address
) i
ON
  o.address = i.address
WHERE
  COALESCE(total_output_value, 0) - COALESCE(total_input_value, 0) <> 0;
