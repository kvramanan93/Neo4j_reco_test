WITH['workshop','neo4j'] AS param_token_list

// step 1: total count
MATCH (:Task)-[r:HAS_TAG]->(: AnnotatedToken)
WITH count(r) AS count_total, param_token_list

// step 2: find areas
MATCH (token: AnnotatedToken)<-[:HAS_TAG]-(:Task)-[: BELONGS_TO]->(area: Area)
WHERE token.lemma IN param_token_list
WITH DISTINCT area, count_total, param_token_list

// step 3: size of each area
MATCH (area)<-[: BELONGS_TO]-(:Task)-[r:HAS_TAG]->(:AnnotatedToken)
WITH area, count(r) AS count_area, count_total, param_token_list

UNWIND param_token_list AS param_token

// step 4: number of assignments for (area, token) combinations
MATCH (token: AnnotatedToken (lemma: param_token})
OPTIONAL MATCH (area)<-[: BELONGS_TO]-()-[r:HAS_TAG]->(token)

WITH area, token, count(r) AS count_token_area, count_area, count_total
WITH *, CASE
WHEN count_token_area = 0 THEN 0.1 / count_area
WHEN count_token_area > 0 THEN toFloat(count_token_area) /count_area 
END AS posterior

RETURN area.string, collect(posterior) AS posteriors, apoc.agg.product(posterior)*count_area/count_total AS score 
ORDER BY score DESC;
