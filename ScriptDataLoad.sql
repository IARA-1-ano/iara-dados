-- Script DataLoad
-- --------------------------------------------------
-- Inserções Super Administrador
-- --------------------------------------------------
INSERT INTO super_adm (nome, cargo, email, senha_hash) VALUES
('Carlos Silva', 'Super Administrador', 'carlos.silva@avicola.com.br', 'Admin12345');

-- --------------------------------------------------
-- Inserções Planos
-- --------------------------------------------------
INSERT INTO plano (nome, valor, descricao) VALUES
('Mar Profundo', 2099.99, 'Plano full');

-- --------------------------------------------------
-- Inserções Método Pagamento
-- --------------------------------------------------
INSERT INTO metodo_pagamento (tipo_pagamento) VALUES
('Cartão de Crédito'),
('Boleto Bancário'),
('PIX'),
('Transferência Bancária'),
('Débito Automático');

-- --------------------------------------------------
-- Inserções Fábrica
-- --------------------------------------------------
INSERT INTO fabrica (fk_plano, email_corporativo, nome_unidade, cnpj_unidade, status, nome_industria, ramo) VALUES
(1, 'seara.avicula@seara.com.br', 'Seara Unidade Chapecó', '12345678000195', true, 'Seara Alimentos', 'Avícola de Corte'),
(1, 'sadia.avicula@sadia.com.br', 'Sadia Unidade Toledo', '98765432000187', true, 'Sadia', 'Avícola de Corte'),
(1, 'jbs.amparo@jbs.com.br', 'JBS Unidade Amparo', '45678912000134', true, 'JBS Friboi', 'Avícola de Corte'),
(1, 'jbs.lins@jbs.com.br', 'JBS Unidade Lins', '32165498000176', true, 'JBS Friboi', 'Avicultura de Corte');

-- --------------------------------------------------
-- Inserções Endereço
-- --------------------------------------------------
INSERT INTO endereco (cep, numero, rua, complemento, bairro, cidade, estado, fk_fabrica) VALUES
('89802020', 1500, 'Rodovia SC-155', 'Km 15', 'Industrial', 'Chapecó', 'Santa Catarina', 1),
('85900000', 2500, 'Av. das Indústrias', 'Lote 25', 'Zona Industrial', 'Toledo', 'Paraná', 2),
('13900000', 1800, 'Rodovia SP-340', 'Km 118', 'Distrito Industrial', 'Amparo', 'São Paulo', 3),
('16400000', 3200, 'Rodovia Marechal Rondon', 'Km 545', 'Polo Industrial', 'Lins', 'São Paulo', 4);

-- --------------------------------------------------
-- Inserções Usuário
-- --------------------------------------------------
INSERT INTO usuario (fk_fabrica, email, senha, nome, tipo_acesso, status, data_nascimento, cargo) VALUES
(1, 'gerente.seara@seara.com.br', 'Seara123', 'João Mendes', 'Administrador', 'Ativo', '1980-05-15', 'Gerente'),
(1, 'supervisor.seara@seara.com.br', 'Seara123', 'Ana Costa', 'Supervisor', 'Ativo', '1985-08-22', 'Supervisor'),
(2, 'gerente.sadia@sadia.com.br', 'Sadia123', 'Pedro Oliveira', 'Administrador', 'Ativo', '1978-12-10', 'Gerente'),
(3, 'gerente.jbs@jbs.com.br', 'Jbs12345', 'Fernanda Lima', 'Administrador', 'Ativo', '1982-03-30', 'Gerente'),
(4, 'supervisor.lins@jbs.com.br', 'Jbs12345', 'Ricardo Souza', 'Supervisor', 'Ativo', '1990-07-18', 'Supervisor');

-- --------------------------------------------------
-- Inserções Foto de Perfil
-- --------------------------------------------------
INSERT INTO foto_perfil (fk_usuario, url) VALUES
((SELECT id FROM usuario WHERE email = 'gerente.seara@seara.com.br'), 'https://storage.avicola.com.br/perfis/joao_mendes.jpg'),
((SELECT id FROM usuario WHERE email = 'supervisor.seara@seara.com.br'), 'https://storage.avicola.com.br/perfis/ana_costa.jpg'),
((SELECT id FROM usuario WHERE email = 'gerente.sadia@sadia.com.br'), 'https://storage.avicola.com.br/perfis/pedro_oliveira.jpg');

-- --------------------------------------------------
-- Inserções Ábaco
-- --------------------------------------------------
INSERT INTO abaco (fk_fabrica, nome, descricao, ativo) VALUES
(1, 'SIF 21 - Condenas Linha Abate', 'Ábaco para registro de condenas na linha de abate SIF 21', true),
(2, 'SIF 15 - Controle Qualidade', 'Ábaco de controle de qualidade SIF 15', true),
(3, 'SIF 04 - Inspeção Final', 'Ábaco de inspeção final SIF 04', true),
(4, 'SIF 08 - Processamento', 'Ábaco de processamento SIF 08', true);

-- --------------------------------------------------
-- Inserções Turno
-- --------------------------------------------------
INSERT INTO turno (fk_fabrica, nome, hora_inicio, hora_fim) VALUES
(1, 'Turno A', '06:00:00', '14:00:00'),
(1, 'Turno B', '14:00:00', '22:00:00'),
(2, 'Turno Único', '07:00:00', '17:00:00'),
(3, 'Turno A', '05:00:00', '13:00:00'),
(3, 'Turno B', '13:00:00', '21:00:00'),
(4, 'Turno Único', '08:00:00', '18:00:00');

-- --------------------------------------------------
-- Inserções Linha
-- --------------------------------------------------
INSERT INTO linha (fk_abaco, nome) VALUES
(1, 'Contaminação'),
(1, 'Problemas Técnicos'),
(1, 'Qualidade'),
(2, 'Higiênico-Sanitárias'),
(2, 'Processamento'),
(3, 'Inspeção Ante-Mortem'),
(3, 'Inspeção Post-Mortem');

-- --------------------------------------------------
-- Inserções Coluna
-- --------------------------------------------------
INSERT INTO coluna (fk_abaco, nome) VALUES
(1, 'Leves'),
(1, 'Moderadas'),
(1, 'Graves'),
(2, 'Aceitável'),
(2, 'Crítico'),
(3, 'Aprovado'),
(3, 'Reprovado'),
(3, 'Condicionado');

-- --------------------------------------------------
-- Inserções Cor e Peso
-- --------------------------------------------------
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

-- --------------------------------------------------
-- Inserções Foto
-- --------------------------------------------------
INSERT INTO foto (fk_abaco, fk_turno, data_hora, url_imagem) VALUES
(1, 1, '2024-01-15 10:30:00', 'https://storage.avicola.com.br/fotos/seara_turnoa_150124_1030.jpg'),
(1, 2, '2024-01-15 18:45:00', 'https://storage.avicola.com.br/fotos/seara_turnob_150124_1845.jpg'),
(2, 3, '2024-01-15 12:15:00', 'https://storage.avicola.com.br/fotos/sadia_turno_150124_1215.jpg'),
(3, 4, '2024-01-15 09:00:00', 'https://storage.avicola.com.br/fotos/jbs_amparo_turnoa_150124_0900.jpg');

-- --------------------------------------------------
-- Inserções Arquivo
-- --------------------------------------------------
INSERT INTO arquivo (fk_foto, fk_turno, data_hora, arquivo) VALUES
(1, 1, '2024-01-15 10:35:00', 'https://storage.avicola.com.br/arquivos/relatorio_seara_turnoa_150124.pdf'),
(2, 2, '2024-01-15 18:50:00', 'https://storage.avicola.com.br/arquivos/relatorio_seara_turnob_150124.pdf'),
(3, 3, '2024-01-15 12:20:00', 'https://storage.avicola.com.br/arquivos/relatorio_sadia_150124.pdf'),
(4, 4, '2024-01-15 09:05:00', 'https://storage.avicola.com.br/arquivos/relatorio_jbs_amparo_150124.pdf');

-- --------------------------------------------------
-- Inserções Condena
-- --------------------------------------------------
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

-- --------------------------------------------------
-- Inserções Pagamentos
-- --------------------------------------------------
INSERT INTO pagamento (fk_fabrica, fk_plano, fk_metodoPag, data_vencimento, valor, data_pagamento, status) VALUES
(1, 1, 3, '2024-01-10', 2099.99, '2024-01-08 14:30:00', true),
(2, 1, 2, '2024-01-10', 2099.99, '2024-01-09 10:15:00', true),
(3, 1, 1, '2024-01-10', 2099.99, '2024-01-07 16:45:00', true),
(4, 1, 4, '2024-01-10', 2099.99, '2024-01-10 09:00:00', true);
