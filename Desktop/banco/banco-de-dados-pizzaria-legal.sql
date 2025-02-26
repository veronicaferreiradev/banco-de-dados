CREATE DATABASE db_pizzaria_legal;

USE db_pizzaria_legal;

CREATE TABLE tb_categorias (
id_categoria INT AUTO_INCREMENT PRIMARY KEY, 
nome_pizza VARCHAR(255) NOT NULL,
tipo VARCHAR(255) NOT NULL
);

CREATE TABLE tb_pizzas (
id_pizza INT AUTO_INCREMENT PRIMARY KEY, 
ingrediente VARCHAR(255) NOT NULL,
datavalidade DATE,
valor DECIMAL,
tamanho VARCHAR(255) NOT NULL,
id_categoria INT -- chave estrangeira
);

ALTER TABLE tb_pizzas 
ADD CONSTRAINT fk_categorias_pizza
FOREIGN KEY (id_categoria) 
REFERENCES tb_categorias(id_categoria);

INSERT INTO tb_categorias (nome_pizza, tipo) VALUES
("Americana", "Salgada"),
("Romeu e Julieta", "Doce"),
("La casa", "Salgada"),
("Espanhola", "Salgada"),
("Mexicana", "Salgada"); 

INSERT INTO tb_pizzas (ingrediente, datavalidade, valor, tamanho, id_categoria) VALUES
("peperoni, mussarela e molho de tomate", "2025-03-10", 45.00, "G", 1),
("mussarela, goiabada, massa fina", "2025-03-15", 35.00, "M", 2),
("Presunto, brie, rúcula", "2025-03-05", 55.00, "G", 3),
("Chorizo, pimentões, azeite", "2025-03-18", 35.00, "M", 4),
("carne, cheddar, jalapenos", "2025-03-09", 50.00, "G", 5),
("presunto, ovo, cebola", "2025-03-05", 35.00, "P", 1),
("calabresa, mussarela, cebola", "2025-03-16", 40.00, "G", 2),
("mussarela, gorgonzola, parmesão", "2025-03-18", 45.00, "M", 3);

SELECT * FROM tb_categorias;

SELECT * FROM tb_pizzas;

SELECT * FROM tb_pizzas WHERE valor > 45;

SELECT * FROM tb_pizzas WHERE valor BETWEEN 50 AND 100;

SELECT * FROM tb_categorias WHERE nome_pizza LIKE '%M%';

SELECT c.nome_pizza, c.tipo,
	p.ingrediente, p.valor
FROM tb_pizzas p
INNER JOIN tb_categorias c ON p.id_categoria = p.id_categoria;

SELECT c.nome_pizza, c.tipo,
	p.ingrediente, p.valor
FROM tb_pizzas p
INNER JOIN tb_categorias c ON p.id_categoria = p.id_categoria
WHERE c.tipo = "doce"; 

