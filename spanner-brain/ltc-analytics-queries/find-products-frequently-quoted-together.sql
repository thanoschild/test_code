-- Traverses from products through quote line items to find co-occurrence patterns.
GRAPH SalesforceGraph  
MATCH (p1:Product)-[:QUOTED_AS]->(qli1:QuoteLineItem)-[:BELONGS_TO]->(q:Quote)
MATCH (q)<-[:BELONGS_TO]-(qli2:QuoteLineItem)<-[:QUOTED_AS]-(p2:Product)
FILTER p1.Id <> p2.Id
RETURN p1.Name AS Product1, p2.Name AS Product2, COUNT(q) AS QuotesCount
GROUP BY p1, p2
ORDER BY QuotesCount DESC
LIMIT 10;
