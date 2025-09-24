CREATE TABLE PricebookEntry (
  Id STRING(36),
  Pricebook2Id STRING(36),
  Product2Id STRING(36),
  UnitPrice FLOAT64,
  IsActive BOOL,
  CurrencyIsoCode STRING(255),
  CreatedDate TIMESTAMP,
  LastModifiedDate TIMESTAMP,
  IsArchived BOOL,
  Name STRING(255),
  PRIMARY KEY (Id)
);
