-- Order to Order Item relationship
CREATE TABLE OrderItems (
  OrderId STRING(36),
  OrderItemId STRING(36),
  CreatedDate TIMESTAMP,
  FOREIGN KEY (OrderId) REFERENCES "Order" (Id),
  FOREIGN KEY (OrderItemId) REFERENCES OrderItem (Id),
  PRIMARY KEY (OrderId, OrderItemId)
);