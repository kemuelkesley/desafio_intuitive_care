-- Consultar as 10 operadoras com maiores despesas em eventos/sinistros nos últimos 3 meses
SELECT
    ops.razao_social, 
    SUM(dc.vl_saldo_final - dc.vl_saldo_inicial) AS total_despesas
FROM demonstracoes_contabeis dc
    INNER JOIN operadoras_de_plano_de_saude_ativas ops ON dc.reg_ans = ops.registro_ans
WHERE dc.descricao ILIKE '%EVENTOS/ SINISTROS CONHECIDOS OU AVISADOS  DE ASSISTÊNCIA A SAÚDE MEDICO HOSPITALAR%'
    AND dc.data >= CURRENT_DATE - INTERVAL '3 months'
GROUP BY ops.razao_social
ORDER BY total_despesas DESC
LIMIT 10;

-- Consultar as 10 operadoras com maiores despesas nessa categoria no último ano
SELECT 
    ops.razao_social, 
    SUM(dc.vl_saldo_final - dc.vl_saldo_inicial) AS total_despesas
FROM demonstracoes_contabeis dc
    INNER JOIN operadoras_de_plano_de_saude_ativas ops ON dc.reg_ans = ops.registro_ans
WHERE dc.descricao ILIKE '%EVENTOS/ SINISTROS CONHECIDOS OU AVISADOS  DE ASSISTÊNCIA A SAÚDE MEDICO HOSPITALAR%'
    AND dc.data >= CURRENT_DATE - INTERVAL '1 year'
GROUP BY ops.razao_social
ORDER BY total_despesas DESC
LIMIT 10;


--OBS: Objetivo foi criar essas consultas para trazer as informações solicitadas, porém, fiquei sem conseguir fazer a relação entre as duas tabelas criadas.
--Pois estava dando problema na hora de inserir os dados, então simulei uma forma de como seria. A ideia, No caso seria juntar essas duas tabelas, fazendo,
--um inner join para junta-las  e trazer as informações das operadoras com mais despesas em 3 messes e 1 ano.

--Por fim não deu tempo de fazer o teste-4 da API.