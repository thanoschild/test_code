-- Quote to Line Item relationship  
CREATE TABLE QuoteLineItems (
  QuoteId STRING(36),
  QuoteLineItemId STRING(36),
  CreatedDate TIMESTAMP,
  FOREIGN KEY (QuoteId) REFERENCES Quote (Id),
  FOREIGN KEY (QuoteLineItemId) REFERENCES QuoteLineItem (Id),
  PRIMARY KEY (QuoteId, QuoteLineItemId)
);