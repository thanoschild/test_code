-- Quote to Order conversion relationship
CREATE TABLE QuoteOrderConversion (
  QuoteId STRING(36),
  OrderId STRING(36),
  ConversionDate TIMESTAMP,
  FOREIGN KEY (QuoteId) REFERENCES Quote (Id),
  FOREIGN KEY (OrderId) REFERENCES "Order" (Id),
  PRIMARY KEY (QuoteId, OrderId)
);