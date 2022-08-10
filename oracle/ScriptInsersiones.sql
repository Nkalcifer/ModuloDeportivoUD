/*==============================================================*/
/* DBMS name:      ORACLE Version 11g                           */
/* Created on:     19/07/2022 02:43:26 p. m.                    */
/* Created by:     Neider Puentes Sanchez                       */
/* Created by:     Diana Valentina Uscategui Tobo               */
/* Usage:          Sports module inserts                        */
/*==============================================================*/
 
--  reseteo Base:
 START .\BaseDeportes.sql;

 -- Inserts in Tables no Fks
INSERT INTO TipoEspacio VALUES ('1', 'Unidad');
INSERT INTO TipoEspacio VALUES ('2', 'Espacio');
INSERT INTO TipoEspacio VALUES ('3', 'Campo');
INSERT INTO TipoEspacio VALUES ('4', 'Pista');
INSERT INTO TipoEspacio VALUES ('5', 'Salon');
INSERT INTO TipoEspacio VALUES ('6', 'Piscina');
INSERT INTO TipoEspacio VALUES ('7', 'Sala Maquinas');
INSERT INTO TipoEspacio VALUES ('8', 'Muro Escalar');
INSERT INTO TipoEspacio VALUES ('9', 'Sede');
SELECT COUNT(IDTIPOESPACIO) FROM TipoEspacio;

INSERT INTO Deporte VALUES ('1', 'Atletismo');
INSERT INTO Deporte VALUES ('2', 'Tenis');
INSERT INTO Deporte VALUES ('3', 'Tenis Mesa');
INSERT INTO Deporte VALUES ('4', 'Natacion');
INSERT INTO Deporte VALUES ('5', 'Voleivol');
INSERT INTO Deporte VALUES ('6', 'Futbol');
INSERT INTO Deporte VALUES ('7', 'Futbol Sala');
INSERT INTO Deporte VALUES ('8', 'Badminton');
INSERT INTO Deporte VALUES ('9', 'Aerobicos');
INSERT INTO Deporte VALUES ('10', 'Boxeo');
INSERT INTO Deporte VALUES ('11', 'Artes Marciales');
INSERT INTO Deporte VALUES ('12', 'Gimnasia Olimpica');
SELECT COUNT(IDDEPORTE) FROM Deporte;

INSERT INTO Estado VALUES ('1', 'Activo');
INSERT INTO Estado VALUES ('2', 'Prestado');
INSERT INTO Estado VALUES ('3', 'Daniado');
INSERT INTO Estado VALUES ('4', 'Perdido');
INSERT INTO Estado VALUES ('5', 'De Baja');
SELECT COUNT(IDESTADO) FROM Estado;

INSERT INTO Periodo VALUES ('20191');
INSERT INTO Periodo VALUES ('20192');
INSERT INTO Periodo VALUES ('20193');
INSERT INTO Periodo VALUES ('20201');
INSERT INTO Periodo VALUES ('20202');
INSERT INTO Periodo VALUES ('20203');
INSERT INTO Periodo VALUES ('20211');
INSERT INTO Periodo VALUES ('20212');
INSERT INTO Periodo VALUES ('20213');
INSERT INTO Periodo VALUES ('20221');
SELECT COUNT(IDPERIODO ) FROM Periodo;

INSERT INTO TipoElemento VALUES ('1', 'Balon Baloncesto');
INSERT INTO TipoElemento VALUES ('2', 'Balon Futbol');
INSERT INTO TipoElemento VALUES ('3', 'Balon Voleibol');
INSERT INTO TipoElemento VALUES ('4', 'Pelota Tenis mesa');
INSERT INTO TipoElemento VALUES ('5', 'Pelota Tenis campo');
INSERT INTO TipoElemento VALUES ('6', 'Colchoneta');
INSERT INTO TipoElemento VALUES ('7', 'Lazo Salto');
INSERT INTO TipoElemento VALUES ('8', 'Guantes Box');
INSERT INTO TipoElemento VALUES ('9', 'Malla Voleibol');
INSERT INTO TipoElemento VALUES ('10', 'Saco Boxeo');
INSERT INTO TipoElemento VALUES ('11', 'Aros hula-hula');
INSERT INTO TipoElemento VALUES ('12', 'Chaleco Boxeo');
INSERT INTO TipoElemento VALUES ('13', 'Malla Pimpon');
SELECT COUNT(IDTIPOESPACIO) FROM TipoEspacio;
-- ROMPIMIENTO DEPORTE_ELEMENTO DEPORTIVO

INSERT INTO DEPORTE_TIPOELEMENTO VALUES ('2', '6');
INSERT INTO DEPORTE_TIPOELEMENTO VALUES ('3', '5');
INSERT INTO DEPORTE_TIPOELEMENTO VALUES ('4', '3');
INSERT INTO DEPORTE_TIPOELEMENTO VALUES ('5', '2');
INSERT INTO DEPORTE_TIPOELEMENTO VALUES ('6', '12');
INSERT INTO DEPORTE_TIPOELEMENTO VALUES ('6', '11');
INSERT INTO DEPORTE_TIPOELEMENTO VALUES ('6', '9');
INSERT INTO DEPORTE_TIPOELEMENTO VALUES ('7', '9');
INSERT INTO DEPORTE_TIPOELEMENTO VALUES ('7', '10');
INSERT INTO DEPORTE_TIPOELEMENTO VALUES ('8', '10');
INSERT INTO DEPORTE_TIPOELEMENTO VALUES ('9', '5');
INSERT INTO DEPORTE_TIPOELEMENTO VALUES ('10', '10');
INSERT INTO DEPORTE_TIPOELEMENTO VALUES ('11', '9');
INSERT INTO DEPORTE_TIPOELEMENTO VALUES ('12', '10');
INSERT INTO DEPORTE_TIPOELEMENTO VALUES ('13', '3');

-- Cursos
INSERT INTO Actividad VALUES ('CU', 'Curso');
INSERT INTO Actividad VALUES ('PR', 'Practica');
INSERT INTO Actividad VALUES ('EN', 'Entrenamiento');
SELECT COUNT(IDACTIVIDAD) FROM Actividad;

-- Horas
INSERT INTO Hora VALUES ('00:00');
INSERT INTO Hora VALUES ('06:00');
INSERT INTO Hora VALUES ('07:00');
INSERT INTO Hora VALUES ('08:00');
INSERT INTO Hora VALUES ('09:00');
INSERT INTO Hora VALUES ('10:00');
INSERT INTO Hora VALUES ('11:00');
INSERT INTO Hora VALUES ('12:00');
INSERT INTO Hora VALUES ('13:00');
INSERT INTO Hora VALUES ('14:00');
INSERT INTO Hora VALUES ('15:00');
INSERT INTO Hora VALUES ('16:00');
INSERT INTO Hora VALUES ('17:00');
INSERT INTO Hora VALUES ('18:00');
INSERT INTO Hora VALUES ('19:00');
INSERT INTO Hora VALUES ('20:00');
INSERT INTO Hora VALUES ('21:00');
INSERT INTO Hora VALUES ('22:00');
INSERT INTO Hora VALUES ('24:00');
SELECT COUNT(IDHORA) FROM Hora;

-- Dias
INSERT INTO Dia VALUES ('1', 'Lunes');
INSERT INTO Dia VALUES ('2', 'Martes');
INSERT INTO Dia VALUES ('3', 'Miercoles');
INSERT INTO Dia VALUES ('4', 'Jueves');
INSERT INTO Dia VALUES ('5', 'Viernes');
INSERT INTO Dia VALUES ('6', 'Sabado');
INSERT INTO Dia VALUES ('7', 'Domingo');
SELECT COUNT(IDDIA) FROM Dia;

-- Marcas
INSERT INTO Marca VALUES ('10', 'Nike');
INSERT INTO Marca VALUES ('20', 'Adidas');
INSERT INTO Marca VALUES ('30', 'Puma');
INSERT INTO Marca VALUES ('40', 'Reebok');
INSERT INTO Marca VALUES ('50', 'Fila');
INSERT INTO Marca VALUES ('60', 'Asics');
INSERT INTO Marca VALUES ('70', 'Kappa');
INSERT INTO Marca VALUES ('80', 'The North Face');
INSERT INTO Marca VALUES ('90', 'Under Armour');
INSERT INTO Marca VALUES ('100', 'Converse');
INSERT INTO Marca VALUES ('110', 'Ti Colombia');
INSERT INTO Marca VALUES ('120', 'Athletic');
SELECT COUNT(IDMARCA) FROM Marca;

-- Roles 
INSERT INTO Rol VALUES ('1', 'Director Deportivo');
INSERT INTO Rol VALUES ('2', 'Docente');
INSERT INTO Rol VALUES ('3', 'Entrenador');
SELECT COUNT(IDROL) FROM Rol;

-- Cargos
INSERT INTO Cargo VALUES ('1', 'Auxiliar');
INSERT INTO Cargo VALUES ('2', 'Docente');
INSERT INTO Cargo VALUES ('3', 'Director Deportivo');
INSERT INTO Cargo VALUES ('4', 'Administrador Deportivo');
INSERT INTO Cargo VALUES ('5', 'Fisioterapeuta');
INSERT INTO Cargo VALUES ('6', 'Entrenador');
SELECT COUNT(IDDIA) FROM Dia;


 -- Inserts in Tables with Fks
-- Incluir 10 espacios
-- 1 Unidad
-- 3 Sedes
-- Por sede un campo
--     una pista
--     una piscina
--     10 salones
--     una sala máquinas
-- Unidad Deportiva

INSERT INTO Espacio (codEspacio, nomEspacio, idTipoEspacio) VALUES (0, 'Deportes UD', 1);
-- Espacios
INSERT INTO Espacio (codEspacio, nomEspacio, idTipoEspacio) VALUES (1, 'Espacio 1', 2);
INSERT INTO Espacio (codEspacio, nomEspacio, idTipoEspacio) VALUES (2, 'Espacio 2', 2);
INSERT INTO Espacio (codEspacio, nomEspacio, idTipoEspacio) VALUES (3, 'Espacio 3', 2);
INSERT INTO Espacio (codEspacio, nomEspacio, idTipoEspacio) VALUES (4, 'Espacio 4', 2);
INSERT INTO Espacio (codEspacio, nomEspacio, idTipoEspacio) VALUES (5, 'Espacio 5', 2);
INSERT INTO Espacio (codEspacio, nomEspacio, idTipoEspacio) VALUES (6, 'Espacio 6', 2);
INSERT INTO Espacio (codEspacio, nomEspacio, idTipoEspacio) VALUES (7, 'Espacio 7', 2);
INSERT INTO Espacio (codEspacio, nomEspacio, idTipoEspacio) VALUES (8, 'Espacio 8', 2);
INSERT INTO Espacio (codEspacio, nomEspacio, idTipoEspacio) VALUES (9, 'Espacio 9', 2);
INSERT INTO Espacio (codEspacio, nomEspacio, idTipoEspacio) VALUES (10, 'Espacio 10', 2);
-- Sedes

INSERT INTO Espacio (codEspacio, nomEspacio, idTipoEspacio) VALUES (11, 'Ingenieria', 9);
INSERT INTO Espacio (codEspacio, nomEspacio, idTipoEspacio) VALUES (12, 'Artes', 9);
INSERT INTO Espacio (codEspacio, nomEspacio, idTipoEspacio) VALUES (13, 'Medio Ambiente', 9);
--Campos por sede
INSERT INTO Espacio (codEspacio, nomEspacio, idTipoEspacio, esp_codEspacio) VALUES (14, 'Campo 1', 3, 11);
INSERT INTO Espacio (codEspacio, nomEspacio, idTipoEspacio, esp_codEspacio) VALUES (15, 'Campo 1', 3, 12);
INSERT INTO Espacio (codEspacio, nomEspacio, idTipoEspacio, esp_codEspacio) VALUES (16, 'Campo 1', 3, 13);
-- Pistas por sede
INSERT INTO Espacio (codEspacio, nomEspacio, idTipoEspacio, esp_codEspacio) VALUES (17, 'Pista 1', 3, 11);
INSERT INTO Espacio (codEspacio, nomEspacio, idTipoEspacio, esp_codEspacio) VALUES (18, 'Pista 1', 3, 12);
INSERT INTO Espacio (codEspacio, nomEspacio, idTipoEspacio, esp_codEspacio) VALUES (19, 'Pista 1', 3, 13);
-- Piscinas por sede
INSERT INTO Espacio (codEspacio, nomEspacio, idTipoEspacio, esp_codEspacio) VALUES (20, 'Piscina 1', 3, 11);
INSERT INTO Espacio (codEspacio, nomEspacio, idTipoEspacio, esp_codEspacio) VALUES (21, 'Piscina 1', 3, 12);
INSERT INTO Espacio (codEspacio, nomEspacio, idTipoEspacio, esp_codEspacio) VALUES (22, 'Piscina 1', 3, 13);
-- Salones por sede
-- Sede 11
INSERT INTO Espacio (codEspacio, nomEspacio, idTipoEspacio, esp_codEspacio) VALUES (23, 'Salon 101', 5, 11);
INSERT INTO Espacio (codEspacio, nomEspacio, idTipoEspacio, esp_codEspacio) VALUES (24, 'Salon 102', 5, 11);
INSERT INTO Espacio (codEspacio, nomEspacio, idTipoEspacio, esp_codEspacio) VALUES (25, 'Salon 103', 5, 11);
INSERT INTO Espacio (codEspacio, nomEspacio, idTipoEspacio, esp_codEspacio) VALUES (26, 'Salon 104', 5, 11);
INSERT INTO Espacio (codEspacio, nomEspacio, idTipoEspacio, esp_codEspacio) VALUES (27, 'Salon 105', 5, 11);
INSERT INTO Espacio (codEspacio, nomEspacio, idTipoEspacio, esp_codEspacio) VALUES (28, 'Salon 106', 5, 11);
INSERT INTO Espacio (codEspacio, nomEspacio, idTipoEspacio, esp_codEspacio) VALUES (29, 'Salon 107', 5, 11);
INSERT INTO Espacio (codEspacio, nomEspacio, idTipoEspacio, esp_codEspacio) VALUES (30, 'Salon 108', 5, 11);
INSERT INTO Espacio (codEspacio, nomEspacio, idTipoEspacio, esp_codEspacio) VALUES (31, 'Salon 109', 5, 11);
INSERT INTO Espacio (codEspacio, nomEspacio, idTipoEspacio, esp_codEspacio) VALUES (32, 'Salon 110', 5, 11);
-- Sede 12
INSERT INTO Espacio (codEspacio, nomEspacio, idTipoEspacio, esp_codEspacio) VALUES (33, 'Salon 101', 5, 12);
INSERT INTO Espacio (codEspacio, nomEspacio, idTipoEspacio, esp_codEspacio) VALUES (34, 'Salon 102', 5, 12);
INSERT INTO Espacio (codEspacio, nomEspacio, idTipoEspacio, esp_codEspacio) VALUES (35, 'Salon 103', 5, 12);
INSERT INTO Espacio (codEspacio, nomEspacio, idTipoEspacio, esp_codEspacio) VALUES (36, 'Salon 104', 5, 12);
INSERT INTO Espacio (codEspacio, nomEspacio, idTipoEspacio, esp_codEspacio) VALUES (37, 'Salon 105', 5, 12);
INSERT INTO Espacio (codEspacio, nomEspacio, idTipoEspacio, esp_codEspacio) VALUES (38, 'Salon 106', 5, 12);
INSERT INTO Espacio (codEspacio, nomEspacio, idTipoEspacio, esp_codEspacio) VALUES (39, 'Salon 107', 5, 12);
INSERT INTO Espacio (codEspacio, nomEspacio, idTipoEspacio, esp_codEspacio) VALUES (40, 'Salon 108', 5, 12);
INSERT INTO Espacio (codEspacio, nomEspacio, idTipoEspacio, esp_codEspacio) VALUES (41, 'Salon 109', 5, 12);
INSERT INTO Espacio (codEspacio, nomEspacio, idTipoEspacio, esp_codEspacio) VALUES (42, 'Salon 110', 5, 12);
-- sede 13
INSERT INTO Espacio (codEspacio, nomEspacio, idTipoEspacio, esp_codEspacio) VALUES (43, 'Salon 101', 5, 13);
INSERT INTO Espacio (codEspacio, nomEspacio, idTipoEspacio, esp_codEspacio) VALUES (44, 'Salon 102', 5, 13);
INSERT INTO Espacio (codEspacio, nomEspacio, idTipoEspacio, esp_codEspacio) VALUES (45, 'Salon 103', 5, 13);
INSERT INTO Espacio (codEspacio, nomEspacio, idTipoEspacio, esp_codEspacio) VALUES (46, 'Salon 104', 5, 13);
INSERT INTO Espacio (codEspacio, nomEspacio, idTipoEspacio, esp_codEspacio) VALUES (47, 'Salon 105', 5, 13);
INSERT INTO Espacio (codEspacio, nomEspacio, idTipoEspacio, esp_codEspacio) VALUES (48, 'Salon 106', 5, 13);
INSERT INTO Espacio (codEspacio, nomEspacio, idTipoEspacio, esp_codEspacio) VALUES (49, 'Salon 107', 5, 13);
INSERT INTO Espacio (codEspacio, nomEspacio, idTipoEspacio, esp_codEspacio) VALUES (50, 'Salon 108', 5, 13);
INSERT INTO Espacio (codEspacio, nomEspacio, idTipoEspacio, esp_codEspacio) VALUES (51, 'Salon 109', 5, 13);
INSERT INTO Espacio (codEspacio, nomEspacio, idTipoEspacio, esp_codEspacio) VALUES (52, 'Salon 110', 5, 13);

--Salas de Maquinas por sede
INSERT INTO Espacio (codEspacio, nomEspacio, idTipoEspacio, esp_codEspacio) VALUES (53, 'Sala 1', 7, 11);
INSERT INTO Espacio (codEspacio, nomEspacio, idTipoEspacio, esp_codEspacio) VALUES (54, 'Sala 1', 7, 12);
INSERT INTO Espacio (codEspacio, nomEspacio, idTipoEspacio, esp_codEspacio) VALUES (55, 'Sala 1', 7, 13);
SELECT COUNT(CODESPACIO) FROM Espacio;
COMMIT;
-- Incluir empleados:
    --  1 Director Deportivo deportivo de 2 sedes
    --  4 docentes
    --  2 auxiliares
    --  3 entrenadores
-- Director Deportivo
INSERT INTO Empleado (codEmpleado, nomEmpleado, apellEmpleado, fechaRegistro, correoUd) VALUES ('307', 'Neider', 'Puentes', CURRENT_DATE, 'npuentess@udistrital.edu.co');
INSERT INTO Empleado_Cargo (consec, codEmpleado, idCargo, codEspacio, fechaCargo) VALUES (1, '307', '3', '0', CURRENT_DATE);
--Docentes
INSERT INTO Empleado (codEmpleado, nomEmpleado, apellEmpleado, fechaRegistro, correoUd) VALUES ('2', 'Andrea', 'Sanchez', CURRENT_DATE, 'asanchezs@udistrital.edu.co');
INSERT INTO Empleado (codEmpleado, nomEmpleado, apellEmpleado, fechaRegistro, correoUd) VALUES ('3', 'Juan', 'Perez', CURRENT_DATE, 'jperezz@udistrital.edu.co');
INSERT INTO Empleado (codEmpleado, nomEmpleado, apellEmpleado, fechaRegistro, correoUd) VALUES ('4', 'Andres', 'Suarez', CURRENT_DATE, 'asuarezm@udistrital.edu.co');
INSERT INTO Empleado (codEmpleado, nomEmpleado, apellEmpleado, fechaRegistro, correoUd) VALUES ('5', 'Felipe', 'Reyes', CURRENT_DATE, 'freyesc@udistrital.edu.co');
INSERT INTO Empleado_Cargo (consec, codEmpleado, idCargo, codEspacio, fechaCargo) VALUES (2, '2', '2', '11', CURRENT_DATE);
INSERT INTO Empleado_Cargo (consec, codEmpleado, idCargo, codEspacio, fechaCargo) VALUES (3, '3', '2', '11', CURRENT_DATE);
INSERT INTO Empleado_Cargo (consec, codEmpleado, idCargo, codEspacio, fechaCargo) VALUES (4, '4', '2', '12', CURRENT_DATE);
INSERT INTO Empleado_Cargo (consec, codEmpleado, idCargo, codEspacio, fechaCargo) VALUES (5, '5', '2', '12', CURRENT_DATE);
--Auxiliares
INSERT INTO Empleado (codEmpleado, nomEmpleado, apellEmpleado, fechaRegistro, correoUd) VALUES ('63', 'Diana', 'Uscategui', CURRENT_DATE, 'duscateguitt@udistrital.edu.co');
INSERT INTO Empleado (codEmpleado, nomEmpleado, apellEmpleado, fechaRegistro, correoUd) VALUES ('777', 'Adriana', 'Hernandez', CURRENT_DATE, 'ahernandezf@udistrital.edu.co');
INSERT INTO Empleado_Cargo (consec, codEmpleado, idCargo, codEspacio, fechaCargo) VALUES (6, '63', '1', '11', CURRENT_DATE);
INSERT INTO Empleado_Cargo (consec, codEmpleado, idCargo, codEspacio, fechaCargo) VALUES (7, '777', '1', '11', CURRENT_DATE);
--Entreandores
INSERT INTO Empleado (codEmpleado, nomEmpleado, apellEmpleado, fechaRegistro, correoUd) VALUES ('8', 'Marcela', 'Rey', CURRENT_DATE, 'mreys@.udistritaledu.co');
INSERT INTO Empleado (codEmpleado, nomEmpleado, apellEmpleado, fechaRegistro, correoUd) VALUES ('9', 'Alejandro', 'Abondano', CURRENT_DATE, 'jperezz@udistrital.edu.co');
INSERT INTO Empleado (codEmpleado, nomEmpleado, apellEmpleado, fechaRegistro, correoUd) VALUES ('10', 'Alexander', 'Carvajal', CURRENT_DATE, 'acarvajalm@udistrital.edu.co');

-- Docente para Pasantes
INSERT INTO Empleado (codEmpleado, nomEmpleado, apellEmpleado, fechaRegistro, correoUd) VALUES ('999', 'LIBRE', 'PASANTE', CURRENT_DATE, 'correo.udistrital.edu.co');
SELECT COUNT(CODEMPLEADO) FROM Empleado;
-- Insersion Equipos
INSERT INTO Equipo VALUES (1, '1','8',CURRENT_DATE);
INSERT INTO Equipo VALUES (3, '2', '9', CURRENT_DATE);
INSERT INTO Equipo VALUES (4, '3', '10', CURRENT_DATE);
INSERT INTO Equipo VALUES (5, '4', '8', CURRENT_DATE);
INSERT INTO Equipo VALUES (6, '5', '9', CURRENT_DATE);
INSERT INTO Equipo VALUES (7, '6', '10', CURRENT_DATE);
INSERT INTO Equipo VALUES (9, '7', '8', CURRENT_DATE);
INSERT INTO Equipo VALUES (10, '8', '9', CURRENT_DATE);
INSERT INTO Equipo VALUES (11, '9', '10', CURRENT_DATE);
INSERT INTO Equipo VALUES (12, '10', '8', CURRENT_DATE);
SELECT COUNT(CONSEEQUIPO) FROM Equipo;


-- Incluir 10 estudiantes de diferentes sedes
INSERT INTO Estudiante (codEstu, codEspacio, nomEstu, apelEstu, fechaRegEstu, correoUdEstu, fechaNacEstu) VALUES (20201010035, 11, 'Catalina', 'Acero', CURRENT_DATE, 'cacerop@udistrital.edu.co', TO_DATE('1991/12/21', 'YYYY/MM/DD'));
INSERT INTO Estudiante (codEstu, codEspacio, nomEstu, apelEstu, fechaRegEstu, correoUdEstu, fechaNacEstu) VALUES (20191010035, 11, 'Andrea', 'Caro', CURRENT_DATE, 'acaroa@udistrital.edu.co', TO_DATE('1996/07/11', 'YYYY/MM/DD'));
INSERT INTO Estudiante (codEstu, codEspacio, nomEstu, apelEstu, fechaRegEstu, correoUdEstu, fechaNacEstu) VALUES (20192010035, 13, 'Andrea', 'Villa', CURRENT_DATE, 'avillac@udistrital.edu.co', TO_DATE('2000/06/14', 'YYYY/MM/DD'));
INSERT INTO Estudiante (codEstu, codEspacio, nomEstu, apelEstu, fechaRegEstu, correoUdEstu, fechaNacEstu) VALUES (20212020012, 12, 'Angela', 'Monroy', CURRENT_DATE, 'amonroyn@udistrital.edu.co', TO_DATE('2002/05/03', 'YYYY/MM/DD'));
INSERT INTO Estudiante (codEstu, codEspacio, nomEstu, apelEstu, fechaRegEstu, correoUdEstu, fechaNacEstu) VALUES (20221020076, 13, 'Camilo', 'Pineros', CURRENT_DATE, 'cpineross@udistrital.edu.co', TO_DATE('2006/04/12', 'YYYY/MM/DD'));
INSERT INTO Estudiante (codEstu, codEspacio, nomEstu, apelEstu, fechaRegEstu, correoUdEstu, fechaNacEstu) VALUES (20211015112, 11, 'Carlos', 'Mahecha', CURRENT_DATE, 'cmahechaj@udistrital.edu.co', TO_DATE('1998/06/29', 'YYYY/MM/DD'));
INSERT INTO Estudiante (codEstu, codEspacio, nomEstu, apelEstu, fechaRegEstu, correoUdEstu, fechaNacEstu) VALUES (20212013231, 12, 'Carol', 'Blanco', CURRENT_DATE, 'cbalncon@udistrital.edu.co', TO_DATE('1999/11/01', 'YYYY/MM/DD'));
INSERT INTO Estudiante (codEstu, codEspacio, nomEstu, apelEstu, fechaRegEstu, correoUdEstu, fechaNacEstu) VALUES (20191034002, 11, 'Cinthya', 'Ruiz', CURRENT_DATE, 'cruizh@udistrital.edu.co', TO_DATE('1996/12/11', 'YYYY/MM/DD'));
INSERT INTO Estudiante (codEstu, codEspacio, nomEstu, apelEstu, fechaRegEstu, correoUdEstu, fechaNacEstu) VALUES (20201010013, 13, 'Felipe', 'Gomez', CURRENT_DATE, 'fgomezg@udistrital.edu.co', TO_DATE('2005/11/17', 'YYYY/MM/DD'));
INSERT INTO Estudiante (codEstu, codEspacio, nomEstu, apelEstu, fechaRegEstu, correoUdEstu, fechaNacEstu) VALUES (20202010056, 12, 'Alberto', 'Castano', CURRENT_DATE, 'acastanoj@udistrital.edu.co', TO_DATE('2003/03/15', 'YYYY/MM/DD'));
INSERT INTO Estudiante (codEstu, codEspacio, nomEstu, apelEstu, fechaRegEstu, correoUdEstu, fechaNacEstu) VALUES (20182020101, 12, 'Juanito', 'Pasante', CURRENT_DATE, 'jpasante@udistrital.edu.co', TO_DATE('1997/03/15', 'YYYY/MM/DD'));
SELECT COUNT(CODESTU) FROM Estudiante;

-- Incluir registros para la programación: 
-- 4registros  de cursos
INSERT INTO Programacion (CONSECPROGRA, IDPERIODO, IDACTIVIDAD, IDDIA, IDHORA/*Hora inicio */, HOR_IDHORA/*Hora fin */, CODESPACIO, IDDEPORTE, CUPO, NOINSCRITO) VALUES (1, '20221', 'CU', '1', '08:00', '10:00', '17', '1', 15, 9);
INSERT INTO Programacion (CONSECPROGRA, IDPERIODO, IDACTIVIDAD, IDDIA, IDHORA/*Hora inicio */, HOR_IDHORA/*Hora fin */, CODESPACIO, IDDEPORTE, CUPO, NOINSCRITO) VALUES (2, '20221', 'CU', '2', '12:00', '14:00', '20', '4', 15, 9);
INSERT INTO Programacion (CONSECPROGRA, IDPERIODO, IDACTIVIDAD, IDDIA, IDHORA/*Hora inicio */, HOR_IDHORA/*Hora fin */, CODESPACIO, IDDEPORTE, CUPO, NOINSCRITO) VALUES (3, '20221', 'CU', '3', '10:00', '12:00', '21', '4', 15, 9);
INSERT INTO Programacion (CONSECPROGRA, IDPERIODO, IDACTIVIDAD, IDDIA, IDHORA/*Hora inicio */, HOR_IDHORA/*Hora fin */, CODESPACIO, IDDEPORTE, CUPO, NOINSCRITO) VALUES (4, '20221', 'CU', '4', '08:00', '10:00', '15', '6', 15, 9);

-- 4 registros de equipos entrenamiento
INSERT INTO Programacion (CONSECPROGRA, IDPERIODO, IDACTIVIDAD, IDDIA, IDHORA/*Hora inicio */, HOR_IDHORA/*Hora fin */, CODESPACIO, IDDEPORTE, CUPO, NOINSCRITO) VALUES (5, '20221', 'EN', '2', '14:00', '15:00', '22', '4', 15, 9);
INSERT INTO Programacion (CONSECPROGRA, IDPERIODO, IDACTIVIDAD, IDDIA, IDHORA/*Hora inicio */, HOR_IDHORA/*Hora fin */, CODESPACIO, IDDEPORTE, CUPO, NOINSCRITO) VALUES (6, '20221', 'EN', '3', '10:00', '11:00', '20', '4', 15, 9);
INSERT INTO Programacion (CONSECPROGRA, IDPERIODO, IDACTIVIDAD, IDDIA, IDHORA/*Hora inicio */, HOR_IDHORA/*Hora fin */, CODESPACIO, IDDEPORTE, CUPO, NOINSCRITO) VALUES (7, '20221', 'EN', '4', '14:00', '16:00', '7', '8', 15, 9);
INSERT INTO Programacion (CONSECPROGRA, IDPERIODO, IDACTIVIDAD, IDDIA, IDHORA/*Hora inicio */, HOR_IDHORA/*Hora fin */, CODESPACIO, IDDEPORTE, CUPO, NOINSCRITO) VALUES (8, '20221', 'EN', '1', '12:00', '14:00', '8', '9', 15, 9);
-- 4 registros practica libre
INSERT INTO Programacion (CONSECPROGRA, IDPERIODO, IDACTIVIDAD, IDDIA, IDHORA/*Hora inicio */, HOR_IDHORA/*Hora fin */, CODESPACIO, IDDEPORTE, CUPO, NOINSCRITO) VALUES (9, '20221', 'PR', '5', '08:00', '10:00', '9', '11', 15, 9);
INSERT INTO Programacion (CONSECPROGRA, IDPERIODO, IDACTIVIDAD, IDDIA, IDHORA/*Hora inicio */, HOR_IDHORA/*Hora fin */, CODESPACIO, IDDEPORTE, CUPO, NOINSCRITO) VALUES (10, '20221', 'PR', '3', '10:00', '12:00', '10', '9', 15, 9);
INSERT INTO Programacion (CONSECPROGRA, IDPERIODO, IDACTIVIDAD, IDDIA, IDHORA/*Hora inicio */, HOR_IDHORA/*Hora fin */, CODESPACIO, IDDEPORTE, CUPO, NOINSCRITO) VALUES (11, '20221', 'PR', '2', '15:00', '17:00', '5', '1', 15, 9);
INSERT INTO Programacion (CONSECPROGRA, IDPERIODO, IDACTIVIDAD, IDDIA, IDHORA/*Hora inicio */, HOR_IDHORA/*Hora fin */, CODESPACIO, IDDEPORTE, CUPO, NOINSCRITO) VALUES (12, '20221', 'PR', '1', '12:00', '13:00', '21', '6', 15, 9);
-- Curso Nuevo
INSERT INTO Programacion (CONSECPROGRA, IDPERIODO, IDACTIVIDAD, IDDIA, IDHORA/*Hora inicio */, HOR_IDHORA/*Hora fin */, CODESPACIO, IDDEPORTE, CUPO, NOINSCRITO) VALUES (13, '20221', 'CU', '1', '08:00', '22:00', '23', '10', 15, 9);
INSERT INTO Programacion (CONSECPROGRA, IDPERIODO, IDACTIVIDAD, IDDIA, IDHORA/*Hora inicio */, HOR_IDHORA/*Hora fin */, CODESPACIO, IDDEPORTE, CUPO, NOINSCRITO) VALUES (14, '20221', 'PR', '1', '00:00', '24:00', '21', '4', 15, 9);

SELECT COUNT(CONSECPROGRA) FROM Programacion;
-- Incluir 10 registros en la tabla espacio-deporte
INSERT INTO Espacio_Deporte (codEspacio, idDeporte) VALUES ('20', '4');
INSERT INTO Espacio_Deporte (codEspacio, idDeporte) VALUES ('21', '4');
INSERT INTO Espacio_Deporte (codEspacio, idDeporte) VALUES ('22', '4');
INSERT INTO Espacio_Deporte (codEspacio, idDeporte) VALUES ('17', '1');
INSERT INTO Espacio_Deporte (codEspacio, idDeporte) VALUES ('18', '1');
INSERT INTO Espacio_Deporte (codEspacio, idDeporte) VALUES ('14', '6');
INSERT INTO Espacio_Deporte (codEspacio, idDeporte) VALUES ('15', '6');
INSERT INTO Espacio_Deporte (codEspacio, idDeporte) VALUES ('53', '9');
INSERT INTO Espacio_Deporte (codEspacio, idDeporte) VALUES ('54', '9');
INSERT INTO Espacio_Deporte (codEspacio, idDeporte) VALUES ('1', '5');
INSERT INTO Espacio_Deporte (codEspacio, idDeporte) VALUES ('23', '10');
SELECT COUNT(IDDEPORTE) FROM Espacio_Deporte;


-- Incluir 10 registros en la tabla ElemenDeportivo con estado activo y prestado para las 2 sedes (Para elprestado se incluyen en la tabla pestramo)
INSERT INTO ElementoDeportivo (CONSECELEMENTO, IDESTADO, IDTIPOELEMENTO, IDMARCA, CODESPACIO, FECHAREGISTRO, CANTIDAD) VALUES (1, '1', '1', '10', '11', CURRENT_DATE, 10);
INSERT INTO ElementoDeportivo (CONSECELEMENTO, IDESTADO, IDTIPOELEMENTO, IDMARCA, CODESPACIO, FECHAREGISTRO, CANTIDAD) VALUES (2, '1', '2', '20', '11', CURRENT_DATE, 10);
INSERT INTO ElementoDeportivo (CONSECELEMENTO, IDESTADO, IDTIPOELEMENTO, IDMARCA, CODESPACIO, FECHAREGISTRO, CANTIDAD) VALUES (3, '1', '3', '20', '11', CURRENT_DATE, 10);
INSERT INTO ElementoDeportivo (CONSECELEMENTO, IDESTADO, IDTIPOELEMENTO, IDMARCA, CODESPACIO, FECHAREGISTRO, CANTIDAD) VALUES (4, '1', '5', '30', '11', CURRENT_DATE, 10);
INSERT INTO ElementoDeportivo (CONSECELEMENTO, IDESTADO, IDTIPOELEMENTO, IDMARCA, CODESPACIO, FECHAREGISTRO, CANTIDAD) VALUES (5, '1', '6', '70', '11', CURRENT_DATE, 10);
INSERT INTO ElementoDeportivo (CONSECELEMENTO, IDESTADO, IDTIPOELEMENTO, IDMARCA, CODESPACIO, FECHAREGISTRO, CANTIDAD) VALUES (6, '1', '8', '100', '11', CURRENT_DATE, 10);
INSERT INTO ElementoDeportivo (CONSECELEMENTO, IDESTADO, IDTIPOELEMENTO, IDMARCA, CODESPACIO, FECHAREGISTRO, CANTIDAD) VALUES (7, '1', '9', '120', '11', CURRENT_DATE, 10);
INSERT INTO ElementoDeportivo (CONSECELEMENTO, IDESTADO, IDTIPOELEMENTO, IDMARCA, CODESPACIO, FECHAREGISTRO, CANTIDAD) VALUES (8, '1', '10', '10', '11', CURRENT_DATE, 10);
INSERT INTO ElementoDeportivo (CONSECELEMENTO, IDESTADO, IDTIPOELEMENTO, IDMARCA, CODESPACIO, FECHAREGISTRO, CANTIDAD) VALUES (9, '1', '12', '50', '11', CURRENT_DATE, 10);
INSERT INTO ElementoDeportivo (CONSECELEMENTO, IDESTADO, IDTIPOELEMENTO, IDMARCA, CODESPACIO, FECHAREGISTRO, CANTIDAD) VALUES (10, '1', '13', '60', '11', CURRENT_DATE, 10);

-- sede 12
INSERT INTO ElementoDeportivo (CONSECELEMENTO, IDESTADO, IDTIPOELEMENTO, IDMARCA, CODESPACIO, FECHAREGISTRO, CANTIDAD) VALUES (11, '1', '1', '10', '12', CURRENT_DATE, 10);
INSERT INTO ElementoDeportivo (CONSECELEMENTO, IDESTADO, IDTIPOELEMENTO, IDMARCA, CODESPACIO, FECHAREGISTRO, CANTIDAD) VALUES (12, '1', '2', '20', '12', CURRENT_DATE, 10);
INSERT INTO ElementoDeportivo (CONSECELEMENTO, IDESTADO, IDTIPOELEMENTO, IDMARCA, CODESPACIO, FECHAREGISTRO, CANTIDAD) VALUES (13, '1', '3', '20', '12', CURRENT_DATE, 10);
INSERT INTO ElementoDeportivo (CONSECELEMENTO, IDESTADO, IDTIPOELEMENTO, IDMARCA, CODESPACIO, FECHAREGISTRO, CANTIDAD) VALUES (14, '1', '5', '30', '12', CURRENT_DATE, 10);
INSERT INTO ElementoDeportivo (CONSECELEMENTO, IDESTADO, IDTIPOELEMENTO, IDMARCA, CODESPACIO, FECHAREGISTRO, CANTIDAD) VALUES (15, '1', '6', '70', '12', CURRENT_DATE, 10);
INSERT INTO ElementoDeportivo (CONSECELEMENTO, IDESTADO, IDTIPOELEMENTO, IDMARCA, CODESPACIO, FECHAREGISTRO, CANTIDAD) VALUES (16, '1', '8', '100', '12', CURRENT_DATE, 10);
INSERT INTO ElementoDeportivo (CONSECELEMENTO, IDESTADO, IDTIPOELEMENTO, IDMARCA, CODESPACIO, FECHAREGISTRO, CANTIDAD) VALUES (17, '1', '9', '120', '12', CURRENT_DATE, 10);
INSERT INTO ElementoDeportivo (CONSECELEMENTO, IDESTADO, IDTIPOELEMENTO, IDMARCA, CODESPACIO, FECHAREGISTRO, CANTIDAD) VALUES (18, '1', '10', '10', '12', CURRENT_DATE, 10);
INSERT INTO ElementoDeportivo (CONSECELEMENTO, IDESTADO, IDTIPOELEMENTO, IDMARCA, CODESPACIO, FECHAREGISTRO, CANTIDAD) VALUES (19, '1', '12', '50', '12', CURRENT_DATE, 10);
INSERT INTO ElementoDeportivo (CONSECELEMENTO, IDESTADO, IDTIPOELEMENTO, IDMARCA, CODESPACIO, FECHAREGISTRO, CANTIDAD) VALUES (20, '1', '13', '60', '12', CURRENT_DATE, 10); 
SELECT COUNT(CONSECELEMENTO) FROM ElementoDeportivo;
COMMIT;


-- Incluir los demás registros necesarios para que funcione el código 

-- Probar

-- Llenado de Miebros Equipo
INSERT INTO MIEMBROEQUIPO (ITEMMIEMBRO, CONSEEQUIPO, CODESTU) VALUES (1, '1', '20191010035');
INSERT INTO MIEMBROEQUIPO (ITEMMIEMBRO, CONSEEQUIPO, CODESTU) VALUES (2, '1', '20191034002');
INSERT INTO MIEMBROEQUIPO (ITEMMIEMBRO, CONSEEQUIPO, CODESTU) VALUES (3, '1', '20192010035');

INSERT INTO MIEMBROEQUIPO (ITEMMIEMBRO, CONSEEQUIPO, CODESTU) VALUES (4, '10', '20201010013');
INSERT INTO MIEMBROEQUIPO (ITEMMIEMBRO, CONSEEQUIPO, CODESTU) VALUES (5, '10', '20201010035');
INSERT INTO MIEMBROEQUIPO (ITEMMIEMBRO, CONSEEQUIPO, CODESTU) VALUES (6, '10', '20202010056');

INSERT INTO MIEMBROEQUIPO (ITEMMIEMBRO, CONSEEQUIPO, CODESTU) VALUES (7, '3', '20211015112');
INSERT INTO MIEMBROEQUIPO (ITEMMIEMBRO, CONSEEQUIPO, CODESTU) VALUES (8, '3', '20212013231');
INSERT INTO MIEMBROEQUIPO (ITEMMIEMBRO, CONSEEQUIPO, CODESTU) VALUES (9, '3', '20221020076');
-- llenar responsable
INSERT INTO responsable (CONSECRES, CONSECPROGRA, CODEMPLEADO, FECHAINI, FECHAFIN) VALUES (1, 1, '2', '24/05/2022', '24/11/2022');
INSERT INTO responsable (CONSECRES, CONSECPROGRA, CODEMPLEADO, FECHAINI, FECHAFIN) VALUES (2, 2, '3', '24/05/2022', '24/11/2022');
INSERT INTO responsable (CONSECRES, CONSECPROGRA, CODEMPLEADO, FECHAINI, FECHAFIN) VALUES (3, 3, '4', '24/05/2022', '24/11/2022');
INSERT INTO responsable (CONSECRES, CONSECPROGRA, CODEMPLEADO, FECHAINI, FECHAFIN) VALUES (4, 4, '5', '24/05/2022', '24/11/2022');
INSERT INTO responsable (CONSECRES, CONSECPROGRA, CODEMPLEADO, FECHAINI, FECHAFIN) VALUES (5, 5, '8', '24/05/2022', '24/11/2022');
INSERT INTO responsable (CONSECRES, CONSECPROGRA, CODEMPLEADO, FECHAINI, FECHAFIN) VALUES (6, 13, '2', '24/05/2022', '24/11/2022');
INSERT INTO responsable (CONSECRES, CONSECPROGRA, CODESTU, CODEMPLEADO, FECHAINI, FECHAFIN) VALUES (7, 14, '20182020101','999', '24/05/2022', '24/11/2022');
COMMIT;
-- Select Aux.nomAuxiliar, Aux.sede, CURRENT_DATE fecha
-- from (select distinct E.codEmpleado Codigo, E.nomEmpleado||' '||E.apellEmpleado nomAuxiliar, ES.nomEspacio sede
--     from empleado E, empleado_cargo EC, espacio ES
--     where E.codEmpleado = EC.codEmpleado and ES.codEspacio= EC.codEspacio and EC.idCargo='3') Aux
-- where '1' in Aux.Codigo;

-- select distinct E.codEmpleado Codigo, E.nomEmpleado||' '||E.apellEmpleado nomAuxiliar, ES.nomEspacio sede
--     from empleado E, empleado_cargo EC, espacio ES
--     where E.codEmpleado = EC.codEmpleado and ES.codEspacio= EC.codEspacio and EC.idCargo='2';
    

-- -- -- 3.2.1.1
Select Prof.Codigo, Prof.nomProf, Prof.apellProf,Prof.sede, to_char(CURRENT_DATE, 'dd/mm/yyyy') fecha, to_char(CURRENT_DATE, 'HH:MI') Hora
                                            from (select distinct E.codEmpleado Codigo, E.nomEmpleado nomProf, E.apellEmpleado apellProf, ES.nomEspacio sede
                                                from empleado E, empleado_cargo EC, espacio ES
                                                where E.codEmpleado = EC.codEmpleado and ES.codEspacio= EC.codEspacio and EC.idCargo='2') Prof
                                            where UPPER(Prof.nomProf) = UPPER('Andrea') AND UPPER(Prof.apellProf) =UPPER('Sanchez');

-- -- -- --- 3.2.1.2
SELECT Pro.CONSECPROGRA CURSO, Esp.nomEspacio ESPACIO, Dep.nomDeporte DEPORTE, Pro.noInscrito "Numero de Estudiantes"
FROM responsable Res, programacion Pro, actividad Act, espacio Esp, deporte Dep
WHERE Res.CONSECPROGRA=Pro.CONSECPROGRA 
AND Pro.IDACTIVIDAD=Act.IDACTIVIDAD 
AND Pro.CODESPACIO=Esp.CODESPACIO 
AND Pro.IDDEPORTE=Dep.IDDEPORTE
AND TO_CHAR(CURRENT_DATE, 'HH24:MI')>Pro.IDHORA 
AND TO_CHAR(CURRENT_DATE, 'HH24:MI') < Pro.HOR_IDHORA
AND CURRENT_DATE>Res.FECHAINI 
AND CURRENT_DATE<Res.FECHAFIN
AND Res.CODEMPLEADO='2';
-- Elementos Activos para prestamos
SELECT DISTINCT ED.CODESPACIO SEDE, E.DESCESTADO ESTADO, ED.CONSECELEMENTO codEl, TE.DESCTIPOELEMENTO ELEMENTO, ED.CANTIDAD
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
    AND Res.CODEMPLEADO='2') CURSO, ElementoDeportivo ED, TipoElemento TE, DEPORTE_TIPOELEMENTO DTE, DEPORTE D, ESTADO E
WHERE CURSO.SEDE in ED.CODESPACIO 
AND ED.IDTIPOELEMENTO=TE.IDTIPOELEMENTO 
AND TE.IDTIPOELEMENTO=DTE.IDTIPOELEMENTO 
AND DTE.IDDEPORTE=D.IDDEPORTE 
AND CURSO.idDep=DTE.IDDEPORTE
AND E.IDESTADO=ED.IDESTADO
AND E.DESCESTADO='Activo';
-- Elementos prestado
SELECT DISTINCT ED.CODESPACIO SEDE, E.DESCESTADO ESTADO, ED.CONSECELEMENTO codEl, TE.DESCTIPOELEMENTO ELEMENTO, ED.CANTIDAD
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
    AND Res.CODEMPLEADO='2') CURSO, ElementoDeportivo ED, TipoElemento TE, DEPORTE_TIPOELEMENTO DTE, DEPORTE D, ESTADO E
WHERE CURSO.SEDE in ED.CODESPACIO 
AND ED.IDTIPOELEMENTO=TE.IDTIPOELEMENTO 
AND TE.IDTIPOELEMENTO=DTE.IDTIPOELEMENTO 
AND DTE.IDDEPORTE=D.IDDEPORTE 
AND CURSO.idDep=DTE.IDDEPORTE
AND E.IDESTADO=ED.IDESTADO
AND E.DESCESTADO='Prestado';

-- -- 3.2.1.4
-- --Registro en la Asistencia
-- -- INSERT INTO ASISTIRRESPONSABLE (CONSECPROGRA, CONSECRES, CONSECASISRES, FECHAASISRES, HORAASISRES) VALUES (1, 1, 1, CURRENT_DATE, TO_CHAR(CURRENT_DATE, 'HH24:MM'));
-- -- INSERT INTO PRESTAMO (CONSECPRESTAMO, CONSECPROGRA, CONSECRES, CONSECASISRES, CONSECELEMENTO) VALUES (1, 1, 1, 1, 1);
-- -- --Actualizacion de Prestamo
-- -- UPDATE ELEMENTODEPORTIVO SET IDESTADO = '2' WHERE CONSECELEMENTO = 1;
-- -- 3.2.2.1.
-- SELECT E.CODESTU CODIGO, E.NOMESTU NOMBRE, E.APELESTU APELLIDO, SE.NOMESPACIO SEDE, E.CORREOUDESTU CORREO, D.NOMDIA DIA, P.IDPERIODO PERIODO,  P.IDHORA HORAINI
-- FROM ESTUDIANTE E, RESPONSABLE R, DIA D, PROGRAMACION P, ESPACIO ES, ESPACIO SE
-- WHERE E.CODESTU=R.CODESTU
-- AND E.CODESTU='20182020101'
-- AND R.CONSECPROGRA = P.CONSECPROGRA
-- AND P.IDDIA = D.IDDIA
-- AND P.CODESPACIO=ES.CODESPACIO
-- AND ES.ESP_CODESPACIO=SE.CODESPACIO;

SELECT Pro.CONSECPROGRA CURSO, Esp.nomEspacio ESPACIO, Dep.nomDeporte DEPORTE, Pro.noInscrito "Numero de Estudiantes"
FROM responsable Res, programacion Pro, actividad Act, espacio Esp, deporte Dep, DIA D
WHERE Res.CONSECPROGRA=Pro.CONSECPROGRA
AND Res.CODESTU='20182020101'
AND Pro.IDACTIVIDAD=Act.IDACTIVIDAD 
AND Pro.CODESPACIO=Esp.CODESPACIO 
AND Pro.IDDEPORTE=Dep.IDDEPORTE
AND D.IDDIA=PRO.IDDIA
-- AND TO_CHAR(CURRENT_DATE, 'HH24:MI') > TO_CHAR(TO_DATE(IDHORA,'HH24:MI')-(15/1440), 'HH24:MI') 
-- AND TO_CHAR(CURRENT_DATE, 'HH24:MI') < TO_CHAR(TO_DATE(IDHORA,'HH24:MI')+(15/1440), 'HH24:MI')
AND CURRENT_DATE>Res.FECHAINI
AND CURRENT_DATE<Res.FECHAFIN
AND D.IDDIA = TO_CHAR(CURRENT_DATE, 'D')/*eSTO DEPENDE DE LA MAQUINA*/;

-- SELECT DISTINCT ED.CODESPACIO SEDE, E.DESCESTADO ESTADO, ED.CONSECELEMENTO codEl, TE.DESCTIPOELEMENTO ELEMENTO, ED.CANTIDAD
-- FROM (SELECT Pro.CONSECPROGRA idPro, Pro.CODESPACIO codE, Esp.ESP_CODESPACIO SEDE, Dep.IDDEPORTE idDep
--     FROM responsable Res, programacion Pro, actividad Act, espacio Esp, deporte Dep
--     WHERE Res.CONSECPROGRA=Pro.CONSECPROGRA 
--     AND Pro.IDACTIVIDAD=Act.IDACTIVIDAD 
--     AND Pro.CODESPACIO=Esp.CODESPACIO 
--     AND Pro.IDDEPORTE=Dep.IDDEPORTE
--     -- AND TO_CHAR(CURRENT_DATE, 'HH24:MI') > TO_CHAR(TO_DATE(IDHORA,'HH24:MI')-(15/1440), 'HH24:MI') 
--     -- AND TO_CHAR(CURRENT_DATE, 'HH24:MI') < TO_CHAR(TO_DATE(IDHORA,'HH24:MI')+(15/1440), 'HH24:MI')
--     AND CURRENT_DATE>Res.FECHAINI 
--     AND CURRENT_DATE<Res.FECHAFIN
--     AND Res.CODESTU='20182020101') CURSO, ElementoDeportivo ED, TipoElemento TE, DEPORTE_TIPOELEMENTO DTE, DEPORTE D, ESTADO E
-- WHERE CURSO.SEDE in ED.CODESPACIO 
-- AND ED.IDTIPOELEMENTO=TE.IDTIPOELEMENTO 
-- AND TE.IDTIPOELEMENTO=DTE.IDTIPOELEMENTO 
-- AND DTE.IDDEPORTE=D.IDDEPORTE 
-- AND CURSO.idDep=DTE.IDDEPORTE
-- AND E.IDESTADO=ED.IDESTADO;
-- -- 3.2.3.1.
-- SELECT DISTINCT E.CONSEEQUIPO EQUIPO, ES.CODESTU CODIGO, ES.NOMESTU NOMBRE, ES.APELESTU APELLIDO, D.NOMDEPORTE DEPORTE, CURRENT_DATE FECHA, TO_CHAR(CURRENT_DATE, 'HH24:MI') HORA
-- FROM MIEMBROEQUIPO ME, EQUIPO E, ESTUDIANTE ES, DEPORTE D, ESPACIO_DEPORTE ED, ESPACIO ESP
-- WHERE ME.CONSEEQUIPO = E.CONSEEQUIPO
-- AND ME.CODESTU=ES.CODESTU
-- AND ME.CODESTU= '20191010035'
-- AND D.IDDEPORTE=E.IDDEPORTE
-- AND ME.CONSEEQUIPO='1'
-- AND D.IDDEPORTE=ED.IDDEPORTE
-- AND ED.CODESPACIO = ESP.CODESPACIO;

-- SELECT *
-- FROM HORA
-- WHERE TO_CHAR(CURRENT_DATE, 'HH24:MI') > TO_CHAR(TO_DATE(IDHORA,'HH24:MI')-(15/1440), 'HH24:MI') AND TO_CHAR(CURRENT_DATE, 'HH24:MI') < TO_CHAR(TO_DATE(IDHORA,'HH24:MI')+(15/1440), 'HH24:MI');

-- select to_char(TO_DATE(CURRENT_DATE,'dd/mm/yyyy'), 'Day') Dia
-- from dual;

-- select to_char(CURRENT_DATE, 'DAY', 'NLS_DATE_LANGUAGE=SPANISH')
from dual

SELECT CONSEEQUIPO EQUIPO FROM EQUIPO; 
Select Aux.Cargo, Aux.nomAuxiliar, Aux.sede, to_char(CURRENT_DATE, 'DD/MM/YYYY') fecha, to_char(CURRENT_DATE, 'HH:MI') Hora
    from (select distinct EC.idCargo Cargo, E.codEmpleado Codigo, E.nomEmpleado||' '||E.apellEmpleado nomAuxiliar, ES.nomEspacio sede
        from empleado E, empleado_cargo EC, espacio ES
        where E.codEmpleado = EC.codEmpleado and ES.codEspacio= EC.codEspacio and EC.idCargo='1') Aux
    where '63' in Aux.Codigo



    -- inserts 

    INSERT INTO ASISTIRRESPONSABLE 
    (CONSECASISRES, CONSECPROGRA, CONSECRES, FECHAASISRES, HORAASISRES) 
    VALUES (2, '13', '6', '09/08/2022', CURRENT_DATE);

    SELECT CONSECRES cres
    FROM RESPONSABLE 
    WHERE CODEMPLEADO= '2' 
    AND CONSECPROGRA= '13';

    SELECT CONSECPROGRA, CONSECRES
    FROM ASISTIRRESPONSABLE
    WHERE CONSECASISRES= :0;

    UPDATE ELEMENTODEPORTIVO SET IDESTADO = '1' WHERE CONSECELEMENTO = '6';
    UPDATE ELEMENTODEPORTIVO SET IDESTADO = '1' WHERE CONSECELEMENTO = '9';
delete from prestamo where CONSECPROGRA='13';
SELECT TE.DESCTIPOELEMENTO ELEMENTO, ES.DESCESTADO ESTADO
FROM ELEMENTODEPORTIVO ED, ESTADO ES, TIPOELEMENTO TE
WHERE ED.IDESTADO = ES.IDESTADO
AND ED.IDTIPOELEMENTO = TE.IDTIPOELEMENTO
AND ES.IDESTADO = '2';