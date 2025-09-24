CREATE OR REPLACE TABLE `project_name.dl_sourcetopay.dl_payment` (
  `payment_id` STRING,
  `invoice_id` INT64,
  `payment_date` DATE,
  `payment_method` STRING,
  `amount` NUMERIC,
  `transaction_id` STRING,
  `status` STRING,
  `created_at` TIMESTAMP,
  `updated_at` TIMESTAMP,
  `customer_notes` STRING,
  `_metadata_insert_time` TIMESTAMP
)
