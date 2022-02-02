CREATE TABLE IF NOT EXISTS "foods" (
	"id"	TEXT NOT NULL UNIQUE,
	"type"	TEXT,
	"assetImgPath"	TEXT,
	"assetImgSourceUrl"	TEXT,
	"assetImgInfo"	TEXT,
	PRIMARY KEY("id")
);
CREATE TABLE IF NOT EXISTS "regions" (
	"id"	TEXT NOT NULL UNIQUE,
	"fallbackRegion"	TEXT,
	"assetPath"	TEXT,
	FOREIGN KEY("fallbackRegion") REFERENCES regions(id),
	PRIMARY KEY("id")
);
CREATE VIEW foods_full AS
SELECT f.id, f.type, f.assetImgPath, f.assetImgInfo, f.assetImgSourceUrl, fr.region_id, fr.is_common, fr.avLocal, fr.avLand, fr.avSea, fr.avAir
FROM foods AS f
INNER JOIN food_region_availability AS fr ON f.id == fr.food_id
/* foods_full(id,type,assetImgPath,assetImgInfo,assetImgSourceUrl,region_id,is_common,avLocal,avLand,avSea,avAir) */;
CREATE TABLE IF NOT EXISTS "food_region_availability" (
	"food_id"	TEXT NOT NULL,
	"region_id"	TEXT NOT NULL DEFAULT 'CE',
	"is_common"	INT,
	"avLocal"	TEXT,
	"avLand"	TEXT,
	"avSea"	TEXT,
	"avAir"	TEXT,
	FOREIGN KEY("food_id") REFERENCES foods(id),
	FOREIGN KEY("region_id") REFERENCES regions(id),
	UNIQUE ("food_id","region_id"),
	PRIMARY KEY("food_id","region_id")
);
