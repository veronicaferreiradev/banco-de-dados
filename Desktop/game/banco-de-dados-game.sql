-- criar o banco de dados
CREATE DATABASE db_generation_game_online;

-- selecionar banco de dados para uso
USE db_generation_game_online;

-- criar a tabela CLASSES
CREATE TABLE tb_classes (
id_classe INT AUTO_INCREMENT PRIMARY KEY, 
nome_classe VARCHAR(255) NOT NULL,
descricao VARCHAR(255) NOT NULL,
habilidade_especial VARCHAR(255) NOT NULL
);

-- criar a tabela PERSONAGENS 
CREATE TABLE tb_personagens (
id_personagem INT AUTO_INCREMENT PRIMARY KEY,
nome_personagem VARCHAR(255) NOT NULL, 
nivel INT NOT NULL, 
poder_ataque INT NOT NULL,
poder_defesa INT NOT NULL,
id_classe INT, 
FOREIGN KEY (id_classe) REFERENCES tb_classes(id_classe)
);

INSERT INTO tb_classes (nome_classe, descricao, habilidade_especial) VALUES
("Ekko", "Manipulador do tempo, inteligente e ágil", " Voltar no tempo"),
("Jinx", "Atiradora caótica e insana, conhecida por suas explosões", " Super Mega Míssil da Morte!"),
("Vi", "Lutadora durona com socos poderosos", "Saque e Enterrada"),
("Morgana", "Feiticeira sombria, mestra das trevas e do tormento, conhecida por seus grilhões implacáveis.", "Grilhões da Alma"),
("Lux", "Maga da luz, popular e querida pelos jogadores", "Centelha Final");

INSERT INTO tb_personagens (nome_personagem, nivel, poder_ataque, poder_defesa, id_classe) VALUES
("Ekko", 20, 2500, 1800, 1),
("Jinx", 40, 3000, 1500, 2),
("Vi", 10, 2900, 1200, 3),
("Morgana", 70, 3300, 2000, 4),
("Lux", 10, 1500, 1500, 5);

SELECT * FROM tb_personagens WHERE poder_ataque > 2000;

SELECT * FROM tb_personagens WHERE poder_defesa BETWEEN 1000 AND 2000;

SELECT * FROM tb_personagens WHERE nome_personagem LIKE '%C%';

SELECT p.id_personagem, p.nome_personagem, p.nivel, p.poder_ataque, p.poder_defesa, 
       c.nome_classe, c.habilidade_especial, c.descricao
FROM tb_personagens p
INNER JOIN tb_classes c ON p.id_classe = c.id_classe;
-- apilidei tb_personagem de p e tb_classe de c; 
-- INNER JOIN une dados de duas tabelas baseando-se em uma relação comum (normalmente, a chave estrangeira).

SELECT p.id_personagem, p.nome_personagem, p.nivel, p.poder_ataque, p.poder_defesa, 
       c.nome_classe, c.habilidade_especial
FROM tb_personagens p
INNER JOIN tb_classes c ON p.id_classe = c.id_classe
WHERE c.nome_classe = "Morgana";
-- SELECT -  busca o personagem 
-- INNER JOIN une dados de duas tabelas
-- WHERE vai filtrar os resultado voltando apenas o "MORGANA" 




