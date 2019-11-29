/* 4.Criar uma query hierarquica, ordenando os registros por uma coluna específica;*/

WITH Setores as 
(
	--Setores raiz
	SELECT Id, cast(Descricao as varchar(max)) as Descricao, Ativo
	FROM dbo.Setor 
	WHERE IdSetorPai IS NULL
	

	UNION ALL

	SELECT S.Id, S.Descricao +  ' (' + SS.Descricao + ')', S.Ativo
	FROM Setores SS
	INNER JOIN Setor S
		on SS.Id = S.IdSetorPai
)

SELECT *
FROM Setores
ORDER BY Id