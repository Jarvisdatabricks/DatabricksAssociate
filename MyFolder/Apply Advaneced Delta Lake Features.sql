-- Databricks notebook source
USE CATALOG hive_metastore

-- COMMAND ----------

DELETE FROM employees

-- COMMAND ----------

SELECT * FROM employees

-- COMMAND ----------

-- MAGIC %fs ls 'dbfs:/user/hive/warehouse/employees/'

-- COMMAND ----------

RESTORE TABLE employees TO VERSION AS OF 2

-- COMMAND ----------

select * from employees

-- COMMAND ----------

DESCRIBE HISTORY employees

-- COMMAND ----------

OPTIMIZE employees
ZORDER BY (id)

-- COMMAND ----------

describe detail employees

-- COMMAND ----------

DESCRIBE HISTORY employees

-- COMMAND ----------

-- MAGIC %fs ls 'dbfs:/user/hive/warehouse/employees'

-- COMMAND ----------

vacuum employees

-- COMMAND ----------

select * from employees@v1

-- COMMAND ----------

select * from employees@v2
