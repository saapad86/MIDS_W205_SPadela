
#Q1
# The data for a managed table is stored in the hive data warehouse directory. When this table is dropped, all of the data is deleted. Conversely, when creating an external table, hive only stores the metadata.

#Q2
# No, if an external table is dropped, only the metadata is lost. The external data file remains intact.

#Q3
# ORC was introduced as a successor to RC, a better way to store data for fast-access and with better compression. ORC data has a stripe structure (with index data), allowing for better predicate filtering.

#Q4
# They are both widely used, with minor differences in cost to create vs. query access time. However, if using Impala you must use Parquet files.

#Q5
# Parquet involves column-level compression specifications, vs. file-level compression for ORC. This allows for flexibility as future compression algorithms are invented.


-- SQL Code is below. This was run using the SOURCE command in Hive.
LOAD DATA LOCAL INPATH '/data/weblog_lab.csv'
OVERWRITE INTO TABLE Web_Session_Log;


CREATE TABLE Web_Session_Log_Managed
(
	DATETIME varchar(500),
	USERID varchar(500),
	SESSIONID varchar(500),
	PRODUCTID varchar(500),
	REFERERURL varchar(500)
)
row format delimited
fields terminated by '\t'
stored as textfile;

CREATE EXTERNAL TABLE IF NOT EXISTS Web_Session_Log_External
(
	DATETIME varchar(500),
	USERID varchar(500),
	SESSIONID varchar(500),
	PRODUCTID varchar(500),
	REFERERURL varchar(500)
)
row format delimited
fields terminated by '\t'
stored as textfile
LOCATION '/data/Lab3_Ext.txt'
;

CREATE Table ORCFileFormatExample
(
	DATETIME varchar(500),
	USERID varchar(500),
	SESSIONID varchar(500),
	PRODUCTID varchar(500),
	REFERERURL varchar(500)
) COMMENT 'This is the Web Session Log data'
row format delimited
fields terminated by '\t'
stored as ORC tablproperties("orc.compress"="ZLIB")
;

CREATE Table ParqFileFormatExample
(
	DATETIME varchar(500),
	USERID varchar(500),
	SESSIONID varchar(500),
	PRODUCTID varchar(500),
	REFERERURL varchar(500)
) COMMENT 'This is the Web Session Log data'
row format delimited
fields terminated by '\t'
stored as parquet
;

