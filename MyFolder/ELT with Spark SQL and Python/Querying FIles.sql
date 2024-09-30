-- Databricks notebook source
use catalog hive_metastore

-- COMMAND ----------

-- MAGIC %md
-- MAGIC <div  style="text-align: center; line-height: 0; padding-top: 9px;">
-- MAGIC <img src="https://github.com/Jarvisdatabricks/DatabricksAssociate/blob/master/Includes/bookstore_schema.png?raw=true" alt="Databricks Learning" style="width: 600">
-- MAGIC </div>

-- COMMAND ----------

-- MAGIC  %md
-- MAGIC  ## Querying JSON 

-- COMMAND ----------

-- MAGIC %run ../../Includes/Copy-Datasets

-- COMMAND ----------

-- MAGIC %python
-- MAGIC files = dbutils.fs.ls(f"{dataset_bookstore}/customers-json")
-- MAGIC display(files)

-- COMMAND ----------

SELECT * FROM json.`${dataset.bookstore}/customers-json/export_001.json`

-- COMMAND ----------

SELECT * FROM json.`${dataset.bookstore}/customers-json/export*.json`

-- COMMAND ----------

SELECT * FROM json.`${dataset.bookstore}/customers-json/`

-- COMMAND ----------

SELECT *,
 input_file_name() source_file
 FROM JSON.`${dataset.bookstore}/customers-json`;

-- COMMAND ----------

SELECT * FROM text.`${dataset.bookstore}/customers-json/`

-- COMMAND ----------

SELECT * FROM binaryFile.`${dataset.bookstore}/customers-json/`

-- COMMAND ----------

SELECT * FROM csv.`${dataset.bookstore}/books-csv/`

-- COMMAND ----------

CREATE TABLE books_csv
  (book_id STRING, title STRING, author STRING, category STRING, price DOUBLE)
USING CSV
OPTIONS (
  header = "true",
  delimiter = ";"
)
LOCATION "${dataset.bookstore}/books-csv"

-- COMMAND ----------

SELECT * FROM books_csv

-- COMMAND ----------

DESCRIBE EXTENDED books_csv

-- COMMAND ----------

CREATE TABLE customers AS
SELECT * FROM json.`${dataset.bookstore}/customers-json`;

-- COMMAND ----------

CREATE TABLE books_unparsed AS
SELECT * FROM csv.`${dataset.bookstore}/books-csv`;

SELECT * FROM books_unparsed;


-- COMMAND ----------

CREATE TABLE books AS
  SELECT * FROM books_tmp_vw;

