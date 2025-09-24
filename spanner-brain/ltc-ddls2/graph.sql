CREATE PROPERTY GRAPH SalesforceGraph
NODE TABLES (
  Product2 KEY (Id) LABEL Product,
  PricebookEntry KEY (Id) LABEL PricingEntry,
  Quote KEY (Id) LABEL Quote,
  QuoteLineItem KEY (Id) LABEL QuoteLineItem,
  "Order" KEY (Id) LABEL Order,
  OrderItem KEY (Id) LABEL OrderItem,
  Asset KEY (Id) LABEL Asset,
  Account KEY (Id) LABEL Account
)
EDGE TABLES (
  ProductPricing
    SOURCE KEY (Product2Id) REFERENCES Product2 (Id)
    DESTINATION KEY (PricebookEntryId) REFERENCES PricebookEntry (Id)
    LABEL HAS_PRICING,
    
  QuoteLineItems
    SOURCE KEY (QuoteId) REFERENCES Quote (Id)
    DESTINATION KEY (QuoteLineItemId) REFERENCES QuoteLineItem (Id)
    LABEL HAS_LINE_ITEM,
    
  QuoteItemProduct
    SOURCE KEY (Product2Id) REFERENCES Product2 (Id)
    DESTINATION KEY (QuoteLineItemId) REFERENCES QuoteLineItem (Id)
    LABEL QUOTED_AS,
    
  OrderItems
    SOURCE KEY (OrderId) REFERENCES "Order" (Id)
    DESTINATION KEY (OrderItemId) REFERENCES OrderItem (Id)
    LABEL HAS_ORDER_ITEM,
    
  OrderItemProduct
    SOURCE KEY (Product2Id) REFERENCES Product2 (Id)
    DESTINATION KEY (OrderItemId) REFERENCES OrderItem (Id)
    LABEL FOR_PRODUCT,
    
  QuoteOrderConversion
    SOURCE KEY (QuoteId) REFERENCES Quote (Id)
    DESTINATION KEY (OrderId) REFERENCES "Order" (Id)
    LABEL CONVERTS_TO,
    
  QuoteLineToOrderItem
    SOURCE KEY (QuoteLineItemId) REFERENCES QuoteLineItem (Id)
    DESTINATION KEY (OrderItemId) REFERENCES OrderItem (Id)
    LABEL BECOMES_ORDER_ITEM,
    
  OrderItemAsset
    SOURCE KEY (OrderItemId) REFERENCES OrderItem (Id)
    DESTINATION KEY (AssetId) REFERENCES Asset (Id)
    LABEL CREATES_ASSET,
    
  AssetProduct
    SOURCE KEY (Product2Id) REFERENCES Product2 (Id)
    DESTINATION KEY (AssetId) REFERENCES Asset (Id)
    LABEL BASED_ON_PRODUCT,
    
  AccountAsset
    SOURCE KEY (AccountId) REFERENCES Account (Id)
    DESTINATION KEY (AssetId) REFERENCES Asset (Id)
    LABEL OWNS_ASSET
);
