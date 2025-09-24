-- Order Item to Asset creation
CREATE TABLE OrderItemAsset (
  OrderItemId STRING(36),
  AssetId STRING(36),
  CreatedDate TIMESTAMP,
  FOREIGN KEY (OrderItemId) REFERENCES OrderItem (Id),
  FOREIGN KEY (AssetId) REFERENCES Asset (Id),
  PRIMARY KEY (OrderItemId, AssetId)
);