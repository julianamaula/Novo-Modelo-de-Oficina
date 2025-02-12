# 🚗 Novo Modelo de Oficina - Banco de Dados

![MySQL](https://img.shields.io/badge/MySQL-005C84?style=for-the-badge&logo=mysql&logoColor=white)
![GitHub](https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=github&logoColor=white)
![Workbench](https://img.shields.io/badge/MySQL%20Workbench-4479A1?style=for-the-badge&logo=mysql&logoColor=white)

## 📌 Sobre o Projeto
Este projeto implementa um banco de dados para uma oficina mecânica, permitindo o gerenciamento de clientes, veículos, ordens de serviço, mecânicos e pagamentos. Ele foi desenvolvido para fornecer uma estrutura eficiente e bem organizada para um sistema de controle de serviços automotivos.

## 🚀 Tecnologias Utilizadas
- **MySQL** - Banco de dados relacional
- **Git & GitHub** - Controle de versão
- **MySQL Workbench** - Ambiente de desenvolvimento

## 🔧 Configuração do Projeto
Para utilizar este banco de dados, siga os passos abaixo:
1. Clone o repositório:
   ```sh
   git clone https://github.com/seu-usuário/Novo-Modelo-de-Oficina.git
   ```
2. Acesse o diretório do projeto:
   ```sh
   cd Novo-Modelo-de-Oficina
   ```
3. Execute o script SQL no seu ambiente MySQL:
   - Criação do banco de dados e tabelas
   - Inserção de dados para testes

## 📊 Estrutura do Banco de Dados
O banco de dados contém as seguintes tabelas:
- **Cliente**: Armazena informações sobre os clientes da oficina.
- **Veículo**: Registra os veículos associados aos clientes.
- **EquipeMecanicos & Mecanico**: Controla as equipes de mecânicos e seus integrantes.
- **OrdemServico**: Gerencia as ordens de serviço e seus respectivos status.
- **Peca & ItemPeca**: Controla o estoque e uso de peças em ordens de serviço.
- **Pagamento**: Registra os métodos de pagamento disponíveis.
- **Servico & ItemServico**: Relaciona os serviços oferecidos e sua associação com ordens de serviço.

## 🔍 Consultas SQL Implementadas

### 📌 Recuperação de Dados
```sql
SELECT * FROM OrdemServico;
```

### 🔎 Filtragem de Dados
```sql
SELECT * FROM OrdemServico WHERE Status = 'Em andamento';
```

### 🏷️ Cálculo de Atributos Derivados
```sql
SELECT os.idOrdemServico, os.descricao, (os.Valor + s.valor_mao_de_obra) AS ValorTotal 
FROM OrdemServico os
JOIN ItemServico iserv ON os.idOrdemServico = iserv.OrdemServico_idOrdemServico
JOIN Servico s ON iserv.Servico_idServico = s.idServico;
```

### 📊 Agrupamento e Filtros por Grupo
```sql
SELECT Status, COUNT(*) AS Quantidade FROM OrdemServico GROUP BY Status HAVING COUNT(*) > 1;
```

### 🔄 Junção de Tabelas
```sql
SELECT os.idOrdemServico, os.descricao, c.Nome AS Cliente, os.Valor
FROM OrdemServico os
JOIN Veiculo v ON os.Veiculo_idVeiculo = v.idVeiculo
JOIN Cliente c ON v.cliente_idCliente = c.idCliente;
```

## 🤝 Como Contribuir
Quer ajudar no desenvolvimento do projeto? Siga os passos abaixo:
1. Faça um **fork** do repositório
2. Crie uma **branch** para sua feature (`git checkout -b minha-feature`)
3. Faça **commit** das suas alterações (`git commit -m 'Minha nova feature'`)
4. Faça um **push** para a branch (`git push origin minha-feature`)
5. Abra um **Pull Request** no GitHub

---


---

## ✉️ **Contato**

💡 *Dúvidas ou sugestões? Entre em contato ou abra uma issue!* 


![linkedin (3)](https://github.com/user-attachments/assets/591bf907-a554-42e7-81a3-c7fcc810e087)
[LinkedIn](https://www.linkedin.com/in/juliana-de-maula)

![github (2)](https://github.com/user-attachments/assets/877894f3-1f69-4c0e-8b2d-4973e8db0933)
[GitHub](https://github.com/julianamaula)

📌 **Desenvolvido com ❤️ por [Juliana de Maula](https://github.com/julianamaula)** 🚀
Desafio [DIO.me](https://www.dio.me/)



