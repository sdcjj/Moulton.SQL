SELECT TOP 50 PERCENT * FROM table1  --取表50%的记录
SELECT * FROM table1 WHERE Name LIKE '_dmin'   --取第一个字符之后是dmin的记录
SELECT * FROM table1 WHERE Name LIKE '[ALN]%' --取以A或L或N开头的记录
SELECT * FROM table1 WHERE Name LIKE '[^ALN]%'  --取不以A或L或N开头的记录  
SELECT TOP 1 * FROM table1 ORDER BY NEWID()  --随机取一条记录
SELECT NAME FROM SYSCOLUMNS WHERE Id=OBJECT_ID('表名')  --获取所有列名 

SELECT * FROM
    (SELECT *,ROW_NUMBER() OVER(ORDER BY Id) AS rownum FROM table1) a 
     WHERE rownum BETWEEN 3 AND 5   --分页并排序1 MSSQL可用
SELECT * FROM
	(SELECT TOP 3 b.* FROM (SELECT TOP 5 Id FROM table1 ORDER BY Id) a,table1 b
	WHERE b.Id=a.Id  ORDER BY a.Id DESC) a ORDER BY Id  --分页并排序2 通用