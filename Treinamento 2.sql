create table disciplina
(CodDisc int not null,
NomeD varchar(40),
Carga_H int,
Primary Key (CodDisc)
);

create table Prof
(CodProf int not null,
NomeP varchar(50),
Cargo varchar(30),
Salario Numeric,
Primary Key (CodProf)
);

create table Depto
(CodDepto int not null,
NomeDepto varchar(30),
Primary Key (CodDepto)
);

create table Aluno
(Mat int not null,
NomeA varchar(50),
Curso varchar(30),
Turma varchar(3),
CodDepto int,
Data_Nasc Date,
Primary Key (Mat)
);

create table Prof_Disc 
(CodProf int not null,
CodDisc int not Null,
CodDepto int not Null,
Primary Key (CodProf, CodDisc)
);

create table Aluno_Paga
(Mat int not null,
CodDisc int not Null,
CodProf int not Null,
Data Date not null,
Primary Key (Mat, CodDisc, CodProf, Data)
);

alter table aluno
add constraint fk_aluno_dep foreign key (CodDepto) references depto (CodDepto);

alter table aluno
add constraint fk_aluno_dep foreign key (CodDepto) references depto (CodDepto);

alter table Prof_Disc
add constraint fk_Prof_Disc_Prof foreign key (CodProf) references Prof (CodProf);

alter table Prof_Disc
add constraint fk_Prof_Disc_Disc foreign key (CodDisc) references disciplina (CodDisc);

alter table Prof_Disc
add constraint fk_Prof_Disc_Depto foreign key (CodDepto) references depto (CodDepto);

alter table Aluno_Paga
add constraint fk_Aluno_Paga_Aluno foreign key (Mat) references aluno (Mat);

alter table Aluno_Paga
add constraint fk_Aluno_Paga_Disc foreign key (CodDisc) references disciplina (CodDisc);

alter table Aluno_Paga
add constraint fk_Aluno_Paga_Prof foreign key (CodProf) references Prof (CodProf);