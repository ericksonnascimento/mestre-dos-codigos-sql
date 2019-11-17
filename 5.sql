/*
    5. Realize 5 consultas no modelo de dados criado no item 1, realizando pelo menos uma das seguintes operações:
     Union, Intersect, Minus, e utilizando pelo menos 3 tipos diferentes de joins;

*/


SELECT Id, Descricao FROM Setor
UNION
SELECT Id, Nome FROM Pessoa;

SELECT P.Nome, E.Endereco
FROM Pessoa P
LEFT JOIN Endereco E ON P.IdEndereco = E.Id;


SELECT E.Endereco, C.Cidade, C.Estado
FROM Endereco E
INNER JOIN Cidade C ON E.IdCidade = C.Id

SELECT RR.Caminho, R.Id
FROM RequisicaoMidia RR
RIGHT JOIN Requisicao R ON RR.IdRequisicao = R.Id



