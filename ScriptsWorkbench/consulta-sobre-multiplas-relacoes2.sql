CREATE DATABASE IF NOT EXISTS academico;
USE academico;

DROP TABLE Aluno;
DROP TABLE Curso;
DROP TABLE Departamento;
DROP TABLE Campus;

CREATE TABLE Campus (
id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(100) NOT NULL UNIQUE);

DESC Campus;

CREATE TABLE Departamento (
id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(100) NOT NULL UNIQUE,
id_campus INT NOT NULL,
FOREIGN KEY (id_campus) REFERENCES Campus (id));

DESC Departamento;

CREATE TABLE Curso (
id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(100) NOT NULL UNIQUE,
id_departamento INT NOT NULL,
id_campus INT NOT NULL,
FOREIGN KEY (id_departamento) REFERENCES Departamento (id),
FOREIGN KEY (id_campus) REFERENCES Campus (id));

DESC Curso;

CREATE TABLE Aluno (
id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(100) NOT NULL UNIQUE,
id_curso INT NOT NULL,
id_departamento INT NOT NULL,
id_campus INT NOT NULL,
FOREIGN KEY (id_curso) REFERENCES Curso (id),
FOREIGN KEY (id_departamento) REFERENCES Departamento (id),
FOREIGN KEY (id_campus) REFERENCES Campus (id));

DESC Aluno;

INSERT INTO Campus (nome) 
VALUES ('São José'), ('Florianopolis'), ('Lages');

SELECT * FROM Campus;

INSERT INTO Departamento (nome, id_campus) 
VALUES ('Telecomunicacoes',1), ('Refrigeracao', 1), ('Engenharia', 2), ('Computacao', 3);

SELECT * FROM Departamento;

SELECT C.nome, D.nome FROM Departamento D INNER JOIN Campus C ON D.id_campus = C.id;

INSERT INTO Curso (nome, id_departamento, id_campus) 
VALUES ('Engenharia de Telecomunicacoes', 1, 1), 
('Analise e Desenvolvimento de Sistemas', 1, 1), 
('Engenharia Elétrica ', 3, 2),
('Ciências da Computação', 4, 3);

SELECT C.nome AS Curso, D.nome AS Departamento, Ca.nome AS Campus FROM Curso C 
INNER JOIN Departamento D ON C.id_departamento = D.id 
INNER JOIN Campus Ca ON C.id_campus = Ca.id;

INSERT INTO Aluno (nome, id_curso, id_departamento, id_campus) VALUES
('Marcos', 1, 1, 1),
('Maria', 1, 1, 1),
('Jorge', 1, 1, 1),
('Roberto', 1, 1, 1),
('Ana', 1, 1, 1),
('Kauan', 2, 1, 1),
('Thays', 2, 1, 1),
('Lucas', 2, 1, 1),
('Fernanda', 2, 1, 1),
('Gustavo', 3, 3, 2),
('Natan', 3, 3, 2),
('Pedro', 4, 4, 3);

SELECT A.nome AS Aluno, C.nome AS Curso, D.nome AS Departamento, Ca.nome AS Campus FROM Aluno A 
INNER JOIN Curso C ON A.id_curso = C.id
INNER JOIN Departamento D ON A.id_departamento = D.id 
INNER JOIN Campus Ca ON A.id_campus = Ca.id;

-- Questão 19
SELECT C.nome AS Curso, Ca.nome AS Campus FROM Curso C 
INNER JOIN Campus Ca ON C.id_campus = Ca.id;

-- Questão 20
SELECT A.nome AS Aluno FROM Aluno A 
INNER JOIN Campus Ca ON A.id_campus = Ca.id
WHERE Ca.nome = 'São José';

-- Questão 21
SELECT Ca.nome AS Campus, D.nome AS Departamento, C.nome AS Curso, COUNT(A.id) AS TotalAlunos FROM Aluno A 
INNER JOIN Curso C ON A.id_curso = C.id
INNER JOIN Departamento D ON A.id_departamento = D.id 
INNER JOIN Campus Ca ON A.id_campus = Ca.id
GROUP BY Ca.nome;

