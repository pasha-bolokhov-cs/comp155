
CREATE OR REPLACE PROCEDURE change_weight 
(check_breed IN VARCHAR2, new_wt IN NUMBER)
AS
BEGIN
	UPDATE dogs
	SET wt =  new_wt
	WHERE UPPER(breed) = UPPER(check_breed);
END;
/