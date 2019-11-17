--SCRIPT CRIADO PARA SER EXECUTADO NO POSTGRESQL

CREATE TABLE Cidade
(
    Id INTEGER NOT NULL,
    Cidade varchar(200) NOT NULL,
	Estado varchar(2) NOT NULL,
    CONSTRAINT PK_Cidade PRIMARY KEY (Id)
);

CREATE TABLE Endereco
(
    Id INTEGER NOT NULL,
    Endereco VARCHAR(250) NOT NULL,
    Cep VARCHAR(9) NOT NULL,
    Bairro VARCHAR(150) NOT NULL,
    IdCidade INTEGER NOT NULL,
    CONSTRAINT PK_Endereco PRIMARY KEY (Id),
    CONSTRAINT FK_Cidade_Endereco FOREIGN KEY (IdCidade) REFERENCES Cidade (Id)
);

CREATE TABLE Pessoa
(
    Id INTEGER NOT NULL,
    Nome VARCHAR(250) NOT NULL,
    Email VARCHAR(250) NOT NULL,
    Telefone VARCHAR(20),
    IdEndereco INTEGER,
    CONSTRAINT PK_Pessoa PRIMARY KEY (Id),
    CONSTRAINT FK_Endereco_Pessoa FOREIGN KEY (IdEndereco) REFERENCES Endereco(Id)
);

CREATE TABLE Setor
(
    Id INTEGER NOT NULL,
    Descricao VARCHAR(100) NOT NULL,
    Ativo BIT NOT NULL,
    CONSTRAINT PK_Setor PRIMARY KEY (Id)
);

CREATE TABLE Funcionario
(
    Id INTEGER NOT NULL,
    IdPessoa INTEGER NOT NULL,
    DataAdmissao TIMESTAMP NOT NULL,
    Salario DECIMAL(15,2),
    CONSTRAINT PK_Funcionario PRIMARY KEY (Id),
    CONSTRAINT FK_Pessoa_Funcionario FOREIGN KEY (IdPessoa) REFERENCES Pessoa(Id)
);

CREATE TABLE SetorFuncionario
(
    IdSetor INTEGER NOT NULL,
    IdFuncionario INTEGER NOT NULL,
    DataInicio TIMESTAMP NOT NULL,
    DataTermino TIMESTAMP NOT NULL,
    CONSTRAINT PK_SetorFuncionario PRIMARY KEY (IdSetor, IdFuncionario),
    CONSTRAINT FK_Setor_SetorFuncionario FOREIGN KEY (IdSetor) REFERENCES Setor (Id),
    CONSTRAINT FK_Funcionario_SetorFuncionario FOREIGN KEY (IdFuncionario) REFERENCES Funcionario (Id)
);

CREATE TABLE MotivoRequisicao
(
    Id INTEGER NOT NULL,
    Motivo VARCHAR(50) NOT NULL,
    CONSTRAINT PK_MotivoRequisicao PRIMARY KEY (Id)
);

CREATE TABLE Requisicao
(
    Id INTEGER NOT NULL,
    IdSetor INTEGER NOT NULL,
    IdMotivoRequisicao INTEGER NOT NULL,
    IdPessoa INTEGER NOT NULL,
    Data TIMESTAMP NOT NULL,
    Mensagem VARCHAR(500) NOT NULL,
    CONSTRAINT PK_Requisicao PRIMARY KEY (Id),
    CONSTRAINT FK_Setor_Requisicao FOREIGN KEY (IdSetor) REFERENCES Setor(Id),
    CONSTRAINT FK_MotivoRequisicao_Requisicao FOREIGN KEY (IdMotivoRequisicao) REFERENCES MotivoRequisicao(Id),
    CONSTRAINT FK_Pessoa_Requisicao FOREIGN KEY (IdPessoa) REFERENCES Pessoa(Id)
);

CREATE TABLE RequisicaoResposta
(
    Id INTEGER NOT NULL,
    IdRequisicao INTEGER NOT NULL,
    Mensagem VARCHAR(500) NOT NULL,
    Data TIMESTAMP NOT NULL,
    IdSetor INTEGER NOT NULL,
    IdFuncionario INTEGER NOT NULL,
    CONSTRAINT PK_RequisicaoResposta PRIMARY KEY (Id),
    CONSTRAINT FK_Requisicao_RequisicaoResposta FOREIGN KEY (IdRequisicao) REFERENCES Requisicao(Id),
    CONSTRAINT FK_SetorFuncionario_RequisicaoResposta FOREIGN KEY (IdSetor, IdFuncionario) REFERENCES SetorFuncionario(IdSetor, IdFuncionario)
);

CREATE TABLE RequisicaoMidia
(
    Id INTEGER NOT NULL,
    IdRequisicao INTEGER NOT NULL,
    Caminho VARCHAR(250) NOT NULL,
    CONSTRAINT PK_RequisicaoMidia PRIMARY KEY (Id),
    CONSTRAINT FK_Requisicao_RequisicaoMidia FOREIGN KEY (IdRequisicao) REFERENCES Requisicao(Id)
);
