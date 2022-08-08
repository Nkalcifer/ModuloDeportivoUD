const express = require('express');
const oracledb = require('oracledb');

const app = express();

const port = 3000;

var password = '1234';

async function consultMiembroEquipo(response, codigo, equipo) {

    try {
        connection = await oracledb.getConnection({
            user: "prueba",
            password: password,
            tns: "localhost:1521/XE"
        });

        restulMEquipo = await connection.execute(`SELECT DISTINCT E.CONSEEQUIPO EQUIPO, ES.CODESTU CODIGO, ES.NOMESTU NOMBRE, ES.APELESTU APELLIDO, D.NOMDEPORTE DEPORTE, TO_CHAR(CURRENT_DATE, 'DD/MM/YYYY') FECHA, TO_CHAR(CURRENT_DATE, 'HH24:MI') HORA
                                                FROM MIEMBROEQUIPO ME, EQUIPO E, ESTUDIANTE ES, DEPORTE D, ESPACIO_DEPORTE ED, ESPACIO ESP
                                                WHERE ME.CONSEEQUIPO = E.CONSEEQUIPO
                                                AND ME.CODESTU=ES.CODESTU
                                                AND ME.CODESTU= :0
                                                AND D.IDDEPORTE=E.IDDEPORTE
                                                AND ME.CONSEEQUIPO= :1
                                                AND D.IDDEPORTE=ED.IDDEPORTE
                                                AND ED.CODESPACIO = ESP.CODESPACIO`, [codigo, equipo]);
        console.log(restulMEquipo);
        
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
        if (restulMEquipo.rows.length == 0) {
            return response.send('El estudiante No esta inscrito En Equipos');
        } else if (restulMEquipo.rows.length !=0) {
            result = [restulMEquipo.rows[0]];
            return response.send(result);
        }
    }
}

//get ingreso 
app.get('/asistencia/equipo/:cod/:equ', function (require, response) {
    //get query param ?id
    const codigo = require.params.cod;
    const equipo = require.params.equ;
    // console.log(codigo)
    // console.log(equipo)
    // id param if it is number
    if (isNaN(codigo)) {
        response.send('Query param Codigo is Not Code')
        return
    }
    if (isNaN(equipo)) {
        response.send('Query param Equipo is Not Code')
        return
    }

    consultMiembroEquipo(response, codigo, equipo);
})

app.listen(port, () => console.log("nodeOracleRestApi app listening on port %s!", port))