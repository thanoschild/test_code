CREATE TABLE QuoteLineItem (
  Id STRING(36),
  QuoteId STRING(36),
  Product2Id STRING(36),
  Quantity INT64,
  SalesPrice FLOAT64,
  Discount FLOAT64,
  Subtotal FLOAT64,
  TotalPrice FLOAT64,
  CreatedDate TIMESTAMP,
  LastModifiedDate TIMESTAMP,
  PRIMARY KEY (Id)
);
