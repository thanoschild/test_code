CREATE OR REPLACE TABLE `project_name.stg_sourcetopay.stg_invoice` (
  `invoice_id` INT64,
  `invoice_number` STRING,
  `customer_id` INT64,
  `invoice_date` DATE,
  `due_date` DATE,
  `total_amount` NUMERIC,
  `status` STRING,
  `payment_terms` STRING,
  `created_at` TIMESTAMP,
  `updated_at` TIMESTAMP,
  `_metadata_insert_time` TIMESTAMP
);