CREATE TABLE `project_name.helix_agiloft_raw.clauses` (
  clause_id STRING(50) NOT NULL,
  contract_id STRING(50) NOT NULL,
  clause_type STRING(100) NOT NULL,
  clause_title STRING(300),
  clause_text STRING(5000),
  is_standard_clause BOOLEAN DEFAULT FALSE,
  compliance_required BOOLEAN DEFAULT FALSE,
  effective_date DATE,
  expiration_date DATE,
  created_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP(),
  last_updated_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP(),
  `_metadata_insert_time` TIMESTAMP,
  `_metadata_update_time` TIMESTAMP,
  `_metadata_deleted` STRING
);