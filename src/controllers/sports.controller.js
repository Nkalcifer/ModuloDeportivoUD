import { getConnection } from "./../database/database";

const getAuxiliar = async (req, res) => {
    try {
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
        if (resultAux.rows.length == 0 && resultAdm.rows.length == 0) {
            res.sen('Usuario Sin Permisos de Acceso');
        } else if (resultAux.rows.length > 0) {
            res.json(resultAux.rows[0]);
        } else {
            res.json(resultAdm.rows[0]);
        }
    } catch (error) {
        res.status(500);
        res.send(error.message);
    }
};

export const methods = {
    getAuxiliar
};