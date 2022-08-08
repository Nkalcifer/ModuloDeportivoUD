const express = require('express');
const oracledb = require('oracledb');
const cors =require('cors');

const app = express();




var password = '1234';

async function consultEquipo(response, codigoAlumno,codigoEquipo) {

    try {
        connection = await oracledb.getConnection({
            user: "prueba",
            password: password,
            connectString: "localhost:1521/XE"
        });
                
        result= await connection.execute(`SELECT DISTINCT E.CONSEEQUIPO EQUIPO, ES.CODESTU CODIGO, ES.NOMESTU NOMBRE, ES.APELESTU APELLIDO, D.NOMDEPORTE DEPORTE, TO_CHAR(CURRENT_DATE,'DD/MM/YYYY') FECHA, TO_CHAR(CURRENT_DATE, 'HH24:MI') HORA
        FROM MIEMBROEQUIPO ME, EQUIPO E, ESTUDIANTE ES, DEPORTE D, ESPACIO_DEPORTE ED, ESPACIO ESP
        WHERE ME.CONSEEQUIPO = E.CONSEEQUIPO
        AND ME.CODESTU=ES.CODESTU
        AND ME.CODESTU= :0
        AND D.IDDEPORTE=E.IDDEPORTE
        AND ME.CONSEEQUIPO=:1
        AND D.IDDEPORTE=ED.IDDEPORTE
        AND ED.CODESPACIO = ESP.CODESPACIO`, [codigoAlumno,codigoEquipo]);
        
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

        if (result.rows.length == 0) {
            return response.send('El estudiante no pertenece al equipo');
        } else if (result.rows.length != 0) {
            return response.send(result.rows[0]);
        } 
    }
}

//get ingreso 
app.get('/asistencia/profesor/:codAlumno/:conEquipo', function (require, response) {
    //get query param ?id
    const codigoAlumno = require.params.codAlumno;
    const codigoEquipo = require.params.conEquipo;
    // id param if it is number
    if (isNaN(codigoAlumno) && isNaN(codigoEquipo)) { 
        return response.send('Query param id is not string')
    }

    consultEquipo(response, codigoAlumno,codigoEquipo);
})

const port = 3000;
app.listen(port, () => console.log("nodeOracleRestApi app listening on port %s!", port))