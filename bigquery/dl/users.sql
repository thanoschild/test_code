CREATE TABLE `project_name.helix_agiloft_dl.users` (
  user_id STRING(50) NOT NULL,
  company_id STRING(50) NOT NULL,
  username STRING(100) NOT NULL,
  email_address STRING(255) NOT NULL,
  first_name STRING(100),
  last_name STRING(100),
  role STRING(50),
  department STRING(100),
  is_active BOOLEAN DEFAULT TRUE,
  created_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP(),
  last_active_date DATE,
  last_login_timestamp TIMESTAMP,
  _metadata_insert_time TIMESTAMP
);