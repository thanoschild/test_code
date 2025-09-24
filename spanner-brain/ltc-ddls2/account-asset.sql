-- Account ownership relationships
CREATE TABLE AccountAsset (
  AccountId STRING(36),
  AssetId STRING(36),
  OwnershipDate TIMESTAMP,
  FOREIGN KEY (AccountId) REFERENCES Account (Id),
  FOREIGN KEY (AssetId) REFERENCES Asset (Id),
  PRIMARY KEY (AccountId, AssetId)
);