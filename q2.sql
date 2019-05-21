-- Ryan Schulz
-- Assignment2
-- COEN 280 Spring 2019
SELECT director.Name AS DIRECTOR_NAME, movies_directed.Num AS NUM_MOVIES_DIRECTED
FROM (
	SELECT P.PID AS PID, P.NAME AS Name
	FROM PERSON P
	WHERE P.JOB_TYPE = 'Director'
	) director,
	(
	SELECT M.Director_ID AS DID, COUNT(*) AS Num
	FROM MOVIE M
	GROUP BY M.Director_ID
	HAVING COUNT(*) > 4
	) movies_directed
WHERE movies_directed.DID = director.PID
ORDER BY movies_directed.Num DESC;
