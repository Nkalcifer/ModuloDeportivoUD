const express = require('express');
const oracledb = require('oracledb');

const app = express();

const port = 3000;

var password = '1234';

async function consulPasante(response, idPasante) {

    try {
        connection = await oracledb.getConnection({
            user: "prueba",
            password: password,
            connectString: "localhost:1521/XE"
        });
              
        resultPasante = await connection.execute(`SELECT E.CODESTU CODIGO, E.NOMESTU NOMBRE, E.APELESTU APELLIDO, SE.NOMESPACIO SEDE, E.CORREOUDESTU CORREO, D.NOMDIA DIA, P.IDPERIODO PERIODO,  P.IDHORA HORAINI
        FROM ESTUDIANTE E, RESPONSABLE R, DIA D, PROGRAMACION P, ESPACIO ES, ESPACIO SE
        WHERE E.CODESTU=R.CODESTU
        AND E.CODESTU=:0
        AND R.CONSECPROGRA = P.CONSECPROGRA
        AND P.IDDIA = D.IDDIA
        AND P.CODESPACIO=ES.CODESPACIO
        AND ES.ESP_CODESPACIO=SE.CODESPACIO`, [idPasante]);
        
        var codPASANTE = resultPasante.rows[0][0];
        resultPLibres = await connection.execute(`SELECT Pro.CONSECPROGRA CURSO, Esp.nomEspacio ESPACIO, Dep.nomDeporte DEPORTE, Pro.noInscrito "Numero de Estudiantes"
        FROM responsable Res, programacion Pro, actividad Act, espacio Esp, deporte Dep, DIA D
        WHERE Res.CONSECPROGRA=Pro.CONSECPROGRA
        AND Res.CODESTU=:0
        AND Pro.IDACTIVIDAD=Act.IDACTIVIDAD 
        AND Pro.CODESPACIO=Esp.CODESPACIO 
        AND Pro.IDDEPORTE=Dep.IDDEPORTE
        AND D.IDDIA=PRO.IDDIA
        -- AND TO_CHAR(CURRENT_DATE, 'HH24:MI') > TO_CHAR(TO_DATE(IDHORA,'HH24:MI')-(15/1440), 'HH24:MI') 
        -- AND TO_CHAR(CURRENT_DATE, 'HH24:MI') < TO_CHAR(TO_DATE(IDHORA,'HH24:MI')+(15/1440), 'HH24:MI')
        AND CURRENT_DATE>Res.FECHAINI
        AND CURRENT_DATE<Res.FECHAFIN
        AND D.IDDIA = TO_CHAR(CURRENT_DATE+1, 'D')`, [codPASANTE]);
        
        resultElementos = await connection.execute(`SELECT DISTINCT ED.CONSECELEMENTO CODE, TE.DESCTIPOELEMENTO ELEMENTO
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
                        AND E.IDESTADO=ED.IDESTADO`, [codPASANTE]);
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
        if (resultPasante.rows.length == 0) {
            return response.send('El usuario ingresado no es un pasante');
        } else if (resultPasante.rows.length != 0 && resultPLibres.rows.length==0) {
            return response.send('El pasante no tiene pracrtica libre en este momento');
        }else if (resultPasante.rows.length != 0 && resultPLibres.rows.length != 0) {
            result = [resultPasante.rows[0], resultPLibres.rows[0],resultElementos.rows];
            return response.send(result);
        }
    } 
}


//get ingreso 
app.get('/asistencia/pasante/:idEst', function (require, response) {
    //get query param ?id
    const idPasante = require.params.idEst;
    // id param if it is number
    if (isNaN(idPasante) ) {
        return response.send('Query param nombre is not Code')
    }

    consulPasante(response, idPasante);
})

app.listen(port, () => console.log("nodeOracleRestApi app listening on port %s!", port))