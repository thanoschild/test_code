CREATE OR REPLACE TABLE `project_name.dl_sourcetopay.dl_invoice_line` (
    `invoice_line_id` INT64,
    `invoice_id` INT64,
    `product_id` STRING,
    `description` STRING,
    `quantity` INT64,
    `unit_price` NUMERIC,
    `line_total` NUMERIC,
    `created_at` TIMESTAMP,
    `updated_at` TIMESTAMP,
    `notes` STRING,
  `_metadata_insert_time` TIMESTAMP
);