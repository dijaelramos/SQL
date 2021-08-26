CREATE TABLE FORNECEDOR
(CodFornec INT(4) ,
NomeFornec CHAR(4) ,
Cidade CHAR(4) NOT NULL,
PRIMARY KEY (CodFornec));

CREATE TABLE PECA
(CodPeca INT(4) NOT NULL,
NomePeca CHAR(20) ,
Peso Decimal,
Cor CHAR(20) ,
PRIMARY KEY (CodPeca));

CREATE TABLE FORNECE
(CodPeca INT(4),
CodFornec INT(4),
Qtde INT,
PRIMARY KEY (CodPeca , CodFornec),
CONSTRAINT fk_PeçaFornec FOREIGN KEY (CodPeca) REFERENCES PECA (CodPeca),
CONSTRAINT fk_Fornec2 FOREIGN KEY (CodFornec) REFERENCES FORNECEDOR (CodFornec));

CREATE TABLE pedido
(num_pedido int,
prazo_entrega int,
codigo_cliente int,
codigo_vendedor int,
primary key (num_pedido)
);

alter table peca
add teste int;

alter table peca
modify teste int (35);

alter table peca
drop teste;