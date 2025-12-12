WITH PERSONALIZADO AS (
	select 
		a.title "SOLICITACAO",
		is2.title "STATUS PROTOCOLO",
		ai.protocol "N°PROTOCOLO",
		p.title "EQUIPAMENTO",
		p.tag_number "PATRIMONIO",
		p.serial_number "SERIAL",
		plis.out_date "DATA SAIDA",
		plis.returned "STATUS RETORNO",
		plis.returned_date "DATA DO RETORNO",
		p2.name "RESPONSAVEL",
		p3.name "RETIRADO POR:",
		p4.name "CLIENTE",
		p4.city CIDADE,
		as2.title "SITE",
		aap.title "PONTO DE ACESSO",
		sp.title "PROBLEMA",
		it.title "TIPO DE PROTOCOLO",
		plis.created "CRIADO EM:",
		ROW_NUMBER() OVER (PARTITION by p.tag_number ORDER by plis.created desc) AS PERSONA1
		from patrimony_packing_list_items plis
		left join patrimony_packing_lists ppl on ppl.id = plis.patrimony_packing_list_id
		left join assignments a on a.id = ppl.assignment_id
		left join assignment_incidents ai on ai.assignment_id = a.id
		left join incident_types it on it.id = ai.incident_type_id
		left join incident_status is2 on is2.id = ai.incident_status_id
		left join patrimonies p on p.id = plis.patrimony_id
		left join people p2 on p2.id = plis.created_by
		left join people p3 on p3.id = plis.person_allocator_id
		left join people p4 on p4.id = ppl.responsible_id
		left join authentication_sites as2 on as2.id = ppl.authentication_site_id
		left join authentication_access_points aap on aap.id = ppl.authentication_access_point_id
		left join solicitation_problems sp on sp.id = ai.solicitation_problem_id
		where (p.tag_number not like '%teste%' and p.tag_number not like '%TESTE%'and p.tag_number not like '%excluir%' and p.tag_number not like '%Excluir%')
		and plis.returned = 0
		) 
    SELECT distinct "SOLICITACAO", 
    				"N°PROTOCOLO", 
    				"STATUS PROTOCOLO",
    				"EQUIPAMENTO",
    				"PATRIMONIO",
    				"SERIAL",
    				"DATA SAIDA",
    				"STATUS RETORNO",
    				"DATA DO RETORNO",
    				"RESPONSAVEL",
    				"RETIRADO POR:",
    				"CLIENTE",
    				CIDADE,
    				"SITE",
    				"PONTO DE ACESSO",
    				"PROBLEMA",
    				"TIPO DE PROTOCOLO",
    				"CRIADO EM:"
FROM PERSONALIZADO
WHERE PERSONA1= 1
and CIDADE like 'Nova Santa Rita'



select user, mac, city, neighborhood, c.client_id, c.contract_number, c.created, c.modified , c.beginning_date, c.approval_date  from authentication_contracts ac
left join contracts c on c.id = ac.contract_id 
where city in ('Nova Santa Rita')
and c.contract_number = '19035'




WITH PERSONALIZADO AS (
	select 
p4.name "CLIENTE",
P4.CITY "CIDADE",
		ROW_NUMBER() OVER (PARTITION by p.tag_number ORDER by plis.created desc) AS PERSONA1
		from patrimony_packing_list_items plis
		left join patrimony_packing_lists ppl on ppl.id = plis.patrimony_packing_list_id
		left join assignments a on a.id = ppl.assignment_id
		left join assignment_incidents ai on ai.assignment_id = a.id
		left join incident_types it on it.id = ai.incident_type_id
		left join incident_status is2 on is2.id = ai.incident_status_id
		left join patrimonies p on p.id = plis.patrimony_id
		left join people p2 on p2.id = plis.created_by
		left join people p3 on p3.id = plis.person_allocator_id
		left join people p4 on p4.id = ppl.responsible_id
		left join authentication_sites as2 on as2.id = ppl.authentication_site_id
		left join authentication_access_points aap on aap.id = ppl.authentication_access_point_id
		left join solicitation_problems sp on sp.id = ai.solicitation_problem_id
		where (p.tag_number not like '%teste%' and p.tag_number not like '%TESTE%'and p.tag_number not like '%excluir%' and p.tag_number not like '%Excluir%')
		and plis.returned = 0
		) 
    SELECT distinct "CLIENTE"
FROM PERSONALIZADO
WHERE PERSONA1= 1
and "CIDADE" like 'Nova Santa Rita'


select user, mac, city, neighborhood, c.client_id, c.contract_number, c.created   from authentication_contracts ac
left join contracts c on c.id = ac.contract_id 
where city like 'Nova Santa Rita'


WITH PERSONALIZADO AS (
	select p.name, p.city, pt.title, c.contract_number, c.client_id, ppli.returned, ppli.created , pt.tag_number,
			ROW_NUMBER() OVER (PARTITION by pt.tag_number ORDER by ppli.created desc) AS PERSONA1
from patrimonies pt
	left join people p on p.id = pt.client_id
	left join contracts c on pt.contract_id = c.id
	left join patrimony_packing_list_items ppli on ppli.patrimony_id = pt.id
	where p.city like 'Nova Santa Rita'
	)
SELECT * FROM PERSONALIZADO
where PERSONA1 = 1
    
select patrimonr