from awsglue.context import GlueContext
from pyspark.context import SparkContext
from pyspark.sql.functions import col, year, month, dayofmonth, to_date

sc = SparkContext()
glueContext = GlueContext(sc)
spark = glueContext.spark_session

df = spark.read.format("awsdatacatalog") \
    .option("catalogDatabase", "clinical_data_lake") \
    .option("catalogTable", "patient_admissions") \
    .load()

df_clean = df.dropna(subset=["patient_id"]) \
             .withColumn("admission_date", to_date("admission_date","yyyy-MM-dd"))

(df_clean
  .withColumn("year", year(col("admission_date")))
  .withColumn("month", month(col("admission_date")))
  .withColumn("day", dayofmonth(col("admission_date")))
  .write.mode("append")
  .partitionBy("year","month","day")
  .parquet("s3://clinical-insights-curated-${env}/admissions/"))
