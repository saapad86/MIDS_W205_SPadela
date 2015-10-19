DROP TABLE stg_hospitals;
CREATE EXTERNAL TABLE stg_hospitals (
	PROVIDER_ID varchar(8),
	HOSPITAL_NAME varchar(32),
	ADDRESS varchar(100),
	CITY varchar(32),
	STATE varchar(4),
	ZIP_CD varchar(7),
	COUNTY_NAME varchar(32),
	PHONE_NBR varchar(12),
	TYPE_CD varchar(20),
	OWNER_TYPE_CD varchar(100),
	EMERGENCY_CD varchar(20)
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/hospitals/';

DROP TABLE stg_care;
CREATE EXTERNAL TABLE stg_care (
	PROVIDER_ID varchar(8),
	HOSPITAL_NAME varchar(32),
	ADDRESS varchar(100),
	CITY varchar(32),
	STATE varchar(4),
	ZIP_CD varchar(7),
	COUNTY_NAME varchar(32),
	PHONE_NBR varchar(12),
	CONDITION_DESC varchar(100),
	MEASURE_ID varchar(24),
	MEASURE_NAME varchar(200),
	SCORE varchar(100),
	SAMPLE varchar(32),
	FOOTNOTE varchar(200),
	MEASURE_START_DT varchar(12),
	MEASURE_END_DT varchar(12)
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/care/';

DROP TABLE stg_readmissions;
CREATE EXTERNAL TABLE stg_readmissions (
	PROVIDER_ID varchar(8),
	HOSPITAL_NAME varchar(32),
	ADDRESS varchar(100),
	CITY varchar(32),
	STATE varchar(4),
	ZIP_CD varchar(7),
	COUNTY_NAME varchar(32),
	PHONE_NBR varchar(12),
	MEASURE_NAME varchar(200),
	MEASURE_ID varchar(24),
	COMPARED_TO_NATIONAL varchar(100),
	DENOMINATOR varchar(32),
	SCORE varchar(100),
	LOWER_ESTIMATE varchar(32),
	HIGHER_ESTIMATE varchar(32),
	FOOTNOTE varchar(200),
	MEASURE_START_DT varchar(12),
	MEASURE_END_DT varchar(12)
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'   
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/readmissions/';

DROP TABLE stg_dates;
CREATE EXTERNAL TABLE stg_dates (
	MEASURE_NAME varchar(200),
	MEASURE_ID varchar(24),
	MEASURE_START_QTR varchar(8),
	MEASURE_START_DT varchar(12),
	MEASURE_END_QTR varchar(8),
	MEASURE_END_DT varchar(12)
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/dates/';

DROP TABLE stg_surveys;
CREATE EXTERNAL TABLE stg_surveys (
	PROVIDER_ID varchar(8),
	HOSPITAL_NAME varchar(100),
	ADDRESS varchar(100),
	CITY varchar(32),
	STATE varchar(4),
	ZIP_CD varchar(7),
	COUNTY_NAME varchar(32),
	COMM_NURSES_AP varchar(15),
	COMM_NURSES_IP varchar(15),
	COMM_NURSES_DS varchar(15),
	COMM_DOCS_AP varchar(15),
	COMM_DOCS_IP varchar(15),
	COMM_DOCS_DS varchar(15),
	RESP_STAFF_AP varchar(15),
	RESP_STAFF_IP varchar(15),
	RESP_STAFF_DS varchar(15),
	PAIN_AP varchar(15),
	PAIN_IP varchar(15),
	PAIN_DS varchar(15),
	COMM_DRUG_AP varchar(15),
	COMM_DRUG_IP varchar(15),
	COMM_DRUG_DS varchar(15),
	CLEAN_AP varchar(15),
	CLEAN_IP varchar(15),
	CLEAN_DS varchar(15),
	DISCH_AP varchar(15),
	DISCH_IP varchar(15),
	DISCH_DS varchar(15),
	OVR_AP varchar(15),
	OVR_IP varchar(15),
	OVR_DS varchar(15),
	HCAHPS_BASE_SCORE varchar(15),
	HCAHPS_CONS_SCORE varchar(15)
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/surveys/';