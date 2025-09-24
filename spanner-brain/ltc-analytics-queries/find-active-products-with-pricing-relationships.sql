-- Uses MATCH to traverse from Product nodes to their pricing entries, filtering for active items.
GRAPH SalesforceGraph
MATCH (p:Product)-[:HAS_PRICING]->(pe:PricingEntry)
FILTER p.IsActive = TRUE AND pe.IsActive = TRUE
RETURN p.Name, p.ProductCode, pe.UnitPrice, pe.CurrencyIsoCode
ORDER BY pe.UnitPrice DESC;
