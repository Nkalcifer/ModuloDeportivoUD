const express = require('express');
const oracledb = require('oracledb');

const app = express();

const port = 3000;

var password = '1234';

async function consultAuxiliaresd(response, nombreProfesor) {

    try {
        connection = await oracledb.getConnection({
            user: "prueba",
            password: password,
            tns: "localhost:1521/XE"
        });
        let miCadena = nombreProfesor;
        //separacion nombre
        let divisionNombre= miCadena.split(" ", 2);
        let nombre= divisionNombre[0].toUpperCase();
        let apellido= divisionNombre[1].toUpperCase();
        console.log(nombre + apellido);
        // run query to get employee with employee_id
        result = await connection.execute(`Select Prof.Codigo, Prof.nomProf, Prof.apellProf,Prof.sede, to_char(CURRENT_DATE, 'dd/mm/yyyy') fecha, to_char(CURRENT_DATE, 'HH:MI') Hora
                                        from (select distinct E.codEmpleado Codigo, E.nomEmpleado nomProf, E.apellEmpleado apellProf, ES.nomEspacio sede
                                            from empleado E, empleado_cargo EC, espacio ES
                                            where E.codEmpleado = EC.codEmpleado and ES.codEspacio= EC.codEspacio and EC.idCargo='2') Prof
                                        where UPPER(Prof.nomProf)=:0  AND UPPER(Prof.apellProf)=:1`, [nombre, apellido]);
        console.log(result)
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
        if (result.rows.length == 0 ) {
            return response.send('El usuario ingresado no es profesor');
        } else { //verifica que sea profesor
            return response.send(result.rows[0]);
        }
    }
}

//get ingreso 
app.get('/asistencia/profesor/:profe', function (require, response) {
    //get query param ?id
    const nombreProfesor = require.params.profe;
    console.log(typeof(nombreProfesor))
    console.log(nombreProfesor)
    // id param if it is number
    if (typeof(nombreProfesor)!= "string") {
        response.send('Query param nombre is not string')
        return
    }

    consultAuxiliaresd(response, nombreProfesor);
})

app.listen(port, () => console.log("nodeOracleRestApi app listening on port %s!", port))