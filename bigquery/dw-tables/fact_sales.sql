CREATE OR REPLACE TABLE project_name.dw_sourcetopay.dw_sales (
    invoice_id INT64,
    customer_id STRING,
    product_id STRING,
    invoice_date DATE,
    due_date DATE,
    quantity INT64,
    unit_price NUMERIC,
    line_total NUMERIC,
    payment_amount NUMERIC,
    payment_date DATE,
    payment_method STRING,
    status STRING,
    updated_at TIMESTAMP
)
PARTITION BY
    invoice_date
CLUSTER BY
    customer_id, product_id;
