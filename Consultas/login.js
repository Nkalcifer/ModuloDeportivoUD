const express = require('express');
const oracledb = require('oracledb');

const app = express();

const port = 3000;

var password = '1234';

async function consultAuxiliaresd(response, id) {

    try {
        connection = await oracledb.getConnection({
            user: "prueba",
            password: password,
            connectString: "localhost:1521/XE"
        });
        // run query to get employee with employee_id
        resultAux = await connection.execute(`Select Aux.nomAuxiliar, Aux.sede, to_char(CURRENT_DATE, 'dd/mm/yyyy') fecha, to_char(CURRENT_DATE, 'HH:MI') Hora
        from (select distinct E.codEmpleado Codigo, E.nomEmpleado||' '||E.apellEmpleado nomAuxiliar, ES.nomEspacio sede
        from empleado E, empleado_cargo EC, espacio ES
        where E.codEmpleado = EC.codEmpleado and ES.codEspacio= EC.codEspacio and EC.idCargo='1') Aux
        where :id in Aux.Codigo`, [id]);

        resultAdmin = await connection.execute(`Select Aux.nomAuxiliar, Aux.sede, to_char(CURRENT_DATE, 'dd/mm/yyyy') fecha, to_char(CURRENT_DATE, 'HH:MI') Hora
        from (select distinct E.codEmpleado Codigo, E.nomEmpleado||' '||E.apellEmpleado nomAuxiliar, ES.nomEspacio sede
        from empleado E, empleado_cargo EC, espacio ES
        where E.codEmpleado = EC.codEmpleado and ES.codEspacio= EC.codEspacio and EC.idCargo='3') Aux
        where :id in Aux.Codigo`, [id]);
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
        //verificacion que no se admin ni auxiliar
        if (resultAux.rows.length == 0 && resultAdmin.rows.length == 0) {
            return response.send('Usted no tiene permisos para ingresar no es Auxiliar ni Administrador');
        } else if (resultAux.rows.length > 0) { //verifica que sea auxiliar
            return response.send(resultAux.rows[0]);
        } else if (resultAdmin.rows.length > 0) {//verifica que sea admin
            return response.send(resultAdmin.rows[0]);
        }
    }
}

//get ingreso 
app.get('/login/:id', function (require, response) {
    //get query param ?id
    const id = require.params.id;
    // id param if it is number
    if (isNaN(id)) {
        response.send('Query param id is not number')
        return
    }
    consultAuxiliaresd(response, id);
})

app.listen(port, () => console.log("nodeOracleRestApi app listening on port %s!", port))