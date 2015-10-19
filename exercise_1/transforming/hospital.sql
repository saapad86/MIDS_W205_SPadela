DROP TABLE HOSPITAL;
CREATE TABLE HOSPITAL(
	PROVIDER_ID INT,
	HOSPITAL_NAME STRING,
	ADDRESS STRING,
	CITY STRING,
	STATE STRING,
	ZIP_CD STRING,
	COUNTY_NAME STRING,
	PHONE_NBR STRING,
	TYPE_CD STRING,
	OWNER_TYPE_CD STRING,
	EMERGENCY_CD STRING	
)
COMMENT 'Hospital Data'
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS ORC;
	
INSERT OVERWRITE TABLE HOSPITAL 
SELECT 
PROVIDER_ID,
HOSPITAL_NAME,
ADDRESS,
CITY,
STATE,
ZIP_CD,
COUNTY_NAME,
PHONE_NBR,
TYPE_CD,
OWNER_TYPE_CD,
EMERGENCY_CD
FROM STG_HOSPITALS;