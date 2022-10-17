CREATE TABLE Empresa(
    id_empresa INT PRIMARY KEY IDENTITY(1,1),
    nome_empresa VARCHAR(100),
    cnpj_empresa VARCHAR (14),
    cep_empresa VARCHAR(8),
    numero_empresa INT,
    telefone_empresa VARCHAR(13),
    nome_representante VARCHAR(100),
    email_empresa VARCHAR(50),
    senha_empresa VARCHAR(25)
);



INSERT INTO empresa VALUES
('FastSystem', 123456789, 02535412, 1522, 11942563656, 'Endryl', 'endryl@gmail.com', 12345678),
('McDonalds', 987654321, 32654845, 365, 11953145796, 'Donald McDonalds', 'dodo@gmail.com', 12345678);



CREATE TABLE Funcionario(
    id_funcionario INT PRIMARY KEY IDENTITY(1,1),
    fk_empresa INT,
    nome_funcionario VARCHAR(100),
    is_admin BIT,
    cpf_funcionario VARCHAR(11),
    email_funcionario VARCHAR(50),
    senha_funcionario VARCHAR(25),
    telefone_funcionario VARCHAR(13),
    FOREIGN KEY(fk_empresa) REFERENCES Empresa(id_empresa)
);



CREATE TABLE Maquina(
id_maquina INT PRIMARY KEY NOT NULL IDENTITY(1,1),
fk_empresa INT,
tipo_maquina VARCHAR(7),
CHECK (tipo_maquina = 'DESKTOP' or tipo_maquina = 'TOTEM'),
nome_maquina VARCHAR(15),
sistema_operacional_maquina varchar(45),
tempo_atividade_maquina FLOAT,
FOREIGN KEY(fk_empresa) REFERENCES Empresa(id_empresa)
);



INSERT INTO Maquina VALUES
( 1, 'DESKTOP', 'Desktop 1', '', 1234564 ),  
( 2, 'TOTEM', 'Totem 1', '', 0 ),
( 2, 'DESKTOP', 'Desktop 1', '', 0 );



CREATE TABLE Componente(
id_componente INT PRIMARY KEY NOT NULL IDENTITY(1,1),
nome_componente VARCHAR(45),
is_ativo BIT,
fabricante_componente VARCHAR(45),
modelo_componente VARCHAR(100),
capacidade_componente INT
);



CREATE TABLE Componente_Maquina(
fk_componente INT,
fk_maquina INT,
FOREIGN KEY(fk_componente) REFERENCES Componente(id_componente),
FOREIGN KEY(fk_maquina) REFERENCES Maquina(id_maquina)
);



CREATE TABLE Tipo_Registro(
id_tipo_registro INT PRIMARY KEY NOT NULL IDENTITY(1,1),
descricao_tipo VARCHAR(20)
);



INSERT INTO Tipo_Registro VALUES
( 'GB' ),
( '%' );



CREATE TABLE Registro(
fk_componente INT,
fk_maquina INT,
data_hora DATETIME2,
medida FLOAT,
fk_tipo_registro INT,
FOREIGN KEY(fk_componente) REFERENCES Componente(id_componente),
FOREIGN KEY(fk_maquina) REFERENCES Maquina(id_maquina),
FOREIGN KEY(fk_tipo_registro) REFERENCES Tipo_Registro(id_tipo_registro)
);