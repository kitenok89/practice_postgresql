/*delete from culture_palaces_clubs 
where "data.general.locale.name" <> 'Вологодская область'*/

/*CREATE EXTENSION postgis;

ALTER TABLE culture_data.culture_palaces_clubs
ADD COLUMN geom geometry(Point, 4326);*/

--select * from culture_palaces_clubs cpc 

/*UPDATE culture_data.culture_palaces_clubs
SET geom = ST_SetSRID(ST_GeomFromGeoJSON("data.general.address.mapPosition"::text), 4326)
WHERE "data.general.address.mapPosition" IS NOT NULL;*/

/*CREATE TABLE tags (
    id SERIAL PRIMARY KEY,
    tag_name VARCHAR(255) NOT NULL,
    tag_sysname VARCHAR(255) UNIQUE NOT NULL,
    description TEXT);
    
WITH extracted_tags AS (
    SELECT DISTINCT jsonb_array_elements("data.general.tags") AS tag
    FROM culture_data.culture_palaces_clubs
)
INSERT INTO tags (tag_name, tag_sysname)
SELECT tag->>'name', tag->>'sysName'
FROM extracted_tags
ON CONFLICT (tag_sysname) DO NOTHING;*/

/*CREATE TABLE m2m_culture_palaces_clubs_tags (
    culture_palace_club_id INTEGER NOT NULL,
    tag_id INTEGER NOT NULL,
    PRIMARY KEY (culture_palace_club_id, tag_id), 
    FOREIGN KEY (culture_palace_club_id) REFERENCES culture_data.culture_palaces_clubs("data.general.id") ON DELETE CASCADE,
    FOREIGN KEY (tag_id) REFERENCES tags(id) ON DELETE CASCADE);
    
INSERT INTO m2m_culture_palaces_clubs_tags (culture_palace_club_id, tag_id)
SELECT c."data.general.id"::integer, t.id
FROM culture_data.culture_palaces_clubs c
JOIN jsonb_array_elements(c."data.general.tags") AS tag_json ON TRUE
JOIN tags t ON tag_json->>'sysName' = t.tag_sysname;

CREATE INDEX idx_culture_palace_club_id ON m2m_culture_palaces_clubs_tags(culture_palace_club_id);
CREATE INDEX idx_tag_id ON m2m_culture_palaces_clubs_tags(tag_id);*/

