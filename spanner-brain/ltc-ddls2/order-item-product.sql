-- Order Item to Product relationship
CREATE TABLE OrderItemProduct (
  OrderItemId STRING(36),
  Product2Id STRING(36),
  Quantity INT64,
  FOREIGN KEY (OrderItemId) REFERENCES OrderItem (Id),
  FOREIGN KEY (Product2Id) REFERENCES Product2 (Id),
  PRIMARY KEY (OrderItemId, Product2Id)
);