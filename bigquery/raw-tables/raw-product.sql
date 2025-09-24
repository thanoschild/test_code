CREATE OR REPLACE TABLE `project_name.raw_sourcetopay.product` (
  `product_id` STRING,
  `product_name` STRING,
  `product_sku` STRING,
  `category` STRING,
  `unit_price` NUMERIC,
  `is_active` BOOL,
  `stock_quantity` INT64,
  `created_at` TIMESTAMP,
  `updated_at` TIMESTAMP,
  `supplier_info` STRING,
  `_metadata_insert_time` TIMESTAMP,
  `_metadata_update_time` TIMESTAMP,
  `_metadata_deleted` STRING
);