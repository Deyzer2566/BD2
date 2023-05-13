SELECT ПЛАН_ИД FROM Н_ГРУППЫ_ПЛАНОВ INNER JOIN (
	SELECT Н_ПЛАНЫ.ИД FROM Н_ПЛАНЫ INNER JOIN Н_ОТДЕЛЫ
		ON Н_ОТДЕЛЫ.ИД=Н_ПЛАНЫ.ОТД_ИД
		WHERE Н_ОТДЕЛЫ.КОРОТКОЕ_ИМЯ = 'КТиУ') AS ПЛАНЫ_ФКТИУ ON ПЛАН_ИД=ИД GROUP BY ПЛАН_ИД HAVING COUNT(ГРУППА)=2;
