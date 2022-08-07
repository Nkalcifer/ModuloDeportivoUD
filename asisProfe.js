const express = require('express')
const oracledb = require('oracledb');
const app = express();
const port = 3000;
var password = '1234';

async function consultaDocente(req, res, nombreprofe) {
    try {
        connection = await oracledb.getConnection({
            user: "prueba",
            password: password,
            tns: "localhost:1521/XE"
        });
        var divisiones = nombreprofe.split(" ", 2);
        nombre = divisiones[0];
        apellido = divisiones[1];
        result = await connection.execute(`Select Prof.Codigo, Prof.nomProf, Prof.apellProf,Prof.sede, to_char(CURRENT_DATE, 'dd/mm/yyyy') fecha, to_char(CURRENT_DATE, 'HH:MI') Hora
                                            from (select distinct E.codEmpleado Codigo, E.nomEmpleado nomProf, E.apellEmpleado apellProf, ES.nomEspacio sede
                                                from empleado E, empleado_cargo EC, espacio ES
                                                where E.codEmpleado = EC.codEmpleado and ES.codEspacio= EC.codEspacio and EC.idCargo='2') Prof
                                            where :0 = UPPER(Prof.nomProf) AND :1 =UPPER(Prof.apellProf);`, [nombre, apellido]);
        console.log(result);
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
        if (result.rows.length == 0) {
            //query return zero employees
            return res.send('No se Ha podido Consultar al Docente');
        } else {
            return res.send(result.rows[0]);
        }
    }
}
//get /employee?id=<id employee>
app.get('/asisProfe/:nombreprofe', function (req, res) {
    //get query param ?id
    const nombreprofe = req.params.nombreprofe;
    // id param if it is number
    if (nombreprofe == "") {
        res.send('Query param nombre is not String')
        return
    }
    consultaDocente(req, res, nombreprofe);
})
app.listen(port, () => console.log("nodeOracleRestApi app listening on port %s!", port))
