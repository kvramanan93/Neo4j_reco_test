// Create Task nodes
CREATE (t15:Task {name: "Task15"});
CREATE (t19:Task {name: "Task19"});

// Create Area nodes
CREATE (area2:Area {name: "Area2"});

// Create AnnotatedToken nodes
CREATE (annotatedToken8:AnnotatedToken {name: "AnnotatedToken8"});

// Create Tag nodes
CREATE (blog:Tag {name: "blog"});
CREATE (post:Tag {name: "post"});
CREATE (neo4jTag:Tag {name: "neo4j"});
CREATE (prepareTag:Tag {name: "prepare"});
CREATE (workshopTag:Tag {name: "workshop"});
CREATE (salsaTag:Tag {name: "salsa"});
CREATE (classTag:Tag {name: "class"});

// Create Node nodes
CREATE (neo4jRecomm:Node {name: "neo4j recomm..."});
CREATE (neo4jWorkshop:Node {name: "neo4j workshop"});
CREATE (neo4jWorkshopPrepare:Node {name: "neo4j workshop prepare"});
CREATE (prepareSalsaWorkshop:Node {name: "prepare salsa workshop"});
CREATE (salsaClass:Node {name: "salsa class"});

// Create Domain nodes
CREATE (consulting:Domain {name: "consulting"});
CREATE (skills:Domain {name: "skills"});

// Create HAS_TAG relationships
CREATE (blog)-[:HAS_TAG]->(t15);
CREATE (post)-[:HAS_TAG]->(t19);
CREATE (neo4jTag)-[:HAS_TAG]->(neo4jRecomm);
CREATE (neo4jTag)-[:HAS_TAG]->(neo4jWorkshop);
CREATE (neo4jTag)-[:HAS_TAG]->(neo4jWorkshopPrepare);
CREATE (prepareTag)-[:HAS_TAG]->(neo4jWorkshopPrepare);
CREATE (prepareTag)-[:HAS_TAG]->(prepareSalsaWorkshop);
CREATE (workshopTag)-[:HAS_TAG]->(neo4jWorkshop);
CREATE (workshopTag)-[:HAS_TAG]->(neo4jWorkshopPrepare);
CREATE (workshopTag)-[:HAS_TAG]->(prepareSalsaWorkshop);
CREATE (salsaTag)-[:HAS_TAG]->(prepareSalsaWorkshop);
CREATE (salsaTag)-[:HAS_TAG]->(salsaClass);
CREATE (classTag)-[:HAS_TAG]->(salsaClass);

// Create BELONGS_TO relationships
CREATE (neo4jRecomm)-[:BELONGS_TO]->(consulting);
CREATE (neo4jWorkshop)-[:BELONGS_TO]->(consulting);
CREATE (neo4jWorkshopPrepare)-[:BELONGS_TO]->(consulting);
CREATE (prepareSalsaWorkshop)-[:BELONGS_TO]->(skills);
CREATE (salsaClass)-[:BELONGS_TO]->(skills);
