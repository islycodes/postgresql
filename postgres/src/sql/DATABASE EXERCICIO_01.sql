CREATE DATABASE "EXERCICIO_01"
TEMPLATE = TEMPLATE0
ENCODING 'UTF-8'
CONNECTION LIMIT 100;

CREATE TABLE tb_departamento(
	cod_departamento INTEGER,
	nm_departamento VARCHAR(40),
	CONSTRAINT pk_departamento_cod_departamento PRIMARY KEY(cod_departamento)
);

CREATE TABLE tb_disciplina(
	cod_disciplina INTEGER,
	cod_departamento INTEGER,
	nm_disciplina VARCHAR(40),
	creditos INTEGER,
	CONSTRAINT pk_disciplina_cod_disciplina PRIMARY KEY(cod_disciplina),
	CONSTRAINT fk_departamento_cod_departamento FOREIGN KEY(cod_departamento)
			REFERENCES tb_departamento(cod_departamento));
			
CREATE TABLE tb_disciplina_pre_requisito(
	cod_disciplina_liberada INTEGER,
	cod_disciplina_liberadora INTEGER,
	CONSTRAINT pk_disciplina_pre_requisito PRIMARY KEY(cod_disciplina_liberada, cod_disciplina_liberadora),
	CONSTRAINT fk_disciplina_cod_disciplina_liberada FOREIGN KEY(cod_disciplina_liberada)
		REFERENCES tb_disciplina(cod_disciplina),
	CONSTRAINT fk_disciplina_cod_disciplina_liberadora FOREIGN KEY(cod_disciplina_liberadora)
		REFERENCES tb_disciplina(cod_disciplina));
		
CREATE TABLE tb_curso(
	cod_curso INTEGER,
	nm_curso VARCHAR(40),
	CONSTRAINT pk_curso_cod_curso PRIMARY KEY(cod_curso));	
	
CREATE TABLE tb_disciplina_curso(
	cod_curso INTEGER,
	cod_disciplina INTEGER,
	CONSTRAINT pk_disciplina_curso PRIMARY KEY(cod_curso, cod_disciplina),
	CONSTRAINT fk_disciplina_curso_cod_curso FOREIGN KEY(cod_curso)
		REFERENCES tb_curso(cod_curso),
	CONSTRAINT fk_disciplina_curso_cod_disciplina FOREIGN KEY(cod_disciplina)
		REFERENCES tb_disciplina(cod_disciplina));	
		
CREATE TABLE tb_aluno(
	cod_aluno INTEGER,
	cod_curso INTEGER,
	nm_aluno VARCHAR(40),
	CONSTRAINT pk_aluno_cod_aluno PRIMARY KEY(cod_aluno),
	CONSTRAINT fk_aluno_cod_curso FOREIGN KEY(cod_curso)
		REFERENCES tb_curso(cod_curso));		
