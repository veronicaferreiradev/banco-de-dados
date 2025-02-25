-- criar um bando de dados do Rh
CREATE DATABASE db_rhempresa_x;

-- Selecionar banco de dados para uso
USE db_rhempresa_x;

-- Criação tabela 
CREATE TABLE tb_funcionarios
( id BIGINT AUTO_INCREMENT, 
nome VARCHAR(255) NOT NULL,
areatrabalho VARCHAR(255), 
salario DECIMAL, 
dataferias DATE, 
PRIMARY KEY(id) ); 


-- Inserção dos dados 
INSERT INTO tb_funcionarios 
(nome, areatrabalho, salario, dataferias) VALUES
("Ana", "CAIXA", 1500.00, "2025-05-01"),
("Fernanda", "ESTOQUISTA", 1900.00, "2025-02-01"),
("Marcela", "LIMPEZA", 1500.00, "2025-08-01"),
("Cataina", "SEGURANÇA", 2800.00, "2025-03-01"),
("Leticia", "ATENDENTE", 2500.00, "2025-10-01");

-- retornar os dados da tabela 
SELECT * FROM tb_funcionarios;

-- funcionários que ganham mais que 2000.00;
SELECT * FROM tb_funcionarios WHERE salario > 2000.00;

-- funcionários que ganham menos que 2000.00;
SELECT * FROM tb_funcionarios WHERE salario < 2000.00;

-- atualiza a informação(dado) onde o id for 1
UPDATE tb_funcionarios SET salario = 2000.00  WHERE id = 1;

-- criar um bando de dados do Rh
CREATE DATABASE db_e_commerce;

-- Selecionar banco de dados para uso
USE db_e_commerce;

-- Criação tabela 
CREATE TABLE tb_produtos
( id BIGINT AUTO_INCREMENT, 
nome VARCHAR(255) NOT NULL,
tipodeproduto VARCHAR(255), 
valor DECIMAL, 
quantidade INT, 
PRIMARY KEY(id) ); 

-- Inserção dos dados 
INSERT INTO tb_produtos 
(nome, tipodeproduto, valor, quantidade) VALUES
("Fone", "Executivo", 550.00, 78),
("Mochila moderna", "Adulto", 300.00, 55),
("Mouse", "Infantil", 800.00, 1200),
("Celular X", "Ultima geração", 2800.00, 50),
("Celular Y", "Usado", 1500.00, 50),
("Celular Z", "Antigo", 200.00, 50),
("Celular H", "Rústico", 3000.00, 50),
("Teclado", "Juvenil", 700.00, 33);

-- retornar os dados da tabela 
SELECT * FROM tb_produtos;

-- produtos que custam mais que 500
SELECT * FROM tb_produtos WHERE valor > 500;

-- produtos que custam menos que 500
SELECT * FROM tb_produtos WHERE valor < 500;

-- atualiza a informação(dado) onde o id for 4
UPDATE tb_produtos SET valor = 2400.00  WHERE id = 4;

-- criar um bando de dados do Rh
CREATE DATABASE db_escola;

-- Selecionar banco de dados para uso
USE db_escola;

CREATE TABLE tb_estudante (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    idade INT NOT NULL,
    nota DECIMAL NOT NULL,
    professor VARCHAR(255) NOT NULL
);

-- Inserção dos dados 
INSERT INTO tb_estudante 
(nome, idade, nota, professor) VALUES
("Rita", 10, 8.0 , "Claudio"),
("Paula", 10, 5.0 , "Jose"),
("Sergio", 11, 4.0 , "Claudio"),
("Ana", 10, 8.0 , "Roberto"),
("Felipe", 14, 9.0 , "Viviane"),
("Rafaela", 08, 10.0 , "Claudio"),
("Paolo", 16, 3.0 , "Júlio"),
("Mônica", 10, 7.0 , "Claudio");

SELECT * FROM tb_estudante;

-- produtos que custam mais que 500
SELECT * FROM tb_estudante WHERE nota > 7;

-- produtos que custam menos que 500
SELECT * FROM tb_estudante WHERE nota < 7;

UPDATE tb_estudante SET nota = 10 WHERE id = 1;

UPDATE tb_estudante SET nome = "Amanda"  WHERE id = 1;
