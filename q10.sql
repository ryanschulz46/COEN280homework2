-- Ryan Schulz
-- Assignment2
-- COEN 280 Spring 2019
SELECT DISTINCT P.NAME AS DAMON_NUM_2_ACTORS
FROM ACTOR ACTOR, PERSON P
WHERE  P.PID=ACTOR.PID AND NOT P.NAME='Matt Damon' AND ACTOR.MID IN (SELECT ACTOR1.MID
                                FROM ACTOR ACTOR1
                                WHERE ACTOR1.PID IN (SELECT ACTOR2.PID
                                                 FROM ACTOR ACTOR2
                                                 WHERE ACTOR2.MID IN(SELECT ACTOR3.MID
                                                                 FROM ACTOR ACTOR3
                                                                 WHERE ACTOR3.PID=(SELECT P.PID
																	FROM PERSON P
																	WHERE P.NAME='Matt Damon'))))
																	MINUS
																		SELECT P.NAME
																		FROM ACTOR ACTOR, PERSON P
																		WHERE P.PID=ACTOR.PID AND ACTOR.MID IN (SELECT ACTOR1.MID
                               																			FROM ACTOR ACTOR1
                                																		WHERE ACTOR1.MID IN (SELECT ACTOR2.MID
                                                																		FROM ACTOR ACTOR2
                                                 																		WHERE ACTOR2.PID=(SELECT P.PID
                                                               																		FROM PERSON P
                                                               																		WHERE P.NAME='Matt Damon')));	
	
	
