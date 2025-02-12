USE OficinaDB;

-- Queries Complexas
SELECT * FROM Servico;
-- 1. Recuperação simples de todas as ordens de serviço
SELECT * FROM OrdemServico;

-- 2. Filtro com WHERE: Ordens de serviço em andamento
SELECT * FROM OrdemServico WHERE Status = 'Em andamento';

-- 3. Atributo derivado: Valor total de cada ordem de serviço
SELECT os.idOrdemServico, os.descricao, (os.Valor + s.valor_mao_de_obra) AS ValorTotal 
FROM OrdemServico os
JOIN ItemServico iserv ON os.idOrdemServico = iserv.OrdemServico_idOrdemServico
JOIN Servico s ON iserv.Servico_idServico = s.idServico;

-- 4. Ordenação dos dados por valor da ordem de serviço
SELECT * FROM OrdemServico ORDER BY Valor DESC;

-- 5. Filtro por grupo (HAVING): Quantidade de serviços por status
SELECT Status, COUNT(*) AS Quantidade FROM OrdemServico GROUP BY Status HAVING COUNT(*) > 1;

-- 6. Junção entre tabelas para exibir detalhes das ordens de serviço com o nome do cliente
SELECT os.idOrdemServico, os.descricao, c.Nome AS Cliente, os.Valor
FROM OrdemServico os
JOIN Veiculo v ON os.Veiculo_idVeiculo = v.idVeiculo
JOIN Cliente c ON v.cliente_idCliente = c.idCliente;
