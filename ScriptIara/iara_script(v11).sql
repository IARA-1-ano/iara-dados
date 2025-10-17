--Colocando o db para nossa TIMEZONE
SET TIMEZONE = 'America/Sao_Paulo';

--Verificação de TIMEZONE
SHOW TIMEZONE;

-- Ativando extensão de UUID
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- --------------------------------------------------
-- Tabela Super Administrador
-- --------------------------------------------------
CREATE TABLE super_adm (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
	cargo VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    senha VARCHAR(100) NOT NULL,
    CONSTRAINT ck_senha CHECK (LENGTH(senha) >= 8)
);

-- --------------------------------------------------
-- Tabela Planos
-- --------------------------------------------------
CREATE TABLE plano (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    valor DECIMAL(10,2) DEFAULT 0.00,
    descricao TEXT DEFAULT 'Sem descrição',
	duracao INTERVAL NOT NULL,
    CONSTRAINT ck_valor_pag CHECK (valor >= 0),
	CONSTRAINT ck_duracao CHECK (duracao > INTERVAL '0')
	
);

-- --------------------------------------------------
-- Tabela Método Pagamento
-- --------------------------------------------------
CREATE TABLE metodo_pagamento (
    id SERIAL PRIMARY KEY,
    tipo_pagamento VARCHAR(30) NOT NULL
);

-- --------------------------------------------------
-- Tabela Fábrica
-- --------------------------------------------------
CREATE TABLE fabrica (
    id SERIAL PRIMARY KEY,
    fk_plano INTEGER NOT NULL REFERENCES plano(id) ON DELETE CASCADE, 
	email_corporativo VARCHAR(100) UNIQUE NOT NULL,
	nome_unidade VARCHAR(100) NOT NULL,
	cnpj_unidade CHAR(14) UNIQUE NOT NULL,
	status BOOLEAN DEFAULT true,
	nome_industria VARCHAR(150) DEFAULT 'Não definido',
	ramo VARCHAR(100) NOT NULL,
    CONSTRAINT ck_cnpj CHECK (LENGTH(cnpj_unidade) = 14)
);

-- --------------------------------------------------
-- Tabela Endereço
-- --------------------------------------------------
CREATE TABLE endereco (
    id SERIAL PRIMARY KEY,
	fk_fabrica INTEGER NOT NULL REFERENCES fabrica(id) ON DELETE CASCADE,
    cep VARCHAR(13) NOT NULL,
    numero INTEGER NOT NULL,
    rua VARCHAR(100) NOT NULL,
    complemento VARCHAR(100),
	bairro VARCHAR(50) NOT NULL,
	cidade VARCHAR(50) NOT NULL,
	estado VARCHAR(50) NOT NULL,
    CONSTRAINT ck_cep CHECK (LENGTH(cep) = 8),
    CONSTRAINT ck_num_endereco CHECK (numero >= 0)
);

-- --------------------------------------------------
-- Tabela Usuário
-- --------------------------------------------------
CREATE TABLE usuario (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    fk_fabrica INTEGER NOT NULL REFERENCES fabrica(id) ON DELETE CASCADE,
    id_gerente UUID REFERENCES NOT NULL usuario(id),
    email VARCHAR(100) UNIQUE NOT NULL,
    senha VARCHAR(100) NOT NULL,
    nome VARCHAR(100) NOT NULL, 
    genero VARCHAR(20) NOT NULL,
    tipo_acesso INTEGER NOT NULL,
	desc_tipoacesso TEXT NOT NULL,
    status BOOLEAN DEFAULT true,
    data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    data_nascimento DATE NOT NULL,
    cargo VARCHAR(20) NOT NULL,
    CONSTRAINT ck_senha CHECK (LENGTH(senha) >= 8),
    CONSTRAINT ck_dataN CHECK (data_nascimento < CURRENT_DATE)
);

-- --------------------------------------------------
-- Tabela Foto de Perfil
-- --------------------------------------------------
CREATE TABLE foto_perfil (
    id SERIAL PRIMARY KEY,
    fk_usuario UUID NOT NULL REFERENCES usuario(id) ON DELETE CASCADE,
    url VARCHAR(500) UNIQUE NOT NULL
);

-- --------------------------------------------------
-- Tabela Ábaco
-- --------------------------------------------------
CREATE TABLE abaco (
    id SERIAL PRIMARY KEY,
    fk_fabrica INTEGER NOT NULL REFERENCES fabrica(id) ON DELETE CASCADE,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT DEFAULT 'Sem descrição',
    ativo BOOLEAN DEFAULT true,
    data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- --------------------------------------------------
-- Tabela Turno
-- --------------------------------------------------
CREATE TABLE turno (
    id SERIAL PRIMARY KEY,
    fk_fabrica INTEGER NOT NULL REFERENCES fabrica(id) ON DELETE CASCADE,
    nome VARCHAR(80) NOT NULL,
    hora_inicio TIME NOT NULL,
    hora_fim TIME NOT NULL,
    CONSTRAINT ck_turno_horas_validas CHECK (hora_fim > hora_inicio),
    CONSTRAINT ck_turno_horas_diferentes CHECK (hora_fim <> hora_inicio)
);

-- --------------------------------------------------
-- Tabela Foto
-- --------------------------------------------------
CREATE TABLE foto (
    id SERIAL PRIMARY KEY,
    fk_abaco INTEGER NOT NULL REFERENCES abaco(id) ON DELETE CASCADE,
    fk_turno INTEGER NOT NULL REFERENCES turno(id) ON DELETE CASCADE,
    data_hora TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    url_imagem VARCHAR(500) NOT NULL
);

-- --------------------------------------------------
-- Tabela Arquivo
-- --------------------------------------------------
CREATE TABLE arquivo (
    id SERIAL PRIMARY KEY,
    fk_foto INTEGER NOT NULL REFERENCES foto(id) ON DELETE CASCADE,
    fk_turno INTEGER NOT NULL REFERENCES turno(id) ON DELETE CASCADE,
    data_hora TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    arquivo VARCHAR(500) NOT NULL
);

-- --------------------------------------------------
-- Tabelas Linha e Coluna
-- --------------------------------------------------
CREATE TABLE linha (
    id SERIAL PRIMARY KEY,
    fk_abaco INTEGER NOT NULL REFERENCES abaco(id) ON DELETE CASCADE,
    nome VARCHAR(80) NOT NULL
);
-- ---------------------------------------------------
CREATE TABLE coluna (
    id SERIAL PRIMARY KEY,
    fk_abaco INTEGER NOT NULL REFERENCES abaco(id) ON DELETE CASCADE,
    nome VARCHAR(80) NOT NULL
);

-- --------------------------------------------------
-- Tabela Condena
-- --------------------------------------------------
CREATE TABLE condena (
    id SERIAL PRIMARY KEY, 
    fk_abaco INTEGER NOT NULL REFERENCES abaco(id) ON DELETE CASCADE,
    fk_linha INTEGER NOT NULL REFERENCES linha(id) ON DELETE CASCADE,
    fk_coluna INTEGER NOT NULL REFERENCES coluna(id) ON DELETE CASCADE,
    fk_foto INTEGER NOT NULL REFERENCES foto(id) ON DELETE CASCADE,
    quantidade INTEGER DEFAULT 0,
    CONSTRAINT ck_qtd_condena CHECK (quantidade >= 0)
);

-- --------------------------------------------------
-- Tabela Cor e Peso
-- --------------------------------------------------
CREATE TABLE cor_peso (
    id SERIAL PRIMARY KEY,
    fk_abaco INTEGER NOT NULL REFERENCES abaco(id) ON DELETE CASCADE,
    peso_valor INTEGER DEFAULT 0,
    cor VARCHAR(80) NOT NULL,
    CONSTRAINT ck_peso CHECK (peso_valor >= 0)
);

-- --------------------------------------------------
-- Tabela Pagamentos
-- --------------------------------------------------
CREATE TABLE pagamento (
    id SERIAL PRIMARY KEY,
	fk_fabrica INTEGER NOT NULL REFERENCES fabrica(id) ON DELETE CASCADE,
	fk_plano INTEGER NOT NULL REFERENCES plano(id) ON DELETE CASCADE,
    fk_metodoPag INTEGER NOT NULL REFERENCES metodo_pagamento(id) ON DELETE CASCADE,
	data_vencimento DATE NOT NULL,
	valor DECIMAL(10,2) DEFAULT 0.00,
	data_pagamento TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	status BOOLEAN DEFAULT TRUE,
	data_inicio TIMESTAMP NOT NULL,
	CONSTRAINT ck_data_inicio CHECK (data_inicio > current_date),	
    CONSTRAINT ck_valor_pag CHECK (valor >= 0)
);