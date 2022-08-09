import { getConnection } from "./../database/database";

// Test Conection BD ORACLE
const getPrueba = async (req, res) => {
    try {
        const connection = await getConnection();
        res.send("Conexión Exitosa");
    } catch (error) {
        res.status(500);
        res.send(error.message);
    }
};

//Body POST
const getRegisterorAdmin = async (req, res) => {
    try {
        const { id } = req.body;
        // console.log(id);
        const connection = await getConnection();
        const resultAux = await connection.execute(`Select Aux.Cargo, Aux.nomAuxiliar, Aux.sede, to_char(CURRENT_DATE, 'DD/MM/YYYY') fecha, to_char(CURRENT_DATE, 'HH:MI') Hora
                                            from (select distinct EC.idCargo Cargo, E.codEmpleado Codigo, E.nomEmpleado||' '||E.apellEmpleado nomAuxiliar, ES.nomEspacio sede
                                                from empleado E, empleado_cargo EC, espacio ES
                                                where E.codEmpleado = EC.codEmpleado and ES.codEspacio= EC.codEspacio and EC.idCargo='1') Aux
                                            where :id in Aux.Codigo`, [id]);
        const resultAdm = await connection.execute(`Select Aux.Cargo, Aux.nomAuxiliar, Aux.sede, to_char(CURRENT_DATE, 'DD/MM/YYYY') fecha, to_char(CURRENT_DATE, 'HH:MI') Hora
                                            from (select distinct EC.idCargo Cargo, E.codEmpleado Codigo, E.nomEmpleado||' '||E.apellEmpleado nomAuxiliar, ES.nomEspacio sede
                                                from empleado E, empleado_cargo EC, espacio ES
                                                where E.codEmpleado = EC.codEmpleado and ES.codEspacio= EC.codEspacio and EC.idCargo='3') Aux
                                            where :id in Aux.Codigo`, [id]);
        // console.log(resultAux, resultAdm);
        if (resultAux.rows.length == 0 && resultAdm.rows.length == 0) {
            //query return zero employees
            return res.send('User not allowed');
        } else if (resultAux.rows.length > 0) {
            res.send(resultAux.rows);
        } else {
            res.send(resultAdm.rows);
        }
    } catch (error) {
        res.status(500);
        res.send(error.message);
    }
};
//Params GET
const getRegorAdm = async (req, res) => {
    try {
        const { id } = req.params;
        // console.log(id);
        const connection = await getConnection();
        const resultAux = await connection.execute(`Select Aux.Cargo, Aux.nomAuxiliar, Aux.sede, to_char(CURRENT_DATE, 'DD/MM/YYYY') fecha, to_char(CURRENT_DATE, 'HH:MI') Hora
                                            from (select distinct EC.idCargo Cargo, E.codEmpleado Codigo, E.nomEmpleado||' '||E.apellEmpleado nomAuxiliar, ES.nomEspacio sede
                                                from empleado E, empleado_cargo EC, espacio ES
                                                where E.codEmpleado = EC.codEmpleado and ES.codEspacio= EC.codEspacio and EC.idCargo='1') Aux
                                            where :id in Aux.Codigo`, [id]);
        const resultAdm = await connection.execute(`Select Aux.Cargo, Aux.nomAuxiliar, Aux.sede, to_char(CURRENT_DATE, 'DD/MM/YYYY') fecha, to_char(CURRENT_DATE, 'HH:MI') Hora
                                            from (select distinct EC.idCargo Cargo, E.codEmpleado Codigo, E.nomEmpleado||' '||E.apellEmpleado nomAuxiliar, ES.nomEspacio sede
                                                from empleado E, empleado_cargo EC, espacio ES
                                                where E.codEmpleado = EC.codEmpleado and ES.codEspacio= EC.codEspacio and EC.idCargo='3') Aux
                                            where :id in Aux.Codigo`, [id]);
        // console.log(resultAux, resultAdm);
        if (resultAux.rows.length == 0 && resultAdm.rows.length == 0) {
            //query return zero employees
            return res.send('User not allowed');
        } else if (resultAux.rows.length > 0) {
            res.send(resultAux.rows);
        } else {
            res.send(resultAdm.rows);
        }
    } catch (error) {
        res.status(500);
        res.send(error.message);
    }
};

export const methods = {
    getPrueba,
    getRegisterorAdmin,
    getRegorAdm
};