SELECT P.NAME AS ACTOR_COLLAB_WITH_SPIELBERG
FROM PERSON P
WHERE P.PID IN (SELECT A.PID
               FROM ACTOR A, DIRECTOR D
               WHERE D.MID=A.MID AND D.PID IN (SELECT P1.PID
                                               FROM PERSON P1
                                               WHERE P1.NAME='Steven Spielberg')
               HAVING COUNT(*)=(SELECT MAX(COUNT) 
                                FROM (SELECT COUNT(*) AS COUNT 
                                      FROM ACTOR A, DIRECTOR D
                                      WHERE D.MID=A.MID AND D.PID IN (SELECT P.PID
                                                                      FROM PERSON P
                                                                      WHERE P.NAME='Steven Spielberg')
                                GROUP BY A.PID))
                GROUP BY A.PID);

