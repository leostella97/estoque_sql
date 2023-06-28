-- Tabela "cliente"
CREATE TABLE cliente (
  id INT PRIMARY KEY,
  nome VARCHAR(100),
  cpf VARCHAR(11),
  telefone VARCHAR(20)
);

-- Tabela "vendedor"
CREATE TABLE vendedor (
  id INT PRIMARY KEY,
  nome VARCHAR(100),
  cpf VARCHAR(11),
  telefone VARCHAR(20)
);

-- Tabela "produtos"
CREATE TABLE produtos (
  id INT PRIMARY KEY,
  nome VARCHAR(100),
  valor DECIMAL(10, 2),
  quantidade INT
);

-- Tabela "vendas"
CREATE TABLE vendas (
  id INT PRIMARY KEY,
  cliente_id INT,
  vendedor_id INT,
  FOREIGN KEY (cliente_id) REFERENCES cliente(id),
  FOREIGN KEY (vendedor_id) REFERENCES vendedor(id)
);

-- Trigger para decrementar a quantidade do produto após uma venda
DELIMITER //

CREATE TRIGGER decrementar_quantidade_produto AFTER INSERT ON vendas
FOR EACH ROW
BEGIN
    UPDATE produtos
    SET quantidade = quantidade - 1
    WHERE id = NEW.produto_id;
END; //

DELIMITER ;
