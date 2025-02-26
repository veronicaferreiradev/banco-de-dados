CREATE DATABASE db_cidade_das_carnes;
USE db_cidade_das_carnes;

CREATE TABLE IF NOT EXISTS tb_categoria (
id_categoria BIGINT AUTO_INCREMENT PRIMARY KEY, 
tipodacarne VARCHAR(255) NOT NULL,
sessao VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS tb_produto (
    id_produto BIGINT AUTO_INCREMENT PRIMARY KEY, 
    nome VARCHAR(255) NOT NULL,
    datevalidade DATE NOT NULL, 
    preco DECIMAL NOT NULL,
    classe_id BIGINT, 
    CONSTRAINT fk_produto_classe FOREIGN KEY (classe_id) REFERENCES tb_categoria(id_categoria)
);

INSERT INTO tb_categoria (tipodacarne, sessao) VALUES
("Boi", "Congelados"),
("Vaca", "Fresco"),
("Porco", "Fresco"),
("Galinha", "Congelados"),
("Bufalo", "Fresco"); 

INSERT INTO tb_produto (nome, datevalidade, preco, classe_id) VALUES
("Picanha", "2025-09-23", 80.00, 1),
("Alcatra", "2025-10-19", 55,00, 1),
("Contrafilé", "2025-05-30", 30.00, 1), 
("Carne Suína", "2025-09-23",  35.00, 3),
("Pernil", "2025-03-23", 90.00, 3),
("Filé de Búfalo", "2025-09-23", 85.00, 5),
("Peito de Frango", "2025-09-23", 35.00, 4),
("Filé Mignon", "2025-09-23", 47.00, 2);

SELECT * FROM tb_categoria;

SELECT * FROM tb_produto;

SELECT * FROM tb_produto WHERE preco > 50;

SELECT * FROM tb_produto WHERE preco BETWEEN 50 AND 150;

SELECT * FROM tb_produto WHERE nome LIKE '%O%';

SELECT * FROM 
tb_categoria INNER JOIN tb_produto 
ON tb_produto.classe_id = tb_categoria.id_categoria;

SELECT p.id_produto, p.nome, p.datevalidade, 
		c.tipodacarne, c.sessao
FROM tb_produto p
INNER JOIN tb_categoria c ON p.classe_id = c.id_categoria
WHERE c.tipodacarne = "Boi";


