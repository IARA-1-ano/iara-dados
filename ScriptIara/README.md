# 🧩 Banco de Dados - Projeto IARA

## 📘 Descrição
Este repositório contém o **script SQL completo** e o **script dataLoad** responsáveis pela **criação, modelagem e estruturação do banco de dados** do projeto **IARA**.  
O banco foi desenvolvido para sustentar o sistema principal do aplicativo IARA, garantindo **integridade, consistência, relacionamentos entre entidades** e **proteção de dados pessoais e industriais**.
---

## 🗂 Estrutura do Repositório

```

📁 ScriptIara/
└── 💾 iara_script(v12).sql
└── 💾 iara_scriptDataload(vFinal).sql

````

O arquivo `iara_script(v12).sql` contém todo o script de criação do banco de dados, incluindo **tabelas, chaves primárias, estrangeiras, constraints, e views**.

---

## ⚙️ Configurações Iniciais

O script inicia configurando o ambiente do banco:

```sql
SET TIMEZONE = 'America/Sao_Paulo';
SHOW TIMEZONE;
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
````

Essas instruções garantem que os registros sigam o fuso horário correto e que seja possível usar **UUIDs** como identificadores únicos.

---

## 🧱 Estrutura do Banco de Dados

### **1. Super Administrador (`super_adm`)**

Armazena os dados dos administradores do sistema, com validação de senha mínima de 8 caracteres.

### **2. Plano (`plano`)**

Define os planos contratados pelas fábricas, com valor, descrição e duração.

### **3. Método de Pagamento (`metodo_pagamento`)**

Lista os métodos disponíveis para pagamento de planos.

### **4. Fábrica (`fabrica`)**

Contém informações de cada fábrica cadastrada, vinculada a um plano e com CNPJ validado.

### **5. Endereço (`endereco`)**

Registra os endereços associados a cada fábrica.

### **6. Usuário (`usuario`)**

Tabela central de usuários do sistema, identificados por UUID, contendo dados pessoais e cargo.
Inclui verificações de senha e data de nascimento válidas.

### **7. Foto de Perfil (`foto_perfil`)**

Associa URLs de imagens de perfil a cada usuário.

### **8. Ábaco (`abaco`)**

Tabela usada para controle industrial e análises de produção.

### **9. Turno (`turno`)**

Gerencia os turnos de cada fábrica, com validações de horários.

### **10. Foto (`foto`)**

Guarda as imagens tiradas de cada ábaco em um turno específico.

### **11. Arquivo (`arquivo`)**

Registra arquivos resultantes do processamento de fotos industriais.

### **12. Linha e Coluna (`linha`, `coluna`)**

Estruturas auxiliares que definem a matriz de posições do ábaco.

### **13. Condena (`condena`)**

Controla a quantidade de peças condenadas no processo industrial, relacionando linha, coluna e foto.

### **14. Cor e Peso (`cor_peso`)**

Relaciona cores a pesos e valores usados nos cálculos industriais.

### **15. Pagamento (`pagamento`)**

Gerencia pagamentos, planos e métodos vinculados às fábricas, com checagem de datas e valores.

---

## 👁️ Views Criadas

### **View `exibicao_fabrica`**

Exibe as fábricas com seus dados principais, endereço formatado e plano contratado.

```sql
CREATE OR REPLACE VIEW exibicao_fabrica AS
SELECT 
    f.id,
    f.nome_unidade,
    f.cnpj_unidade,
    f.status,
    f.email_corporativo,
    f.nome_industria,
    f.ramo,
    format('%s, n° %s %s', e.rua, e.numero, e.complemento) AS "endereco",
    p.nome AS "plano"
FROM fabrica f
LEFT JOIN endereco e ON e.fk_fabrica = f.id
JOIN plano p ON p.id = f.fk_plano;
```

### **View `email_gerentes`**

Retorna todos os e-mails dos usuários com tipo de acesso de gerente.

```sql
CREATE OR REPLACE VIEW email_gerentes AS
SELECT email FROM usuario WHERE tipo_acesso = 2;
```

---

## 🧠 Regras e Validações Importantes

* **Senhas** devem ter no mínimo 8 caracteres.
* **CNPJs e CEPs** são validados quanto ao tamanho.
* **Datas de nascimento** devem ser anteriores à data atual.
* **Valores e quantidades** possuem restrições para não serem negativos.
* **Turnos** exigem que o horário final seja posterior ao inicial.

---

## 🔒 Observações Finais

* O script foi desenvolvido seguindo princípios de **normalização e integridade referencial**.
* A extensão `uuid-ossp` foi utilizada para geração automática de UUIDs em tabelas de usuários.
* O banco foi projetado para integração com o backend e os notebooks de pseudonimização de dados.

---

## 💾 Arquivo Principal

* `iara_script(v12).sql` → Script completo do banco de dados do sistema IARA.

## 💾 Arquivo Secundário

* `iara_scriptDataload(v12).sql` → Script completo do banco de dados do sistema IARA.


```

---
