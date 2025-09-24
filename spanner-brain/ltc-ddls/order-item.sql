CREATE TABLE OrderItem (
  Id STRING(36),
  OrderId STRING(36),
  Product2Id STRING(36),
  Quantity INT64,
  UnitPrice FLOAT64,
  TotalPrice FLOAT64,
  QuoteLineItemId STRING(36),
  StartDate TIMESTAMP,
  EndDate TIMESTAMP,
  CreatedDate TIMESTAMP,
  PRIMARY KEY (Id)
);
