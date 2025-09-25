CREATE OR REPLACE TABLE `project_name.stg_sourcetopay.stg_customer` (
  `customer_id` STRING,
  `first_name` STRING,
  `last_name` STRING,
  `email` STRING,
  `phone_number` STRING,
  `website` STRING,
  `address` STRUCT<street STRING, city STRING, state STRING, postal_code STRING, country STRING>,
  `created_at` TIMESTAMP,
  `updated_at` TIMESTAMP,
  `is_active` BOOL,
  `marketing_opt_in` BOOL,
  `_metadata_insert_time` TIMESTAMP
);