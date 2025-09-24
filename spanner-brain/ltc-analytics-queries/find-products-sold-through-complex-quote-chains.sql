-- Uses variable-length pattern matching to discover products that appear in multi-level quote structures.
GRAPH SalesforceGraph
MATCH paths = (p:Product)-[:QUOTED_AS]->{1,3}(qli:QuoteLineItem)-[:BELONGS_TO]->(q:Quote)
FILTER q.Status IN ['Accepted', 'Converted']
WITH p, COUNT(DISTINCT q) AS QuoteAppearances, AVG(ARRAY_LENGTH(paths)) AS AvgPathLength
FILTER QuoteAppearances > 10
RETURN p.Name, p.Family, QuoteAppearances, AvgPathLength
ORDER BY QuoteAppearances DESC;
