
	DROP TABLE BEST_STATES;
	CREATE TABLE BEST_STATES AS
	SELECT
	t1.STATE,
	count(distinct t2.PROVIDER_ID) as num_hospitals,
	avg(case when t2.score > 100 then 100 else t2.score end) as avg_score
	FROM HOSPITAL t1
	INNER JOIN MEASURE t2
	on t1.PROVIDER_ID = t2.PROVIDER_ID
	GROUP BY t1.STATE
	ORDER BY AVG_SCORE DESC;
