const express = require('express')
const oracledb = require('oracledb');
const app = express();

var password = '1234';

async function selectAllEmployees(req, res) {
    try {
        connection = await oracledb.getConnection({
            user: "prueba",
            password: password,
            connectString: "localhost:1521/XE"
        });
        console.log('connected to database');
        // run query to get all employees
        result = await connection.execute(`SELECT * FROM estudiante`);
    } catch (err) {
        //send error message
        return res.send(err.message);
    } finally {
        if (connection) {
            try {
                // Always close connections
                await connection.close();
                console.log('close connection success');
            } catch (err) {
                console.error(err.message);
            }
        }
        if (result.rows.length == 0) {
            //query return zero employees
            return res.send('query send no rows');
        } else {
            //send all employees
            return res.send(result.rows);
        }
    }
}

//get /employess
app.get('/estudiantes', function (req, res)  {
    selectAllEmployees(req, res);
})

const port = 3001;
app.listen(port, () => console.log("nodeOracleRestApi app listening on port %s!", port))