# Estoque SQL

O código representa a estrutura de um banco de dados com quatro tabelas: "cliente", "vendedor", "produtos" e "vendas". Cada tabela possui colunas que armazenam informações específicas.

A tabela "cliente" contém as informações dos clientes, como o ID, nome, CPF e telefone. O ID é definido como a chave primária da tabela, o que garante a unicidade de cada cliente.

A tabela "vendedor" guarda os dados dos vendedores, como o ID, nome, CPF e telefone. O ID também é definido como chave primária.

A tabela "produtos" armazena os detalhes dos produtos disponíveis para venda. Ela possui colunas para o ID, nome, valor e quantidade. O ID é definido como chave primária, enquanto o valor é um número decimal que representa o preço do produto. A coluna "quantidade" indica a quantidade disponível em estoque.

A tabela "vendas" registra as informações sobre as vendas realizadas. Ela possui um ID único para cada venda, além das colunas "cliente_id" e "vendedor_id". Essas duas colunas são chaves estrangeiras que se relacionam com as tabelas "cliente" e "vendedor", respectivamente, garantindo a integridade referencial. Isso significa que o cliente_id e o vendedor_id em cada registro da tabela "vendas" devem corresponder a um ID existente nas tabelas "cliente" e "vendedor".

Além disso, o código inclui um gatilho (trigger) chamado "decrementar_quantidade_produto". Esse gatilho é acionado após a inserção de um registro na tabela "vendas". Quando acionado, ele executa uma atualização na tabela "produtos", diminuindo em 1 a quantidade do produto vendido. Essa atualização é feita com base no ID do produto registrado na venda, acessado através da variável "NEW.produto_id".

É importante lembrar que esse é apenas um exemplo básico de estrutura de banco de dados e gatilho. Em um ambiente de produção real, é necessário considerar outras considerações, como validações de dados, tratamento de erros e otimização de consultas, de acordo com as necessidades específicas do sistema.