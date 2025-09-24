-- Account table (customers/organizations)
CREATE TABLE Account (
  Id STRING(36),
  Name STRING(255),
  Type STRING(100),
  Industry STRING(100),
  CreatedDate TIMESTAMP,
  LastModifiedDate TIMESTAMP,
  PRIMARY KEY (Id)
);