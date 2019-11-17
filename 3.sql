/*3. Extrair um relatório do modelo de dados criado no item 1, utilizando 3 funções de agregação diferentes, 
e filtrando por pelo menos uma função agregadora;*/


SELECT COUNT(*) FROM Requisicao; --Quantidade de Requisicoes

SELECT MIN(DataAdmissao) FROM Funcionario; -- Data de adminissao do funcionario mais antigo

SELECT AVG(Salario) FROM Funcionario; --Media Salarial dos funcionarios

SELECT R.Id, COUNT(RR.IdRequisicao)
FROM Requisicao R
INNER JOIN RequisicaoResposta RR 
    ON R.Id = RR.IdRequisicao
GROUP BY R.Id
HAVING COUNT(RR.IdRequisicao) > 1; -- Requisicoes com mais de uma resposta enviada


