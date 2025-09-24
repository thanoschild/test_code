CREATE OR REPLACE PROCEDURE project_name.dw_sourcetopay.sp_dw_sales (
    last_run_timestamp TIMESTAMP
)
BEGIN
  -- Create a temporary table to stage the new and updated data
  CREATE OR REPLACE TEMPORARY TABLE temp_dw_sales AS
  SELECT
      t1.invoice_id,
      t1.customer_id,
      t2.product_id,
      t1.invoice_date,
      t1.due_date,
      t2.quantity,
      t2.unit_price,
      t2.line_total,
      t3.amount AS payment_amount,
      t3.payment_date,
      t3.payment_method,
      t1.status,
      t1.updated_at
  FROM
      `project_name.raw_sourcetopay.invoice` AS t1
  INNER JOIN
      `project_name.raw_sourcetopay.invoice_line` AS t2
  ON
      t1.invoice_id = t2.invoice_id
  LEFT JOIN
      `project_name.raw_sourcetopay.payment` AS t3
  ON
      t1.invoice_id = t3.invoice_id
  WHERE
      t1.updated_at > last_run_timestamp
      OR t2.updated_at > last_run_timestamp
      OR t3.updated_at > last_run_timestamp;

  -- Use a MERGE statement to incrementally update the dw table
  MERGE INTO project_name.dw_sourcetopay.dw_sales AS T
  USING temp_dw_sales AS S
  ON T.invoice_id = S.invoice_id
  WHEN MATCHED AND T.updated_at < S.updated_at THEN
    UPDATE SET
      customer_id = S.customer_id,
      product_id = S.product_id,
      invoice_date = S.invoice_date,
      due_date = S.due_date,
      quantity = S.quantity,
      unit_price = S.unit_price,
      line_total = S.line_total,
      payment_amount = S.payment_amount,
      payment_date = S.payment_date,
      payment_method = S.payment_method,
      status = S.status,
      updated_at = S.updated_at
  WHEN NOT MATCHED THEN
    INSERT (
        invoice_id, customer_id, product_id, invoice_date, due_date, quantity, unit_price,
        line_total, payment_amount, payment_date, payment_method, status, updated_at
    )
    VALUES (
        S.invoice_id, S.customer_id, S.product_id, S.invoice_date, S.due_date, S.quantity,
        S.unit_price, S.line_total, S.payment_amount, S.payment_date, S.payment_method, S.status, S.updated_at
    );
END;
