USE jobs;

-- Questão 1

SELECT forenames, surname, Day(dob) AS dia FROM employee WHERE Month(dob) = 3;

-- Questão 2 

SELECT E.forenames FROM employee E INNER JOIN jobhistory J ON E.empno = J.empno WHERE Year(J.startdate) = 1980 AND J.position = 'Accountant';

-- Questão 3

SELECT distinct E.empno, E.forenames FROM employee E INNER JOIN jobhistory J ON E.empno = J.empno WHERE J.enddate IS NULL;

-- Questão 4

SELECT distinct E.forenames, J.position FROM employee E INNER JOIN jobhistory J ON E.empno = J.empno WHERE J.enddate IS NULL;

-- Questão 5

SELECT D.dname, SUM(J.salary) AS Total FROM employee E INNER JOIN jobhistory J ON E.empno = J.empno INNER JOIN department D ON E.depno = D.depno WHERE J.enddate IS NULL GROUP BY (D.dname); 

-- Questão 6

SELECT SUM(J.salary) AS TotalFolha FROM jobhistory J WHERE J.enddate IS NULL; 

-- Questão 7

SELECT E.empno, E.forenames, E.surname FROM employee E WHERE NOT EXISTS (SELECT * FROM empcourse Ec WHERE Ec.empno = E.empno); 

-- Questão 8

SELECT distinct E.forenames FROM employee E INNER JOIN empcourse Ec ON E.empno = Ec.empno INNER JOIN course C ON Ec.courseno = C.courseno WHERE Year(C.cdate) = 1988;

-- Questão 9

SELECT D.dname, COUNT(*) AS Total FROM department D INNER JOIN employee E ON D.depno = E.depno GROUP BY (D.dname);

-- Questão 10

SELECT D.dname, C.cname, COUNT(*) As Total FROM department D INNER JOIN employee E ON D.depno = E.depno INNER JOIN empcourse Ec ON E.empno = Ec.empno INNER JOIN course C ON Ec.courseno = C.courseno GROUP BY C.cname, D.dname;

-- Questão 11

SELECT D.dname, MAX(J.salary) AS MaiorSalario FROM department D INNER JOIN employee E ON D.depno = E.depno INNER JOIN jobhistory J ON E.empno = J.empno GROUP BY (D.dname);

-- Questão 12

CREATE VIEW MaioresSalarios AS
SELECT D.dname, MAX(J.salary) AS MaiorSalario 
FROM department D INNER JOIN employee E ON D.depno = E.depno INNER JOIN jobhistory J ON E.empno = J.empno GROUP BY (D.dname);

SELECT MIN(MaiorSalario) AS MenorMaiorSalario FROM MaioresSalarios;

-- Questão 13

UPDATE employee E SET E.depno = (SELECT D.depno FROM department D WHERE D.dname = 'engineering') WHERE E.depno = (SELECT D.depno FROM department D WHERE D.dname = 'accounts'); 

SELECT * FROM employee;

-- Questão 14

DELETE FROM employee E WHERE E.depno = (SELECT D.depno FROM department D WHERE D.dname = 'accounts');

-- Questão 15

DELETE FROM employee E WHERE E.depno = (SELECT D.depno FROM department D WHERE D.dname = 'engineering');