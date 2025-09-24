CREATE TABLE Product2 (
  Id STRING(36),
  Name STRING(255),
  ProductCode STRING(100),
  Description STRING(255),
  Family STRING(255),
  IsActive BOOL,
  StockKeepingUnit STRING(100),
  CreatedDate TIMESTAMP,
  LastModifiedDate TIMESTAMP,
  IsArchived BOOL,
  PRIMARY KEY (Id)
);
