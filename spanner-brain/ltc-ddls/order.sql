CREATE TABLE "Order" (
  Id STRING(36),
  Name STRING(255),
  AccountId STRING(36),
  OpportunityId STRING(36),
  Status STRING(50),
  TotalAmount FLOAT64,
  EffectiveDate TIMESTAMP,
  Type STRING(255),
  CreatedDate TIMESTAMP,
  LastModifiedDate TIMESTAMP,
  PRIMARY KEY (Id)
);
