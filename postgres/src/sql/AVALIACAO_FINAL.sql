CREATE TABLE tb_pais(
id_pais CHAR(2),
nm_pais VARCHAR(40),
CONSTRAINT pk_pais_id_pais PRIMARY KEY(id_pais)
);

CREATE TABLE tb_localizacao(
id_localizacao INTEGER,
id_pais CHAR (2),
endereco VARCHAR(40),
cep VARCHAR(12),
cidade VARCHAR(30),
estado VARCHAR(25),
CONSTRAINT pk_localizacao_id_localizacao PRIMARY KEY(id_localizacao),
CONSTRAINT fk_pais_id_pais FOREIGN KEY (id_pais)
		REFERENCES tb_pais(id_pais)	
);

CREATE TABLE tb_departamento(
id_departamento INTEGER,
id_localizacao INTEGER,
nm_departamento VARCHAR(30),
CONSTRAINT pk_departamento_id_departamento PRIMARY KEY(id_departamento),
CONSTRAINT fk_localizacao_id_localizacao FOREIGN KEY (id_localizacao)
		REFERENCES tb_localizacao(id_localizacao)		
);

CREATE TABLE tb_funcao(
id_funcao VARCHAR(10),
ds_funcao VARCHAR(35),
base_salario NUMERIC,
teto_salario NUMERIC,
CONSTRAINT pk_funcao_id_funcao PRIMARY KEY(id_funcao)
);

CREATE TABLE tb_empregado(
id_empregado INTEGER,
id_gerente INTEGER,
id_departamento INTEGER,
id_funcao VARCHAR(10),
nome VARCHAR(20),
sobrenome VARCHAR(25),
email VARCHAR(25),
telefone VARCHAR(20),
data_admissao DATE,
percentual_comissao NUMERIC,
salario NUMERIC,
CONSTRAINT pk_empregado_id_empregado PRIMARY KEY(id_empregado),
CONSTRAINT fk_tb_empregado_id_gerente FOREIGN KEY (id_gerente)
	REFERENCES tb_empregado(id_empregado),
CONSTRAINT fk_departamento_id_departamento FOREIGN KEY (id_departamento)
		REFERENCES tb_departamento(id_departamento),
CONSTRAINT fk_funcao_id_funcao FOREIGN KEY (id_funcao)
		REFERENCES tb_funcao(id_funcao)
);

--questao 3
SELECT empregado.nome || ' ' || empregado.sobrenome "Nome completo", funcao.ds_funcao "Função", empregado.data_admissao "Data de admissão"
FROM tb_empregado empregado, tb_funcao funcao
WHERE empregado.id_funcao = funcao.id_funcao 
AND data_admissao BETWEEN CAST('1987 02 20' AS date) AND
						  CAST('1989 05 01' AS date)
ORDER BY 3 ASC


--questao 4
SELECT empregado.nome || ' ' || empregado.sobrenome "Nome completo", 
d.nm_departamento "Departamento", p.nm_pais "País"
FROM tb_empregado empregado
INNER JOIN tb_departamento d ON (empregado.id_departamento = d.id_departamento)
INNER JOIN tb_localizacao l ON (d.id_localizacao = l.id_localizacao)
INNER JOIN tb_pais p ON (l.id_pais = p.id_pais)
WHERE empregado.nome SIMILAR TO '(B|L|A)%';

--questao 5
SELECT empregado.nome || ' ' || empregado.sobrenome "Nome completo", 
d.nm_departamento "Departamento", l.cidade || ', ' || l.estado "Localização"
FROM tb_empregado empregado
INNER JOIN tb_departamento d ON (empregado.id_departamento = d.id_departamento)
INNER JOIN tb_localizacao l ON (d.id_localizacao = l.id_localizacao)
WHERE empregado.percentual_comissao IS NOT NULL;

--questao 6
CREATE TABLE tb_empregado_copia
AS
SELECT * FROM tb_empregado

--questao 7
SELECT empregado.nome || ', recebe ' || empregado.salario || ' mensalmente, mas deseja ' ||
CAST(empregado.salario * 3 AS NUMERIC) AS "Salário dos Sonhos"
FROM tb_empregado empregado

--questao 8
SELECT empregado.nome || ' ' || empregado.sobrenome || ', se encontra alocado no ' ||
d.nm_departamento || ' localizado na cidade ' || l.cidade || ', ' || l.estado || ' - ' || p.nm_pais
AS "Informações dos Empregados" FROM tb_empregado empregado
INNER JOIN tb_departamento d ON (empregado.id_departamento = d.id_departamento)
INNER JOIN tb_localizacao l ON (d.id_localizacao = l.id_localizacao)
INNER JOIN tb_pais p ON (p.nm_pais = p.nm_pais)

--questao 9
--alternativa d) A cláusula JOIN...ON pode ser usada para junções entre diversas tabelas

--questao 10
--alternativa c) 12

--questao 11
--alternativa b) Uma linha de saída com os valores DBA, 100
