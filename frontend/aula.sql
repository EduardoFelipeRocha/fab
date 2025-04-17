CREATE DATABASE exemplo;
USE exemplo;

CREATE TABLE clientes(
id INT PRIMARY KEY auto_increment,
nome VARCHAR(100) NOT NULL,
email VARCHAR(50) NOT NULL,
telefone VARCHAR(20),
cidade VARCHAR(50) NOT NULL
);

CREATE TABLE produtos(
id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(100) NOT NULL,
categoria VARCHAR(50) NOT NULL,
preco DECIMAL(10,2) NOT NULL);


CREATE TABLE pedidos(
id INT PRIMARY KEY AUTO_INCREMENT,
cliente_id INT,
data_pedido DATE NOT NULL,
valor DECIMAL(10,2) NOT NULL,
FOREIGN KEY (cliente_id) REFERENCES clientes(id)
);

SELECT * FROM clientes;
DESCRIBE clientes; 
INSERT INTO clientes(nome, email, telefone, cidade)
VALUES
("Joao","joao@gmail.com", "21988367728", "Maricá"),
("Joao","joao1235@gmail.com", "21988367728", "Maricá"),
("Joao","joao123@gmail.com", "21988367728", "Maricá");

SELECT * FROM produtos;
INSERT INTO produtos(nome, categoria, preco)
VALUES
("Joao","Monitor","Eletronico" , 500),
("Joao","Monitor","Eletronico" , 500),
("Joao","Monitor","Eletronico" , 500);

SELECT * FROM pedidos;
DESCRIBE pedidos; 
INSERT INTO pedidos(cliente_id, data_pedido, valor)
VALUES
(1, "2025-02-12", 1000.00),
(3, "2025-02-20", 200.00),
(1,"2025-03-27", 5000.00);

SELECT nome, email FROM clientes;
SELECT * FROM clientes;
UPDATE clientes 
SET nome = "joao"
WHERE id = 3;
SELECT * FROM clientes;

INSERT INTO clientes(nome, email, telefone, cidade)
VALUES 
("Manuel", "manuel@gmail.com", "21988329949", "Maricá");
DELETE FROM clientes WHERE id = 4;

SELECT * FROM clientes;

SELECT COUNT(*) AS "Quantidade de Clientes " FROM clientes; 

SELECT SUM(valor) AS "Total de valor em pedidos" FROM pedidos;
SELECT * FROM pedidos; 

SELECT MAX(valor) FROM pedidos;
SELECT MIN(valor) FROM pedidos;

SELECT SUM(valor)
FROM pedidos
WHERE valor > 500;

SELECT AVG(valor) AS "Média dos pedidos"
FROM pedidos; 

SELECT *FROM clientes
WHERE nome LIKE "J%";

SELECT clientes.nome, pedidos.valor
FROM clientes
INNER JOIN pedidos ON clientes.id = pedidos.cliente_id;
SELECT * FROM pedidos;
SELECT * FROM clientes;

SELECT clientes.nome, pedidos.valor
FROM pedidos
LEFT JOIN pedidos ON clientes.id = pedidos.cliente_id;
