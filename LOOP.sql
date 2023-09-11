DECLARE @num int=0
WHILE(@num<12)
BEGIN
	IF @num=3 
		print '';
	ELSE IF @num=7
		BREAK
	ELSE
		select concat('num=',@num)
	SET @num=@num+1
END


