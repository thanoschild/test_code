-- Product to Pricing relationship
CREATE TABLE ProductPricing (
  Product2Id STRING(36),
  PricebookEntryId STRING(36),
  CreatedDate TIMESTAMP,
  FOREIGN KEY (Product2Id) REFERENCES Product2 (Id),
  FOREIGN KEY (PricebookEntryId) REFERENCES PricebookEntry (Id),
  PRIMARY KEY (Product2Id, PricebookEntryId)
);