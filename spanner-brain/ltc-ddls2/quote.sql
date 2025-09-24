-- Quote table (sales proposals)
CREATE TABLE Quote (
  Id STRING(36),
  Name STRING(255),
  OpportunityId STRING(36),
  AccountId STRING(36),
  Status STRING(50),
  Subtotal FLOAT64,
  Discount FLOAT64,
  GrandTotal FLOAT64,
  ExpirationDate TIMESTAMP,
  CreatedDate TIMESTAMP,
  PRIMARY KEY (Id)
);