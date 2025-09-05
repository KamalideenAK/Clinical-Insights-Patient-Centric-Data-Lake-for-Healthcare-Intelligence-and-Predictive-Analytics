CREATE EXTERNAL TABLE IF NOT EXISTS clinical.patient_admissions (
  patient_id string,
  admission_id string,
  admission_date date,
  discharge_date date,
  diagnosis string,
  department string
)
PARTITIONED BY (year int, month int, day int)
STORED AS PARQUET
LOCATION 's3://clinical-insights-curated-dev/admissions/';
