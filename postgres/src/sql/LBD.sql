CREATE TABLE tb_cliente (
	id_cliente INTEGER,
	titulo CHAR(4),
	nome VARCHAR(32) CONSTRAINT nn_cliente_nome NOT NULL,
	sobrenome VARCHAR(32) CONSTRAINT nn_cliente_sobrenome NOT NULL,
	endereco VARCHAR(62) CONSTRAINT nn_cliente_endereco NOT NULL,
	numero VARCHAR(5) CONSTRAINT nn_cliente_numero NOT NULL,
	complemento VARCHAR(62),
	cep VARCHAR(10),
	cidade VARCHAR(62) CONSTRAINT nn_cliente_cidade NOT NULL,
	estado CHAR(2) CONSTRAINT nn_cliente_estado NOT NULL,
	fone_fixo VARCHAR(15) CONSTRAINT nn_cliente_fone_fixo NOT NULL,
	fone_movel VARCHAR(15) CONSTRAINT nn_cliente_fone_movel NOT NULL,
	fg_ativo INTEGER,
	CONSTRAINT pk_cliente_id_cliente PRIMARY KEY(id_cliente)
);


CREATE TABLE tb_item (
	id_item INTEGER, -- id do item
	ds_item VARCHAR(64) -- descrição do item
		CONSTRAINT nn_item_ds_item NOT NULL,
	preco_custo NUMERIC(7,2),
	preco_venda NUMERIC(7,2),
	fg_ativo INTEGER, -- flag para ativo/inativo
	CONSTRAINT pk_item_id_item PRIMARY KEY(id_item)
);

CREATE TABLE tb_pedido (
	id_pedido INTEGER,
	id_cliente INTEGER
		CONSTRAINT nn_pedido_id_cliente NOT NULL,
	dt_compra TIMESTAMP,
	dt_entrega TIMESTAMP,
	valor NUMERIC(7,2),
	fg_ativo INTEGER,
	CONSTRAINT pk_pedido_id_pedido PRIMARY KEY (id_pedido),
	CONSTRAINT fk_pedido_id_cliente FOREIGN KEY (id_cliente)
		REFERENCES tb_cliente(id_cliente)
);

CREATE TABLE tb_item_pedido (
	id_item INTEGER,
	id_pedido INTEGER
		CONSTRAINT nn_item_pedido_id_pedido NOT NULL,
	quantidade INTEGER,
	CONSTRAINT pk_item_pedido PRIMARY KEY (id_item, id_pedido),
	CONSTRAINT fk_item_pedido_id_item FOREIGN KEY (id_item)
		REFERENCES tb_item(id_item),
	CONSTRAINT fk_item_pedido_id_pedido FOREIGN KEY (id_pedido)
		REFERENCES tb_pedido(id_pedido)
);

CREATE TABLE tb_codigo_barras (
	codigo_barras INTEGER
		CONSTRAINT nn_cod_barras_codigo_barras NOT NULL,
	id_item INTEGER
		CONSTRAINT nn_cod_barras_id_item NOT NULL,
	CONSTRAINT fk_cod_barras_id_item FOREIGN KEY (id_item)
		REFERENCES tb_item(id_item)
);

CREATE TABLE tb_estoque (
	id_item INTEGER,
	quantidade INTEGER,
	CONSTRAINT pk_estoqe_id_item PRIMARY KEY (id_item),
	CONSTRAINT fk_estoque_id_item FOREIGN KEY (id_item)
		REFERENCES tb_item(id_item)
);

INSERT INTO tb_cliente(id_cliente, titulo, nome, sobrenome, endereco, numero, complemento, cep,
					  cidade, estado, fone_fixo, fone_movel, fg_ativo)
	VALUES (1, 'Sra', 'Jessica', 'Mendes', 'Avenida Acelino de Leao', '89', NULL, 
		   '68900 300', 'Macapá', 'AP', '3565 1234', '8765 8999', 1),
		   (2, 'Sr', 'Andrei', 'Junqueira', 'Rua Tabaiares', '1024', NULL, '30150 040',
		   'Belo Horizonte', 'MG', '3676 1209', '8876 4543', 1),
		   (3, 'Sr', 'Alex', 'Matheus', 'Rua Eva Terpins', 's/n', NULL, '05327 030', 
		   'São Paulo', 'SP', '6576 0099', '9358 7676', 1);
		   
INSERT INTO tb_cliente
	VALUES (4, 'Sr', 'Andre', 'Lopes', 'Rua Fortaleza', '552', NULL, '11436 360',
		   'Guarujá', 'SP', '5654 4343', '9821 4321', 1),
		   (5, 'Sr', 'Vitor', 'Silva', 'Estrada Aguá Chata', 's/n', 'Rodovia 356',
		   '07251 000', 'Guarulhos', 'SP', '4343 6712', '831 3411', 1),
		   (6, 'Sr', 'Claudinei', 'Safra', 'Avenida José Osvaldo Marques', '1562', NULL, 
		   '14173 010', 'Sertãozinho', 'SP', '3698 8100', '8131 6409', 1),
		   (7, 'Sr', 'Ricardo', 'Ferreira', 'Alameda Assunta Barizani Tienghi', '88', 
		   NULL, '18046 705', 'Sorocaba', 'SP', '6534 7099', '9988 1251', 1);

INSERT INTO	tb_cliente
	VALUES (8, 'Sra', 'Anna', 'Kelly', 'Rua das Acacias', '1089', NULL, '13187 042', 
		   'Hortolândia', 'SP', '6432 440043', '9465 0023', 1),
		   (9, 'Sra', 'Cristiane', 'Hickman', 'Rua Agenir Martinhon Scachetti', '300',
		   NULL, '13341 633', 'Indaiatuba', 'SP', '3512 1243', '9987 0001', 1),
		   (10, 'Sr', 'Marcos', 'Augusto', 'Avenida Australia', 's/n', NULL, '06852 100', 
		   'Itapecerica da Serra', 'SP', '3623 8821', '8891 2333', 1),
		   (11, 'Sr', 'David', 'Silva', 'Rua Arcy Prestes Ruggeri', '24', 'Esquina do Mercado',
		   '18201 720', 'Itapetininga', 'SP', '4565 9240', '7765 4029', 1);


INSERT INTO tb_cliente 
	VALUES (12, 'Sr', 'Ricardo', 'Cunha', 'Rua Jose Fotunato de Godoy', '889', NULL,
		   '13976 121', 'Itapira', 'SP', '5467 1959', '9244 9584', 1),
		   (13, 'Sra', 'Laura', 'Batista', 'Rua Villa Lobos', '76', NULL, '13976 018',
		   'Ribeirão Preto', 'SP', '2111 8710', '9991 2324', 1),
		   (14, 'Sr', 'Valmil', 'Feliciano', 'Rua Professor Emilton Amaral', '961', 
		   'Loteamento Novo Horizonte', '58053 223', 'João Pessoa', 'PB',
		   '4431 8740', '9766 0033', 1),
		   (15, 'Sr', 'Agnaldo', 'Aparecido', 'Rua Soldado Celio Tonelli', '778', NULL,
		   '09240 320', 'Santo André', 'SP', '2386 8092', '99625 3683', 1);

INSERT INTO tb_item(id_item, ds_item, preco_custo, preco_venda, fg_ativo)
	VALUES 
		(1, 'Quebra-cabeça de Madeira', 15.23, 21.95, 1),
		(2, 'Cubo X', 7.45, 11.49, 1),
		(3, 'CD Linux', 1.99, 2.49, 1),
		(4, 'Tecidos', 2.11, 3.99, 1),
		(5, 'Moldura', 7.54, 9.95, 1),
		(6, 'Ventilador Pequeno', 9.23, 15.75, 1);

INSERT INTO tb_item(id_item, ds_item, preco_custo, preco_venda, fg_ativo)
	VALUES
		(7, 'Ventilador Grande', 13.36, 19.95, 1),
		(8, 'Escova de Dentes', 0.75, 1.45, 1),
		(9, 'Papel A4', 2.34, 2.45, 1),
		(10, 'Saco de Transporte', 0.01, 0.0, 1),
		(11, 'Alto-Falantes', 19.73, 25.32, 1);

INSERT INTO tb_pedido(id_pedido, id_cliente, dt_compra, dt_entrega, valor, fg_ativo)
	VALUES
		(1, 3, '13-03-2013', '17-03-2013', 2.99, 1),
		(2, 8, '23-06-2013', '24-06-2013', 0.00, 1),
		(3, 15, '02-09-2013', '12-09-2013', 3.99, 1),
		(4, 13, '03-09-2013', '10-09-2013', 2.99, 1),
		(5, 8, '21-07-2013', '24-07-2013', 0.00, 1);
		
INSERT INTO tb_item_pedido(id_pedido, id_item, quantidade)
	VALUES
		(1,4,1),
		(1,7,1),
		(1,9,1),
		(2,1,1),
		(2,10,1),
		(2,7,2);
		
INSERT INTO tb_item_pedido(id_pedido, id_item, quantidade)
	VALUES
		(2,4,2),
		(3,2,1),
		(3,1,1),
		(4,5,2),
		(5,1,1),
		(5,3,1);
		
INSERT INTO tb_codigo_barras(codigo_barras, id_item)
	VALUES
		(624152783, 1),
		(624157463, 2),
		(626453783, 3),
		(624152774, 3),
		(746574384, 4),
		(345345867, 5),
		(643456456, 6);
		
INSERT INTO tb_codigo_barras(codigo_barras, id_item)
	VALUES 
		(847673683, 7),
		(624123458, 8),
		(947362553, 8),
		(947362746, 8),
		(458726364, 9),
		(987987983, 11),
		(223987237, 11);

INSERT INTO tb_estoque(id_item, quantidade)
	VALUES
		(1,12),
		(2,2),
		(4,8),
		(5,3),
		(7,8),
		(8,18),
		(10,1);
		
SELECT *
FROM tb_item;

SELECT cidade, sobrenome
FROM tb_cliente

SELECT cidade AS "Cidade do Cliente", sobrenome AS "Sobrenome do Cliente"
FROM tb_cliente;

SELECT cidade "Cidade do Cliente", sobrenome "Sobrenome do Cliente"
FROM tb_cliente;

SELECT cidade "Cidade do Cliente", sobrenome "Sobrenome do Cliente"
FROM tb_cliente
ORDER BY cidade

--O uso do EXISTS permite combinar as duas instruções SELECT, pois, é necessário apenas saber se há linha(s) retornada(s) pela subconsulta
SELECT nome, sobrenome
FROM tb_cliente AS c
WHERE EXISTS (SELECT 1
FROM tb_pedido p
WHERE p.id_cliente = c.id_cliente)

CREATE TABLE tb_parte(
id_parte INTEGER,
descricao VARCHAR(32),
id_parte_principal INTEGER,
PRIMARY KEY(id_parte),
FOREIGN KEY(id_parte_principal)
	REFERENCES tb_parte(id_parte)
);

--O conjunto de mesa e cadeiras possui o id_parte 1, que é
--composto por cadeiras, id_parte 2, e uma mesa, id_parte 3
INSERT INTO tb_parte
VALUES
(1, 'Mesa e Cadeiras', NULL),
(2, 'Cadeira', 1),
(3, 'Mesa', 1);

--Como recuperar as informações sobre as peças individuais
--que compõem um determinada jogo/kit?
--Criamos dois apelidos para a mesma tabela, possibilitando
--realizar uma referência/junção à mesma tabela

SELECT p1.descricao AS "Combinação",
	   p2.descricao AS "Partes"
FROM tb_parte p1, tb_parte p2
WHERE p1.id_parte = p2.id_parte_principal;


CREATE TABLE tb_empregado(
id_empregado INTEGER,
Id_gerente INTEGER,
nm_empregado VARCHAR(60),
dt_admissao DATE,
CONSTRAINT pk_tb_emp_id_emp PRIMARY KEY (id_empregado),
CONSTRAINT fk_tb_emp_id_gerente FOREIGN KEY (id_gerente)
	REFERENCES tb_empregado(id_empregado)
);

INSERT INTO tb_empregado (id_empregado,
						  id_gerente,
						  nm_empregado,
						  dt_admissao)					  
VALUES
(100, NULL, 'Rafael Mendes', '01/05/1998'),
(110, 100, 'Marcia Marina', '25/02/2000'),
(120, 100, 'Ricardo de Oliveira', '30/06/2005'),
(130, 110, 'Ana Lucia', '17/08/2009'),
(140, 120, 'Eduardo Costa', '21/12/2013');

--Criar um relatorio para exibir o nome do empregado,
--juntamente com o nome do seu respectivo gerente.

--Exemplo de saida: Marcia marina trabalha para rafael mendes

SELECT e.nm_empregado || ' trabalha para ' || g.nm_empregado "Empregado - Gerente"
FROM tb_empregado e
INNER JOIN tb_empregado g ON(e.id_gerente = g.id_empregado)

--SIMILAR TO
--Semelhante ao LIKE, sendo que sua pesquisa possui adicionais facilidades
--Recuperar os clientes cujo SOBRENOME corresponda a Matheus ou Mendes
SELECT nome, sobrenome
FROM tb_cliente
WHERE sobrenome SIMILAR TO '%(Matheus|Mendes)%';

--Recuperar o(s) cliente(s) cujo nome(s) iniciam com os caracteres “A” ou “S”
SELECT nome, sobrenome
FROM tb_cliente
WHERE nome SIMILAR TO '(A|S)%';

--A função COUNT conta a quantidade de itens presentes em cada faixa de preço
SELECT 
COUNT(CASE WHEN preco_venda BETWEEN 0.01 AND 5.00
THEN 1 ELSE NULL END) AS "Muito Baixo",
COUNT(CASE WHEN preco_venda BETWEEN 5.01 AND 10.00
THEN 1 ELSE NULL END) AS "Baixo",
COUNT(CASE WHEN preco_venda BETWEEN 10.01 AND 20.00
THEN 1 ELSE NULL END) AS "Médio",
COUNT(CASE WHEN preco_venda BETWEEN 20.01 AND 30.00
THEN 1 ELSE NULL END) AS "Alto" 
FROM tb_item;

-- Obter o maior, menor e a média dos preços de venda dos itens
SELECT
 (SELECT MIN(preco_venda) FROM tb_item) AS Menor,
 (SELECT MAX(preco_venda) FROM tb_item) AS Maior,
 (SELECT AVG(preco_venda) FROM tb_item) AS Média

--Tablespace
-- Possibilita o armazenamento de informação em locais distintos
CREATE TABLESPACE tablespace_01 
LOCATION 'C://tablespace_postgresql';

-- Criando um objeto (tabela) na tablespace nomeada de tablespace_postgresql
CREATE TABLE tb_teste_tablespace(
col_a INTEGER)
TABLESPACE tablespace_01;

INSERT INTO tb_teste_tablespace
VALUES
(generate_series(1,1000));

SELECT * FROM tb_teste_tablespace;

--Verificando as tablespaces existentes
SELECT *
FROM pg_tablespace;

--Como remover tablespace
DROP TABLESPACE tablespace_01;
DROP TABLE tb_teste_tablespace;

--OUTERJOINS
--Listar todos os itens disponíveis para venda, indicando a quantidade em estoque
SELECT i.id_item, i.ds_item, e.quantidade
FROM tb_item i, tb_estoque e
WHERE i.id_item = e.id_item;

--Encontrando as tuplas ausentes na consulta anterior por meio da cláusula IN
SELECT i.id_item, i.ds_item
FROM tb_item i
WHERE i.id_item NOT IN (SELECT i.id_item
					    FROM tb_item i, tb_estoque e
					    WHERE i.id_item = e.id_item)

--Reescrevendo a consulta descartando o uso de UNION
SELECT i.id_item, i.ds_item, e.quantidade
FROM tb_item i 
LEFT OUTER JOIN tb_estoque e ON(i.id_item = e.id_item);

--Recuperar apenas as tuplas da TB_ESTOQUE onde existe mais de 2 itens em estoque
SELECT i.id_item, i.ds_item, e.quantidade
FROM tb_item i
LEFT OUTER JOIN tb_estoque e 
	ON (i.id_item = e.id_item AND e.quantidade >2);

-- Além de recuperar apenas as tuplas da TB_ESTOQUE onde
--existe mais de 2 itens em estoque, desejamos também
--recuperar apenas as tuplas onde o preço de custo seja
--superior a R$ 5,00

SELECT i.id_item, i.ds_item, e.quantidade
FROM tb_item i
LEFT OUTER JOIN tb_estoque e
	ON(i.id_item = e.id_item AND e.quantidade >2)
WHERE i.preco_custo > 5::NUMERIC(5,2);

