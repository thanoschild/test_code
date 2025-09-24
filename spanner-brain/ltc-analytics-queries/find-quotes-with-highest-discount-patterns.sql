-- Analyzes discount distribution across quotes and their eventual order outcomes.
GRAPH SalesforceGraph
MATCH (q:Quote)-[:HAS_LINE_ITEM]->(qli:QuoteLineItem)
FILTER q.Discount > 1000
WITH q, AVG(qli.Discount) AS AvgLineDiscount
OPTIONAL MATCH (q)-[:CONVERTS_TO]->(o:Order)
RETURN q.Name, q.Status, q.Discount AS TotalDiscount, AvgLineDiscount, o.Status AS OrderStatus
ORDER BY q.Discount DESC;
