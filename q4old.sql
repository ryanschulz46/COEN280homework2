-- Ryan Schulz
-- Assignment2
-- COEN 280 Spring 2019
SELECT P.NAME AS ACTOR_COLLAB_WITH_SPIELBERG
FROM PERSON P
WHERE P.PID = (SELECT MAX(A.PID)
               FROM ACTOR A
               WHERE A.MID IN (SELECT D.MID
                               FROM DIRECTOR D
                               WHERE D.PID IN (SELECT P1.PID
                                               FROM PERSON P1
                                               WHERE P1.NAME='Steven Spielberg')));