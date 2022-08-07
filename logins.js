const express = require('express')
const oracledb = require('oracledb');
const app = express();
const port = 3000;
var password = '1234';

async function consultAuxiliaresiD(req, res, id) {
    try {
        connection = await oracledb.getConnection({
            user: "prueba",
            password: password,
            tns: "localhost:1521/XE"
        });
        // run query to get employee with employee_id
        // console.log(id);
        resultAux = await connection.execute(`Select Aux.nomAuxiliar, Aux.sede, to_char(CURRENT_DATE, 'DD/MM/YYYY') fecha, to_char(CURRENT_DATE, 'HH:MI') Hora
                                            from (select distinct E.codEmpleado Codigo, E.nomEmpleado||' '||E.apellEmpleado nomAuxiliar, ES.nomEspacio sede
                                                from empleado E, empleado_cargo EC, espacio ES
                                                where E.codEmpleado = EC.codEmpleado and ES.codEspacio= EC.codEspacio and EC.idCargo='1') Aux
                                            where :id in Aux.Codigo`, [id]);
        resultAdm = await connection.execute(`Select Aux.nomAuxiliar, Aux.sede, to_char(CURRENT_DATE, 'DD/MM/YYYY') fecha, to_char(CURRENT_DATE, 'HH:MI') Hora
                                            from (select distinct E.codEmpleado Codigo, E.nomEmpleado||' '||E.apellEmpleado nomAuxiliar, ES.nomEspacio sede
                                                from empleado E, empleado_cargo EC, espacio ES
                                                where E.codEmpleado = EC.codEmpleado and ES.codEspacio= EC.codEspacio and EC.idCargo='3') Aux
                                            where :id in Aux.Codigo`, [id]);
        // console.log(result)
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
        if (resultAux.rows.length == 0 && resultAdm.rows.length == 0) {
            //query return zero employees
            return res.send('Usted No Tiene Permisos De acceso');
        } else if(resultAux.rows.length > 0 ){
            return res.send(resultAux.rows[0]);
        }else{
            return res.send(resultAdm.rows[0]);
        }
    }
}
//get /employee?id=<id employee>
app.get('/login/:id', function (req, res) {
    //get query param ?id
    const id = req.params.id;
    // id param if it is number
    if (isNaN(id)) {
        res.send('Query param id is not number')
        return
    }
    consultAuxiliaresiD(req, res, id);
})
app.listen(port, () => console.log("nodeOracleRestApi app listening on port %s!", port))
