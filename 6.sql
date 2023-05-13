SELECT ГРУППА, Н_УЧЕНИКИ.ИД, ИМЯ, ФАМИЛИЯ, ОТЧЕСТВО, П_ПРКОК_ИД AS "НОМЕР ПРИКАЗА", СОСТОЯНИЕ FROM
	Н_УЧЕНИКИ INNER JOIN Н_ЛЮДИ ON Н_УЧЕНИКИ.ЧЛВК_ИД=Н_ЛЮДИ.ИД
	where ПЛАН_ИД in (
		select Н_ПЛАНЫ.ИД from Н_ПЛАНЫ
			INNER JOIN Н_НАПРАВЛЕНИЯ_СПЕЦИАЛ ON Н_ПЛАНЫ.НАПС_ИД=Н_НАПРАВЛЕНИЯ_СПЕЦИАЛ.ИД
			INNER JOIN Н_НАПР_СПЕЦ ON Н_НАПР_СПЕЦ.ИД = НС_ИД
			INNER JOIN Н_ФОРМЫ_ОБУЧЕНИЯ ON Н_ПЛАНЫ.ФО_ИД = Н_ФОРМЫ_ОБУЧЕНИЯ.ИД
			WHERE Н_НАПР_СПЕЦ.КОД_НАПРСПЕЦ='230101' AND Н_ФОРМЫ_ОБУЧЕНИЯ.НАИМЕНОВАНИЕ IN ('Очная','Заочная'))
	AND НАЧАЛО < '01-09-2012';