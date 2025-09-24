-- Quote Line Item to Order Item conversion
CREATE TABLE QuoteLineToOrderItem (
  QuoteLineItemId STRING(36),
  OrderItemId STRING(36),
  ConversionDate TIMESTAMP,
  FOREIGN KEY (QuoteLineItemId) REFERENCES QuoteLineItem (Id),
  FOREIGN KEY (OrderItemId) REFERENCES OrderItem (Id),
  PRIMARY KEY (QuoteLineItemId, OrderItemId)
);