-- Quote Line Item to Product relationship
CREATE TABLE QuoteItemProduct (
  QuoteLineItemId STRING(36),
  Product2Id STRING(36),
  Quantity INT64,
  FOREIGN KEY (QuoteLineItemId) REFERENCES QuoteLineItem (Id),
  FOREIGN KEY (Product2Id) REFERENCES Product2 (Id),
  PRIMARY KEY (QuoteLineItemId, Product2Id)
);