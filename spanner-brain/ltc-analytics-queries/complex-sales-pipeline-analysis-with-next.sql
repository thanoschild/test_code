-- Chains multiple linear queries to analyze sales performance across different stages using the NEXT statement.
GRAPH SalesforceGraph
MATCH (p:Product)-[:QUOTED_AS]->(qli:QuoteLineItem)-[:BELONGS_TO]->(q:Quote)
FILTER q.CreatedDate >= '2024-01-01'
RETURN p, COUNT(q) AS QuoteCount, AVG(q.GrandTotal) AS AvgQuoteValue
GROUP BY p
NEXT
MATCH (p)-[:CREATES_ASSET]->(a:Asset)
FILTER a.Status = 'Active'
RETURN p.Name AS ProductName, QuoteCount, AvgQuoteValue, COUNT(a) AS ActiveAssets
ORDER BY QuoteCount DESC
LIMIT 15;
