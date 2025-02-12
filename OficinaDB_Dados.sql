USE OficinaDB;

-- Inserção de dados para testes

INSERT INTO Cliente (Nome, Telefone, Endereco, CPF) VALUES 
('João Silva', '11987654321', 'Rua A, 123', '12345678901'),
('Maria Oliveira', '11976543210', 'Rua B, 456', '98765432100');

INSERT INTO Veiculo (renavam, placa, modelo, cor, ano, cliente_idCliente) VALUES 
('12345678901', 'ABC1234', 'Gol', 'Vermelho', '2020', 1),
('98765432100', 'XYZ5678', 'Fiesta', 'Preto', '2018', 2);

INSERT INTO EquipeMecanicos (Nome) VALUES ('Equipe Alpha');

INSERT INTO Mecanico (Nome, Endereco, Especialidade, Codigo, EquipeMecanicos_idEquipeResponsavel) VALUES 
('Carlos Souza', 'Rua C, 789', 'Motor', 'MEC001', 1);

INSERT INTO OrdemServico (descricao, data_emissao, Valor, Status, Veiculo_idVeiculo, EquipeMecanicos_idEquipeResponsavel) VALUES 
('Troca de óleo', '2024-02-12', 150.00, 'Aberta', 1, 1);

INSERT INTO Peca (Valor) VALUES (50.00);
INSERT INTO ItemPeca (OrdemServico_idOrdemServico, Peca_idPeca) VALUES (1, 1);

INSERT INTO Pagamento (formaPagamento) VALUES ('Cartão');

INSERT INTO Servico (TiposDeServico, valor_mao_de_obra, Pagamento_idPagamento) VALUES ('Revisão Completa', 200.00, 1);
INSERT INTO ItemServico (OrdemServico_idOrdemServico, Servico_idServico) VALUES (1, 1);