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
FOREIGN KEY (id_departamento) REFERENCES Departamento (id));

DESC Curso;

CREATE TABLE Aluno (
id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(100) NOT NULL UNIQUE,
id_curso INT NOT NULL,
FOREIGN KEY (id_curso) REFERENCES Curso (id));

DESC Aluno;

INSERT INTO Campus (nome) 
VALUES ('São José'), ('Florianopolis'), ('Lages');

SELECT * FROM Campus;

INSERT INTO Departamento (nome, id_campus) 
VALUES ('Telecomunicacoes',1), ('Refrigeracao', 1), ('Engenharia', 2), ('Computacao', 3);

SELECT * FROM Departamento;

SELECT C.nome, D.nome FROM Departamento D INNER JOIN Campus C ON D.id_campus = C.id;

INSERT INTO Curso (nome, id_departamento) 
VALUES ('Engenharia de Telecomunicacoes', 1), 
('Analise e Desenvolvimento de Sistemas', 1), 
('Engenharia Elétrica ', 3),
('Ciências da Computação', 4);

SELECT C.nome AS Curso, D.nome AS Departamento, Ca.nome AS Campus FROM Curso C 
INNER JOIN Departamento D ON C.id_departamento = D.id 
INNER JOIN Campus Ca ON D.id_campus = Ca.id;

INSERT INTO Aluno (nome, id_curso) VALUES
('Marcos', 1),
('Maria', 1),
('Jorge', 1),
('Roberto', 1),
('Ana', 1),
('Kauan', 2),
('Thays', 2),
('Lucas', 2),
('Fernanda', 2),
('Gustavo', 3),
('Natan', 3),
('Pedro', 4);

SELECT A.nome AS Aluno, C.nome AS Curso, D.nome AS Departamento, Ca.nome AS Campus FROM Aluno A 
INNER JOIN Curso C ON A.id_curso = C.id
INNER JOIN Departamento D ON C.id_departamento = D.id 
INNER JOIN Campus Ca ON D.id_campus = Ca.id;

-- Questão 19
SELECT C.nome AS Curso, Ca.nome AS Campus FROM Curso C
INNER JOIN Departamento D ON C.id_departamento = D.id 
INNER JOIN Campus Ca ON D.id_campus = Ca.id;

-- Questão 20
SELECT A.nome AS Aluno FROM Aluno A
INNER JOIN Curso C ON A.id_curso = C.id
INNER JOIN Departamento D ON C.id_departamento = D.id 
INNER JOIN Campus Ca ON D.id_campus = Ca.id
WHERE Ca.nome = 'São José';

-- Questão 21
SELECT Ca.nome AS Campus, D.nome AS Departamento, C.nome AS Curso, COUNT(A.id) AS TotalAlunos FROM Aluno A 
INNER JOIN Curso C ON A.id_curso = C.id
INNER JOIN Departamento D ON C.id_departamento = D.id 
INNER JOIN Campus Ca ON D.id_campus = Ca.id
GROUP BY Ca.nome, D.nome, C.nome;

CREATE DATABASE IF NOT EXISTS empresarial;
USE empresarial;

DROP TABLE Dependente;
DROP TABLE Empregado;
DROP TABLE Empresa;
DROP TABLE Grupo;

CREATE TABLE Grupo (
id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(100) NOT NULL UNIQUE);

DESC Grupo;

CREATE TABLE Empresa (
id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(100) NOT NULL UNIQUE,
id_grupo INT NOT NULL,
FOREIGN KEY (id_grupo) REFERENCES Grupo (id));

DESC Empresa;

CREATE TABLE Empregado (
id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(100) NOT NULL UNIQUE,
id_empresa INT NOT NULL,
FOREIGN KEY (id_empresa) REFERENCES Empresa (id));

DESC Empregado;

CREATE TABLE Dependente (
id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(100) NOT NULL UNIQUE,
id_empregado INT NOT NULL,
FOREIGN KEY (id_empregado) REFERENCES Empregado (id));

DESC Dependente;

INSERT INTO Grupo (nome) 
VALUES ('ABC'), ('DEF'), ('GHI');

SELECT * FROM Grupo;

INSERT INTO Empresa (nome, id_grupo) 
VALUES ('O baratão',1), ('A moda', 1), ('Popular', 2), ('Exclusiva', 3);

SELECT * FROM Empresa;

SELECT G.nome, E.nome FROM Grupo G INNER JOIN Empresa E ON G.id = E.id_grupo;

INSERT INTO Empregado (nome, id_empresa) 
VALUES ('Sofia', 1), 
('Ana', 1), 
('Adriano', 2),
('Kauan', 3),
('Thays', 4);

SELECT * FROM Empregado;

INSERT INTO Dependente (nome, id_empregado) VALUES
('Julia', 1),
('Carmelita', 1),
('Guilherme', 1),
('Jorge', 1),
('Firmino', 1),
('Magali', 3),
('Chico Bento', 3),
('Cascão', 3),
('Cebolinha', 3),
('Livinha', 4),
('Luciene', 4),
('Sheik', 5);

SELECT * FROM Dependente;

-- Questão 22

SELECT G.nome AS Grupo, E.nome AS Empregado FROM Empregado E
INNER JOIN Empresa Emp ON E.id_empresa = Emp.id
INNER JOIN Grupo G ON Emp.id_grupo = G.id;

-- Questão 23

SELECT D.nome FROM Dependente D
INNER JOIN Empregado E ON D.id_empregado = E.id
INNER JOIN Empresa Emp ON E.id_empresa = Emp.id
INNER JOIN Grupo G ON Emp.id_grupo = G.id
WHERE G.nome = 'ABC';

-- Questão 24
SELECT G.nome AS Grupo, Emp.nome AS Empresa, E.nome AS Empregado, COUNT(D.id) AS TotalDependentes FROM Dependente D
INNER JOIN Empregado E ON D.id_empregado = E.id
INNER JOIN Empresa Emp ON E.id_empresa = Emp.id
INNER JOIN Grupo G ON Emp.id_grupo = G.id
GROUP BY G.nome, Emp.nome, E.nome;