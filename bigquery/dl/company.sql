CREATE TABLE `smart-pr.legal_analytics_dl.company` (
  company_id STRING(50) NOT NULL,
  company_name STRING(255) NOT NULL,
  industry STRING(100),
  headquarters_location STRING(200),
  annual_revenue NUMERIC(15,2),
  employee_count INT64,
  incorporation_date DATE,
  company_status STRING(20),
  created_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP(),
  last_updated_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP(),
  _metadata_insert_time TIMESTAMP
);