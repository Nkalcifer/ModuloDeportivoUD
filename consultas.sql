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
 from estudiante E, empleado_cargo EC, espacio ES
 where E.codEmpleado = EC.codEmpleado and ES.codEspacio= EC.codEspacio and EC.idCargo='2') Prof
 where 'ANDRES' = UPPER(Prof.nomProf) AND 'SUAREZ' =UPPER(Prof.apellProf);

--CONSULTA NOMBRE ESTUDIANTE 
Select Prof.Codigo, Prof.nomProf, Prof.apellProf,Prof.sede, to_char(CURRENT_DATE, 'dd/mm/yyyy') fecha, to_char(CURRENT_DATE, 'HH:MI') Hora
from (select distinct E.codEmpleado Codigo, E.nomEmpleado nomProf, E.apellEmpleado apellProf, ES.nomEspacio sede
from empleado E, empleado_cargo EC, espacio ES
where E.codEmpleado = EC.codEmpleado and ES.codEspacio= EC.codEspacio and EC.idCargo='2') Prof
where 'ANDRES' = UPPER(Prof.nomProf) AND 'SUAREZ' =UPPER(Prof.apellProf);

SELECT E.CODESTU CODIGO, E.NOMESTU NOMBRE, E.APELESTU APELLIDO, E.CODESPACIO SEDE, TO_CHAR(CURRENT_DATE, 'HH24:MM') HORA, CURRENT_DATE FECHA
FROM ESTUDIANTE E, RESPONSABLE R
WHERE E.CODESTU=R.CODESTU 
AND E.CODESTU='20182020101';


SELECT E.CODESTU CODIGO, E.NOMESTU NOMBRE, E.APELESTU APELLIDO, SE.NOMESPACIO SEDE, E.CORREOUDESTU CORREO, D.NOMDIA DIA, P.IDPERIODO PERIODO,  P.IDHORA HORAINI
FROM ESTUDIANTE E, RESPONSABLE R, DIA D, PROGRAMACION P, ESPACIO ES, ESPACIO SE
WHERE E.CODESTU=R.CODESTU
AND E.CODESTU='20182020101'
AND R.CONSECPROGRA = P.CONSECPROGRA
AND P.IDDIA = D.IDDIA
AND P.CODESPACIO=ES.CODESPACIO
AND ES.ESP_CODESPACIO=SE.CODESPACIO;


SELECT Pro.CONSECPROGRA CURSO, Pro.noInscrito "Numero de Estudiantes", Pro.IDDIA dia, to_char(TO_DATE(CURRENT_DATE,'dd/mm/yyyy'), 'D') "dia actual"
FROM responsable Res, programacion Pro, actividad Act, espacio Esp, deporte Dep
WHERE Res.CONSECPROGRA=Pro.CONSECPROGRA 
AND Pro.IDACTIVIDAD=Act.IDACTIVIDAD 
AND Pro.CODESPACIO=Esp.CODESPACIO 
AND Pro.IDDEPORTE=Dep.IDDEPORTE
-- AND TO_CHAR(CURRENT_DATE, 'HH24:MI') > TO_CHAR(TO_DATE(IDHORA,'HH24:MI')-(15/1440), 'HH24:MI') 
-- AND TO_CHAR(CURRENT_DATE, 'HH24:MI') < TO_CHAR(TO_DATE(IDHORA,'HH24:MI')+(15/1440), 'HH24:MI')
AND CURRENT_DATE>Res.FECHAINI
AND CURRENT_DATE<Res.FECHAFIN
AND to_char(TO_DATE(CURRENT_DATE,'dd/mm/yyyy'), 'D')=Pro.IDDIA;

select to_char('06/08/2022', 'D', 'NLS_DATE_LANGUAGE=SPANISH')
from dual;


SELECT Pro.CONSECPROGRA CURSO, Esp.nomEspacio ESPACIO, Dep.nomDeporte DEPORTE, Pro.noInscrito "Numero de Estudiantes"
FROM responsable Res, programacion Pro, actividad Act, espacio Esp, deporte Dep, DIA D
WHERE Res.CONSECPROGRA=Pro.CONSECPROGRA
AND Res.CODESTU='20182020101'
AND Pro.IDACTIVIDAD=Act.IDACTIVIDAD 
AND Pro.CODESPACIO=Esp.CODESPACIO 
AND Pro.IDDEPORTE=Dep.IDDEPORTE
AND D.IDDIA=PRO.IDDIA
-- AND TO_CHAR(CURRENT_DATE, 'HH24:MI') > TO_CHAR(TO_DATE(IDHORA,'HH24:MI')-(15/1440), 'HH24:MI') 
-- AND TO_CHAR(CURRENT_DATE, 'HH24:MI') < TO_CHAR(TO_DATE(IDHORA,'HH24:MI')+(15/1440), 'HH24:MI')
AND CURRENT_DATE>Res.FECHAINI
AND CURRENT_DATE<Res.FECHAFIN
AND D.IDDIA = TO_CHAR(CURRENT_DATE+1, 'D');


SELECT DISTINCT ED.CONSECELEMENTO CODE, TE.DESCTIPOELEMENTO ELEMENTO
                    FROM (SELECT Pro.CONSECPROGRA idPro, Pro.CODESPACIO codE, Esp.ESP_CODESPACIO SEDE, Dep.IDDEPORTE idDep
                    FROM responsable Res, programacion Pro, actividad Act, espacio Esp, deporte Dep
                    WHERE Res.CONSECPROGRA=Pro.CONSECPROGRA 
                    AND Pro.IDACTIVIDAD=Act.IDACTIVIDAD 
                    AND Pro.CODESPACIO=Esp.CODESPACIO 
                    AND Pro.IDDEPORTE=Dep.IDDEPORTE
                    -- AND TO_CHAR(CURRENT_DATE, 'HH24:MI') > TO_CHAR(TO_DATE(IDHORA,'HH24:MI')-(15/1440), 'HH24:MI') 
                    -- AND TO_CHAR(CURRENT_DATE, 'HH24:MI') < TO_CHAR(TO_DATE(IDHORA,'HH24:MI')+(15/1440), 'HH24:MI')
                    AND CURRENT_DATE>Res.FECHAINI 
                    AND CURRENT_DATE<Res.FECHAFIN
                    AND Res.CODESTU=:0 ) CURSO, ElementoDeportivo ED, TipoElemento TE, DEPORTE_TIPOELEMENTO DTE, DEPORTE D, ESTADO E
                    WHERE CURSO.SEDE in ED.CODESPACIO 
                    AND ED.IDTIPOELEMENTO=TE.IDTIPOELEMENTO 
                    AND TE.IDTIPOELEMENTO=DTE.IDTIPOELEMENTO 
                    AND DTE.IDDEPORTE=D.IDDEPORTE 
                    AND CURSO.idDep=DTE.IDDEPORTE
                    AND E.IDESTADO=ED.IDESTADO

