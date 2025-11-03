--Colocando o db para nossa TIMEZONE
SET TIMEZONE = 'America/Sao_Paulo';

--Verificação de TIMEZONE
SHOW TIMEZONE;

-- --------------------------------------------------
-- Tabela pseudonimizada de Super Administrador
-- --------------------------------------------------
CREATE TABLE super_adm_pseudo (
    id VARCHAR(10)  PRIMARY KEY,
    nome_pseudo VARCHAR(100) NOT NULL,
	cargo_pseudo VARCHAR(50) NOT NULL,
    email_pseudo VARCHAR(100) NOT NULL,
    senha_criptografada VARCHAR(100) NOT NULL
);

-- --------------------------------------------------
-- Tabela pseudonimizada de Usuário
-- --------------------------------------------------
CREATE TABLE usuario_pseudo (
    id VARCHAR(55) PRIMARY KEY,
    fk_fabrica_pseudo VARCHAR(10) NOT NULL,
    id_gerente_pseudo VARCHAR(10) NOT NULL,
    email_pseudo VARCHAR(100) UNIQUE NOT NULL,
    senha_criptografada VARCHAR(100) NOT NULL,
    nome_pseudo VARCHAR(100) NOT NULL, 
    genero VARCHAR(20) NOT NULL,
    desc_tipoacesso_pseudo TEXT NOT NULL,
    status_pseudo VARCHAR(50)NOT NULL,
    data_criacao_pseudo VARCHAR(40) NOT NULL,
    data_nascimento_pseudo VARCHAR(15) NOT NULL,
    cargo_pseudo VARCHAR(20) NOT NULL
);
