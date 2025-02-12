-- Criando o banco de dados
CREATE DATABASE OficinaDB;
USE OficinaDB;

-- Tabela Cliente
CREATE TABLE Cliente (
    idCliente INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(45) NOT NULL,
    Telefone VARCHAR(15),
    Endereco VARCHAR(100),
    CPF VARCHAR(11) UNIQUE NOT NULL
);

-- Tabela Veiculo
CREATE TABLE Veiculo (
    idVeiculo INT PRIMARY KEY AUTO_INCREMENT,
    renavam VARCHAR(45) UNIQUE NOT NULL,
    placa VARCHAR(45) UNIQUE NOT NULL,
    modelo VARCHAR(45) NOT NULL,
    cor VARCHAR(45),
    ano VARCHAR(45),
    cliente_idCliente INT,
    FOREIGN KEY (cliente_idCliente) REFERENCES Cliente(idCliente)
);

-- Tabela EquipeMecanicos
CREATE TABLE EquipeMecanicos (
    idEquipeResponsavel INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(45) NOT NULL
);

-- Tabela Mecanico
CREATE TABLE Mecanico (
    idMecanico INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(45) UNIQUE NOT NULL,
    Endereco VARCHAR(100) UNIQUE NOT NULL,
    Especialidade VARCHAR(100) UNIQUE NOT NULL,
    Codigo VARCHAR(45) UNIQUE NOT NULL,
    EquipeMecanicos_idEquipeResponsavel INT,
    FOREIGN KEY (EquipeMecanicos_idEquipeResponsavel) REFERENCES EquipeMecanicos(idEquipeResponsavel)
);

-- Tabela OrdemServico
CREATE TABLE OrdemServico (
    idOrdemServico INT PRIMARY KEY AUTO_INCREMENT,
    descricao VARCHAR(255),
    data_emissao DATE NOT NULL,
    Valor FLOAT NOT NULL,
    Status ENUM('Aberta', 'Em andamento', 'Concluída', 'Cancelada') NOT NULL,
    data_conclusao DATE,
    Veiculo_idVeiculo INT,
    EquipeMecanicos_idEquipeResponsavel INT,
    FOREIGN KEY (Veiculo_idVeiculo) REFERENCES Veiculo(idVeiculo),
    FOREIGN KEY (EquipeMecanicos_idEquipeResponsavel) REFERENCES EquipeMecanicos(idEquipeResponsavel)
);

-- Tabela Peca
CREATE TABLE Peca (
    idPeca INT PRIMARY KEY AUTO_INCREMENT,
    Valor FLOAT NOT NULL
);

-- Tabela ItemPeca
CREATE TABLE ItemPeca (
    OrdemServico_idOrdemServico INT,
    Peca_idPeca INT,
    PRIMARY KEY (OrdemServico_idOrdemServico, Peca_idPeca),
    FOREIGN KEY (OrdemServico_idOrdemServico) REFERENCES OrdemServico(idOrdemServico),
    FOREIGN KEY (Peca_idPeca) REFERENCES Peca(idPeca)
);

-- Tabela Pagamento
CREATE TABLE Pagamento (
    idPagamento INT PRIMARY KEY AUTO_INCREMENT,
    formaPagamento ENUM('Dinheiro', 'Cartão', 'PIX', 'Boleto') NOT NULL
);

-- Tabela Servico
CREATE TABLE Servico (
    idServico INT PRIMARY KEY AUTO_INCREMENT,
    TiposDeServico VARCHAR(45) NOT NULL,
    valor_mao_de_obra FLOAT NOT NULL,
    Pagamento_idPagamento INT,
    FOREIGN KEY (Pagamento_idPagamento) REFERENCES Pagamento(idPagamento)
);

-- Tabela ItemServico
CREATE TABLE ItemServico (
    OrdemServico_idOrdemServico INT,
    Servico_idServico INT,
    PRIMARY KEY (OrdemServico_idOrdemServico, Servico_idServico),
    FOREIGN KEY (OrdemServico_idOrdemServico) REFERENCES OrdemServico(idOrdemServico),
    FOREIGN KEY (Servico_idServico) REFERENCES Servico(idServico)
);



