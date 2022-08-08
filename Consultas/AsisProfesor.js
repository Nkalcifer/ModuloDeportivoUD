const express = require('express');
const oracledb = require('oracledb');
const cors =require('cors');

const app = express();
app.use(cors());

const port = 3000;

var password = '1234';

async function consultAuxiliaresd(response, nombreProfesor) {

    try {
        connection = await oracledb.getConnection({
            user: "prueba",
            password: password,
            connectString: "localhost:1521/XE"
        });
        let miCadena = nombreProfesor;
        //separacion nombre
        let divisionNombre = miCadena.split(" ", 2);
        let nombre = divisionNombre[0].toUpperCase();
        let apellido = divisionNombre[1].toUpperCase();
        console.log(nombre + apellido);
        
        resultProfesor = await connection.execute(`Select Prof.Codigo, Prof.nomProf, Prof.apellProf,Prof.sede, to_char(CURRENT_DATE, 'dd/mm/yyyy') fecha, to_char(CURRENT_DATE, 'HH:MI') Hora
        from (select distinct E.codEmpleado Codigo, E.nomEmpleado nomProf, E.apellEmpleado apellProf, ES.nomEspacio sede
            from empleado E, empleado_cargo EC, espacio ES
            where E.codEmpleado = EC.codEmpleado and ES.codEspacio= EC.codEspacio and EC.idCargo='2') Prof
        where UPPER(Prof.nomProf)=:0  AND UPPER(Prof.apellProf)=:1`, [nombre, apellido]);
        
        var codProf = resultProfesor.rows[0][0];
        resultClase = await connection.execute(`SELECT Pro.CONSECPROGRA CURSO, Esp.nomEspacio ESPACIO, Dep.nomDeporte DEPORTE, Pro.noInscrito "Numero de Estudiantes"
            FROM responsable Res, programacion Pro, actividad Act, espacio Esp, deporte Dep
            WHERE Res.CONSECPROGRA=Pro.CONSECPROGRA 
            AND Pro.IDACTIVIDAD=Act.IDACTIVIDAD 
            AND Pro.CODESPACIO=Esp.CODESPACIO 
            AND Pro.IDDEPORTE=Dep.IDDEPORTE
            AND TO_CHAR(CURRENT_DATE, 'HH24:MI')>Pro.IDHORA 
            AND TO_CHAR(CURRENT_DATE, 'HH24:MI') < Pro.HOR_IDHORA
            AND CURRENT_DATE>Res.FECHAINI 
            AND CURRENT_DATE<Res.FECHAFIN
            AND Res.CODEMPLEADO=:0`, [codProf]);
        
            resultElementos = await connection.execute(`SELECT DISTINCT ED.CONSECELEMENTO CODE, TE.DESCTIPOELEMENTO ELEMENTO
                    FROM (SELECT Pro.CONSECPROGRA idPro, Pro.CODESPACIO codE, Esp.ESP_CODESPACIO SEDE, Dep.IDDEPORTE idDep
                        FROM responsable Res, programacion Pro, actividad Act, espacio Esp, deporte Dep
                        WHERE Res.CONSECPROGRA=Pro.CONSECPROGRA 
                        AND Pro.IDACTIVIDAD=Act.IDACTIVIDAD 
                        AND Pro.CODESPACIO=Esp.CODESPACIO 
                        AND Pro.IDDEPORTE=Dep.IDDEPORTE
                        AND TO_CHAR(CURRENT_DATE, 'HH24:MI')>Pro.IDHORA 
                        AND TO_CHAR(CURRENT_DATE, 'HH24:MI') < Pro.HOR_IDHORA
                        AND CURRENT_DATE>Res.FECHAINI 
                        AND CURRENT_DATE<Res.FECHAFIN
                        AND Res.CODEMPLEADO=:0 ) CURSO, ElementoDeportivo ED, TipoElemento TE, DEPORTE_TIPOELEMENTO DTE, DEPORTE D, ESTADO E
                    WHERE CURSO.SEDE in ED.CODESPACIO 
                    AND ED.IDTIPOELEMENTO=TE.IDTIPOELEMENTO 
                    AND TE.IDTIPOELEMENTO=DTE.IDTIPOELEMENTO 
                    AND DTE.IDDEPORTE=D.IDDEPORTE 
                    AND CURSO.idDep=DTE.IDDEPORTE
                    AND E.IDESTADO=ED.IDESTADO`, [codProf]);
    } catch (err) {
        //send error message
        return res.send(err.message);
    } finally {
        if (connection) {
            try {
                // Always close connections
                await connection.close();
            } catch (err) {
                return console.error(err.message);
            }
        }
        
        //verificacion que no se profesor
        if (resultProfesor.rows.length == 0) {
            return response.send('El usuario ingresado no es profesor');
        } else if (resultProfesor.rows.length != 0 && resultClase.rows.length == 0) {
        //verifica que sea profesor y tenga clase
            return response.send('El profesor no tiene Clases en Este Momento');
        } else if (resultProfesor.rows.length != 0 && resultClase.rows.length != 0) {
            result = [resultProfesor.rows[0], resultClase.rows[0], resultElementos.rows];
            return response.send(result);
        }
    }
}

//get ingreso 
app.get('/asistencia/profesor/:profe', function (require, response) {
    //get query param ?id
    const nombreProfesor = require.params.profe;
    console.log(typeof (nombreProfesor))
    console.log(nombreProfesor)
    // id param if it is number
    if (typeof (nombreProfesor) != "string") {
        return response.send('Query param nombre is not string')
    }

    consultAuxiliaresd(response, nombreProfesor);
})

app.listen(port, () => console.log("nodeOracleRestApi app listening on port %s!", port))