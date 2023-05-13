SELECT ГРУППА as Группа, CAST(AVG(DATE_PART('year',AGE(НАЧАЛО,ДАТА_РОЖДЕНИЯ))+КУРС-1) as int) AS "Средний возраст"
FROM Н_УЧЕНИКИ
	INNER JOIN Н_ЛЮДИ ON Н_ЛЮДИ.ИД=Н_УЧЕНИКИ.ЧЛВК_ИД
	INNER JOIN Н_ПЛАНЫ ON Н_ПЛАНЫ.ИД = Н_УЧЕНИКИ.ИД
	GROUP BY ГРУППА
	HAVING CAST(AVG(DATE_PART('year',AGE(НАЧАЛО,ДАТА_РОЖДЕНИЯ))+КУРС-1) as int) =
	(SELECT MIN(DATE_PART('year',AGE(НАЧАЛО,ДАТА_РОЖДЕНИЯ))+КУРС-1) FROM
		Н_УЧЕНИКИ INNER JOIN Н_ЛЮДИ ON Н_УЧЕНИКИ.ЧЛВК_ИД = Н_ЛЮДИ.ИД
		INNER JOIN Н_ПЛАНЫ ON Н_УЧЕНИКИ.ПЛАН_ИД = Н_ПЛАНЫ.ИД
		WHERE ГРУППА = '3100' AND НАЧАЛО > ДАТА_РОЖДЕНИЯ
	);
