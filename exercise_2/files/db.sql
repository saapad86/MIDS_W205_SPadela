create database tcount;
\c tcount;
CREATE TABLE tweetwordcount (
	word varchar(100) PRIMARY KEY,
	word_count int NOT NULL
	);