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