--após dropar todas as tabelas e limpar seu banco:
--crie uma pasta intitulada: ORACLE
--adicione o arquivo SCRIPT_MODELO_PEDIDO dentro dela
--cole o caminho aqui no compilador e execute

@ 'C:\Users\coala\Desktop\oracle\SCRIPT_MODELO_PEDIDO';

--execute os blocos separado do comando acima--
alter table cidade modify nom_cidade varchar2(50);
alter table pedido add status varchar2(50);
--faça a verificação abaixo
select * from pais;
--caso nao tenha nada, comandos abaixo para copiar os dados, tabela por tabela
insert into pais select * from rm98420.pais; 
commit;

-- Inserindo dados na tabela estado
INSERT INTO estado SELECT * FROM rm98420.estado;

-- Inserindo dados na tabela cidade
INSERT INTO cidade SELECT * FROM rm98420.cidade;

-- Inserindo dados na tabela estoque
INSERT INTO estoque SELECT * FROM rm98420.estoque;

-- Inserindo dados na tabela cliente
INSERT INTO cliente SELECT * FROM rm98420.cliente;

-- Inserindo dados na tabela produto
INSERT INTO produto SELECT * FROM rm98420.produto;

-- Inserindo dados na tabela estoque_produto
INSERT INTO estoque_produto SELECT * FROM rm98420.estoque_produto;

-- Inserindo dados na tabela tipo_endereco
INSERT INTO tipo_endereco SELECT * FROM rm98420.tipo_endereco;

-- Inserindo dados na tabela endereco_cliente
INSERT INTO endereco_cliente SELECT * FROM rm98420.endereco_cliente;

-- Inserindo dados na tabela vendedor
INSERT INTO vendedor SELECT * FROM rm98420.vendedor;

-- Inserindo dados na tabela cliente_vendedor
INSERT INTO cliente_vendedor SELECT * FROM rm98420.cliente_vendedor;

-- Inserindo dados na tabela usuario
INSERT INTO usuario SELECT * FROM rm98420.usuario;

-- Inserindo dados na tabela pedido
INSERT INTO pedido SELECT * FROM rm98420.pedido;

-- Inserindo dados na tabela item_pedido
INSERT INTO item_pedido SELECT * FROM rm98420.item_pedido;

-- Inserindo dados na tabela historico_pedido
INSERT INTO historico_pedido SELECT * FROM rm98420.historico_pedido;

-- Inserindo dados na tabela produto_composto
INSERT INTO produto_composto SELECT * FROM rm98420.produto_composto;

-- Inserindo dados na tabela tipo_movimento_estoque
INSERT INTO tipo_movimento_estoque SELECT * FROM rm98420.tipo_movimento_estoque;

-- Inserindo dados na tabela movimento_estoque
INSERT INTO movimento_estoque SELECT * FROM rm98420.movimento_estoque;
