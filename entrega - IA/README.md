***PROJETO IARA - Pseudonimização e Proteção de Dados e Introdução à Inteligência Artificial.***




**Descrição:**
Conjunto de códigos, arquivos e memoriais com a função de realizar a devida proteção dos dados pessoais do aplicativo IARA, que integra o trabalho Interdisciplinar 2025 na escola Germinare Tech.





**Resumo e estrutura das pastas:**
Estão inseridos dentro da pasta "entrega - IA", os requisitos da matéria de **Inteligência Artificial do projeto IARA**. 
Dentre os itens que compõem ela, podemos destacar memoriais descritivos, script, arquivos .ipynb, arquivos .csv, e também imagens que detalham o banco que foi usados para armazenar os dados pessoais com as devidas medidas de proteção.


A partir dos itens utilizados no trabalho que estão dentro da pasta "entrega - IA", também há o seguinte **fluxo de hierarquia**, para dividir os assuntos dentro dela:

	
	📁 entrega - IA
	├── 📁 .idea/
	│
	├── 📁 Prompt do Sistema/
	│   └── 📝 MEMORIAL DESCRITIVO – PROMPT DE SISTEMA.docx
	│
	├── 📁 Proteção dos dados pessoais/
	│   ├── 📁 Formatação/
	│   │   ├── 📝 MEMORIAL DESCRITIVO – CRIPTOGRAFIA.docx
	│   │   └── 📝 MEMORIAL DESCRITIVO – PROTEÇÃO DOS DADOS PESSOAIS DOS USUÁRIOS.docx
	│   │
	│   └── 📁 tabelas/
	│       ├── 📁 SuperAdm/
	│       │   ├── 📁 CSV/
	│       │   ├── 📁 ImagemBanco/
	│       │   └── 📓 SuperAdm.ipynb
	│       │
	│       └── 📁 Usuário/
	│           ├── 📁 CSV/
	│           ├── 📁 ImagemBanco/
	│           └── 📓 usuario.ipynb
	│
	├── 📁 Script BD dados pessoais/
	│   └── 💾 db1ano_dados_pessoais.sql
	│
	├── ⚙️ .env
	├── ⚙️ .gitignore
	└── 📄 README.md
	


Dentro da pasta **"Prompt do Sistema"**, encontra-se o "MEMORIAL DESCRITIVO – PROMPT DE SISTEMA", conforme o exigido nas competências de IA e que contém o modelo de prompt de Sistema modelado pelo 1° ano.

	MEMORIAL DESCRITIVO – PROMPT DE SISTEMA.docx
	

A partir da pasta **"Formatação"**, dentro de "Proteção dos dados pessoais", temos 2 arquivos .docx que contemplam a demanda de IA e são responsáveis por documentar as operações realizadas:
	
	MEMORIAL DESCRITIVO – PROTEÇÃO DOS DADOS PESSOAIS DOS USUÁRIOS.docx
	MEMORIAL DESCRITIVO – CRIPTOGRAFIA.docx


As subpastas de **"tabelas"**, dentro de "Proteção dos dados pessoais" correspondem as tabelas que apresentam dados pessoais no esquema do banco original. 

	Essas subpastas contém os seguintes itens:
		
		Um arquivo .ipynb ou Notebook que está totalmente de acordo com a tabela original no banco de dados.
		Uma pasta na qual será guardada arquivos .csv que guardam os pares de informação: original e protegida. É importante lembrar que essa pasta não foi adicionada ao repositório por conta de sua alta exposição dos dados originais, e será enviada em um meio de comunicação seguro e eficaz.
		Uma pasta chamada "ImagemBanco", na qual se guardam as imagens do banco com as informações protegidas.

Já a pasta **"Script BD dados pessoais"**, é responsável por guardar o script do banco criado para guardar as informações protegidas dos dados pessoais (db1ano_dados_pessoais.sql).

	db1ano_dados_pessoais.sql


A respeito do **.env**, ele é responsável por guardar as credenciais do banco remoto criado para o projeto, e foi acrescentada ao **.gitignore** para não ser exposto.

	.env
	

Como citado, o **.gitignore** foi utilizado para ignorar o **.env**, mas também foi responsável por guardar as pastas **"CSV"**, as quais contém os arquivos **.csv** com os pares de informação original e protegida.

	.gitignore




		
**Observações finais:**
Dentro de cada arquivo **.ipynb**, foi executado um comando 'display(<df_protegido>)' para facilitar a visualização dos dados já com as devidas medidas de proteção.
Para acessar os dados originais, o dataload e o script original do banco, basta acessar a pasta "ScriptIara" ao invés da "entrega - IA".

