use FocosRojos_Muebles
go

-- =============================================
-- Autor: Antonio Acosta Murillo
-- Fecha: 12 Febrero 2014
-- Descripción General: Genera informe de focos rojos; muebles 2011.
-- =============================================

--Se cuentan todos los registros
--select count(*) from FocosRojos_MueblesFinal_2011
--12,183,581

----Query para cambiar valores no validos
--select distinct tipodecasa from FocosRojos_MueblesFinal_2011
--update FocosRojos_MueblesFinal_2011
--set tipodecasa=0
--where tipodecasa not in('P','R','F','H')

--********************************************************************************
--********************************************************************************
--			Genera la información del informe de focos rojos por sexo
--********************************************************************************
--********************************************************************************

--Se calculan las Ventas a crédito
select case sexo when 'M' then '1 Hombre' when 'F' then '2 Mujer' else '3 Invalido' end Sexo,count(*)OpCred,  sum(isnull(cast(importe as bigint),0))ImpCred
from FocosRojos_MueblesFinal_2011
group by sexo
order by sexo

--Se calculan las cuentas perdidas
select case sexo when 'M' then '1 Hombre' when 'F' then '2 Mujer' else '3 Invalido' end Sexo,count(*)opPer,  sum(isnull(cast(importe as bigint),0))ImpPer
from FocosRojos_MueblesFinal_2011
where flag='cp'
group by sexo
order by sexo

--Se calculan las saldadas con bonificación
select case sexo when 'M' then '1 Hombre' when 'F' then '2 Mujer' else '3 Invalido' end Sexo,count(*)opSalCB,  sum(isnull(cast(importe as bigint),0))ImpSalCB
from FocosRojos_MueblesFinal_2011
where flag='SCB'
group by sexo
order by sexo

--Se calculan las saldadas sin bonificación
select case sexo when 'M' then '1 Hombre' when 'F' then '2 Mujer' else '3 Invalido' end Sexo,count(*)opSalSB,  sum(isnull(cast(importe as bigint),0))ImpSalSB
from FocosRojos_MueblesFinal_2011
where flag='SSB'
group by sexo
order by sexo

--Se calculan las saldadas sin bonificación
select case sexo when 'M' then '1 Hombre' when 'F' then '2 Mujer' else '3 Invalido' end Sexo,count(*)opDev,  sum(isnull(cast(importe as bigint),0))ImpDev
from FocosRojos_MueblesFinal_2011
where flag='D'
group by sexo
order by sexo


--********************************************************************************
--********************************************************************************
--		Genera la información del informe de focos rojos por rango de edades
--********************************************************************************
--********************************************************************************

--Se calculan las Ventas a crédito por rango de edades
select case 
	when datediff(year,fechadenacimiento,'20101231') <=22 then '1 <=22' 
	when datediff(year,fechadenacimiento,'20101231') between 23 and 25 then '2 23-25'
	when datediff(year,fechadenacimiento,'20101231') between 26 and 30 then '3 26-30'
	when datediff(year,fechadenacimiento,'20101231') between 31 and 35 then '4 31-35'
	when datediff(year,fechadenacimiento,'20101231') between 36 and 40 then '5 36-40'
	when datediff(year,fechadenacimiento,'20101231') between 41 and 50 then '6 41-50'
	when datediff(year,fechadenacimiento,'20101231') between 51 and 60 then '7 51-60'
	else '8 >=61' end as Edades,
	count(*)OpCred,sum(isnull(cast(importe as bigint),0))ImpCred
	from FocosRojos_MueblesFinal_2011
	group by case
		when datediff(year,fechadenacimiento,'20101231') <=22 then '1 <=22' 
	when datediff(year,fechadenacimiento,'20101231') between 23 and 25 then '2 23-25'
	when datediff(year,fechadenacimiento,'20101231') between 26 and 30 then '3 26-30'
	when datediff(year,fechadenacimiento,'20101231') between 31 and 35 then '4 31-35'
	when datediff(year,fechadenacimiento,'20101231') between 36 and 40 then '5 36-40'
	when datediff(year,fechadenacimiento,'20101231') between 41 and 50 then '6 41-50'
	when datediff(year,fechadenacimiento,'20101231') between 51 and 60 then '7 51-60'
	else '8 >=61' end
	order by Edades

--Se calculan las cuentas perdidas por rango de edades
select case 
	when datediff(year,fechadenacimiento,'20101231') <=22 then '1 <=22' 
	when datediff(year,fechadenacimiento,'20101231') between 23 and 25 then '2 23-25'
	when datediff(year,fechadenacimiento,'20101231') between 26 and 30 then '3 26-30'
	when datediff(year,fechadenacimiento,'20101231') between 31 and 35 then '4 31-35'
	when datediff(year,fechadenacimiento,'20101231') between 36 and 40 then '5 36-40'
	when datediff(year,fechadenacimiento,'20101231') between 41 and 50 then '6 41-50'
	when datediff(year,fechadenacimiento,'20101231') between 51 and 60 then '7 51-60'
	else '8 >=61' end as Edades,
	count(*)opPer,sum(isnull(cast(importe as bigint),0))ImpPer
	from FocosRojos_MueblesFinal_2011
	where flag='cp'
	group by case
		when datediff(year,fechadenacimiento,'20101231') <=22 then '1 <=22' 
	when datediff(year,fechadenacimiento,'20101231') between 23 and 25 then '2 23-25'
	when datediff(year,fechadenacimiento,'20101231') between 26 and 30 then '3 26-30'
	when datediff(year,fechadenacimiento,'20101231') between 31 and 35 then '4 31-35'
	when datediff(year,fechadenacimiento,'20101231') between 36 and 40 then '5 36-40'
	when datediff(year,fechadenacimiento,'20101231') between 41 and 50 then '6 41-50'
	when datediff(year,fechadenacimiento,'20101231') between 51 and 60 then '7 51-60'
	else '8 >=61' end
	order by Edades

--Se calculan las saldadas con bonificación por rango de edades
select case 
	when datediff(year,fechadenacimiento,'20101231') <=22 then '1 <=22' 
	when datediff(year,fechadenacimiento,'20101231') between 23 and 25 then '2 23-25'
	when datediff(year,fechadenacimiento,'20101231') between 26 and 30 then '3 26-30'
	when datediff(year,fechadenacimiento,'20101231') between 31 and 35 then '4 31-35'
	when datediff(year,fechadenacimiento,'20101231') between 36 and 40 then '5 36-40'
	when datediff(year,fechadenacimiento,'20101231') between 41 and 50 then '6 41-50'
	when datediff(year,fechadenacimiento,'20101231') between 51 and 60 then '7 51-60'
	else '8 >=61' end as Edades,
count(*)opSalCB,sum(isnull(cast(importe as bigint),0))ImpSalCB
from FocosRojos_MueblesFinal_2011
where flag='SCB'
group by case
	when datediff(year,fechadenacimiento,'20101231') <=22 then '1 <=22' 
	when datediff(year,fechadenacimiento,'20101231') between 23 and 25 then '2 23-25'
	when datediff(year,fechadenacimiento,'20101231') between 26 and 30 then '3 26-30'
	when datediff(year,fechadenacimiento,'20101231') between 31 and 35 then '4 31-35'
	when datediff(year,fechadenacimiento,'20101231') between 36 and 40 then '5 36-40'
	when datediff(year,fechadenacimiento,'20101231') between 41 and 50 then '6 41-50'
	when datediff(year,fechadenacimiento,'20101231') between 51 and 60 then '7 51-60'
	else '8 >=61' end
	order by Edades

--Se calculan las saldadas sin bonificación por rango edades
select case 
	when datediff(year,fechadenacimiento,'20101231') <=22 then '1 <=22' 
	when datediff(year,fechadenacimiento,'20101231') between 23 and 25 then '2 23-25'
	when datediff(year,fechadenacimiento,'20101231') between 26 and 30 then '3 26-30'
	when datediff(year,fechadenacimiento,'20101231') between 31 and 35 then '4 31-35'
	when datediff(year,fechadenacimiento,'20101231') between 36 and 40 then '5 36-40'
	when datediff(year,fechadenacimiento,'20101231') between 41 and 50 then '6 41-50'
	when datediff(year,fechadenacimiento,'20101231') between 51 and 60 then '7 51-60'
	else '8 >=61' end as Edades,
count(*)opSalSB,sum(isnull(cast(importe as bigint),0))ImpSalSB
from FocosRojos_MueblesFinal_2011
where flag='SSB'
group by case
	when datediff(year,fechadenacimiento,'20101231') <=22 then '1 <=22' 
	when datediff(year,fechadenacimiento,'20101231') between 23 and 25 then '2 23-25'
	when datediff(year,fechadenacimiento,'20101231') between 26 and 30 then '3 26-30'
	when datediff(year,fechadenacimiento,'20101231') between 31 and 35 then '4 31-35'
	when datediff(year,fechadenacimiento,'20101231') between 36 and 40 then '5 36-40'
	when datediff(year,fechadenacimiento,'20101231') between 41 and 50 then '6 41-50'
	when datediff(year,fechadenacimiento,'20101231') between 51 and 60 then '7 51-60'
	else '8 >=61' end
	order by Edades

--Se calculan las saldadas sin bonificación por rango edades
select case 
	when datediff(year,fechadenacimiento,'20101231') <=22 then '1 <=22' 
	when datediff(year,fechadenacimiento,'20101231') between 23 and 25 then '2 23-25'
	when datediff(year,fechadenacimiento,'20101231') between 26 and 30 then '3 26-30'
	when datediff(year,fechadenacimiento,'20101231') between 31 and 35 then '4 31-35'
	when datediff(year,fechadenacimiento,'20101231') between 36 and 40 then '5 36-40'
	when datediff(year,fechadenacimiento,'20101231') between 41 and 50 then '6 41-50'
	when datediff(year,fechadenacimiento,'20101231') between 51 and 60 then '7 51-60'
	else '8 >=61' end as Edades,
count(*)opDev,  sum(isnull(cast(importe as bigint),0))ImpDev
from FocosRojos_MueblesFinal_2011
where flag='D'
group by case
	when datediff(year,fechadenacimiento,'20101231') <=22 then '1 <=22' 
	when datediff(year,fechadenacimiento,'20101231') between 23 and 25 then '2 23-25'
	when datediff(year,fechadenacimiento,'20101231') between 26 and 30 then '3 26-30'
	when datediff(year,fechadenacimiento,'20101231') between 31 and 35 then '4 31-35'
	when datediff(year,fechadenacimiento,'20101231') between 36 and 40 then '5 36-40'
	when datediff(year,fechadenacimiento,'20101231') between 41 and 50 then '6 41-50'
	when datediff(year,fechadenacimiento,'20101231') between 51 and 60 then '7 51-60'
	else '8 >=61' end
	order by Edades


--********************************************************************************
--********************************************************************************
--		Genera la información del informe de focos rojos por tipo de casa
--********************************************************************************
--********************************************************************************

--Se calculan las Ventas a crédito por tipo de casa
select case TipodeCasa when 'P' then '1 Propia' when 'R' then '2 Rentada' when 'F' then '3 Familiar' when 'H' then '4 Husped' else '5 Otros' end TipodeCasa,
count(*)OpCred,  sum(isnull(cast(importe as bigint),0))ImpCred
from FocosRojos_MueblesFinal_2011
group by case TipodeCasa when 'P' then '1 Propia' when 'R' then '2 Rentada' when 'F' then '3 Familiar' when 'H' then '4 Husped' else '5 Otros' end

--Se calculan las cuentas perdidas por tipo de casa
select case TipodeCasa when 'P' then '1 Propia' when 'R' then '2 Rentada' when 'F' then '3 Familiar' when 'H' then '4 Husped' else '5 Otros' end TipodeCasa,
count(*)opPer,  sum(isnull(cast(importe as bigint),0))ImpPer
from FocosRojos_MueblesFinal_2011
where flag='cp'
group by case TipodeCasa when 'P' then '1 Propia' when 'R' then '2 Rentada' when 'F' then '3 Familiar' when 'H' then '4 Husped' else '5 Otros' end

--Se calculan las saldadas con bonificación por tipo de casa
select case TipodeCasa when 'P' then '1 Propia' when 'R' then '2 Rentada' when 'F' then '3 Familiar' when 'H' then '4 Husped' else '5 Otros' end TipodeCasa,
count(*)opSalCB,  sum(isnull(cast(importe as bigint),0))ImpSalCB
from FocosRojos_MueblesFinal_2011
where flag='SCB'
group by case TipodeCasa when 'P' then '1 Propia' when 'R' then '2 Rentada' when 'F' then '3 Familiar' when 'H' then '4 Husped' else '5 Otros' end

--Se calculan las saldadas sin bonificación por tipo de casa
select case TipodeCasa when 'P' then '1 Propia' when 'R' then '2 Rentada' when 'F' then '3 Familiar' when 'H' then '4 Husped' else '5 Otros' end TipodeCasa,
count(*)opSalSB,  sum(isnull(cast(importe as bigint),0))ImpSalSB
from FocosRojos_MueblesFinal_2011
where flag='SSB'
group by case TipodeCasa when 'P' then '1 Propia' when 'R' then '2 Rentada' when 'F' then '3 Familiar' when 'H' then '4 Husped' else '5 Otros' end

--Se calculan las saldadas sin bonificación por tipo de casa
select case TipodeCasa when 'P' then '1 Propia' when 'R' then '2 Rentada' when 'F' then '3 Familiar' when 'H' then '4 Husped' else '5 Otros' end TipodeCasa,
count(*)opDev,  sum(isnull(cast(importe as bigint),0))ImpDev
from FocosRojos_MueblesFinal_2011
where flag='D'
group by case TipodeCasa when 'P' then '1 Propia' when 'R' then '2 Rentada' when 'F' then '3 Familiar' when 'H' then '4 Husped' else '5 Otros' end


--********************************************************************************
--********************************************************************************
--	Genera la información del informe de focos rojos por número de dependientes
--********************************************************************************
--********************************************************************************

--Se calculan las Ventas a crédito por rango de No. de dependientes
select case
	when NumDeDependientes between 0 and 2 then '1 0-2'
	when NumDeDependientes between 3 and 4 then '2 3-4'
	when NumDeDependientes between 5 and 6 then '3 5-6'
	else '4 >=7' end as NumDependientes,
	count(*)OpCred,sum(isnull(cast(importe as bigint),0))ImpCred
from FocosRojos_MueblesFinal_2011
group by case 
	when NumDeDependientes between 0 and 2 then '1 0-2'
	when NumDeDependientes between 3 and 4 then '2 3-4'
	when NumDeDependientes between 5 and 6 then '3 5-6'
	else '4 >=7' end
	order by NumDependientes
	
--Se calculan las cuentas perdidas por rango de No. de dependientes
select case
	when NumDeDependientes between 0 and 2 then '1 0-2'
	when NumDeDependientes between 3 and 4 then '2 3-4'
	when NumDeDependientes between 5 and 6 then '3 5-6'
	else '4 >=7' end as NumDependientes,
	count(*)opPer,sum(isnull(cast(importe as bigint),0))ImpPer
from FocosRojos_MueblesFinal_2011
where flag='cp'
group by case
	when NumDeDependientes between 0 and 2 then '1 0-2'
	when NumDeDependientes between 3 and 4 then '2 3-4'
	when NumDeDependientes between 5 and 6 then '3 5-6'
	else '4 >=7' end
 
--Se calculan las saldadas con bonificación por rango de No. de dependientes
select case
	when NumDeDependientes between 0 and 2 then '1 0-2'
	when NumDeDependientes between 3 and 4 then '2 3-4'
	when NumDeDependientes between 5 and 6 then '3 5-6'
	else '4 >=7' end as NumDependientes,
	count(*)opSalCB,sum(isnull(cast(importe as bigint),0))ImpSalCB
from FocosRojos_MueblesFinal_2011
where flag='SCB'
group by case
	when NumDeDependientes between 0 and 2 then '1 0-2'
	when NumDeDependientes between 3 and 4 then '2 3-4'
	when NumDeDependientes between 5 and 6 then '3 5-6'
	else '4 >=7' end
	order by NumDependientes

--Se calculan las saldadas sin bonificación por rango de No. de dependientes
select case
	when NumDeDependientes between 0 and 2 then '1 0-2'
	when NumDeDependientes between 3 and 4 then '2 3-4'
	when NumDeDependientes between 5 and 6 then '3 5-6'
	else '4 >=7' end as NumDependientes,
	count(*)opSalSB,sum(isnull(cast(importe as bigint),0))ImpSalSB
from FocosRojos_MueblesFinal_2011
where flag='SSB'
group by case
	when NumDeDependientes between 0 and 2 then '1 0-2'
	when NumDeDependientes between 3 and 4 then '2 3-4'
	when NumDeDependientes between 5 and 6 then '3 5-6'
	else '4 >=7' end
	order by NumDependientes
	
--Se calculan las saldadas sin bonificación por rango de No. de dependientes
select case
	when NumDeDependientes between 0 and 2 then '1 0-2'
	when NumDeDependientes between 3 and 4 then '2 3-4'
	when NumDeDependientes between 5 and 6 then '3 5-6'
	else '4 >=7' end as NumDependientes,
	count(*)opDev,  sum(isnull(cast(importe as bigint),0))ImpDev
from FocosRojos_MueblesFinal_2011
where flag='D'
group by case
	when NumDeDependientes between 0 and 2 then '1 0-2'
	when NumDeDependientes between 3 and 4 then '2 3-4'
	when NumDeDependientes between 5 and 6 then '3 5-6'
	else '4 >=7' end
	order by NumDependientes

--********************************************************************************
--********************************************************************************
-- Genera la información del informe de focos rojos por antiguedad del domicilio
--********************************************************************************
--********************************************************************************

--Se calculan las Ventas a crédito por rango de Antiguedad en el Domicilio
select case 
    when datediff(month,Desdecuandovive,'20101231') <6	then '1 <6'
	when datediff(month,Desdecuandovive,'20101231') between 6 and 12  then '2 6-12'
	when datediff(month,Desdecuandovive,'20101231') between 12 and 24 then '3 12-24'
	when datediff(month,Desdecuandovive,'20101231') between 24 and 36 then '4 24-36'
	when datediff(month,Desdecuandovive,'20101231') between 36 and 48 then '5 36-48'
	else '6 >48' end as AntiguedadDom,
	count(*)OpCred,sum(isnull(cast(importe as bigint),0))ImpCred
from FocosRojos_MueblesFinal_2011
group by case
    when datediff(month,Desdecuandovive,'20101231') <6	then '1 <6'
	when datediff(month,Desdecuandovive,'20101231') between 6 and 12  then '2 6-12'
	when datediff(month,Desdecuandovive,'20101231') between 12 and 24 then '3 12-24'
	when datediff(month,Desdecuandovive,'20101231') between 24 and 36 then '4 24-36'
	when datediff(month,Desdecuandovive,'20101231') between 36 and 48 then '5 36-48'
	else '6 >48' end

--Se calculan las cuentas perdidas por rango de Antiguedad en el Domicilio
select case 
    when datediff(month,Desdecuandovive,'20101231') <6	then '1 <6'
	when datediff(month,Desdecuandovive,'20101231') between 6 and 12  then '2 6-12'
	when datediff(month,Desdecuandovive,'20101231') between 12 and 24 then '3 12-24'
	when datediff(month,Desdecuandovive,'20101231') between 24 and 36 then '4 24-36'
	when datediff(month,Desdecuandovive,'20101231') between 36 and 48 then '5 36-48'
	else '6 >48' end as AntiguedadDom,
	count(*)opPer,sum(isnull(cast(importe as bigint),0))ImpPer
from FocosRojos_MueblesFinal_2011
where flag='CP'
group by case
    when datediff(month,Desdecuandovive,'20101231') <6	then '1 <6'
	when datediff(month,Desdecuandovive,'20101231') between 6 and 12  then '2 6-12'
	when datediff(month,Desdecuandovive,'20101231') between 12 and 24 then '3 12-24'
	when datediff(month,Desdecuandovive,'20101231') between 24 and 36 then '4 24-36'
	when datediff(month,Desdecuandovive,'20101231') between 36 and 48 then '5 36-48'
	else '6 >48' end
	
--Se calculan las saldadas con bonificación por rango de Antiguedad en el Domicilio	
select case 
    when datediff(month,Desdecuandovive,'20101231') <6	then '1 <6'
	when datediff(month,Desdecuandovive,'20101231') between 6 and 12  then '2 6-12'
	when datediff(month,Desdecuandovive,'20101231') between 12 and 24 then '3 12-24'
	when datediff(month,Desdecuandovive,'20101231') between 24 and 36 then '4 24-36'
	when datediff(month,Desdecuandovive,'20101231') between 36 and 48 then '5 36-48'
	else '6 >48' end as AntiguedadDom,
	count(*)opSalCB,sum(isnull(cast(importe as bigint),0))ImpSalCB
from FocosRojos_MueblesFinal_2011
where flag='SCB'
group by case
    when datediff(month,Desdecuandovive,'20101231') <6	then '1 <6'
	when datediff(month,Desdecuandovive,'20101231') between 6 and 12  then '2 6-12'
	when datediff(month,Desdecuandovive,'20101231') between 12 and 24 then '3 12-24'
	when datediff(month,Desdecuandovive,'20101231') between 24 and 36 then '4 24-36'
	when datediff(month,Desdecuandovive,'20101231') between 36 and 48 then '5 36-48'
	else '6 >48' end

--Se calculan las saldadas sin bonificación por rango de Antiguedad en el Domicilio
select case 
    when datediff(month,Desdecuandovive,'20101231') <6	then '1 <6'
	when datediff(month,Desdecuandovive,'20101231') between 6 and 12  then '2 6-12'
	when datediff(month,Desdecuandovive,'20101231') between 12 and 24 then '3 12-24'
	when datediff(month,Desdecuandovive,'20101231') between 24 and 36 then '4 24-36'
	when datediff(month,Desdecuandovive,'20101231') between 36 and 48 then '5 36-48'
	else '6 >48' end as AntiguedadDom,
	count(*)opSalSB,sum(isnull(cast(importe as bigint),0))ImpSalSB
from FocosRojos_MueblesFinal_2011
where flag='SSB'
group by case
    when datediff(month,Desdecuandovive,'20101231') <6	then '1 <6'
	when datediff(month,Desdecuandovive,'20101231') between 6 and 12  then '2 6-12'
	when datediff(month,Desdecuandovive,'20101231') between 12 and 24 then '3 12-24'
	when datediff(month,Desdecuandovive,'20101231') between 24 and 36 then '4 24-36'
	when datediff(month,Desdecuandovive,'20101231') between 36 and 48 then '5 36-48'
	else '6 >48' end

--Se calculan las saldadas sin bonificación por rango de Antiguedad en el Domicilio
select case 
    when datediff(month,Desdecuandovive,'20101231') <6	then '1 <6'
	when datediff(month,Desdecuandovive,'20101231') between 6 and 12  then '2 6-12'
	when datediff(month,Desdecuandovive,'20101231') between 12 and 24 then '3 12-24'
	when datediff(month,Desdecuandovive,'20101231') between 24 and 36 then '4 24-36'
	when datediff(month,Desdecuandovive,'20101231') between 36 and 48 then '5 36-48'
	else '6 >48' end as AntiguedadDom,
	count(*)opDev,  sum(isnull(cast(importe as bigint),0))ImpDev
from FocosRojos_MueblesFinal_2011
where flag='D'
group by case
    when datediff(month,Desdecuandovive,'20101231') <6	then '1 <6'
	when datediff(month,Desdecuandovive,'20101231') between 6 and 12  then '2 6-12'
	when datediff(month,Desdecuandovive,'20101231') between 12 and 24 then '3 12-24'
	when datediff(month,Desdecuandovive,'20101231') between 24 and 36 then '4 24-36'
	when datediff(month,Desdecuandovive,'20101231') between 36 and 48 then '5 36-48'
	else '6 >48' end

--********************************************************************************
--********************************************************************************
-- Genera la información del informe de focos rojos por antiguedad del Trabajo
--********************************************************************************
--********************************************************************************

--Se calculan las Ventas a crédito por rango de Antiguedad en el Trabajo
select case 
    when datediff(month,AntiguedadDelTrabajo,'20101231') <6	then '1 <6'
	when datediff(month,AntiguedadDelTrabajo,'20101231') between 6 and 12  then '2 6-12'
	when datediff(month,AntiguedadDelTrabajo,'20101231') between 12 and 24 then '3 12-24'
	when datediff(month,AntiguedadDelTrabajo,'20101231') between 24 and 36 then '4 24-36'
	when datediff(month,AntiguedadDelTrabajo,'20101231') between 36 and 48 then '5 36-48'
	else '6 >48' end as AntiguedadDom,
	count(*)OpCred,sum(isnull(cast(importe as bigint),0))ImpCred
from FocosRojos_MueblesFinal_2011
group by case
    when datediff(month,AntiguedadDelTrabajo,'20101231') <6	then '1 <6'
	when datediff(month,AntiguedadDelTrabajo,'20101231') between 6 and 12  then '2 6-12'
	when datediff(month,AntiguedadDelTrabajo,'20101231') between 12 and 24 then '3 12-24'
	when datediff(month,AntiguedadDelTrabajo,'20101231') between 24 and 36 then '4 24-36'
	when datediff(month,AntiguedadDelTrabajo,'20101231') between 36 and 48 then '5 36-48'
	else '6 >48' end

--Se calculan las cuentas perdidas por rango de Antiguedad en el Trabajo
select case 
    when datediff(month,AntiguedadDelTrabajo,'20101231') <6	then '1 <6'
	when datediff(month,AntiguedadDelTrabajo,'20101231') between 6 and 12  then '2 6-12'
	when datediff(month,AntiguedadDelTrabajo,'20101231') between 12 and 24 then '3 12-24'
	when datediff(month,AntiguedadDelTrabajo,'20101231') between 24 and 36 then '4 24-36'
	when datediff(month,AntiguedadDelTrabajo,'20101231') between 36 and 48 then '5 36-48'
	else '6 >48' end as AntiguedadDom,
	count(*)opPer,sum(isnull(cast(importe as bigint),0))ImpPer
from FocosRojos_MueblesFinal_2011
where flag='CP'
group by case
    when datediff(month,AntiguedadDelTrabajo,'20101231') <6	then '1 <6'
	when datediff(month,AntiguedadDelTrabajo,'20101231') between 6 and 12  then '2 6-12'
	when datediff(month,AntiguedadDelTrabajo,'20101231') between 12 and 24 then '3 12-24'
	when datediff(month,AntiguedadDelTrabajo,'20101231') between 24 and 36 then '4 24-36'
	when datediff(month,AntiguedadDelTrabajo,'20101231') between 36 and 48 then '5 36-48'
	else '6 >48' end
	
--Se calculan las saldadas con bonificación por rango de Antiguedad en el Trabajo	
select case 
    when datediff(month,AntiguedadDelTrabajo,'20101231') <6	then '1 <6'
	when datediff(month,AntiguedadDelTrabajo,'20101231') between 6 and 12  then '2 6-12'
	when datediff(month,AntiguedadDelTrabajo,'20101231') between 12 and 24 then '3 12-24'
	when datediff(month,AntiguedadDelTrabajo,'20101231') between 24 and 36 then '4 24-36'
	when datediff(month,AntiguedadDelTrabajo,'20101231') between 36 and 48 then '5 36-48'
	else '6 >48' end as AntiguedadDom,
	count(*)opSalCB,sum(isnull(cast(importe as bigint),0))ImpSalCB
from FocosRojos_MueblesFinal_2011
where flag='SCB'
group by case
    when datediff(month,AntiguedadDelTrabajo,'20101231') <6	then '1 <6'
	when datediff(month,AntiguedadDelTrabajo,'20101231') between 6 and 12  then '2 6-12'
	when datediff(month,AntiguedadDelTrabajo,'20101231') between 12 and 24 then '3 12-24'
	when datediff(month,AntiguedadDelTrabajo,'20101231') between 24 and 36 then '4 24-36'
	when datediff(month,AntiguedadDelTrabajo,'20101231') between 36 and 48 then '5 36-48'
	else '6 >48' end

--Se calculan las saldadas sin bonificación por rango de Antiguedad en el Trabajo
select case 
    when datediff(month,AntiguedadDelTrabajo,'20101231') <6	then '1 <6'
	when datediff(month,AntiguedadDelTrabajo,'20101231') between 6 and 12  then '2 6-12'
	when datediff(month,AntiguedadDelTrabajo,'20101231') between 12 and 24 then '3 12-24'
	when datediff(month,AntiguedadDelTrabajo,'20101231') between 24 and 36 then '4 24-36'
	when datediff(month,AntiguedadDelTrabajo,'20101231') between 36 and 48 then '5 36-48'
	else '6 >48' end as AntiguedadDom,
	count(*)opSalSB,sum(isnull(cast(importe as bigint),0))ImpSalSB
from FocosRojos_MueblesFinal_2011
where flag='SSB'
group by case
    when datediff(month,AntiguedadDelTrabajo,'20101231') <6	then '1 <6'
	when datediff(month,AntiguedadDelTrabajo,'20101231') between 6 and 12  then '2 6-12'
	when datediff(month,AntiguedadDelTrabajo,'20101231') between 12 and 24 then '3 12-24'
	when datediff(month,AntiguedadDelTrabajo,'20101231') between 24 and 36 then '4 24-36'
	when datediff(month,AntiguedadDelTrabajo,'20101231') between 36 and 48 then '5 36-48'
	else '6 >48' end

--Se calculan las saldadas sin bonificación por rango de Antiguedad en el Trabajo
select case 
    when datediff(month,AntiguedadDelTrabajo,'20101231') <6	then '1 <6'
	when datediff(month,AntiguedadDelTrabajo,'20101231') between 6 and 12  then '2 6-12'
	when datediff(month,AntiguedadDelTrabajo,'20101231') between 12 and 24 then '3 12-24'
	when datediff(month,AntiguedadDelTrabajo,'20101231') between 24 and 36 then '4 24-36'
	when datediff(month,AntiguedadDelTrabajo,'20101231') between 36 and 48 then '5 36-48'
	else '6 >48' end as AntiguedadDom,
	count(*)opDev,  sum(isnull(cast(importe as bigint),0))ImpDev
from FocosRojos_MueblesFinal_2011
where flag='D'
group by case
    when datediff(month,AntiguedadDelTrabajo,'20101231') <6	then '1 <6'
	when datediff(month,AntiguedadDelTrabajo,'20101231') between 6 and 12  then '2 6-12'
	when datediff(month,AntiguedadDelTrabajo,'20101231') between 12 and 24 then '3 12-24'
	when datediff(month,AntiguedadDelTrabajo,'20101231') between 24 and 36 then '4 24-36'
	when datediff(month,AntiguedadDelTrabajo,'20101231') between 36 and 48 then '5 36-48'
	else '6 >48' end

--********************************************************************************
--********************************************************************************
-- Genera la información del informe de focos rojos por ingreso mensual
--********************************************************************************
--********************************************************************************

--Se calculan las Ventas a crédito por rango de Ingreso Mensual
select case
	when IngresoMensual between 0 and 3 then '1 0-3'
	when IngresoMensual between 4 and 6 then '2 4-6'
	when IngresoMensual between 7 and 9 then '3 7-9'
	when IngresoMensual between 10 and 12 then '4 10-12'
	when IngresoMensual between 13 and 15 then '5 13-15'
	when IngresoMensual between 16 and 20 then '6 16-20'
	else '7 >=21' end as IngresoMens,
	count(*)OpCred,sum(isnull(cast(importe as bigint),0))ImpCred
from FocosRojos_MueblesFinal_2011
group by case 
	when IngresoMensual between 0 and 3 then '1 0-3'
	when IngresoMensual between 4 and 6 then '2 4-6'
	when IngresoMensual between 7 and 9 then '3 7-9'
	when IngresoMensual between 10 and 12 then '4 10-12'
	when IngresoMensual between 13 and 15 then '5 13-15'
	when IngresoMensual between 16 and 20 then '6 16-20'
	else '7 >=21' end

--Se calculan las cuentas perdidas por rango de Ingreso Mensual
select case
	when IngresoMensual between 0 and 3 then '1 0-3'
	when IngresoMensual between 4 and 6 then '2 4-6'
	when IngresoMensual between 7 and 9 then '3 7-9'
	when IngresoMensual between 10 and 12 then '4 10-12'
	when IngresoMensual between 13 and 15 then '5 13-15'
	when IngresoMensual between 16 and 20 then '6 16-20'
	else '7 >=21' end as IngresoMens,
	count(*)opPer,sum(isnull(cast(importe as bigint),0))ImpPer
from FocosRojos_MueblesFinal_2011
where flag='cp'
group by case
	when IngresoMensual between 0 and 3 then '1 0-3'
	when IngresoMensual between 4 and 6 then '2 4-6'
	when IngresoMensual between 7 and 9 then '3 7-9'
	when IngresoMensual between 10 and 12 then '4 10-12'
	when IngresoMensual between 13 and 15 then '5 13-15'
	when IngresoMensual between 16 and 20 then '6 16-20'
	else '7 >=21' end
	
--Se calculan las saldadas con bonificación por rango de Ingreso Mensual
select case
	when IngresoMensual between 0 and 3 then '1 0-3'
	when IngresoMensual between 4 and 6 then '2 4-6'
	when IngresoMensual between 7 and 9 then '3 7-9'
	when IngresoMensual between 10 and 12 then '4 10-12'
	when IngresoMensual between 13 and 15 then '5 13-15'
	when IngresoMensual between 16 and 20 then '6 16-20'
	else '7 >=21' end as IngresoMens,
	count(*)opSalCB,sum(isnull(cast(importe as bigint),0))ImpSalCB
from FocosRojos_MueblesFinal_2011
where flag='SCB'
group by case
	when IngresoMensual between 0 and 3 then '1 0-3'
	when IngresoMensual between 4 and 6 then '2 4-6'
	when IngresoMensual between 7 and 9 then '3 7-9'
	when IngresoMensual between 10 and 12 then '4 10-12'
	when IngresoMensual between 13 and 15 then '5 13-15'
	when IngresoMensual between 16 and 20 then '6 16-20'
	else '7 >=21' end
	
--Se calculan las saldadas sin bonificación por rango de Ingreso Mensual
select case
	when IngresoMensual between 0 and 3 then '1 0-3'
	when IngresoMensual between 4 and 6 then '2 4-6'
	when IngresoMensual between 7 and 9 then '3 7-9'
	when IngresoMensual between 10 and 12 then '4 10-12'
	when IngresoMensual between 13 and 15 then '5 13-15'
	when IngresoMensual between 16 and 20 then '6 16-20'
	else '7 >=21' end as IngresoMens,
	count(*)opSalSB,sum(isnull(cast(importe as bigint),0))ImpSalSB
from FocosRojos_MueblesFinal_2011
where flag='SSB'
group by case
	when IngresoMensual between 0 and 3 then '1 0-3'
	when IngresoMensual between 4 and 6 then '2 4-6'
	when IngresoMensual between 7 and 9 then '3 7-9'
	when IngresoMensual between 10 and 12 then '4 10-12'
	when IngresoMensual between 13 and 15 then '5 13-15'
	when IngresoMensual between 16 and 20 then '6 16-20'
	else '7 >=21' end

--Se calculan las saldadas sin bonificación por rango de Ingreso Mensual
select case
	when IngresoMensual between 0 and 3 then '1 0-3'
	when IngresoMensual between 4 and 6 then '2 4-6'
	when IngresoMensual between 7 and 9 then '3 7-9'
	when IngresoMensual between 10 and 12 then '4 10-12'
	when IngresoMensual between 13 and 15 then '5 13-15'
	when IngresoMensual between 16 and 20 then '6 16-20'
	else '7 >=21' end as IngresoMens,
	count(*)opDev,  sum(isnull(cast(importe as bigint),0))ImpDev
from FocosRojos_MueblesFinal_2011
where flag='D'
group by case
	when IngresoMensual between 0 and 3 then '1 0-3'
	when IngresoMensual between 4 and 6 then '2 4-6'
	when IngresoMensual between 7 and 9 then '3 7-9'
	when IngresoMensual between 10 and 12 then '4 10-12'
	when IngresoMensual between 13 and 15 then '5 13-15'
	when IngresoMensual between 16 and 20 then '6 16-20'
	else '7 >=21' end
	

--********************************************************************************
--********************************************************************************
--		Genera la información del informe de focos rojos por EstadoCivil
--********************************************************************************
--********************************************************************************

--Se calculan las Ventas a crédito por rango de Estado Civil
select case
	EstadoCivil when 'S' then '1 S'
	when 'C' then '2 C'
	when 'V' then '3 V'
	when 'D' then '4 D'
	when 'U' then '5 U'
	else 'Otros' end EstadoCivil,
	count(*)OpCred,sum(isnull(cast(importe as bigint),0))ImpCred
from FocosRojos_MueblesFinal_2011
group by case 
	EstadoCivil when 'S' then '1 S'
	when 'C' then '2 C'
	when 'V' then '3 V'
	when 'D' then '4 D'
	when 'U' then '5 U'
	else 'Otros' end
	
--Se calculan las cuentas perdidas por rango de Estado Civil
select case
	EstadoCivil when 'S' then '1 S'
	when 'C' then '2 C'
	when 'V' then '3 V'
	when 'D' then '4 D'
	when 'U' then '5 U'
	else 'Otros' end EstadoCivil,
	count(*)opPer,sum(isnull(cast(importe as bigint),0))ImpPer
from FocosRojos_MueblesFinal_2011
where flag='cp'
group by case 
	EstadoCivil when 'S' then '1 S'
	when 'C' then '2 C'
	when 'V' then '3 V'
	when 'D' then '4 D'
	when 'U' then '5 U'
	else 'Otros' end
 
--Se calculan las saldadas con bonificación por rango de Estado Civil
select case
	EstadoCivil when 'S' then '1 S'
	when 'C' then '2 C'
	when 'V' then '3 V'
	when 'D' then '4 D'
	when 'U' then '5 U'
	else 'Otros' end EstadoCivil,
	count(*)opSalCB,sum(isnull(cast(importe as bigint),0))ImpSalCB
from FocosRojos_MueblesFinal_2011
where flag='SCB'
group by case 
	EstadoCivil when 'S' then '1 S'
	when 'C' then '2 C'
	when 'V' then '3 V'
	when 'D' then '4 D'
	when 'U' then '5 U'
	else 'Otros' end

--Se calculan las saldadas sin bonificación por rango de Estado Civil
select case
	EstadoCivil when 'S' then '1 S'
	when 'C' then '2 C'
	when 'V' then '3 V'
	when 'D' then '4 D'
	when 'U' then '5 U'
	else 'Otros' end EstadoCivil,
	count(*)opSalSB,sum(isnull(cast(importe as bigint),0))ImpSalSB
from FocosRojos_MueblesFinal_2011
where flag='SSB'
group by case 
	EstadoCivil when 'S' then '1 S'
	when 'C' then '2 C'
	when 'V' then '3 V'
	when 'D' then '4 D'
	when 'U' then '5 U'
	else 'Otros' end

--Se calculan las saldadas sin bonificación por rango de Estado Civil
select case
	EstadoCivil when 'S' then '1 S'
	when 'C' then '2 C'
	when 'V' then '3 V'
	when 'D' then '4 D'
	when 'U' then '5 U'
	else 'Otros' end EstadoCivil,
	count(*)opDev,  sum(isnull(cast(importe as bigint),0))ImpDev
from FocosRojos_MueblesFinal_2011
where flag='D'
group by case 
	EstadoCivil when 'S' then '1 S'
	when 'C' then '2 C'
	when 'V' then '3 V'
	when 'D' then '4 D'
	when 'U' then '5 U'
	else 'Otros' end

--********************************************************************************
--********************************************************************************
--		Genera la información del informe de focos rojos por escolaridad
--********************************************************************************
--********************************************************************************

--Se calculan las Ventas a crédito por tipo de Escolaridad
select case
	when Escolaridad in (1,2,3,4,5,6) then cast (Escolaridad as char(2)) else 'Invalido' end Escolaridad,
	count(*)OpCred,sum(isnull(cast(importe as bigint),0))ImpCred
from FocosRojos_MueblesFinal_2011
group by case
	when Escolaridad in (1,2,3,4,5,6) then cast (Escolaridad as char(2)) else 'Invalido' end
	
--Se calculan las cuentas perdidas por rango de Escolaridad
select case
	when Escolaridad in (1,2,3,4,5,6) then cast (Escolaridad as char(2)) else 'Invalido' end Escolaridad,
	count(*)opPer,sum(isnull(cast(importe as bigint),0))ImpPer
from FocosRojos_MueblesFinal_2011
where flag='cp'
group by case
	when Escolaridad in (1,2,3,4,5,6) then cast (Escolaridad as char(2)) else 'Invalido' end
 
--Se calculan las saldadas con bonificación por rango de Escolaridad
select case
	when Escolaridad in (1,2,3,4,5,6) then cast (Escolaridad as char(2)) else 'Invalido' end Escolaridad,
	count(*)opSalCB,sum(isnull(cast(importe as bigint),0))ImpSalCB
from FocosRojos_MueblesFinal_2011
where flag='SCB'
group by case
	when Escolaridad in (1,2,3,4,5,6) then cast (Escolaridad as char(2)) else 'Invalido' end
	
--Se calculan las saldadas sin bonificación por rango de Escolaridad
select case
	when Escolaridad in (1,2,3,4,5,6) then cast (Escolaridad as char(2)) else 'Invalido' end Escolaridad,
	count(*)opSalSB,sum(isnull(cast(importe as bigint),0))ImpSalSB
from FocosRojos_MueblesFinal_2011
where flag='SSB'
group by case
	when Escolaridad in (1,2,3,4,5,6) then cast (Escolaridad as char(2)) else 'Invalido' end

--Se calculan las saldadas sin bonificación por rango de Escolaridad
select case
	when Escolaridad in (1,2,3,4,5,6) then cast (Escolaridad as char(2)) else 'Invalido' end Escolaridad,
	count(*)opDev,  sum(isnull(cast(importe as bigint),0))ImpDev
from FocosRojos_MueblesFinal_2011
where flag='D'
group by case
	when Escolaridad in (1,2,3,4,5,6) then cast (Escolaridad as char(2)) else 'Invalido' end
	
--********************************************************************************
--********************************************************************************
--	  Genera la información del informe de focos rojos por tamaño de la ciudad
--********************************************************************************
--********************************************************************************

--Se calculan las Ventas a crédito por rango de tamaño de la ciudad
select case
	when TipoCiudad in (1,2,3,4,5,6) then cast(TipoCiudad as char(2)) else 'Invalido' end TipoCiudad,
	count(*)OpCred,sum(isnull(cast(importe as bigint),0))ImpCred
from FocosRojos_MueblesFinal_2011
group by case 
	when TipoCiudad in (1,2,3,4,5,6) then cast(TipoCiudad as char(2)) else 'Invalido' end
	
--Se calculan las cuentas perdidas por rango de tamaño de la ciudad
select case
	when TipoCiudad in (1,2,3,4,5,6) then cast(TipoCiudad as char(2)) else 'Invalido' end TipoCiudad,
	count(*)opPer,sum(isnull(cast(importe as bigint),0))ImpPer
from FocosRojos_MueblesFinal_2011
where flag='cp'
group by case
	when TipoCiudad in (1,2,3,4,5,6) then cast(TipoCiudad as char(2)) else 'Invalido' end
 
--Se calculan las saldadas con bonificación por rango de tamaño de la ciudad
select case
	when TipoCiudad in (1,2,3,4,5,6) then cast(TipoCiudad as char(2)) else 'Invalido' end TipoCiudad,
	count(*)opSalCB,sum(isnull(cast(importe as bigint),0))ImpSalCB
from FocosRojos_MueblesFinal_2011
where flag='SCB'
group by case
	when TipoCiudad in (1,2,3,4,5,6) then cast(TipoCiudad as char(2)) else 'Invalido' end

--Se calculan las saldadas sin bonificación por rango de tamaño de la ciudad
select case
	when TipoCiudad in (1,2,3,4,5,6) then cast(TipoCiudad as char(2)) else 'Invalido' end TipoCiudad,
	count(*)opSalSB,sum(isnull(cast(importe as bigint),0))ImpSalSB
from FocosRojos_MueblesFinal_2011
where flag='SSB'
group by case
	when TipoCiudad in (1,2,3,4,5,6) then cast(TipoCiudad as char(2)) else 'Invalido' end

--Se calculan las saldadas sin bonificación por rango de tamaño de la ciudad
select case
	when TipoCiudad in (1,2,3,4,5,6) then cast(TipoCiudad as char(2)) else 'Invalido' end TipoCiudad,
	count(*)opDev,  sum(isnull(cast(importe as bigint),0))ImpDev
from FocosRojos_MueblesFinal_2011
where flag='D'
group by case
	when TipoCiudad in (1,2,3,4,5,6) then cast(TipoCiudad as char(2)) else 'Invalido' end

--********************************************************************************
--********************************************************************************
--	Genera la información del informe de focos rojos por antiguedad de la Compra
--********************************************************************************
--********************************************************************************

--Se calculan las Ventas a crédito por rango de Antiguedad de la Compra
select case 
    when datediff(month,FechaPrimerCompraRopa,'20101231') <6	then '1 <6'
	when datediff(month,FechaPrimerCompraRopa,'20101231') between 6 and 12  then '2 6-12'
	when datediff(month,FechaPrimerCompraRopa,'20101231') between 12 and 24 then '3 12-24'
	when datediff(month,FechaPrimerCompraRopa,'20101231') between 24 and 36 then '4 24-36'
	when datediff(month,FechaPrimerCompraRopa,'20101231') between 36 and 48 then '5 36-48'
	else '6 >48' end as AntiguedadDom,
	count(*)OpCred,sum(isnull(cast(importe as bigint),0))ImpCred
from FocosRojos_MueblesFinal_2011
group by case
    when datediff(month,FechaPrimerCompraRopa,'20101231') <6	then '1 <6'
	when datediff(month,FechaPrimerCompraRopa,'20101231') between 6 and 12  then '2 6-12'
	when datediff(month,FechaPrimerCompraRopa,'20101231') between 12 and 24 then '3 12-24'
	when datediff(month,FechaPrimerCompraRopa,'20101231') between 24 and 36 then '4 24-36'
	when datediff(month,FechaPrimerCompraRopa,'20101231') between 36 and 48 then '5 36-48'
	else '6 >48' end

--Se calculan las cuentas perdidas por rango de Antiguedad de la Compra
select case 
    when datediff(month,FechaPrimerCompraRopa,'20101231') <6	then '1 <6'
	when datediff(month,FechaPrimerCompraRopa,'20101231') between 6 and 12  then '2 6-12'
	when datediff(month,FechaPrimerCompraRopa,'20101231') between 12 and 24 then '3 12-24'
	when datediff(month,FechaPrimerCompraRopa,'20101231') between 24 and 36 then '4 24-36'
	when datediff(month,FechaPrimerCompraRopa,'20101231') between 36 and 48 then '5 36-48'
	else '6 >48' end as AntiguedadDom,
	count(*)opPer,sum(isnull(cast(importe as bigint),0))ImpPer
from FocosRojos_MueblesFinal_2011
where flag='CP'
group by case
    when datediff(month,FechaPrimerCompraRopa,'20101231') <6	then '1 <6'
	when datediff(month,FechaPrimerCompraRopa,'20101231') between 6 and 12  then '2 6-12'
	when datediff(month,FechaPrimerCompraRopa,'20101231') between 12 and 24 then '3 12-24'
	when datediff(month,FechaPrimerCompraRopa,'20101231') between 24 and 36 then '4 24-36'
	when datediff(month,FechaPrimerCompraRopa,'20101231') between 36 and 48 then '5 36-48'
	else '6 >48' end
	
--Se calculan las saldadas con bonificación por rango de Antiguedad de la Compra	
select case 
    when datediff(month,FechaPrimerCompraRopa,'20101231') <6	then '1 <6'
	when datediff(month,FechaPrimerCompraRopa,'20101231') between 6 and 12  then '2 6-12'
	when datediff(month,FechaPrimerCompraRopa,'20101231') between 12 and 24 then '3 12-24'
	when datediff(month,FechaPrimerCompraRopa,'20101231') between 24 and 36 then '4 24-36'
	when datediff(month,FechaPrimerCompraRopa,'20101231') between 36 and 48 then '5 36-48'
	else '6 >48' end as AntiguedadDom,
	count(*)opSalCB,sum(isnull(cast(importe as bigint),0))ImpSalCB
from FocosRojos_MueblesFinal_2011
where flag='SCB'
group by case
    when datediff(month,FechaPrimerCompraRopa,'20101231') <6	then '1 <6'
	when datediff(month,FechaPrimerCompraRopa,'20101231') between 6 and 12  then '2 6-12'
	when datediff(month,FechaPrimerCompraRopa,'20101231') between 12 and 24 then '3 12-24'
	when datediff(month,FechaPrimerCompraRopa,'20101231') between 24 and 36 then '4 24-36'
	when datediff(month,FechaPrimerCompraRopa,'20101231') between 36 and 48 then '5 36-48'
	else '6 >48' end

--Se calculan las saldadas sin bonificación por rango de Antiguedad de la Compra
select case 
    when datediff(month,FechaPrimerCompraRopa,'20101231') <6	then '1 <6'
	when datediff(month,FechaPrimerCompraRopa,'20101231') between 6 and 12  then '2 6-12'
	when datediff(month,FechaPrimerCompraRopa,'20101231') between 12 and 24 then '3 12-24'
	when datediff(month,FechaPrimerCompraRopa,'20101231') between 24 and 36 then '4 24-36'
	when datediff(month,FechaPrimerCompraRopa,'20101231') between 36 and 48 then '5 36-48'
	else '6 >48' end as AntiguedadDom,
	count(*)opSalSB,sum(isnull(cast(importe as bigint),0))ImpSalSB
from FocosRojos_MueblesFinal_2011
where flag='SSB'
group by case
    when datediff(month,FechaPrimerCompraRopa,'20101231') <6	then '1 <6'
	when datediff(month,FechaPrimerCompraRopa,'20101231') between 6 and 12  then '2 6-12'
	when datediff(month,FechaPrimerCompraRopa,'20101231') between 12 and 24 then '3 12-24'
	when datediff(month,FechaPrimerCompraRopa,'20101231') between 24 and 36 then '4 24-36'
	when datediff(month,FechaPrimerCompraRopa,'20101231') between 36 and 48 then '5 36-48'
	else '6 >48' end

--Se calculan las saldadas sin bonificación por rango de Antiguedad de la Compra
select case 
    when datediff(month,FechaPrimerCompraRopa,'20101231') <6	then '1 <6'
	when datediff(month,FechaPrimerCompraRopa,'20101231') between 6 and 12  then '2 6-12'
	when datediff(month,FechaPrimerCompraRopa,'20101231') between 12 and 24 then '3 12-24'
	when datediff(month,FechaPrimerCompraRopa,'20101231') between 24 and 36 then '4 24-36'
	when datediff(month,FechaPrimerCompraRopa,'20101231') between 36 and 48 then '5 36-48'
	else '6 >48' end as AntiguedadDom,
	count(*)opDev,  sum(isnull(cast(importe as bigint),0))ImpDev
from FocosRojos_MueblesFinal_2011
where flag='D'
group by case
    when datediff(month,FechaPrimerCompraRopa,'20101231') <6	then '1 <6'
	when datediff(month,FechaPrimerCompraRopa,'20101231') between 6 and 12  then '2 6-12'
	when datediff(month,FechaPrimerCompraRopa,'20101231') between 12 and 24 then '3 12-24'
	when datediff(month,FechaPrimerCompraRopa,'20101231') between 24 and 36 then '4 24-36'
	when datediff(month,FechaPrimerCompraRopa,'20101231') between 36 and 48 then '5 36-48'
	else '6 >48' end
