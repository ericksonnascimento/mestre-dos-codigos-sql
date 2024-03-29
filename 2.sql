CREATE TABLE Cidade
(
    Id INTEGER IDENTITY(1,1) NOT NULL,
    Cidade varchar(200) NOT NULL,
	Estado varchar(2) NOT NULL,
    CONSTRAINT PK_Cidade PRIMARY KEY (Id)
);

CREATE TABLE Endereco
(
    Id INTEGER IDENTITY(1,1) NOT NULL,
    Endereco VARCHAR(250) NOT NULL,
    Cep VARCHAR(9) NOT NULL,
    Bairro VARCHAR(150) NOT NULL,
    IdCidade INTEGER NOT NULL,
    CONSTRAINT PK_Endereco PRIMARY KEY (Id),
    CONSTRAINT FK_Cidade_Endereco FOREIGN KEY (IdCidade) REFERENCES Cidade (Id)
);

CREATE TABLE Pessoa
(
    Id INTEGER IDENTITY(1,1) NOT NULL,
    Nome VARCHAR(250) NOT NULL,
    Email VARCHAR(250) NOT NULL,
    Telefone VARCHAR(20),
    IdEndereco INTEGER,
    CONSTRAINT PK_Pessoa PRIMARY KEY (Id),
    CONSTRAINT FK_Endereco_Pessoa FOREIGN KEY (IdEndereco) REFERENCES Endereco(Id)
		ON DELETE CASCADE 
		ON UPDATE CASCADE
);

CREATE TABLE Setor
(
    Id INTEGER IDENTITY(1,1) NOT NULL,
    Descricao VARCHAR(100) NOT NULL,
    Ativo BIT NOT NULL,
	IdSetorPai INTEGER NULL,
    CONSTRAINT PK_Setor PRIMARY KEY (Id),
	CONSTRAINT FK_Setor_Setor FOREIGN KEY (IdSetorPai) REFERENCES Setor(Id)
);

CREATE TABLE Funcionario
(
    Id INTEGER IDENTITY(1,1) NOT NULL,
    IdPessoa INTEGER NOT NULL,
    DataAdmissao DATETIME NOT NULL,
    Salario DECIMAL(15,2),
    CONSTRAINT PK_Funcionario PRIMARY KEY (Id),
    CONSTRAINT FK_Pessoa_Funcionario FOREIGN KEY (IdPessoa) REFERENCES Pessoa(Id)
		ON DELETE CASCADE 
		ON UPDATE CASCADE
);

CREATE TABLE SetorFuncionario
(
    IdSetor INTEGER NOT NULL,
    IdFuncionario INTEGER NOT NULL,
    DataInicio DATETIME NOT NULL,
    DataTermino DATETIME NULL,
    CONSTRAINT PK_SetorFuncionario PRIMARY KEY (IdSetor, IdFuncionario),
    CONSTRAINT FK_Setor_SetorFuncionario FOREIGN KEY (IdSetor) REFERENCES Setor (Id)
		ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT FK_Funcionario_SetorFuncionario FOREIGN KEY (IdFuncionario) REFERENCES Funcionario (Id)
		ON DELETE CASCADE 
		ON UPDATE CASCADE
);

CREATE TABLE MotivoRequisicao
(
    Id INTEGER IDENTITY(1,1) NOT NULL,
    Motivo VARCHAR(50) NOT NULL,
    CONSTRAINT PK_MotivoRequisicao PRIMARY KEY (Id)
);

CREATE TABLE Requisicao
(
    Id INTEGER IDENTITY(1,1) NOT NULL,
    IdSetor INTEGER NOT NULL,
    IdMotivoRequisicao INTEGER NOT NULL,
    IdPessoa INTEGER NOT NULL,
    Data DATETIME NOT NULL,
    Mensagem VARCHAR(500) NOT NULL,
    CONSTRAINT PK_Requisicao PRIMARY KEY (Id),
    CONSTRAINT FK_Setor_Requisicao FOREIGN KEY (IdSetor) REFERENCES Setor(Id) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT FK_MotivoRequisicao_Requisicao FOREIGN KEY (IdMotivoRequisicao) REFERENCES MotivoRequisicao(Id) ON DELETE CASCADE  ON UPDATE CASCADE,
    CONSTRAINT FK_Pessoa_Requisicao FOREIGN KEY (IdPessoa) REFERENCES Pessoa(Id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE RequisicaoResposta
(
    Id INTEGER IDENTITY(1,1) NOT NULL,
    IdRequisicao INTEGER NOT NULL,
    Mensagem VARCHAR(500) NOT NULL,
    Data DATETIME NOT NULL,
    IdSetor INTEGER NOT NULL,
    IdFuncionario INTEGER NOT NULL,
    CONSTRAINT PK_RequisicaoResposta PRIMARY KEY (Id),
    CONSTRAINT FK_Requisicao_RequisicaoResposta FOREIGN KEY (IdRequisicao) REFERENCES Requisicao(Id) ON DELETE NO ACTION  ON UPDATE NO ACTION,
    CONSTRAINT FK_SetorFuncionario_RequisicaoResposta FOREIGN KEY (IdSetor, IdFuncionario) REFERENCES SetorFuncionario(IdSetor, IdFuncionario) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE RequisicaoMidia
(
    Id INTEGER IDENTITY(1,1) NOT NULL,
    IdRequisicao INTEGER NOT NULL,
    Caminho VARCHAR(250) NOT NULL,
    CONSTRAINT PK_RequisicaoMidia PRIMARY KEY (Id),
    CONSTRAINT FK_Requisicao_RequisicaoMidia FOREIGN KEY (IdRequisicao) REFERENCES Requisicao(Id) ON DELETE CASCADE ON UPDATE CASCADE
);
