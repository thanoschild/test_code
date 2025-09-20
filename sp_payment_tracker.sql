create or replace procedure `project_name.payment_set_dw.sp_payment_tracker`(
    IN dag_id STRING,
    IN p_from_delta STRING,
    IN p_to_delta STRING
)

BEGIN
  BEGIN;
  
  MERGE `project_name.payment_set_dw.dw_payment_tracker` T
  USING(
      SELECT 
      CONCAT(user_name, '-', event_data, '-', region) AS integration_id,
      user_name,
      event_data,
      amount,
      currency,
      payment_method,
      status,
      region,
      updated_at
      FROM `project_name.payment_set_raw.payment_tracker` 
      WHERE updated_at BETWEEN p_from_delta AND p_to_delta
  ) S
  ON T.integration_id = S.integration_id
  WHEN MATCHED THEN
      UPDATE SET
      T.user_name = S.user_name,
      T.event_data = S.event_data,
      T.amount = S.amount,
      T.currency = S.currency,
      T.payment_method = S.payment_method,
      T.status = S.status,
      T.region = S.region,
      T.updated_at = S.updated_at
  WHEN NOT MATCHED THEN
      INSERT (
          integration_id,
          user_name,
          event_data,
          amount,
          currency,
          payment_method,
          status,
          region,
          updated_at
      )
      VALUES (
          S.integration_id,
          S.user_name,
          S.event_data,
          S.amount,
          S.currency,
          S.payment_method,
          S.status,
          S.region,
          S.updated_at
      );

  COMMIT;

EXCEPTION WHEN ERROR THEN
  ROLLBACK;
  -- Log error details or re-raise as needed
  RAISE;

END;