-- Complete lifecycle traversal showing how products move through sales stages to become customer assets.
GRAPH SalesforceGraph
MATCH lifecycle = (p:Product)-[:QUOTED_AS]->(qli:QuoteLineItem)-[:BELONGS_TO]->(q:Quote)-[:CONVERTS_TO]->(o:Order)-[:HAS_ORDER_ITEM]->(oi:OrderItem)-[:CREATES_ASSET]->(a:Asset)
FILTER a.Status = 'Installed'
RETURN p.Name AS ProductName, q.CreatedDate AS QuoteDate, o.CreatedDate AS OrderDate, a.InstallDate, a.SerialNumber
ORDER BY a.InstallDate DESC
LIMIT 20;
