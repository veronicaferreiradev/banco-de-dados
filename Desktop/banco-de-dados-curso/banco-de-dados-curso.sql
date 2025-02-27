CREATE DATABASE db_curso_da_minha_vida;
USE db_curso_da_minha_vida;

CREATE TABLE IF NOT EXISTS tb_categoria (
id_categoria BIGINT AUTO_INCREMENT PRIMARY KEY, 
tipo VARCHAR(255) NOT NULL,
professor VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS tb_produto (
    id_produto BIGINT AUTO_INCREMENT PRIMARY KEY, 
    nome VARCHAR(255) NOT NULL,
    preco DECIMAL NOT NULL,
    area VARCHAR(255) NOT NULL,
    dateinicio DATE,
    classe_id BIGINT, 
    CONSTRAINT fk_produto_classe FOREIGN KEY (classe_id) REFERENCES tb_categoria(id_categoria)
);

INSERT INTO tb_categoria (tipo, professor) VALUES
("Matematica", "Marcelo"),
("Portugues", "Claudia"),
("Ingles", "Rita"),
("Robotica", "Marcos"),
("Historia", "Junior"); 

INSERT INTO tb_produto (nome, preco, area, dateinicio, classe_id) VALUES
("matematica 1", 980.00, "Sala1", "2025-02-01", 1),
("pmatemática 2", 1155.00, "Sala2", "2025-02-05", 1),
("inglês divertido", 1130.00, "salão de eventos","2025-05-01", 3), 
("Português atulizado", 235.00, "salão de eventos interno", "2025-01-01", 2),
("Robos futuristicos", 3190.00, "laboratório 1", "2025-02-01", 4),
("Robos iniciante", 1190.00, "laboratório 2", "2025-03-01", 4),
("Histórias de superação", 190.00, "Sala 5", "2025-06-01", 5),
("inglês avançado", 4190.00, "sala 7", "2025-03-01", 3);

SELECT * FROM tb_categoria;

SELECT * FROM tb_produto;

SELECT * FROM tb_produto WHERE preco > 500;

SELECT * FROM tb_produto WHERE preco BETWEEN 600 AND 1000;

SELECT * FROM tb_produto WHERE nome LIKE '%M%';

SELECT * FROM 
tb_categoria INNER JOIN tb_produto 
ON tb_produto.classe_id = tb_categoria.id_categoria;

SELECT p.id_produto, p.nome, p.preco, p.dateinicio, 
		c.tipo, c.professor
FROM tb_produto p
INNER JOIN tb_categoria c ON p.classe_id = c.id_categoria
WHERE c.tipo = "inglês";
