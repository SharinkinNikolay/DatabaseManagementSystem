1) select Name_group, Name_course from Groups order by Name_course DESC; +
2) select S.Surname, S.Name, S.Lastname, G.Name_group, G.Name_group from Students as S join Groups on (S.Code_group = G.Code_group); +
3) select P.Date_exam, S.Name_subject from Progress as P join Subjects as S on (P.Code_subject = S.Code_subject); +(дубли)
4) select Name_lector from Lectors where Science like 'к%'; +
5) select Name_lector, Post from Lectors where Science <> 'д.т.н.'; +
6) select P.Date_exam, S.Name_subject from Progress as P join Subjects as S on (P.Code_subject = S.Code_subject) where Date_exam between '01-01-2003' and '01-01-2003'; +(Дубли)
7) select Name_lector, Post from Lectors where Science in ('к.т.н.','к.э.н.','д.т.н.'); +
8) select S.Surname, S.Name, S.Lastname from Students as S join Progress as P on (S.Code_stud P.Code_stud) where P.Code_subject in (5,8,12,25) group by S.Code_stud; -
9) select Name_group from Groups where Name_group like '%0'; +
10) select G.Name_group, G.Num_course from Students as S join Groups as G on (S.Code_stud = G.Code_stud) where S.Code_stud between 10 and 150 and S.Birthdate between '01-01-1976' and '01-01-1978' group by G.Code_group;+
11) select distinct S.Name_subject, L.Name_lector from Subjects as S join Progress as P on (S.Code_subject = P.Code_subject) join Lectors as L on (P.Code_lector = L.Code_lector);+
12) select distinct L.Name_lector from Lectors as L join Progress as P on (P.Code_lector = L.Code_lector) join Students as S on (S.Code_stud = P.Code_stud) where S.Code_group in (10,12,15); -
13) select Name_lector, Science, Year(Date_) from Lectors;+-
14) select S.Surname, S.Name, S.Lastname, G.Num_course, 5 - G.Num_course from Students as S join Groups as G on (S.Code_group = G.Code_group);  +
15) select G.Name_group, count(*) from Groups as G left join Students as S on (S.Code_group = G.Code_group) group by G.Code_group; +
16) select avg(P.Estimate), S.Surname, S.Name from Students as S join Progress as P on (S.Code_stud = P.Code_stud) where P.Date_exam between '05-01-2003' and '25-01-2003' group by S.Code_stud; +
17) select S.Surname, S.Name from Students as S join Progress as P on (S.Code_stud = P.Code_stud) group by S.Code_stud having avg(P.Estimate) = (select avg(P.Estimate) from Students as S join Progress as P on (S.Code_stud = P.Code_stud) group by S.Code_stud order by avg(P.Estimate) DESC LIMIT 1); +
18) select * from Lectors where year(_Date) = (select min(year(Date_)) from Lectors); +
19) select AVG(P.Estimate) as Avg_estimate, S.Surname, S.Name from Progress as P join Students as S on (P.Code_stud = S.Code_stud) where P.Date_exam between '05-01-2003' and '25-01-2003' group by S.Code_stud; +
20) select P.Code_stud, P.Code_subject, P.Code_lector, P.Date_exam, P.Estimate, P.Code_progress, S.Surname, S.name from Students as S join Progress as P on (S.Code_stud = P.Code_stud) where P.Date_exam = (select max(Date_exam) from Progress) group by P.Code_stud; +
21)select G.Name_group from Groups as G where (select count(*) from Students as S where S.Code_group = G.Code_group) > 25; +
22) select S.Surname, S.Name, S.Lastname from Students as S where (select count(*) from Progress as P where P.Code_stud = S.Code_stud) = 0;+