Create table EMPR
(MATR CHAR (6) primary key,
NOME VARCHAR (12) not null,	
SOBRENOME VARCHAR (15) not null,
DEPT CHAR(3),
FONE CHAR(14),
DINADIM DATE,
CARGO CHAR(10),
NIVELED	INT(2),
SEXO	CHAR(1),
DATANAS	 DATE,
SALARIO	 decimal(9,2),
BONUS	decimal(9,2),
COMIS	decimal(9,2),
FOREIGN KEY(DEPT) REFERENCES DEPT(DCODIGO)
);

Create table DEPT
(DCODIGO	CHAR(3) primary key,
DNOME		VARCHAR(36),
GERENTE		CHAR (6),
DSUPER		CHAR(3),
FOREIGN KEY(GERENTE) REFERENCES EMPR(MAT),
FOREIGN KEY(DSUPER) REFERENCES DEPT(DCODIGO)
);
Create table PROJETO
(PCODIGO  	CHAR(6) PRIMARY KEY,
PNOME		VARCHAR(24),
DCODIGO		CHAR(3),
RESP 		CHAR(6),
EQUIPE		INT(5),
DATAINI		DATE, 
DATAFIM		DATE,
PSUPER		CHAR(6),
FOREIGN KEY(DCODIGO) REFERENCES DEPT(DCODIGO),
FOREIGN KEY(RESP) REFERENCES EMPR(MATR),
FOREIGN KEY(PSUPER) REFERENCES PROJETO(PCODIGO)
);

Create table TrabalhaEM(
MATR char(6),
PCODIGO char(6),
HORASALOCACAO INT,
PRIMARY KEY(MATR,PCODIGO),
FOREIGN KEY(PCODIGO) REFERENCES PROJETO(PCODIGO),
FOREIGN KEY(MATR) REFERENCES EMPR(MATR)
);


INSERT INTO EMPR
(`MATR`, `NOME`, `SOBRENOME`, `DEPT`, `FONE`, `DINADIM`, `CARGO`, `NIVELED`, `SEXO`, `DATANAS`, `SALARIO`, `BONUS`,`COMIS`)
VALUES('123456', 'Herminio', 'Silva', 'D01','998844667', '2021-01-25','Analista', null,'M','1978-06-04', 3500.00 , 500.00, 0.15);

INSERT INTO EMPR
(`MATR`, `NOME`, `SOBRENOME`, `DEPT`, `FONE`, `DINADIM`, `CARGO`, `NIVELED`, `SEXO`, `DATANAS`, `SALARIO`, `BONUS`,`COMIS`)
VALUES('678901', 'joão', 'Silva', 'D01','998844667', '2021-01-25','Analista',05,'M','1978-06-04', 3500.00 , 500.00, 0.15);

INSERT INTO EMPR
(`MATR`, `NOME`, `SOBRENOME`, `DEPT`, `FONE`, `DINADIM`, `CARGO`, `NIVELED`, `SEXO`, `DATANAS`, `SALARIO`, `BONUS`,`COMIS`)
VALUES('034567', 'José', 'Ribeiro', 'D01','998543217', '2019-09-03','Analista',05,'M','1983-02-12', 3500.00 , 500.00, 0.15);

INSERT INTO EMPR
(`MATR`, `NOME`, `SOBRENOME`, `DEPT`, `FONE`, `DINADIM`, `CARGO`, `NIVELED`, `SEXO`, `DATANAS`, `SALARIO`, `BONUS`,`COMIS`)
VALUES('789543', 'Flor', 'Rosa', 'D1','98432811', '20-02-25','GER',08,'F','1984-03-08', 4500.00 , 0.00, 0.10);

INSERT INTO EMPR
(`MATR`, `NOME`, `SOBRENOME`, `DEPT`, `FONE`, `DINADIM`, `CARGO`, `NIVELED`, `SEXO`, `DATANAS`, `SALARIO`, `BONUS`,`COMIS`)
VALUES('843209', 'Filomena', 'Farias', 'D02','97345261', '20-03-25','GER',08,'F','1988-08-12', 4500.00 , 500.00, 0.15);

INSERT INTO DEPT (`DCODIGO`, `DNOME`, `GERENTE`, `DSUPER`)
VALUES ('D01','DTI', 'João', null);

INSERT INTO DEPT (`DCODIGO`, `DNOME`, `GERENTE`, `DSUPER`)
VALUES ('D1','DTIB', 'Flor', 'D01');

INSERT INTO DEPT (`DCODIGO`, `DNOME`, `GERENTE`, `DSUPER`)
VALUES ('D02','DRH', 'Filo', null);

INSERT INTO projeto (`PCODIGO`, `PNOME`, `DCODIGO`,`RESP`, `EQUIPE`, `DATAINI`, `DATAFIM`, `PSUPER`)
VALUES ('ABC321', 'IMPLANTAÇÃO xxx', 'D01' ,'678901' ,08 ,'2020-01-01', '2020-12-31',NULL);

INSERT INTO projeto (`PCODIGO`, `PNOME`, `DCODIGO`,`RESP`, `EQUIPE`, `DATAINI`, `DATAFIM`, `PSUPER`)
VALUES ('ABC001', 'Aquisição Servidor', 'D02' ,'789543' ,02 ,'2020-03-01', '2020-05-31','ABC321');

INSERT INTO TRABALHAEM (MATR, PCODIGO, HORASALOCACAO)
VALUES ('678901','ABC321',40);

INSERT INTO TRABALHAEM (MATR, PCODIGO, HORASALOCACAO)
VALUES ('789543','ABC001',12);

update empr set salario = 6700
where matr = '789543';


select * from empr;
select * from dept;
select * from projeto;
select * from trabalhaem;

Select matr,nome,sobrenome,dept,cargo
from empr;

Select matr,nome,salario
from empr;

select distinct salario,cargo
from empr;

select * from empr
where dept = 'D01';

select * from empr
where dept = 'D02';

select matr,nome,salario 
from empr
where dept = 'D02';

select matr,nome,salario 
from empr
where sexo = 'F' and dept = 'D02';

select Pnome from projeto
where equipe = 8 ;

select e.matr,e.nome,d.dnome
from empr e, dept d
where d.dcodigo = e.dept;

select e.nome, e.cargo, p.pnome, te.HORASALOCACAO
from empr e, projeto p, trabalhaem te
where e.matr = te.matr
and p.pcodigo = te.pcodigo
and te.horasalocacao <= 20;

select distinct salario, (salario*1.30) NovoSalario 
from empr e
where cargo = 'GER';

select nome, salario, ((salario*comis)+bonus) TotalSalario 
from empr e;

select concat(nome,' ', sobrenome) NomeCompleto 
from empr e;

select  nome, salario
from empr
where salario between 4500 and 5000;

select  nome, salario
from empr
where salario not between 4500 and 5000;

select *
from empr
where nome like 'J%';

select *
from empr
where nome not like 'J%';

select *
from empr
where concat(nome,' ', sobrenome) like '%Ribeiro%';

select * from empr
where niveled is null;

select * from empr
where niveled is not null;

select * from dept
where DSuper is not null;

select * from dept
where DSuper is null;

select count(*) TotalEmpregados
from Empr;

select count(niveled) TotalEmpregadosEquipe
from Empr;

select max(salario) MaiorSalario
from Empr;

select min(salario) MenorSalario
from Empr;

select avg(salario) MediaSalario
from Empr;

select cargo,sum(salario) SomaSalarioporCargo
from Empr
group by cargo;

select nome, cargo,sum(salario) SomaSalarioporCargo
from Empr
group by nome, cargo;


select * from empr
order by nome desc ;

select * from empr
order by Dinadim desc;

select cargo,sum(salario) SomaSalarioporCargo
from Empr
group by cargo
having cargo = 'GER'
order by nome;

select d.Dnome,d.dcodigo,sum(e.salario) SomaSalarioporDept
from Empr e, dept d
where e.dept = d.dcodigo
group by d.Dnome,d.dcodigo
having d.dcodigo = 'D01';

select d.Dnome,sum(e.salario) SomaSalarioporDept
from Empr e, dept d
where e.dept = d.dcodigo and d.dcodigo = 'D01'
group by d.Dnome;