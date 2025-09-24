CREATE TABLE `project_name.helix_agiloft_stg.non_standard_orders` (
  order_id STRING(50) NOT NULL,
  contract_id STRING(50) NOT NULL,
  company_id STRING(50) NOT NULL,
  order_description STRING(500),
  order_amount NUMERIC(12,2),
  payment_type STRING(50),
  order_date DATE,
  approval_status STRING(30),
  approval_required_by DATE,
  special_terms STRING(1000),
  created_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP(),
  last_updated_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP(),
  _metadata_insert_time TIMESTAMP
);