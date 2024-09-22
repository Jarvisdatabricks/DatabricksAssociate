-- Databricks notebook source
use catalog hive_metastore

-- COMMAND ----------

CREATE TABLE IF NOT EXISTS smartphones
(id INT, name STRING, brand STRING, year INT);
