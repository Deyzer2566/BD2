SELECT DISTINCT Н_ЛЮДИ.ИМЯ, Н_УЧЕНИКИ.ИД, foo.ИД FROM Н_УЧЕНИКИ
	INNER JOIN Н_ЛЮДИ ON Н_УЧЕНИКИ.ЧЛВК_ИД=Н_ЛЮДИ.ИД
	INNER JOIN (SELECT Н_ЛЮДИ.ИМЯ, Н_УЧЕНИКИ.ИД FROM Н_УЧЕНИКИ
	INNER JOIN Н_ЛЮДИ ON Н_УЧЕНИКИ.ЧЛВК_ИД=Н_ЛЮДИ.ИД) as foo ON Н_ЛЮДИ.ИМЯ=foo.ИМЯ AND Н_ЛЮДИ.ИД != foo.ИД
	ORDER BY ИМЯ;
