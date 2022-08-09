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

const getasisDocente = async (req, res) => {
    try {
        const { nombreprofe } = req.params;
        var divisiones = nombreprofe.split(" ", 2);
        var nombre = divisiones[0];
        var apellido = divisiones[1];
        const connection = await getConnection();
        const resultProfesor = await connection.execute(`Select Prof.Codigo, Prof.nomProf, Prof.apellProf,Prof.sede, to_char(CURRENT_DATE, 'dd/mm/yyyy') fecha, to_char(CURRENT_DATE, 'HH:MI') Hora
                                            from (select distinct E.codEmpleado Codigo, E.nomEmpleado nomProf, E.apellEmpleado apellProf, ES.nomEspacio sede
                                                from empleado E, empleado_cargo EC, espacio ES
                                                where E.codEmpleado = EC.codEmpleado and ES.codEspacio= EC.codEspacio and EC.idCargo='2') Prof
                                            where UPPER(Prof.nomProf) = UPPER( :0) AND UPPER(Prof.apellProf) =UPPER( :1)`, [nombre, apellido]);

        var codProf = resultProfesor.rows[0][0];
        const resultClase = await connection.execute(`SELECT Pro.CONSECPROGRA CURSO, Esp.nomEspacio ESPACIO, Dep.nomDeporte DEPORTE, Pro.noInscrito "Numero de Estudiantes"
                                                    FROM responsable Res, programacion Pro, actividad Act, espacio Esp, deporte Dep
                                                    WHERE Res.CONSECPROGRA=Pro.CONSECPROGRA 
                                                    AND Pro.IDACTIVIDAD=Act.IDACTIVIDAD 
                                                    AND Pro.CODESPACIO=Esp.CODESPACIO 
                                                    AND Pro.IDDEPORTE=Dep.IDDEPORTE
                                                    AND TO_CHAR(CURRENT_DATE, 'HH24:MI')>Pro.IDHORA 
                                                    AND TO_CHAR(CURRENT_DATE, 'HH24:MI') < Pro.HOR_IDHORA
                                                    AND CURRENT_DATE>Res.FECHAINI 
                                                    AND CURRENT_DATE<Res.FECHAFIN
                                                    AND Res.CODEMPLEADO=:0`, [codProf]);

        const resultElementosDisponibles = await connection.execute(`SELECT DISTINCT ED.CONSECELEMENTO CODE, E.DESCESTADO ESTADO, TE.DESCTIPOELEMENTO ELEMENTO
                                                        FROM (SELECT Pro.CONSECPROGRA idPro, Pro.CODESPACIO codE, Esp.ESP_CODESPACIO SEDE, Dep.IDDEPORTE idDep
                                                            FROM responsable Res, programacion Pro, actividad Act, espacio Esp, deporte Dep
                                                            WHERE Res.CONSECPROGRA=Pro.CONSECPROGRA 
                                                            AND Pro.IDACTIVIDAD=Act.IDACTIVIDAD 
                                                            AND Pro.CODESPACIO=Esp.CODESPACIO 
                                                            AND Pro.IDDEPORTE=Dep.IDDEPORTE
                                                            AND TO_CHAR(CURRENT_DATE, 'HH24:MI')>Pro.IDHORA 
                                                            AND TO_CHAR(CURRENT_DATE, 'HH24:MI') < Pro.HOR_IDHORA
                                                            AND CURRENT_DATE>Res.FECHAINI 
                                                            AND CURRENT_DATE<Res.FECHAFIN
                                                            AND Res.CODEMPLEADO=:0 ) CURSO, ElementoDeportivo ED, TipoElemento TE, DEPORTE_TIPOELEMENTO DTE, DEPORTE D, ESTADO E
                                                        WHERE CURSO.SEDE in ED.CODESPACIO 
                                                        AND ED.IDTIPOELEMENTO=TE.IDTIPOELEMENTO 
                                                        AND TE.IDTIPOELEMENTO=DTE.IDTIPOELEMENTO 
                                                        AND DTE.IDDEPORTE=D.IDDEPORTE 
                                                        AND CURSO.idDep=DTE.IDDEPORTE
                                                        AND E.IDESTADO=ED.IDESTADO
                                                        AND E.DESCESTADO='Activo'`, [codProf]);
        const resultElementosPrestados = await connection.execute(`SELECT DISTINCT ED.CONSECELEMENTO CODE, E.DESCESTADO ESTADO,  TE.DESCTIPOELEMENTO ELEMENTO
                                                        FROM (SELECT Pro.CONSECPROGRA idPro, Pro.CODESPACIO codE, Esp.ESP_CODESPACIO SEDE, Dep.IDDEPORTE idDep
                                                            FROM responsable Res, programacion Pro, actividad Act, espacio Esp, deporte Dep
                                                            WHERE Res.CONSECPROGRA=Pro.CONSECPROGRA 
                                                            AND Pro.IDACTIVIDAD=Act.IDACTIVIDAD 
                                                            AND Pro.CODESPACIO=Esp.CODESPACIO 
                                                            AND Pro.IDDEPORTE=Dep.IDDEPORTE
                                                            AND TO_CHAR(CURRENT_DATE, 'HH24:MI')>Pro.IDHORA 
                                                            AND TO_CHAR(CURRENT_DATE, 'HH24:MI') < Pro.HOR_IDHORA
                                                            AND CURRENT_DATE>Res.FECHAINI 
                                                            AND CURRENT_DATE<Res.FECHAFIN) CURSO, ElementoDeportivo ED, TipoElemento TE, DEPORTE_TIPOELEMENTO DTE, DEPORTE D, ESTADO E
                                                        WHERE CURSO.SEDE in ED.CODESPACIO 
                                                        AND ED.IDTIPOELEMENTO=TE.IDTIPOELEMENTO 
                                                        AND TE.IDTIPOELEMENTO=DTE.IDTIPOELEMENTO 
                                                        AND DTE.IDDEPORTE=D.IDDEPORTE 
                                                        AND CURSO.idDep=DTE.IDDEPORTE
                                                        AND E.IDESTADO=ED.IDESTADO
                                                        AND E.DESCESTADO='Prestado'`);

        // console.log(resultProfesor, resultClase, resultElementosDisponibles, resultElementosPrestados);
        if (resultProfesor.rows.length == 0) {
            res.send('El usuario ingresado no es profesor');
        } else if (resultProfesor.rows.length != 0 && resultClase.rows.length == 0) {
            //verifica que sea profesor y tenga clase
            res.send([resultProfesor.rows[0], ['El profesor no tiene Clases en Este Momento']]);
        } else if (resultProfesor.rows.length != 0 && resultClase.rows.length != 0) {
            const result = [resultProfesor.rows[0], resultClase.rows[0], resultElementosDisponibles.rows, resultElementosPrestados.rows];
            res.send(result);
        }
    } catch (error) {
        res.status(500);
        res.send(error.message);
    }
};

const getasisEquipo = async (req, res) => {
    try {
        const { codigo, equipo } = req.params;
        const connection = await getConnection();
        const restulMEquipo = await connection.execute(`SELECT DISTINCT E.CONSEEQUIPO EQUIPO, ES.CODESTU CODIGO, ES.NOMESTU NOMBRE, ES.APELESTU APELLIDO, D.NOMDEPORTE DEPORTE, TO_CHAR(CURRENT_DATE, 'DD/MM/YYYY') FECHA, TO_CHAR(CURRENT_DATE, 'HH24:MI') HORA
                                                FROM MIEMBROEQUIPO ME, EQUIPO E, ESTUDIANTE ES, DEPORTE D, ESPACIO_DEPORTE ED, ESPACIO ESP
                                                WHERE ME.CONSEEQUIPO = E.CONSEEQUIPO
                                                AND ME.CODESTU=ES.CODESTU
                                                AND ME.CODESTU= :0
                                                AND D.IDDEPORTE=E.IDDEPORTE
                                                AND ME.CONSEEQUIPO= :1
                                                AND D.IDDEPORTE=ED.IDDEPORTE
                                                AND ED.CODESPACIO = ESP.CODESPACIO`, [codigo, equipo]);
        if (restulMEquipo.rows.length == 0) {
            res.send('user no Team or is not registered');
        } else if (restulMEquipo.rows.length != 0) {
            res.send(restulMEquipo.rows[0]);
        }
    } catch (error) {
        res.status(500);
        res.send(error.message);
    }
};

const getasisPasante = async (req, res) => {
    try {
        const { codigo } = req.params;
        const connection = await getConnection();
        const resultPasante = await connection.execute(`SELECT E.CODESTU CODIGO, E.NOMESTU NOMBRE, E.APELESTU APELLIDO, SE.NOMESPACIO SEDE, E.CORREOUDESTU CORREO, D.NOMDIA DIA, P.IDPERIODO PERIODO,  P.IDHORA HORAINI
                                                    FROM ESTUDIANTE E, RESPONSABLE R, DIA D, PROGRAMACION P, ESPACIO ES, ESPACIO SE
                                                    WHERE E.CODESTU=R.CODESTU
                                                    AND E.CODESTU=:0
                                                    AND R.CONSECPROGRA = P.CONSECPROGRA
                                                    AND P.IDDIA = D.IDDIA
                                                    AND P.CODESPACIO=ES.CODESPACIO
                                                    AND ES.ESP_CODESPACIO=SE.CODESPACIO`, [codigo]);

        const resultPlibres = await connection.execute(`SELECT Pro.CONSECPROGRA CURSO, Esp.nomEspacio ESPACIO, Dep.nomDeporte DEPORTE, Pro.noInscrito "Numero de Estudiantes"
                                                        FROM responsable Res, programacion Pro, actividad Act, espacio Esp, deporte Dep, DIA D
                                                        WHERE Res.CONSECPROGRA=Pro.CONSECPROGRA
                                                        AND Res.CODESTU = :0
                                                        AND Pro.IDACTIVIDAD=Act.IDACTIVIDAD 
                                                        AND Pro.CODESPACIO=Esp.CODESPACIO 
                                                        AND Pro.IDDEPORTE=Dep.IDDEPORTE
                                                        AND D.IDDIA=PRO.IDDIA
                                                        -- AND TO_CHAR(CURRENT_DATE, 'HH24:MI') > TO_CHAR(TO_DATE(IDHORA,'HH24:MI')-(15/1440), 'HH24:MI') 
                                                        -- AND TO_CHAR(CURRENT_DATE, 'HH24:MI') < TO_CHAR(TO_DATE(IDHORA,'HH24:MI')+(15/1440), 'HH24:MI')
                                                        AND CURRENT_DATE>Res.FECHAINI
                                                        AND CURRENT_DATE<Res.FECHAFIN
                                                        AND D.IDDIA = TO_CHAR(CURRENT_DATE, 'D')/*eSTO DEPENDE DE LA MAQUINA*/`, [codigo]);
        const resultElementos = await connection.execute(`SELECT DISTINCT ED.CODESPACIO SEDE, E.DESCESTADO ESTADO, ED.CONSECELEMENTO codEl, TE.DESCTIPOELEMENTO ELEMENTO, ED.CANTIDAD
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
                                                    AND Res.CODESTU= :0) CURSO, ElementoDeportivo ED, TipoElemento TE, DEPORTE_TIPOELEMENTO DTE, DEPORTE D, ESTADO E
                                                WHERE CURSO.SEDE in ED.CODESPACIO 
                                                AND ED.IDTIPOELEMENTO=TE.IDTIPOELEMENTO 
                                                AND TE.IDTIPOELEMENTO=DTE.IDTIPOELEMENTO 
                                                AND DTE.IDDEPORTE=D.IDDEPORTE 
                                                AND CURSO.idDep=DTE.IDDEPORTE
                                                AND E.IDESTADO=ED.IDESTADO`, [codigo]);
        if (resultPasante.rows.length == 0) {
            res.send('User isn`t intern');
        } else if (resultPasante.rows.length != 0 && resultPlibres.rows.length == 0) {
            res.send('Itern has not PL ');
        } else if (resultPasante.rows.length != 0 && resultPlibres.rows.length != 0) {
            const result = [resultPasante.rows[0], resultPlibres.rows[0], resultElementos.rows];
            return response.send(result);
        }
    } catch (error) {
        res.status(500);
        res.send(error.message);
    }
};

const getEquipos = async (req, res) => {
    try {
        const connection = await getConnection();
        const result = await connection.execute("SELECT CONSEEQUIPO EQUIPO FROM EQUIPO");
        if (result.rows.length == 0) {
            res.send('There´re not teams');
        } else if (result.rows.length != 0) {
            res.send(result.rows);
        }
    } catch (error) {
        res.status(500);
        res.send(error.message);
    }
};

const postasisProfe = async (req, res) => {
    try {
        const connection = await getConnection();
        res.send("Conexión Exitosa");
    } catch (error) {
        res.status(500);
        res.send(error.message);
    }
};
export const methods = {
    getPrueba,
    getRegisterorAdmin,
    getRegorAdm,
    getasisDocente,
    getasisEquipo,
    getasisPasante,
    getEquipos
};