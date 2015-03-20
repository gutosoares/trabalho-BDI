-- Exemplos de Views:
--1 Informações sobre os fornecedores e a quantidade de produtos fornecidos.
CREATE VIEW Fornecores_Info(id_Fornecedor, Nome_Fornecedor, id_Produto, Qtde_Produtos)
AS SELECT id_Fornecedor, Nome_Fornecedor, id_Produto, COUNT(*)
FROM Fornecedor F, Fornecido G, Produtos P
WHERE F.id_Fornecedor = P.id_Fornecedor and G.id_Produto = P.id_Produto;

SELECT Nome_Fornecedor, id_Produto
FROM Fornecores_Info;

--2 Informações contendo o nome e CPF dos clientes e também a placa e modelo dos seu veiculos.
CREATE VIEW Cliente_Veiculos
SELECT C.Nome_Cliente, C.CPF_Cliente, V.Placa, V.Modelo
FROM Cliente C, Veiculo V
WHERE C.CPF_Cliente = V.CPF_Cliente
GROUP BY C.Nome_Cliente;

SELECT Nome_Cliente, Modelo
FROM Cliente_Veiculos;

--3 Informações de todas as ordem de serviço solicitadas pelos clientes.
CREATE VIEW Cliente_OS
SELECT C.Nome_Cliente, C.CPF_Cliente, O.Data, O.Valor_Total
FROM Cliente C, OS O
WHERE C.CPF_Cliente = O.CPF_Cliente;

SELECT Nome_Cliente, Valor_Total
FROM Cliente_OS
WHERE DATA < '2014';