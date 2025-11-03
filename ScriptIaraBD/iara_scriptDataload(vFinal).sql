-- SCRIPT DATALOAD 
-- -----------------------------------------------
-- Tabela super ADM
-- -----------------------------------------------
INSERT INTO super_adm (nome, cargo, email, senha) VALUES
('Lucas Kluska Donini', 'Dev Backend', 'lucas.donini@germinare.org.br', '$2a$15$.RNms4TylNvpnjxb3FVP0eK8NMw9zXVbchFaZW6VS0iR2ZFHJkfAu'),
('Ryan Cursino Moraes', 'Dev Backend', 'ryan.moraes@germinare.org.br', '$2a$15$pSyKf8/wrB7lLO6YrYlHL.hfDiFeIiKsqtV0GmzYkJa7g29v/4Hdy'),
('Gustavo Kenzo Shirahata Ota', 'Dev Frontend', 'gustavo.ota@germinare.org.br', '$2a$15$CweaGwjD9fESqkuFqFliJeyLEy1Vv6cBYx.05bLBgNkdVBr9JhOBC'),
('Luigi Azevedo Biondo', 'Dev Frontend', 'luigi.biondo@germinare.org.br', '$2a$15$6pG3a8QJkb9F2jcHhtIl..WeLMoohFveGlqs8XJ/oshvx27WWQjuK'),
('Enzo Christowan Joaquim', 'Analista de Dados', 'enzo.joaquim@germinare.org.br', '$2a$15$4CHCAC2RhRkDnPXvOt5JDuM5/pfBTTa09.9oTbT/Z7wryTxxE5IBi'),
('Letícia Favoretto Pires de Camargo', 'UX Designer e Engenheira de Dados', 'leticia.camargo@germinare.org.br', '$2a$15$3g5smqPP7tPeNpDjyGUiKumKB9yIsELtWM9g.31OzSJG44NBlseuW'),
('Nicolas Isepe Paz', 'Engenheiro de Dados', 'nicolas.paz@germinare.org.br', '$2a$15$SbjpG85.RrTeBLkMZY8HkeRzaoAJCpTUHdxvUMv.P1QO8gkKgxo3O'),
('Davi Arakaki Oliveira de Souza', 'Engenheiro de Dados', 'davi.souza@germinare.org.br', '$2a$15$hZ0zxuAZin4X0vtq54DKEOYVaSXpYnPseLoHElABMUL2THzJ8Yfyi');

-- -----------------------------------------------
-- Tabela Plano 
-- -----------------------------------------------
INSERT INTO plano (nome, valor, descricao, duracao) VALUES
('Plano Teste', 0.00, 'Teste grátis', INTERVAL '15 days'),
('Plano Japurá', 2100.00, 'Plano com acesso total', INTERVAL '1 month'),
('Plano Purus', 12600.00, 'Plano com acesso total', INTERVAL '6 months'),
('Plano Madeira', 25200.00, 'Plano com acesso total', INTERVAL '1 year'),
('Plano Amazonas', 100000.00, 'Plano com acesso total', INTERVAL '5 years');

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
(1, 'seara.chapeco@seara.com.br', 'Seara Unidade Chapecó', '12345678000195', true, 'Seara Alimentos', 'Avícola de Corte'),
(2, 'seara.rolandia@seara.com.br', 'Seara Unidade Rolândia', '98765432000187', true, 'Seara Alimentos', 'Avícola de Corte'),
(3, 'jbs.amparo@jbs.com.br', 'JBS Unidade Amparo', '45678912000134', true, 'JBS Friboi', 'Avícola de Corte'),
(4, 'jbs.osasco@jbs.com.br', 'JBS Unidade Osasco', '32165498000176', true, 'JBS Friboi', 'Avicultura de Corte'),
(5, 'jbs.lins@jbs.com.br', 'JBS Unidade Lins', '32165408000176', true, 'JBS Friboi', 'Avicultura de Corte');

-- -----------------------------------------------
-- Tabela Endereço
-- -----------------------------------------------
INSERT INTO endereco (fk_fabrica, cep, numero, rua, complemento, bairro, cidade, estado) VALUES
(1, '89802020', 1500, 'Rodovia SC-155', 'Km 15', 'Industrial', 'Chapecó', 'Santa Catarina'),
(2, '85900000', 2500, 'Av. das Indústrias', 'Lote 25', 'Zona Industrial', 'Rolândia', 'Paraná'),
(3, '13900000', 1800, 'Rodovia SP-340', 'Km 118', 'Distrito Industrial', 'Amparo', 'São Paulo'),
(4, '16400000', 3200, 'Rodovia Marechal Rondon', 'Km 545', 'Osasco', 'São Paulo', 'São Paulo'),
(5, '09012323', 3201, 'Rodovia Marechal Lins', 'Km 546', 'Polo Industrial de ', 'Lins', 'São Paulo');

-- -----------------------------------------------
-- Tabela Usuário (Gerente/Usuário)
-- -----------------------------------------------

-- GERENTE
INSERT INTO usuario (fk_fabrica, email, senha, nome, genero, tipo_acesso, desc_tipoacesso, status, data_nascimento, cargo) VALUES
(1, 'ana.costa@seara.com.br', '$2a$15$6f0MKf1mUEVfSDQeN3OVc.2MYTjZxklW/cwvNnURh27TwbWBsVBOq', 'Ana Costa', 'feminino', 2, 'ler, tirar foto, aprovar foto, cadastrar ábaco, cadastrar pessoa', true, '1985-08-22', 'Gerente');

-- USUÁRIOS
INSERT INTO usuario(fk_fabrica, email, id_gerente, senha, nome, genero, tipo_acesso, desc_tipoacesso, status, data_nascimento, cargo) VALUES
(1, 'emerson.souza@jbs.com.br', (select id from usuario where email = 'ana.costa@seara.com.br'), '$2a$15$pQkDPRa454W4Ls4si6OVseEQp/q8T04rxhiaA.jRJ08djUbJ30Bca', 'Emerson Souza', 'masculino', 1, 'ler, tirar foto, aprovar foto', true, '1990-07-18', 'Supersivor SIF'),
(1, 'renata.cursino@jbs.com.br', (select id from usuario where email = 'ana.costa@seara.com.br'), '$2a$15$2nDRCcy8zthAjozlq2.P4eSOEBNaEy8Mj5.uF27/uJTvBp3rp1yTG', 'Renata Cursino', 'masculino', 1, 'ler, tirar foto, aprovar foto', true, '1990-07-18', 'Supervisor SIF');

-- -----------------------------------------------
-- Tabela Foto de Perfil 
-- -----------------------------------------------
INSERT INTO foto_perfil (fk_usuario, url) VALUES
((select id from usuario where email = 'emerson.souza@jbs.com.br'), 'https://storage.avicola.com.br/perfis/emerson_souza.jpg'),
((select id from usuario where email = 'emerson.souza@jbs.com.br'), 'https://storage.avicola.com.br/perfis/emerson_souza2.jpg'),
((select id from usuario where email = 'emerson.souza@jbs.com.br'), 'https://storage.avicola.com.br/perfis/emerson_souza3.jpg');

-- -----------------------------------------------
-- Tabela Ábaco
-- -----------------------------------------------
INSERT INTO abaco (fk_fabrica, nome, descricao, ativo) VALUES
(1, 'SIF 21 - Condenas Linha Abate', 'Ábaco para registro de condenas na linha de abate SIF 21', true),
(2, 'SIF 15 - Controle Qualidade', 'Ábaco de controle de qualidade SIF 15', true),
(3, 'SIF 04 - Inspeção Final', 'Ábaco de inspeção final SIF 04', true),
(4, 'SIF 05 - Inspeção Final', 'Ábaco de inspeção final SIF 05', true),
(5, 'SIF 08 - Processamento', 'Ábaco de processamento SIF 08', true);

-- -----------------------------------------------
-- Tabela Turno
-- -----------------------------------------------
INSERT INTO turno (fk_fabrica, nome, hora_inicio, hora_fim) VALUES
(1, 'Turno A', '06:00:00', '14:00:00'),
(1, 'Turno B', '14:00:00', '22:00:00'),
(3, 'Turno Único', '07:00:00', '17:00:00'),
(2, 'Turno A', '05:00:00', '13:00:00'),
(2, 'Turno B', '13:00:00', '21:00:00'),
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
(2, 3, '2024-01-15 12:15:00', 'https://storage.avicola.com.br/fotos/seara_turno_150124_1215.jpg'),
(3, 4, '2024-01-15 09:00:00', 'https://storage.avicola.com.br/fotos/jbs_amparo_turnoa_150124_0900.jpg');

-- -----------------------------------------------
-- Tabela Arquivo
-- -----------------------------------------------
INSERT INTO arquivo (fk_foto, fk_turno, data_hora, arquivo) VALUES
(1, 1, '2024-01-15 10:35:00', 'https://storage.avicola.com.br/arquivos/relatorio_seara_turnoa_150124.pdf'),
(2, 2, '2024-01-15 18:50:00', 'https://storage.avicola.com.br/arquivos/relatorio_seara_turnob_150124.pdf'),
(3, 3, '2024-01-15 12:20:00', 'https://storage.avicola.com.br/arquivos/relatorio_seara_150124.pdf'),
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