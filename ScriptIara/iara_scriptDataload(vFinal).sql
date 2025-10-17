-- SCRIPT DATALOAD 
-- -----------------------------------------------
-- Tabela super ADM
-- -----------------------------------------------
INSERT INTO super_adm (nome, cargo, email, senha) VALUES
('Ryan Cursino', 'Desenvolvedor Crud', 'Ryan.guloso@germinare.com.br', 'Arakakilindo123');

-- -----------------------------------------------
-- Tabela Plano 
-- -----------------------------------------------
INSERT INTO plano (nome, valor, descricao, duracao) VALUES
('Mar Profundo', 2099.99, 'Plano full', INTERVAL '30 days');

-- -----------------------------------------------
-- Tabela Método pagamento
-- -----------------------------------------------
INSERT INTO metodo_pagamento (tipo_pagamento) VALUES
('Cartão de Crédito'),
('Boleto Bancário'),
('PIX'),
('Transferência Bancária'),
('Débito Automático');

-- -----------------------------------------------
-- Tabela Fábrica 
-- -----------------------------------------------
INSERT INTO fabrica (fk_plano, email_corporativo, nome_unidade, cnpj_unidade, status, nome_industria, ramo) VALUES
(1, 'seara.avicula@seara.com.br', 'Seara Unidade Chapecó', '12345678000195', true, 'Seara Alimentos', 'Avícola de Corte'),
(1, 'sadia.avicula@sadia.com.br', 'Sadia Unidade Toledo', '98765432000187', true, 'Sadia', 'Avícola de Corte'),
(1, 'jbs.amparo@jbs.com.br', 'JBS Unidade Amparo', '45678912000134', true, 'JBS Friboi', 'Avícola de Corte'),
(1, 'jbs.lins@jbs.com.br', 'JBS Unidade Lins', '32165498000176', true, 'JBS Friboi', 'Avicultura de Corte');

-- -----------------------------------------------
-- Tabela Endereço
-- -----------------------------------------------
INSERT INTO endereco (fk_fabrica, cep, numero, rua, complemento, bairro, cidade, estado) VALUES
(1, '89802020', 1500, 'Rodovia SC-155', 'Km 15', 'Industrial', 'Chapecó', 'Santa Catarina'),
(2, '85900000', 2500, 'Av. das Indústrias', 'Lote 25', 'Zona Industrial', 'Toledo', 'Paraná'),
(3, '13900000', 1800, 'Rodovia SP-340', 'Km 118', 'Distrito Industrial', 'Amparo', 'São Paulo'),
(4, '16400000', 3200, 'Rodovia Marechal Rondon', 'Km 545', 'Polo Industrial', 'Lins', 'São Paulo');

-- -----------------------------------------------
-- Tabela Usuário (Gerente/Usuário)
-- -----------------------------------------------

-- Gerente 
INSERT INTO usuario (fk_fabrica, email, senha, nome, genero, tipo_acesso, desc_tipoacesso, status, data_nascimento, cargo) VALUES
(1, 'gerente.seara@seara.com.br', 'Seara12345', 'João Mendes', 'masc', 1, 'Remover ábaco', true, '1980-05-15', 'Gerente'),
(1, 'supervisor.seara@seara.com.br', 'Seara12345', 'Ana Costa', 'fem', 2, 'leitura e revisão de dados', true, '1985-08-22', 'Gerente'),
(2, 'gerente.sadia@sadia.com.br', 'Sadia12345', 'Pedro Oliveira', 'masc', 1, 'Acesso total', true, '1978-12-10', 'Gerente'),
(3, 'gerente.jbs@jbs.com.br', 'Jbs12345', 'Fernanda Lima', 'fem', 1, 'Acesso total', true, '1982-03-30', 'Gerente'),
(4, 'supervisor.lins@jbs.com.br', 'Jbs12345', 'Ricardo Souza', 'masc', 2, 'Acesso limitado', true, '1990-07-18', 'Gerente');

-- Usuário
INSERT INTO usuario (id_gerente, fk_fabrica, email, senha, nome, genero, tipo_acesso, desc_tipoacesso, status, data_nascimento, cargo) VALUES
('7f085232-954a-4462-a3fb-9002bb18fd1c', 1, 'usuariocomum.seara@seara.com.br', 'Seara12345', 'João Mendes', 'masc', 1, 'Remover ábaco', true, '1980-05-15', 'Usuário comum'),
('c5760bc5-64f5-4fa7-8756-310fdf8650f3', 1, 'usuariocomum1.seara@seara.com.br', 'Seara12345', 'Ana Costa', 'fem', 2, 'leitura e revisão de dados', true, '1985-08-22', 'Usuário comum'),
('37e1ecec-85f4-4ee8-980d-772a354b7a7c', 2, 'usuariocomum.sadia@sadia.com.br', 'Sadia12345', 'Pedro Oliveira', 'masc', 1, 'Acesso total', true, '1978-12-10', 'Usuário comum'),
('1ad1f2ec-8f62-4cef-863c-e20815dd0d11', 3, 'usuariocomum.jbs@jbs.com.br', 'Jbs12345', 'Fernanda Lima', 'fem', 1, 'Acesso total', true, '1982-03-30', 'Usuário comum'),
('54ab6ed9-8619-4afa-b3a3-ee16f7e4b9f8', 4, 'usuariocomum.lins@jbs.com.br', 'Jbs12345', 'Ricardo Souza', 'masc', 2, 'Acesso limitado', true, '1990-07-18', 'Usuário comum');

-- -----------------------------------------------
-- Tabela Foto de Perfil 
-- -----------------------------------------------
INSERT INTO foto_perfil (fk_usuario, url) VALUES
('b39b248d-b5b9-42f0-addd-e1f404db5ee1', 'https://storage.avicola.com.br/perfis/joao_mendes.jpg'),
('a6426fae-d8c0-43b3-8e10-c237c3e4ee44', 'https://storage.avicola.com.br/perfis/ana_costa.jpg'),
('9e16cbff-3f32-4a13-9b90-f6a83e4e6e3e', 'https://storage.avicola.com.br/perfis/pedro_oliveira.jpg');

-- -----------------------------------------------
-- Tabela Ábaco
-- -----------------------------------------------
INSERT INTO abaco (fk_fabrica, nome, descricao, ativo) VALUES
(1, 'SIF 21 - Condenas Linha Abate', 'Ábaco para registro de condenas na linha de abate SIF 21', true),
(2, 'SIF 15 - Controle Qualidade', 'Ábaco de controle de qualidade SIF 15', true),
(3, 'SIF 04 - Inspeção Final', 'Ábaco de inspeção final SIF 04', true),
(4, 'SIF 08 - Processamento', 'Ábaco de processamento SIF 08', true);

-- -----------------------------------------------
-- Tabela Turno
-- -----------------------------------------------
INSERT INTO turno (fk_fabrica, nome, hora_inicio, hora_fim) VALUES
(1, 'Turno A', '06:00:00', '14:00:00'),
(1, 'Turno B', '14:00:00', '22:00:00'),
(2, 'Turno Único', '07:00:00', '17:00:00'),
(3, 'Turno A', '05:00:00', '13:00:00'),
(3, 'Turno B', '13:00:00', '21:00:00'),
(4, 'Turno Único', '08:00:00', '18:00:00');

-- -----------------------------------------------
-- Tabela Linhas e Coluna
-- -----------------------------------------------
INSERT INTO linha (fk_abaco, nome) VALUES
(1, 'Contaminação'),
(1, 'Problemas Técnicos'),
(1, 'Qualidade'),
(2, 'Higiênico-Sanitárias'),
(2, 'Processamento'),
(3, 'Inspeção Ante-Mortem'),
(3, 'Inspeção Post-Mortem');

-- ----------------------------------------------

INSERT INTO coluna (fk_abaco, nome) VALUES
(1, 'Leves'),
(1, 'Moderadas'),
(1, 'Graves'),
(2, 'Aceitável'),
(2, 'Crítico'),
(3, 'Aprovado'),
(3, 'Reprovado'),
(3, 'Condicionado');

-- -----------------------------------------------
-- Tabela Cor e Peso
-- -----------------------------------------------
INSERT INTO cor_peso (fk_abaco, peso_valor, cor) VALUES
(1, 1, 'Verde'),
(1, 10, 'Amarelo'),
(1, 100, 'Laranja'),
(1, 1000, 'Vermelho'),
(2, 1, 'Azul Claro'),
(2, 10, 'Azul'),
(2, 100, 'Roxo'),
(2, 1000, 'Vinho'),
(3, 1, 'Branco'),
(3, 10, 'Cinza'),
(3, 100, 'Marrom'),
(3, 1000, 'Preto');

-- -----------------------------------------------
-- Tabela Foto
-- -----------------------------------------------
INSERT INTO foto (fk_abaco, fk_turno, data_hora, url_imagem) VALUES
(1, 1, '2024-01-15 10:30:00', 'https://storage.avicola.com.br/fotos/seara_turnoa_150124_1030.jpg'),
(1, 2, '2024-01-15 18:45:00', 'https://storage.avicola.com.br/fotos/seara_turnob_150124_1845.jpg'),
(2, 3, '2024-01-15 12:15:00', 'https://storage.avicola.com.br/fotos/sadia_turno_150124_1215.jpg'),
(3, 4, '2024-01-15 09:00:00', 'https://storage.avicola.com.br/fotos/jbs_amparo_turnoa_150124_0900.jpg');

-- -----------------------------------------------
-- Tabela Arquivo
-- -----------------------------------------------
INSERT INTO arquivo (fk_foto, fk_turno, data_hora, arquivo) VALUES
(1, 1, '2024-01-15 10:35:00', 'https://storage.avicola.com.br/arquivos/relatorio_seara_turnoa_150124.pdf'),
(2, 2, '2024-01-15 18:50:00', 'https://storage.avicola.com.br/arquivos/relatorio_seara_turnob_150124.pdf'),
(3, 3, '2024-01-15 12:20:00', 'https://storage.avicola.com.br/arquivos/relatorio_sadia_150124.pdf'),
(4, 4, '2024-01-15 09:05:00', 'https://storage.avicola.com.br/arquivos/relatorio_jbs_amparo_150124.pdf');

-- -----------------------------------------------
-- Tabela Condena
-- -----------------------------------------------
INSERT INTO condena (fk_abaco, fk_linha, fk_coluna, fk_foto, quantidade) VALUES
(1, 1, 1, 1, 5),
(1, 1, 2, 1, 3),
(1, 2, 3, 1, 1),
(1, 3, 1, 2, 8),
(2, 4, 4, 3, 2),
(2, 5, 5, 3, 4),
(3, 6, 6, 4, 12),
(3, 7, 7, 4, 3),
(3, 7, 8, 4, 7);

-- -----------------------------------------------
-- Tabela Pagamento 
-- -----------------------------------------------
INSERT INTO pagamento (fk_fabrica, fk_plano, fk_metodoPag, data_vencimento, valor, data_pagamento, status, data_inicio) VALUES
(1, 1, 3, '2026-02-10', 2099.99, '2026-01-08 14:30:00', true, '2026-01-01 00:00:00'),
(2, 1, 2, '2026-02-10', 2099.99, '2026-01-09 10:15:00', true, '2026-01-01 00:00:00'),
(3, 1, 1, '2026-02-10', 2099.99, '2026-01-07 16:45:00', true, '2026-01-01 00:00:00'),
(4, 1, 4, '2026-02-10', 2099.99, '2026-01-10 09:00:00', true, '2026-01-01 00:00:00');