-- USE dbFastSystem;

CREATE TABLE Empresa (
	id_empresa INT PRIMARY KEY IDENTITY(1,1),
	nome_empresa VARCHAR(100),
	cnpj_empresa VARCHAR (14),
	cep_empresa VARCHAR(11),
	numero_empresa INT,
	telefone_empresa VARCHAR(13),
	representante VARCHAR(100),
	email_empresa VARCHAR(50)
);

CREATE TABLE Funcionario (
	id_funcionario INT PRIMARY KEY IDENTITY(1,1),
	fk_empresa INT,
	nome_funcionario VARCHAR(100),
    	is_admin BIT,
    	cpf_funcionario VARCHAR(11),
    	email_funcionario VARCHAR(50),
    	senha_funcionario VARCHAR(25),
    	telefone_funcionario VARCHAR(14),
	FOREIGN KEY(fk_empresa) REFERENCES Empresa(id_empresa)
);

CREATE TABLE Maquina (
	id_maquina INT PRIMARY KEY NOT NULL IDENTITY(1,1),
	fk_empresa INT,
	tipo_maquina VARCHAR(7),
	CHECK (tipo_maquina = 'DESKTOP' or tipo_maquina = 'TOTEM'),
	nome_maquina VARCHAR(15),
	sistema_operacional_maquina varchar(45),
	tempo_atividade_maquina FLOAT,
	email_maquina VARCHAR(45),
	senha_maquina VARCHAR(45),
	FOREIGN KEY(fk_empresa) REFERENCES Empresa(id_empresa)
);

CREATE TABLE App (
	id_app INT PRIMARY KEY NOT NULL IDENTITY(1000,1),
	nome_app VARCHAR(60)
);

CREATE TABLE App_Empresa (
	fk_empresa INT,
	fk_app INT,
	FOREIGN KEY(fk_empresa) REFERENCES Empresa(id_empresa),
	FOREIGN KEY(fk_app) REFERENCES App(id_app),
	PRIMARY KEY (fk_empresa, fk_app)
);

CREATE TABLE Registro_Processo (
	id_registro_processo INT PRIMARY KEY NOT NULL IDENTITY(1,1),
	nome_processo VARCHAR(45),
	data_hora DATETIME,
	is_autorizado BIT,
	fk_maquina INT,
	FOREIGN KEY (fk_maquina) references Maquina(id_maquina)
);

CREATE TABLE Componente (
	id_componente INT PRIMARY KEY NOT NULL IDENTITY(1,1),
	nome_componente VARCHAR(45),
	is_ativo BIT,
	fabricante_componente VARCHAR(45),
	modelo_componente VARCHAR(100),
	capacidade_componente FLOAT,
	fk_maquina INT,
	FOREIGN KEY (fk_maquina) REFERENCES Maquina(id_maquina)
);


CREATE TABLE Tipo_Registro (
id_tipo_registro INT PRIMARY KEY NOT NULL IDENTITY(1,1),
descricao_tipo VARCHAR(5)
);

CREATE TABLE Registro (
	data_hora DATETIME2,
	medida FLOAT,
	fk_tipo_registro INT,
	fk_componente INT,
	FOREIGN KEY(fk_componente) REFERENCES Componente(id_componente),
	FOREIGN KEY(fk_tipo_registro) REFERENCES Tipo_Registro(id_tipo_registro)
);

INSERT INTO Empresa VALUES 
('Fast Food 1', 123456789, 02535412, 1522, 11942563656, 'Endryl', "admin.fastfood1@gmail.com"),
( 'Fast Food 2', 987654321, 32654845, 365, 11953145796, 'Donald McDonalds', 'admin.fastfood2@gmail.com');

INSERT INTO Funcionario VALUES 
(1, 'Endryl', 1, 12345678912, 'endryl@gmail.com', 12345678, '942518747'),
(1, 'Alex', 0, 12345678912, 'alex@gmail.com', 12345678, '942518747'),
(2, 'Felipe', 1, 98765432112, 'felipe@gmail.com', 12345678, '965321547'),
(2, 'Gerson', 0, '12345678912', 'gerson@gmail.com', 12345678, '942518747');

INSERT INTO Maquina VALUES 
(1, 'DESKTOP', 'Admin PC', '', 0, 'admin.fastfood1@gmail.com', '1234' ),
(2, 'TOTEM', 'Caixa 1', '', 0, 'caixa1.fastfood2@gmail.com', '1234'),
(2, 'DESKTOP', 'Admin PC', '', 0, 'admin.fastfood2@gmail.com', '1234'),
(2, 'DESKTOP', 'Caixa 2', '', 0, 'caixa2.fastfood2@gmail.com', '1234' ),
(2, 'TOTEM', 'Caixa 3', '', 0, 'caixa3.fastfood2@gmail.com', '1234'),
(2, 'DESKTOP', 'Totem 1', '', 0, 'totem1.fastfood2s@gmail.com', '1234'),
(2, 'TOTEM', 'Totem 2', '', 0, 'totem2.fastfood2@gmail.com', '1234'),
(2, 'DESKTOP', 'Totem 3', '', 0, 'totem3.fastfood2@gmail.com', '1234'), 
(2, 'DESKTOP', 'Caixa 4', '', 0, 'caixa4.fastfood2@gmail.com', '1234' ); 

INSERT INTO App VALUES
('chrome'),
('WhatsApp'),
('AnyDesk'),
('Code');

INSERT INTO Tipo_Registro VALUES
('GB'),
('%');
