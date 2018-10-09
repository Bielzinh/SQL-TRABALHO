-- seguros_db.dbo.tp_avaliacao_tb                          pk  tp_avaliacao_id
-- seguros_db.dbo.critica_pre_analise_tb  ---              pk  critica_pre_analise_id       fk tp_avaliacao_id
-- seguros_db.dbo.parametro_pre_analise_tb                 pk  parametro_pre_analise_id     fk critica_pre_analise_id
-- seguros_db.dbo.proposta_tb                              pk  proposta_id                  fk produto_id                  fk prop_cliente_id
-- seguros_db.dbo.cliente_tb                               pk  cliente_id                   fk tp_pessoa_id
-- seguros_dbo.proposta_processo_susep_tb                  pk  proposta_id                  fk -----------
-- seguros_db.dbo.ramo_tb                                  pk  ramo_id                      fk tp_ramo_id                  fk tp_objeto_id       fk ramo_irb_id
-- seguros_db.dbo.seguradora_tb                            pk  seguradora_cod_susep         fk municipio_id                fk estado
-- seguros_db.dbo.corretor_tb                              pk  corretor_id
-- seguros_db.dbo.municipio_tb                            
-- als_operacao_db.dbo.prtd_rsco_ctr

select * from dbo.banco_tb
select top 10 * from agendamento_cobranca_tb
select top 10 * from seguros_db.dbo.parametro_pre_analise_tb  
select * from seguros_db.dbo.critica_pre_analise_tb
select * from seguros_db.dbo.tp_avaliacao_tb
select top 10 * from seguros_db.dbo.proposta_tb

----------------------------------
----- OPERADOR BETWEEN
select   a.nome, a.tratamento, c.nome, c.dt_inclusao, p.dt_inicio_vigencia
from seguros_db.dbo.tp_avaliacao_tb a
inner join seguros_db.dbo.critica_pre_analise_tb c on a.tp_avaliacao_id = c.tp_avaliacao_id
inner join seguros_db.dbo.parametro_pre_analise_tb p on p.critica_pre_analise_id = c.critica_pre_analise_id
where c.dt_inclusao between '2011-10-26 00:00:00' and '2015-03-01 17:30:00'
----------------------------------------------------------------------------------------------------------------------------------------
----- CONDIÇÃO LIKE -- Cujo nome começa com 'valor'
select   a.nome, a.tratamento, c.nome, c.dt_inclusao, p.dt_inicio_vigencia
from seguros_db.dbo.tp_avaliacao_tb a
inner join seguros_db.dbo.critica_pre_analise_tb c on a.tp_avaliacao_id = c.tp_avaliacao_id
inner join seguros_db.dbo.parametro_pre_analise_tb p on p.critica_pre_analise_id = c.critica_pre_analise_id
where c.dt_inclusao between '2011-10-26 00:00:00' and '2015-03-01 17:30:00' and c.nome like 'Valor%' order by c.dt_inclusao

----- Cujo nome começa com 'Assistência' -----
select   a.nome, a.tratamento, c.nome, c.dt_inclusao, p.dt_inicio_vigencia
from seguros_db.dbo.tp_avaliacao_tb a
inner join seguros_db.dbo.critica_pre_analise_tb c on a.tp_avaliacao_id = c.tp_avaliacao_id
inner join seguros_db.dbo.parametro_pre_analise_tb p on p.critica_pre_analise_id = c.critica_pre_analise_id
where c.dt_inclusao between '2011-10-26 00:00:00' and '2015-03-01 17:30:00' and c.nome like '%Assistência' order by c.dt_inclusao
------------------------------------------------------------------------------------------------------------------------------------------


select top 10 * from seguradora_tb
select top 10 * from seguros_db.dbo.proposta_tb
where seguros_db.dbo.proposta_tb.proposta_id = 11294421
------------------------------------------------------------
select top 10 * from seguros_db.dbo.produto_tb
select pro.nome, p.proposta_id
from seguros_db.dbo.proposta_tb p
inner join seguros_db.dbo.produto_tb pro on pro.produto_id = p.produto_id
where p.proposta_id = 11294421
----- Pesquisando dados da aba proposta com o filtro 11294421
select *
from seguradora_tb
where nome = 'COMPANHIA DE SEGUROS ALIANÇA DO BRASIL' AND seguradora_cod_susep = 6785

select top 10*
from cliente_tb


select *
from ramo_tb
where ramo_id = 77

select *
from sucursal_seguradora_tb
where nome = 'MATRIZ'

select *
from corretor_tb
where corretor_id = 100067199

select top 10 *
from segurado_tb 

select top 10 *
from beneficiario_tb

select top 20 *
from dominio_tb

select top 40 *
from  pessoa_fisica_tb

select top 40 *
from endosso_tb

 select top 20 *
from cobertura_bb_tb


select  *
from conta_bancaria_tb
where conta_corrente_id = 405202

select top 10 *
from segmento_consorcio_tb

select top 10 *
from proposta_internet_tb

select top 10*
from municipio_tb

-------------------------------------------------- EXIBIR TODAS INFORMAÇÕES DE CHAVES ESTRANGEIRAS E SUAS RESPECTIVAS TABELAS ----------------------------------------------

USE seguros_db;
GO  
SELECT   
    f.name AS Chave_Estrangeira 
   ,OBJECT_NAME(f.parent_object_id) AS Nome_Tabela  
   ,COL_NAME(fc.parent_object_id, fc.parent_column_id) AS Chave_Estrangeira  
   ,OBJECT_NAME (f.referenced_object_id) AS Tabela_Oposta
   ,COL_NAME(fc.referenced_object_id, fc.referenced_column_id) AS Chave_Primaria_Da_Tabela_Oposta_Pra_Ligação 
   ,is_disabled 
   ,delete_referential_action_desc  
   ,update_referential_action_desc  
FROM sys.foreign_keys AS f  
INNER JOIN sys.foreign_key_columns AS fc   
   ON f.object_id = fc.constraint_object_id   
WHERE f.parent_object_id = OBJECT_ID('proposta_processo_susep_tb');
------------------------------------------------------------------------------------------------------------------------------------------------------------------------

select top 10 * 
from sinistro_tb

------------------------------------------------listar todas as tabelas
select * from sys.tables

select * FROM UF_TB

