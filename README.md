# Bitcoin Cash Data Analysis Project

## Overview

This project focuses on analyzing Bitcoin Cash cryptocurrency data using Google Cloud services. The goal is to create a staging table and a data mart table and visualize the transaction trends. The project uses BigQuery as the primary data source and includes Python scripts for data processing and visualization.

## Google Cloud Project Credentials & Details 

 - The project uses a service account with credentials stored in the file: `astrafay-project-bc3a508fb204.json`.
 - Project details:
   - Project ID: `atrafay-project`
   - Dataset ID: `bitcoin_cash_data`

## BigQuery Tables

### Staging Table

- **Objective**: Table extracted from the raw table “transactions "transactions," selecting only the last three months of data.

- SQL Files:
  - `staging_table_creation.sql`
  - `staging_table_update.sql`

### Data Mart Table

- **Objective**: Table providing the current balance for all addresses, excluding those with at least one transaction on Coinbase.

- SQL Files:
  - `data_mart_creation.sql`
  - `data_mart_update.sql`

## Scheduled Queries

- Queries are set up as scheduled queries, executed every 48 hours.

## Python Script for Visualization

- A Google Colab notebook (`BigQueryDataAnalyzer.ipynb`) is provided with Python logic to plot a graph of daily transactions.

  - Python Class: The logic is encapsulated within a Python class.

The executed google collab can also be found at: https://colab.research.google.com/drive/1AE_EhQkBsucsoVTrdJLnJ-CeeN0YwQBn?usp=sharing

## Usage

3. **Scheduled Queries**

   - The scheduled queries are in charge that the information is up to date and the user does not have to interact with them as they are automatic.

4. **Python Script for Visualization**

   - Open the provided Google Colab notebook to visualize and analyze the data.
