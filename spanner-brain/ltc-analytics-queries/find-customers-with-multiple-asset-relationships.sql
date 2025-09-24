-- Discovers customers (accounts) with complex asset portfolios and their interconnected products.
GRAPH SalesforceGraph
MATCH (account:Account)-[:OWNS_ASSET]->(a:Asset)<-[:CREATES_ASSET]-(oi:OrderItem)-[:FOR_PRODUCT]->(p:Product)
WITH account, COUNT(DISTINCT a) AS AssetCount, COUNT(DISTINCT p) AS UniqueProducts
FILTER AssetCount > 5
RETURN account.Name AS CustomerName, AssetCount, UniqueProducts
ORDER BY AssetCount DESC;
