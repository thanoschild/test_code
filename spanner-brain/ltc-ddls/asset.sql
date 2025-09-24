CREATE TABLE Asset (
  Id STRING(36),
  Name STRING(255),
  AccountId STRING(36),
  Product2Id STRING(36),
  SerialNumber STRING(100),
  Status STRING(50),
  PurchaseDate TIMESTAMP,
  Quantity INT64,
  Price FLOAT64,
  InstallDate TIMESTAMP,
  PRIMARY KEY (Id)
);
