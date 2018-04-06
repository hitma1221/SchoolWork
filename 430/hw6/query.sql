CREATE OR REPLACE TRIGGER studentRemove
BEFORE DELETE ON STUDENT
REFERENCING OLD as oldGuy NEW as newGuy
FOR EACH ROW
BEGIN
	DELETE FROM taking
	WHERE studentnum = :oldGuy.studentnum;
END;
/

DELETE *
FROM STUDENT NATURAL JOIN TAKING NATURAL JOIN CLASS
WHERE DEPTARTMENT = 'CMPSC' AND NUM = 463;



CREATE TABLE AUDIT_TRAIL (
	NAME VARCHAR(255),
	TIME_STAMP = TIMESTAMP,
	STUDENTNUM = int,
	DEPARTMENT = VARCHAR(255),
	OLD_GRADE = NUMERIC(2,1),
	NEW_GRADE = NUMERIC(2,1),
);




CREATE OR REPLACE TRIGGER GRADEREC
AFTER UPDATE OF GRADE ON TAKING
REFERENCING OLD AS OLDROW NEW AS NEWROW
FOR EACH ROW WHEN (OLDROW.GRADE <> NEWROW.GRADE)
BEGIN
	INSERT INTO TRAIL VALUES(USER, SYSTIMESTAMP, :NEWROW.STUDENTNUM, 
		(SELECT DEPARTMENT FROM CLASS WHERE SCHEDULENUM = :NEWROW.SCHEDULENUM), 
		(SELECT NUM FROM CLASS WHERE SCHEDULENUM = :NEWROW.SCHEDULENUM),
		 :OLDROW.GRADE, :NEWROW.GRADE);
END;
/

UPDATE TAKING,
SET GRADE = 0,
WHERE STUDENTNUM = 1;

CREATE OR REPLACE TRIGGER PREVENTGPA
AFTER INSERT OR DELETE OR UPDATE ON TAKING
	DECLARE
		AVGGRADE NUMERIC(2,1);
	BEGIN
		SELECT AVG(GRADE) INTO AVGGRADE
		FROM TAKING;
		IF AVGgRADE < 3 THEN
			RAISE_APPLICATION_ERROR(-99999, 'GPA BELOW 3.0');
		END IF;
	END;
/
INSERT INTO TAKING (STUDENTNUM, SCHEDULENUM, SEMESTER, GRADE)
VALUES(0, 100, 'S18', 0.0);


UPDATE TAKING
SET GRADE = 0;

DELETE FROM STUDENT
WHERE STUDENTNUM IN (SELECT STUDENTNUM FROM STUDENT NATURAL JOIN TAKING WHERE GRADE >= 3);


