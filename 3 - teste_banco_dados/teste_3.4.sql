-- Script para  importar os dados dos arquivos CSV na tabela demonstracoes_contabeis
-- Teste 3.4

COPY demonstracoes_contabeis(data, reg_ans, cd_conta_contabil, descricao, vl_saldo_inicial, vl_saldo_final)
FROM 'C:\Users\Public\teste\2T2024.csv'
DELIMITER ';'
CSV HEADER
ENCODING 'UTF8'
NULL 'NULL';

COPY demonstracoes_contabeis(data, reg_ans, cd_conta_contabil, descricao, vl_saldo_inicial, vl_saldo_final)
FROM 'C:\Users\Public\teste\1T2024.csv'
DELIMITER ';'
CSV HEADER
ENCODING 'UTF8'
NULL 'NULL';

COPY demonstracoes_contabeis(data, reg_ans, cd_conta_contabil, descricao, vl_saldo_inicial, vl_saldo_final)
FROM 'C:\Users\Public\teste\4T2024.csv'
DELIMITER ';'
CSV HEADER
ENCODING 'UTF8'
NULL 'NULL';

COPY demonstracoes_contabeis(data, reg_ans, cd_conta_contabil, descricao, vl_saldo_inicial, vl_saldo_final)
FROM 'C:\Users\Public\teste\3T2024.csv'
DELIMITER ';'
CSV HEADER
ENCODING 'UTF8'
NULL 'NULL';



COPY demonstracoes_contabeis(data, reg_ans, cd_conta_contabil, descricao, vl_saldo_inicial, vl_saldo_final)
FROM 'C:\Users\Public\teste\1T2023.csv'
DELIMITER ';'
CSV HEADER
ENCODING 'UTF8'
NULL 'NULL';

COPY demonstracoes_contabeis(data, reg_ans, cd_conta_contabil, descricao, vl_saldo_inicial, vl_saldo_final)
FROM 'C:\Users\Public\teste\2t2023.csv'
DELIMITER ';'
CSV HEADER
ENCODING 'UTF8'
NULL 'NULL';

COPY demonstracoes_contabeis(data, reg_ans, cd_conta_contabil, descricao, vl_saldo_inicial, vl_saldo_final)
FROM 'C:\Users\Public\teste\3T2023.csv'
DELIMITER ';'
CSV HEADER
ENCODING 'UTF8'
NULL 'NULL';

COPY demonstracoes_contabeis(data, reg_ans, cd_conta_contabil, descricao, vl_saldo_inicial, vl_saldo_final)
FROM 'C:\Users\Public\teste\4T2023.csv'
DELIMITER ';'
CSV HEADER
ENCODING 'UTF8'
NULL 'NULL';

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Script para importar os dados dos arquivos CSV na tabela operadoras_de_plano_de_saude_ativas
-- Teste 3.4


COPY operadoras_de_plano_de_saude_ativas
FROM 'C:\Users\Public\teste\Relatorio_cadop.csv'
DELIMITER ';'
CSV HEADER
ENCODING 'UTF8';
