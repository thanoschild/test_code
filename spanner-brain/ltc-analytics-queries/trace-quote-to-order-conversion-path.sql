-- Multi-hop traversal from quotes through line items to orders, analyzing conversion success.
GRAPH SalesforceGraph
MATCH path = (q:Quote)-[:HAS_LINE_ITEM]->(qli:QuoteLineItem)-[:BECOMES_ORDER_ITEM]->(oi:OrderItem)-[:BELONGS_TO_ORDER]->(o:Order)
FILTER q.Status = 'Presented' AND o.Status = 'Activated'
RETURN q.Name AS QuoteName, o.Name AS OrderName, q.GrandTotal AS QuoteTotal, o.TotalAmount AS OrderTotal
ORDER BY q.CreatedDate DESC;
