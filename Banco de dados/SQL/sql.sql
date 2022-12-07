                                                                                                                                  ATIVIDADE SQL  
   Crie uma database (loja) com 4 tabelas (clientes,compras,produtos,compras_contem_produtos) , preencha as tabelas com dados aleatórios e faça as seguintes consultas:
1) Mostrar todos os dados de Clientes					
2) Mostrar nome, rg e telefone dos Clientes					
3) Mostrar nome e preço de Todos os Produtos					
4) Mostrar Nome, preço e estoque das Bebidas					
5) Mostrar todos os produtos com preço acima de 5 reais					
6) Mostrar a quantidade total de produtos em estoque.					
7) Mostrar a soma de todas as compras.					
8) Mostrar todos os produtos ordenados pelo nome (A-Z)					
9) Mostrar o nome e o valor total da compra realizada pela cliente Mariah Jaqueline Aparício					
10) Mostrar todos os cliente que são do estado de SP ou do  CE.					
11) Mostrar todos os cliente que são do estado do CE e do bairro Centro.					
12)Mostrar a lista de produtos ordenado pelo preço do menor para o maior.					
13) Mostrar uma lista dos produtos que foram comprados pelo cliente Benedito Henry Teixeira, bem como seu nome e endereço completo.					
14) Mostrar a quantidade de clientes que são do estado do CE.					
15) Mostrar a soma dos estoques de todas as bebidas do estabelecimento.					

-> Criando tabelas:

CREATE DATABASE loja;

USE loja;

CREATE TABLE clientes (
id_cli INT AUTO_INCREMENT,
rg_cli VARCHAR(20) NOT NULL,
nome_cli VARCHAR(100) NOT NULL,
tel_cli VARCHAR(50),
rua VARCHAR(100),
num INT,
bairro VARCHAR(100),
cep VARCHAR(20),
CONSTRAINT pk_id_cli PRIMARY KEY(id_cli)
);

CREATE TABLE produtos (
id_prod INT AUTO_INCREMENT,
nome_prod VARCHAR(100) NOT NULL,
tipo_prod VARCHAR(100) NOT NULL,
preco_prod FLOAT NOT NULL,
estoque_prod INT,
CONSTRAINT pk_id_prod PRIMARY KEY(id_prod)
);

CREATE TABLE compras (
id_compra INT AUTO_INCREMENT,
data_compra DATE NOT NULL,
valor_compra FLOAT NOT NULL,
id_cli INT,
CONSTRAINT pk_id_compra PRIMARY KEY(id_compra),
CONSTRAINT fk_compras_clientes FOREIGN KEY(id_cli) REFERENCES clientes(id_cli)
);


CREATE TABLE compras_contem_produtos (
id INT AUTO_INCREMENT,
quantidade INT NOT NULL,
id_prod INT,
id_compra INT,
CONSTRAINT pk_id_compra_produtos PRIMARY KEY(id),
CONSTRAINT fk_ccp_produtos FOREIGN KEY(id_prod) REFERENCES produtos(id_prod)
CONSTRAINT fk_ccp_compras FOREIGN KEY(id_compra) REFERENCES compras(id_compra),
);

-> Populando tabelas

TABELA clientes

INSERT INTO clientes VALUES(NULL,'42.515.012-4','Leonardo Diego das Neves','(68)98106-8326','Avenida Santos Dumont','160','Centro','69934-970','Epitaciolândia','AC');

INSERT INTO clientes VALUES(NULL,'35.993.799-8','Vallentina Jenniffer Livia','(64) 98941-7452','Avenida 11 de Novembro','729','Setor Central','75619-970','Aloândia','GO');

INSERT INTO clientes VALUES(NULL,'14.594.456-6','Benedito Henry Teixeira','(88) 99690-4161','Rua Eduardo Mota','640','Centro','62420-970','Chaval','CE');

INSERT INTO clientes VALUES(NULL,'11.946.174-2','Mariah Jaqueline Aparício','(88) 3753-8770','Rua Santa Isabel','539','São Miguel','63010-555','Juazeiro do Norte','CE');

INSERT INTO clientes VALUES(NULL,'27.722.583-8','Alice Pietra Ramos','(31) 99404-8773','Rua Doutor Álvaro Lobo Leite','521','Centro','36419-970','Lobo Leite','MG');

INSERT INTO clientes VALUES(NULL,'38.895.346-9','Mário Márcio Ruan Pinto',' (13) 98485-6954','Rua Rubião Júnior ','418','Centro','11013-210','Santos','SP');


TABELA compras  

INSERT INTO compras VALUES(NULL,'2022-10-05',58.8,4);
INSERT INTO compras VALUES(NULL,'2022-10-05',110,1);
INSERT INTO compras VALUES(NULL,'2022-10-07',81.7,3);
INSERT INTO compras VALUES(NULL,'2022-10-07',51,6);


TABELA produtos

INSERT INTO produtos VALUES(NULL,'Energético TNT 269ML','Bebidas',5,5,35)
INSERT INTO produtos VALUES(2,'Arroz Juliano Parboilizado','Arroz',4,5,150)
INSERT INTO produtos VALUES(3,'Arroz Juliano Branco','Arroz',4,2,122)
INSERT INTO produtos VALUES(4,'Coca Cola 1 litro','Bebidas',8,5,36)
INSERT INTO produtos VALUES(5,'Biscoito Recheado Bolão Morango','Doces',2,7,45)
INSERT INTO produtos VALUES(6,'Água Mineral sem Gás','Bebidas',2,266)
INSERT INTO produtos VALUES(7,'Chocolate Gutti Gutti 50g','Doces',1,9,61)
INSERT INTO produtos VALUES(8,'Suco de Laranja Laranjinha','Bebidas',3,16)


TABELA compras_contem_produtos

 
INSERT INTO compras_contem_produtos VALUES(NULL,10,1,3);
INSERT INTO compras_contem_produtos VALUES(NULL,4,1,5);
INSERT INTO compras_contem_produtos VALUES(NULL,2,1,8);
INSERT INTO compras_contem_produtos VALUES(NULL,20,2,2);
INSERT INTO compras_contem_produtos VALUES(NULL,10,2,6);
INSERT INTO compras_contem_produtos VALUES(NULL,4,3,1);
INSERT INTO compras_contem_produtos VALUES(NULL,10,3,3);
INSERT INTO compras_contem_produtos VALUES(NULL,3,3,7);
INSERT INTO compras_contem_produtos VALUES(NULL,4,3,8);
INSERT INTO compras_contem_produtos VALUES(NULL,6,4,4)

			

                                                                                                             CONSULTAS

1) Mostrar todos os dados de Clientes		

SELECT * FROM clientes;

2) Mostrar nome, rg e telefone dos Clientes	

SELECT nome_cli,rg_cli,tel_cli FROM clientes;

3) Mostrar nome e preço de Todos os Produtos	

SELECT nome_prod,  preco_prod FROM produtos;

4) Mostrar Nome, preço e estoque das Bebidas			

SELECT nome_prod, preco_prod, estoque_prod FROM produtos WHERE tipo_prod = 'Bebidas';	
	
5) Mostrar todos os produtos com preço acima de 5 reais

SELECT *  FROM produtos WHERE preco_prod > 5;
					
6) Mostrar a quantidade total de produtos em estoque.
					
SELECT SUM(estoque_prod) AS soma_estoque FROM produtos;	

7) Mostrar a soma de todas as compras.

SELECT SUM(valor_compra) AS soma_compras FROM compras;		
			
8) Mostrar todos os produtos ordenados pelo nome (A-Z)

SELECT * FROM produtos ORDER BY nomes_prod ASC;
					
9) Mostrar o nome e o valor total da compra realizada pela cliente Mariah Jaqueline Aparício

SELECT clientes.nome_cli, SUM(compras.valor_compra) AS valor_compras, produtos.nome_prod FROM compras_contem_produtos INNER JOIN produtos ON compras_contem_produtos.id_prod = produtos.id_prod
INNER JOIN compras ON compras_contem_produtos.id_compra = compras.id_compra
INNER JOIN clientes  WHERE clientes.id_cli= 4;



SELECT clientes.nome_cli, SUM(compras.valor_compra)  AS valor_compras
FROM  compras INNER JOIN clientes
ON clientes.id_cli = compras.id_cli
WHERE compras.id_cli = 4;


		
10) Mostrar todos os cliente que são do estado de SP ou do  CE.					

SELECT * FROM clientes WHERE estado = 'SP' OR estado = 'CE';


11) Mostrar todos os cliente que são do estado do CE e do bairro Centro.

SELECT * FROM clientes WHERE estado = 'CE' AND bairro='Centro';
					
12)Mostrar a lista de produtos ordenado pelo preço do menor para o maior.	


SELECT * FROM produtos ORDER BY preco_prod ASC;

				
13) Mostrar uma lista dos produtos que foram comprados pelo cliente Benedito Henry Teixeira, bem como seu nome e endereço completo.				



SELECT clientes.nome_cli, clientes.rua, produtos.nome_prod FROM compras_contem_produtos INNER JOIN produtos ON compras_contem_produtos.id_prod = produtos.id_prod
INNER JOIN compras ON compras_contem_produtos.id_compra = compras.id_compra
INNER JOIN clientes  WHERE clientes.id_cli= 3;


14) Mostrar a quantidade de clientes que são do estado do CE.

SELECT COUNT(id_cli) AS quant_cli_ce FROM clientes WHERE estado = 'CE';

					
15) Mostrar a soma dos estoques de todas as bebidas do estabelecimento.		

SELECT SUM(estoque_prod) AS soma_estoque_prod  FROM produtos WHERE tipo_prod = 'Bebidas';			