-- 1. validacion de si el codempleado pertenece aun auxiliar

Select Aux.nomAuxiliar, Aux.sede, to_char(CURRENT_DATE, 'dd/mm/yyyy') fecha, to_char(CURRENT_DATE, 'HH-MI') Hora
from (select distinct E.codEmpleado Codigo, E.nomEmpleado||' '||E.apellEmpleado nomAuxiliar, ES.nomEspacio sede
    from empleado E, empleado_cargo EC, espacio ES
    where E.codEmpleado = EC.codEmpleado and ES.codEspacio= EC.codEspacio and EC.idCargo='1') Aux
where '1' in Aux.Codigo;

-- 2. IDENTIFICAR SI ES EL DIRECTOR 
Select Aux.nomAuxiliar, Aux.sede, CURRENT_DATE fecha
from (select distinct E.codEmpleado Codigo, E.nomEmpleado||' '||E.apellEmpleado nomAuxiliar, ES.nomEspacio sede
    from empleado E, empleado_cargo EC, espacio ES
    where E.codEmpleado = EC.codEmpleado and ES.codEspacio= EC.codEspacio and EC.idCargo='3') Aux
where '307' in Aux.Codigo;

-- 3. profesor
Select Prof.Codigo, Prof.nomProf, Prof.apellProf,Prof.sede, to_char(CURRENT_DATE, 'dd/mm/yyyy') fecha, to_char(CURRENT_DATE, 'HH:MI') Hora
from (select distinct E.codEmpleado Codigo, E.nomEmpleado nomProf, E.apellEmpleado apellProf, ES.nomEspacio sede
    from empleado E, empleado_cargo EC, espacio ES
    where E.codEmpleado = EC.codEmpleado and ES.codEspacio= EC.codEspacio and EC.idCargo='2') Prof
where 'Andres' = UPPER(Prof.nomProf) AND 'Suarez'=UPPER(Prof.apellProf);


-- 3. CONSULTA QUE RECIBE EL NOMBRE DEL DOCENTE Y DEVUELVE DATOS DEL DOCENTE, SEDE ,FECHA Y HORA

Select Prof.Codigo, Prof.nomProf, Prof.apellProf,Prof.sede, to_char(CURRENT_DATE, 'dd/mm/yyyy') fecha, to_char(CURRENT_DATE, 'HH:MI') Hora
from (select distinct E.codEmpleado Codigo, E.nomEmpleado nomProf, E.apellEmpleado apellProf, ES.nomEspacio sede
 from empleado E, empleado_cargo EC, espacio ES
 where E.codEmpleado = EC.codEmpleado and ES.codEspacio= EC.codEspacio and EC.idCargo='2') Prof
 where 'ANDRES' = UPPER(Prof.nomProf) AND 'SUAREZ' =UPPER(Prof.apellProf);

--CONSULTA NOMBRE ESTUDIANTE 
Select Prof.Codigo, Prof.nomProf, Prof.apellProf,Prof.sede, to_char(CURRENT_DATE, 'dd/mm/yyyy') fecha, to_char(CURRENT_DATE, 'HH:MI') Hora
from (select distinct E.codEmpleado Codigo, E.nomEmpleado nomProf, E.apellEmpleado apellProf, ES.nomEspacio sede
from empleado E, empleado_cargo EC, espacio ES
where E.codEmpleado = EC.codEmpleado and ES.codEspacio= EC.codEspacio and EC.idCargo='2') Prof
where 'ANDRES' = UPPER(Prof.nomProf) AND 'SUAREZ' =UPPER(Prof.apellProf);