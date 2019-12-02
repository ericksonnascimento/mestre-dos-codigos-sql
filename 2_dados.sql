--cidade
insert into Cidade (Cidade, Estado) values ('Campo Grande','MS');
insert into Cidade (Cidade, Estado) values ('Maringá','PR');

--endereco
insert into Endereco (Endereco, Cep, Bairro, IdCidade) values ('Rua Chicago', '79074450', 'Jardim Monte Monte Alegre',1);
insert into Endereco (Endereco, Cep, Bairro, IdCidade) values ('Rua Antonio Maria Coelho', '79002221', 'Centro', 1);

--pessoa
insert into Pessoa (Nome, Email, Telefone, IdEndereco) values ('Erickson Nascimento','erickson@mail.com','6799222255', 1);
insert into Pessoa (Nome, Email, Telefone, IdEndereco) values ('Ana Karla Nascimento','anakarla@mail.com','6799333355', 1);
insert into Pessoa (Nome, Email, Telefone, IdEndereco) values ('Fred Marcos','fred@mail.com','6799444455', 2);

--setor
insert into Setor (Descricao, Ativo) values ('Administração', 1);
insert into Setor (Descricao, Ativo) values ('RH', 1);
insert into Setor (Descricao, Ativo) values ('Finanças', 1);
insert into Setor (Descricao, Ativo, IdSetorPai) values ('Planejamento', '1',3); --SetorPai: Finanças
insert into Setor (Descricao, Ativo, IdSetorPai) values ('Controle', '1',3); --SetorPai: Finanças
insert into Setor (Descricao, Ativo, IdSetorPai) values ('Departamento Pessoal', '1',2); --SetorPai: RH
insert into Setor (Descricao, Ativo, IdSetorPai) values ('Contratação', '1',6); --SetorPai: Departamento Pessoal

--funcionario
insert into Funcionario (IdPessoa, DataAdmissao, Salario) values (1, '1/1/2009',3500);
insert into Funcionario (IdPessoa, DataAdmissao, Salario) values (2, '1/3/2016',9200);


--motivorequisicao
insert into MotivoRequisicao (Motivo) values ('Reclamação');
insert into MotivoRequisicao (Motivo) values ('Elogio');


--setorfuncionario
insert into SetorFuncionario (IdSetor, IdFuncionario, DataInicio, DataTermino) values (2,1,'1/1/2009', null);
insert into SetorFuncionario (IdSetor, IdFuncionario, DataInicio, DataTermino) values (1,2,'1/3/2016', null);



--requisicao
insert into Requisicao (IdSetor, IdMotivoRequisicao, IdPessoa, Data, Mensagem) values (1,1,3, GETDATE(), 'Demora retorno solicitação de férias')

--requisicaoresposta
insert into RequisicaoResposta (IdRequisicao, Mensagem, Data, IdSetor, IdFuncionario)  values (1, 'Já estamos providenciando',GETDATE()+1, 2, 1);
insert into RequisicaoResposta (IdRequisicao, Mensagem, Data, IdSetor, IdFuncionario)  values (1, 'Encaminhado por e-mail',GETDATE()+2, 2, 1);

--requisicaomidia
insert into RequisicaoMidia (IdRequisicao, Caminho) values (1, '/imgs/1.png');
insert into RequisicaoMidia (IdRequisicao, Caminho) values (1, '/imgs/2.png');