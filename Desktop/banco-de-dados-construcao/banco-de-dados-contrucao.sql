CREATE DATABASE db_construindo_vidas;
USE db_construindo_vidas;

CREATE TABLE IF NOT EXISTS tb_categoria (
id_categoria BIGINT AUTO_INCREMENT PRIMARY KEY, 
tipo VARCHAR(255) NOT NULL,
sessao VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS tb_produto (
    id_produto BIGINT AUTO_INCREMENT PRIMARY KEY, 
    nome VARCHAR(255) NOT NULL,
    preco DECIMAL NOT NULL,
    funcao VARCHAR(255) NOT NULL,
    classe_id BIGINT, 
    CONSTRAINT fk_produto_classe FOREIGN KEY (classe_id) REFERENCES tb_categoria(id_categoria)
);

INSERT INTO tb_categoria (tipo, sessao) VALUES
("Casa", "interior"),
("Quintal", "exterior"),
("Jardim", "exterior"),
("Apartamento", "interior"),
("Escritório", "interior"); 

INSERT INTO tb_produto (nome, preco, funcao, classe_id) VALUES
("piso", 180.00, "impermeável", 1),
("pá", 55.00, "grande", 2),
("flores", 130.00, "decoração", 3), 
("poltrona", 2235.00, "decoração", 4),
("mesa", 1190.00, "organização escritório", 5),
("armário", 1185.00, "organização", 1),
("armário", 135.00, "organização escritório", 5),
("balanço", 2247.00, "decoração", 2);

SELECT * FROM tb_categoria;

SELECT * FROM tb_produto;

SELECT * FROM tb_produto WHERE preco > 100;

SELECT * FROM tb_produto WHERE preco BETWEEN 70 AND 150;

SELECT * FROM tb_produto WHERE nome LIKE '%c%';

SELECT * FROM 
tb_categoria INNER JOIN tb_produto 
ON tb_produto.classe_id = tb_categoria.id_categoria;

SELECT p.id_produto, p.nome, p.preco, p.funcao, 
		c.tipo, c.sessao
FROM tb_produto p
INNER JOIN tb_categoria c ON p.classe_id = c.id_categoria
WHERE c.tipo = "Casa";
