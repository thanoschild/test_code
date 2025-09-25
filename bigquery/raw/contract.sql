CREATE TABLE `smart-pr.legal_analytics_raw.contract` (
  contract_id STRING(50) NOT NULL,
  company_id STRING(50) NOT NULL,
  contract_name STRING(300) NOT NULL,
  contract_type STRING(50),
  contract_value NUMERIC(15,2),
  start_date DATE,
  end_date DATE,
  contract_status STRING(30),
  renewal_required BOOLEAN DEFAULT FALSE,
  created_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP(),
  last_updated_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP(),
  `_metadata_insert_time` TIMESTAMP,
  `_metadata_update_time` TIMESTAMP,
  `_metadata_deleted` STRING
);