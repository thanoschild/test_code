-- Asset to Product relationship
CREATE TABLE AssetProduct (
  AssetId STRING(36),
  Product2Id STRING(36),
  CreatedDate TIMESTAMP,
  FOREIGN KEY (AssetId) REFERENCES Asset (Id),
  FOREIGN KEY (Product2Id) REFERENCES Product2 (Id),
  PRIMARY KEY (AssetId, Product2Id)
);