CREATE DATABASE db_farmacia_bem_estar;

USE db_farmacia_bem_estar;

CREATE TABLE IF NOT EXISTS tb_categoria (
id_categoria BIGINT AUTO_INCREMENT PRIMARY KEY, 
tipo VARCHAR(255) NOT NULL,
sessao VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS tb_produto (
    id_produto BIGINT AUTO_INCREMENT PRIMARY KEY, 
    nome VARCHAR(255) NOT NULL,
    datevalidade DATE NOT NULL, 
    receita VARCHAR(255) NOT NULL,
    quantidade INT NOT NULL,
    classe_id BIGINT, 
    CONSTRAINT fk_produto_classe FOREIGN KEY (classe_id) REFERENCES tb_categoria(id_categoria)
);

INSERT INTO tb_categoria (tipo, sessao) VALUES
("Perfumaria", "A"),
("Remedio", "B"),
("Cosméticos", "C"),
("Higiene", "D"),
("Conveniência", "E"); 

INSERT INTO tb_produto (nome, datevalidade, receita, quantidade, classe_id) VALUES
("Sabonete", "2025-09-23", "Não", "80", 4),
("Diporona", "2026-10-19", "Não", "120", 2),
("Shampoo", "2030-05-30", "Não", "45", 3), 
("Cotonete", "2070-09-23", "Não", "120", 4),
("Bala", "2027-03-23", "Não", "400", 5),
("Dexametasona", "2025-09-23", "Não", "300", 2),
("Amoxicilina", "2027-09-23", "Sim", "100", 2),
("Tinta", "2030-09-23", "Não", "20", 3);

SELECT * FROM tb_categoria;

SELECT * FROM tb_produto;

SELECT * FROM tb_produto WHERE quantidade > 50;

SELECT * FROM tb_produto WHERE quantidade BETWEEN 50 AND 300;

SELECT * FROM tb_produto WHERE nome LIKE '%O%';

SELECT * FROM 
tb_categoria INNER JOIN tb_produto 
ON tb_produto.classe_id = tb_categoria.id_categoria;

SELECT p.id_produto, p.nome, p.datevalidade, p.receita, p.quantidade, 
		c.tipo, c.sessao
FROM tb_produto p
INNER JOIN tb_categoria c ON p.classe_id = c.id_categoria
WHERE c.tipo = "remedio";


