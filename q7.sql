-- Ryan Schulz
-- Assignment2
-- COEN 280 Spring 2019
SELECT  DISTINCT P_MALE.Name AS M_ACTOR, P_FEMALE.Name AS F_ACTOR, COUNT(*)/39 AS COUNT
FROM PERSON P_MALE, PERSON P_FEMALE, ACTOR MALE_ACT, ACTOR FEMALE_ACT, MOVIE M
WHERE P_MALE.GENDER = 'M'
	AND P_FEMALE.GENDER = 'F'
	AND MALE_ACT.PID = P_MALE.PID
	AND FEMALE_ACT.PID = P_FEMALE.PID
	AND FEMALE_ACT.MID = MALE_ACT.MID
GROUP BY P_MALE.Name, P_FEMALE.Name
HAVING COUNT(*) > 39;