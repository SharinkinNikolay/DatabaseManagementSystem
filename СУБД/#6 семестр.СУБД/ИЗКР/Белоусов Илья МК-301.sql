#1).Выбрать из таблицы Groups названия групп и номера курсов (поля Name_group, Name_course) и отсортировать результат по полю Name_course по убыванию
SELECT Name_group, Name_course FROM Groups ORDER BY Name_course DESC; +

#2). Вывести список фамилий (поле Surname), имен (поле Name), отчеств (поле Lastname) студентов из таблицы Students и названий групп (поле Name_group) из таблицы Groups, в которых они обучаются.
SELECT Students.Surname, Students.Name, Students.Lastname, Groups.Name_group FROM Students INNER JOIN Groups ON Students.Code_group=Groups.Code_group; +

#3). Вывести даты экзаменов (поле Date_exam) из таблицы Progress и названия дисциплин (поле Name_subject) из таблицы Subjects, по которым сдавали экзамены в указанные даты.
SELECT Progress.Date_exam, Subjects.Name_subject FROM Progress INNER JOIN Subjects ON Progress.Code_subject = Subjects.Code_subject; +(Дубли)

#4). Вывести список преподавателей (поле Name_lector) из таблицы Lectors с ученой степенью кандидат каких-либо наук, т.е. у которых значение поля Science начинается с ‘к’.
SELECT Name_lector FROM Lectors WHERE Science LIKE "к%"; +

#5). Вывести список преподавателей (поле Name_lector) из таблицы Lectors и их должности (поле Post), которые не являются докторами технических наук, т.е. значение поля Science не равно ‘д.т.н.’.
SELECT Name_lector, Post FROM Lectors WHERE Sciens NOT LIKE "д.т.н."; +(зачем LIKE?)

#6). Вывести даты экзаменов (поле Date_exam) из таблицы Progress и список дисциплин (поле Name_subject) из таблицы Subjects, по которым сдавали экзамены в период с 01.01.2003 по 01.02.2003 (условие по полю Date_exam).
SELECT Progress.Date_exam, Subjects.Name_Subject FROM Progress INNER JOIN Subjects ON Progress.Code_subject = Subjects.Code_subject WHERE Progress.Date_exam between '01.01.2003' AND '01.02.2003'; +(Дубли)

#7). Вывести список преподавателей (поле Name_lector) из таблицы Lectors и их должности (поле Post), у которых есть одна из следующих ученых степеней: ‘к.т.н.’, ‘к.э.н.’, ‘д.т.н.’ (условие по полю Science).
SELECT Name_LectOR, Post FROM Lectors WHERE Science LIKE 'к.т.н.' OR Science LIKE 'к.э.н.' OR Science LIKE 'д.т.н.'; +(Зачем LIKE)

#8). Вывести список студентов (поля Surname, Name, Lastname) из таблицы Students, которые сдавали экзамены по дисциплинам со следующими кодами 5, 8, 12, 25 (условие по полю Code_subject).
SELECT Students.Surname, Students.Name, Students.LastName FROM Students INNER JOIN Progress ON Students.Code_stud = Progress.Code_stud WHERE Progress.Code_subjects in (5, 8, 12, 25); -

#9). Выбрать список групп (поле Name_group) из таблицы Groups, у которых значение оканчивается на ‘0’ (ноль).
SELECT Name_group FROM Groups WHERE Name_group LIKE "%0"; +

#10). Вывести список групп (поле Name_group) и номера курсов (поле Num_course) из таблицы Groups, в которых учатся студенты с датами рождения с 01.01.1976 по 01.01.1978 (условие по полю Birthday из таблицы Students) и кодами из диапазона 10 – 150 (условие по полю Code_stud из таблицы Students).
SELECT Groups.Name_group, Groups.Num_course FROM Groups INNER JOIN Students ON Students.Birthday BETWEEN '01.01.1976' AND '01.01.1978' AND Students.Code_stud BETWEEN 10 AND 15; -(150?)

#11). Вывести список названий дисциплин (поле Name_subject из таблицы Subjects) и имен преподавателей (поле Name_lector из таблицы Lectors), которые принимали по этим дисциплинам экзамены.
SELECT DISTINCT Subjects.Name_subject, Lectors.Name_lector FROM Subjects INNER JOIN Lectors INNER JOIN Progress ON Subjects.Code_subject = Progress.Code_subject AND Lectors.Code_lectOR = Progress.Code_LectOR;  +

#12). Вывести список имен преподавателей (поле Name_lector из таблицы Lectors), которые принимали экзамены у студентов с кодами групп 10, 12, 15 (условие по полю Code_group из таблицы Students).
SELECT DISTINCT Lectors.Name_lector FROM Lectors INNER JOIN Students INNER JOIN Progress ON Lectors.Code_stud = Students.Code_stud WHERE Students.Code_group = 10 OR Students.Code_group = 12  OR Students.Code_group = 1; -

#13). Вывести список всех преподавателей (Name_lector), их ученые степени (поле Science) и срок их работы в годах (использовать поле Date_ из таблицы Lectors).
SELECT DISTINCT Name_lector, Science, EXTRACT(YEAR FROM CURDATE()) - EXTRACT(YEAR FROM Date_) FROM Lectors; +

#14). Вывести список всех студентов (поля Surname, Name, Lastname из таблицы Students) и номер курса, на котором они занимаются, а также количество лет оставшейся учебы (использовать поле Num_course из таблицы Groups).
SELECT Students.Surname, Students.Name, Students.Lastname, Groups.Num_course, 5-Groups.Num_course FROM Students INNER JOIN Groups ON Students.Code_group=Groups.Code_group; +

#15). Вывести список всех групп (поле Name_group из таблицы Groups) и количество студентов в каждой группе.
SELECT Groups.Name_group, COUNT(*) FROM Groups INNER JOIN Students ON Groups.Code_group=Students.Code_group GROUP BY Students.Code_Group; +

#16). Вывести средний балл (использовать поле Estimate из таблицы Progress) по результатам экзаменов каждого студента и имена студентов (поля Surname, Name из таблицы Students) за период сдачи экзаменов с 05.01.2003 по 25.01.2003 (условие по полю Date_exam из таблицы Progress).
SELECT AVG(Progress.Estimate), Students.Surname, Students.Name FROM Students INNER JOIN Progress ON Students.Code_stud=Progress.Code_stud WHERE Progress.Date_exam BETWEEN '05.01.2003' AND '25.01.2003'; +

#17). Вывести фамилии и имена студентов (поля Surname, Name из таблицы Students) с максимальным средним баллом за весь период обучения (условие по полю Estimate из таблицы Progress).
SELECT Students.Surname, Students.Name FROM Students INNER JOIN Progress ON Students.Code_stud=Progress.Code_stud WHERE Progress.Estimate=(SELECT Estimate FROM Progress ORDER BY Estimate DESC LIMIT 1) ORDER BY Estimate DESC; -

#18). Вывести все сведения о преподавателях (все поля таблицы Lectors) с максимальным общим стажем работы (использовать поле Date_).
SELECT * FROM Lectors WHERE EXTRACT(YEAR FROM CURDATE()) - EXTRACT(YEAR FROM Date_)=(SELECT EXTRACT(YEAR FROM CURDATE()) - EXTRACT(YEAR FROM Date_) FROM Lectors ORDER BY EXTRACT(YEAR FROM CURDATE()) - EXTRACT(YEAR FROM Date_) DESC LIMIT 1); +

#19). Вывести средний балл (использовать поле Estimate из таблицы Progress) по результатам экзаменов каждого студента, поместив результат в поле Avg_estimate, и имена студентов (поля Surname, Name из таблицы Students) за период сдачи экзаменов 05.01.2003 по 25.01.2003 (условие по полю Date_exam из таблицы Progress).
SELECT AVG(Progress.Estimate) as Avg_estimate, Students.Surname, Students.Name FROM Progress INNER JOIN Students ON Students.Code_stud=Progress.Code_stud WHERE Progress.Date_exam BETWEEN '05.01.2003' AND '25.01.2003' GROUP BY Students.Code_stud; +

#20). Вывести все сведения о сдачах экзаменов (все поля из таблицы Progress) и список студентов (поля Surname, Name из таблицы Students), которые по таблице Progress сдавали экзамены самыми последними (дата сдачи экзаменов Date_exam максимальна).
SELECT Progress.Code_stud, Progress.Code_subject, Progress.Code_lector, Progress.Date_exam, Progress.Estimate, Progress.Code_progress, Students.Surname, Students.Name FROM Progress INNER JOIN Students ON Students.Code_stud=Progress.Code_stud WHERE Progress.Date_exam BETWEEN '05.01.2003' AND '25.01.2003' GROUP BY Students.Code_stud; -

#21). Вывести список групп (поле Name_group), в которых студентов больше 25.
SELECT Groups.Name_group FROM Groups INNER JOIN (SELECT COUNT(*) AS studcount FROM Students INNER JOIN Groups ON Groups.Code_group = Students.Code_groups GROUP BY Groups.Code_group) as INDB WHERE INDB.studcount > 25; -

#22). Вывести список студентов (поля Surname, Name, Lastname из таблицы Students), которые не сдавали ни одного экзамена.
SELECT Students.Surname, Students.Name, Students.Lastname FROM Students INNER JOIN (SELECT COUNT(*) AS examcount FROM Students INNER JOIN Progress ON Students.Code_stud = Progress.Code_stud GROUP BY Progress.Code_stud) as INDB WHERE INDB.examcount = 0; -



