CREATE TABLE IF NOT EXISTS `project_name.contact_raw.contact_table` (
  `contact_id` STRING,
  `first_name` STRING,
  `last_name` STRING,
  `email` STRING,
  `phone_number` STRING,
  `location` STRING,
  `age` INT64,
  `gender` STRING,
  `date_of_birth` DATE,
  `is_active` BOOL,
  `company` STRING,
  `job_title` STRING,
  `website` STRING,
  `source` STRING,
  `purpose` STRING,
  `created_at` TIMESTAMP,
  `updated_at` TIMESTAMP
);