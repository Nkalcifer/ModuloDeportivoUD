/*==============================================================*/
/* DBMS name:      ORACLE Version 11g                           */
/* Created on:     4/08/2022 12:58:22 p. m.                     */
/*==============================================================*/


alter table ASISMIEMBROEQUIPO
   drop constraint FK_ASISMIEM_ASISTENTE_MIEMBROE;

alter table ASISMIEMBROEQUIPO
   drop constraint FK_ASISMIEM_PROGRAMAC_PROGRAMA;

alter table ASISTIRRESPONSABLE
   drop constraint FK_ASISTIRR_RESPONSAB_RESPONSA;

alter table DEPORTE_TIPOELEMENTO
   drop constraint FK_DEPORTE__DEPORTE_T_TIPOELEM;

alter table DEPORTE_TIPOELEMENTO
   drop constraint FK_DEPORTE__DEPORTE_T_DEPORTE;

alter table ELEMENTODEPORTIVO
   drop constraint FK_ELEMENTO_ESPACIOE_ESPACIO;

alter table ELEMENTODEPORTIVO
   drop constraint FK_ELEMENTO_ESTADOELE_ESTADO;

alter table ELEMENTODEPORTIVO
   drop constraint FK_ELEMENTO_MARCA_MARCA;

alter table ELEMENTODEPORTIVO
   drop constraint FK_ELEMENTO_TIPODEPOR_TIPOELEM;

alter table EMPLEADO_CARGO
   drop constraint FK_EMPLEADO_CARGO_CARGO;

alter table EMPLEADO_CARGO
   drop constraint FK_EMPLEADO_EMPLEADO_EMPLEADO;

alter table EMPLEADO_CARGO
   drop constraint FK_EMPLEADO_ESPACIO_ESPACIO;

alter table EQUIPO
   drop constraint FK_EQUIPO_DEPORTEE_DEPORTE;

alter table EQUIPO
   drop constraint FK_EQUIPO_ENTRENADO_EMPLEADO;

alter table ESPACIO
   drop constraint FK_ESPACIO_SEDE_ESPACIO;

alter table ESPACIO
   drop constraint FK_ESPACIO_TIPOESPAC_TIPOESPA;

alter table ESPACIO_DEPORTE
   drop constraint FK_ESPACIO__ESPACIO_D_DEPORTE;

alter table ESPACIO_DEPORTE
   drop constraint FK_ESPACIO__ESPACIO_D_ESPACIO;

alter table ESTUDIANTE
   drop constraint FK_ESTUDIAN_PERTENECE_ESPACIO;

alter table INSCRITOPRACLIBRE
   drop constraint FK_INSCRITO_EMPLEADOS_EMPLEADO;

alter table INSCRITOPRACLIBRE
   drop constraint FK_INSCRITO_ESTUDIANT_ESTUDIAN;

alter table INSCRITOPRACLIBRE
   drop constraint FK_INSCRITO_PRROGRAMA_PROGRAMA;

alter table MIEMBROEQUIPO
   drop constraint FK_MIEMBROE_EQUIPO_EQUIPO;

alter table MIEMBROEQUIPO
   drop constraint FK_MIEMBROE_ESTUDIANT_ESTUDIAN;

alter table PRESTAMO
   drop constraint FK_PRESTAMO_ASISTENCI_ASISTIRR;

alter table PRESTAMO
   drop constraint FK_PRESTAMO_ELEMENTO_ELEMENTO;

alter table PROGRAMACION
   drop constraint FK_PROGRAMA_ACTIVIDAD_ACTIVIDA;

alter table PROGRAMACION
   drop constraint FK_PROGRAMA_DEPORTEP_DEPORTE;

alter table PROGRAMACION
   drop constraint FK_PROGRAMA_DIA_DIA;

alter table PROGRAMACION
   drop constraint FK_PROGRAMA_ESPACIOP_ESPACIO;

alter table PROGRAMACION
   drop constraint FK_PROGRAMA_HORAFIN_HORA;

alter table PROGRAMACION
   drop constraint FK_PROGRAMA_HORAINICI_HORA;

alter table PROGRAMACION
   drop constraint FK_PROGRAMA_PERIODO_PERIODO;

alter table RESPONSABLE
   drop constraint FK_RESPONSA_EMPLEADOR_EMPLEADO;

alter table RESPONSABLE
   drop constraint FK_RESPONSA_PROGRAMAC_PROGRAMA;

alter table RESPONSABLE
   drop constraint FK_RESPONSA_RELATIONS_ESTUDIAN;

alter table RESPONSABLE
   drop constraint FK_RESPONSA_ROL_ROL;

drop table ACTIVIDAD cascade constraints;

drop index ASISTENTE_FK;

drop index PROGRAMACIONA_FK;

drop table ASISMIEMBROEQUIPO cascade constraints;

drop index RESPONSABLE_FK;

drop table ASISTIRRESPONSABLE cascade constraints;

drop table CARGO cascade constraints;

drop table DEPORTE cascade constraints;

drop index DEPORTE_TIPOELEMENTO_FK;

drop index DEPORTE_TIPOELEMENTO2_FK;

drop table DEPORTE_TIPOELEMENTO cascade constraints;

drop table DIA cascade constraints;

drop index ESPACIOE_FK;

drop index MARCA_FK;

drop index TIPODEPORTIVO_FK;

drop index ESTADOELEMENTO_FK;

drop table ELEMENTODEPORTIVO cascade constraints;

drop table EMPLEADO cascade constraints;

drop index ESPACIO_FK;

drop index CARGO_FK;

drop index EMPLEADO_FK;

drop table EMPLEADO_CARGO cascade constraints;

drop index ENTRENADOR_FK;

drop index DEPORTEE_FK;

drop table EQUIPO cascade constraints;

drop index TIPOESPACIO_FK;

drop index SEDE_FK;

drop table ESPACIO cascade constraints;

drop index ESPACIO_DEPORTE_FK;

drop index ESPACIO_DEPORTE2_FK;

drop table ESPACIO_DEPORTE cascade constraints;

drop table ESTADO cascade constraints;

drop index PERTENECE_FK;

drop table ESTUDIANTE cascade constraints;

drop table HORA cascade constraints;

drop index EMPLEADOS_FK;

drop index PRROGRAMACION_FK;

drop index ESTUDIANTES_FK;

drop table INSCRITOPRACLIBRE cascade constraints;

drop table MARCA cascade constraints;

drop index ESTUDIANTE_FK;

drop index EQUIPO_FK;

drop table MIEMBROEQUIPO cascade constraints;

drop table PERIODO cascade constraints;

drop index ELEMENTO_FK;

drop index ASISTENCIAR_FK;

drop table PRESTAMO cascade constraints;

drop index DEPORTEP_FK;

drop index ESPACIOP_FK;

drop index HORAFIN_FK;

drop index DIA_FK;

drop index HORAINICIO_FK;

drop index ACTIVIDAD_FK;

drop index PERIODO_FK;

drop table PROGRAMACION cascade constraints;

drop index EMPLEADOR_FK;

drop index RELATIONSHIP_15_FK;

drop index ROL_FK;

drop index PROGRAMACION_FK;

drop table RESPONSABLE cascade constraints;

drop table ROL cascade constraints;

drop table TIPOELEMENTO cascade constraints;

drop table TIPOESPACIO cascade constraints;

/*==============================================================*/
/* Table: ACTIVIDAD                                             */
/*==============================================================*/
create table ACTIVIDAD 
(
   IDACTIVIDAD          VARCHAR2(2)          not null,
   DESACTIVIDAD         VARCHAR2(30)         not null,
   constraint PK_ACTIVIDAD primary key (IDACTIVIDAD)
);

/*==============================================================*/
/* Table: ASISMIEMBROEQUIPO                                     */
/*==============================================================*/
create table ASISMIEMBROEQUIPO 
(
   CONSECPROGRA         NUMBER(4,0)          not null,
   CONMIEMBROEQUIPO     NUMBER(4,0)          not null,
   CONSEEQUIPO          NUMBER(3,0)          not null,
   ITEMMIEMBRO          NUMBER(3,0)          not null,
   constraint PK_ASISMIEMBROEQUIPO primary key (CONSECPROGRA, CONMIEMBROEQUIPO)
);

/*==============================================================*/
/* Index: PROGRAMACIONA_FK                                      */
/*==============================================================*/
create index PROGRAMACIONA_FK on ASISMIEMBROEQUIPO (
   CONSECPROGRA ASC
);

/*==============================================================*/
/* Index: ASISTENTE_FK                                          */
/*==============================================================*/
create index ASISTENTE_FK on ASISMIEMBROEQUIPO (
   CONSEEQUIPO ASC,
   ITEMMIEMBRO ASC
);

/*==============================================================*/
/* Table: ASISTIRRESPONSABLE                                    */
/*==============================================================*/
create table ASISTIRRESPONSABLE 
(
   CONSECPROGRA         NUMBER(4,0)          not null,
   CONSECRES            NUMBER(4,0)          not null,
   CONSECASISRES        NUMBER(4,0)          not null,
   FECHAASISRES         DATE                 not null,
   HORAASISRES          DATE                 not null,
   constraint PK_ASISTIRRESPONSABLE primary key (CONSECPROGRA, CONSECRES, CONSECASISRES)
);

/*==============================================================*/
/* Index: RESPONSABLE_FK                                        */
/*==============================================================*/
create index RESPONSABLE_FK on ASISTIRRESPONSABLE (
   CONSECPROGRA ASC,
   CONSECRES ASC
);

/*==============================================================*/
/* Table: CARGO                                                 */
/*==============================================================*/
create table CARGO 
(
   IDCARGO              VARCHAR2(2)          not null,
   DESCARGO             VARCHAR2(30)         not null,
   constraint PK_CARGO primary key (IDCARGO)
);

/*==============================================================*/
/* Table: DEPORTE                                               */
/*==============================================================*/
create table DEPORTE 
(
   IDDEPORTE            VARCHAR2(2)          not null,
   NOMDEPORTE           VARCHAR2(20)         not null,
   constraint PK_DEPORTE primary key (IDDEPORTE)
);

/*==============================================================*/
/* Table: DEPORTE_TIPOELEMENTO                                  */
/*==============================================================*/
create table DEPORTE_TIPOELEMENTO 
(
   IDTIPOELEMENTO       VARCHAR2(2)          not null,
   IDDEPORTE            VARCHAR2(2)          not null,
   constraint PK_DEPORTE_TIPOELEMENTO primary key (IDTIPOELEMENTO, IDDEPORTE)
);

/*==============================================================*/
/* Index: DEPORTE_TIPOELEMENTO2_FK                              */
/*==============================================================*/
create index DEPORTE_TIPOELEMENTO2_FK on DEPORTE_TIPOELEMENTO (
   IDDEPORTE ASC
);

/*==============================================================*/
/* Index: DEPORTE_TIPOELEMENTO_FK                               */
/*==============================================================*/
create index DEPORTE_TIPOELEMENTO_FK on DEPORTE_TIPOELEMENTO (
   IDTIPOELEMENTO ASC
);

/*==============================================================*/
/* Table: DIA                                                   */
/*==============================================================*/
create table DIA 
(
   IDDIA                VARCHAR2(1)          not null,
   NOMDIA               VARCHAR2(10)         not null,
   constraint PK_DIA primary key (IDDIA)
);

/*==============================================================*/
/* Table: ELEMENTODEPORTIVO                                     */
/*==============================================================*/
create table ELEMENTODEPORTIVO 
(
   CONSECELEMENTO       NUMBER(5,0)          not null,
   IDESTADO             VARCHAR2(2)          not null,
   IDTIPOELEMENTO       VARCHAR2(2)          not null,
   IDMARCA              VARCHAR2(3)          not null,
   CODESPACIO           VARCHAR2(2)          not null,
   FECHAREGISTRO        DATE                 not null,
   CANTIDAD             NUMBER(2,0)          not null,
   constraint PK_ELEMENTODEPORTIVO primary key (CONSECELEMENTO)
);

/*==============================================================*/
/* Index: ESTADOELEMENTO_FK                                     */
/*==============================================================*/
create index ESTADOELEMENTO_FK on ELEMENTODEPORTIVO (
   IDESTADO ASC
);

/*==============================================================*/
/* Index: TIPODEPORTIVO_FK                                      */
/*==============================================================*/
create index TIPODEPORTIVO_FK on ELEMENTODEPORTIVO (
   IDTIPOELEMENTO ASC
);

/*==============================================================*/
/* Index: MARCA_FK                                              */
/*==============================================================*/
create index MARCA_FK on ELEMENTODEPORTIVO (
   IDMARCA ASC
);

/*==============================================================*/
/* Index: ESPACIOE_FK                                           */
/*==============================================================*/
create index ESPACIOE_FK on ELEMENTODEPORTIVO (
   CODESPACIO ASC
);

/*==============================================================*/
/* Table: EMPLEADO                                              */
/*==============================================================*/
create table EMPLEADO 
(
   CODEMPLEADO          VARCHAR2(4)          not null,
   NOMEMPLEADO          VARCHAR2(20)         not null,
   APELLEMPLEADO        VARCHAR2(20)         not null,
   FECHAREGISTRO        DATE                 not null,
   CORREOUD             VARCHAR2(30)         not null,
   constraint PK_EMPLEADO primary key (CODEMPLEADO)
);

/*==============================================================*/
/* Table: EMPLEADO_CARGO                                        */
/*==============================================================*/
create table EMPLEADO_CARGO 
(
   CONSEC               NUMBER(3,0)          not null,
   CODEMPLEADO          VARCHAR2(4)          not null,
   IDCARGO              VARCHAR2(2)          not null,
   CODESPACIO           VARCHAR2(2)          not null,
   FECHACARGO           DATE                 not null,
   FECHAFINCAR          DATE,
   constraint PK_EMPLEADO_CARGO primary key (CONSEC)
);

/*==============================================================*/
/* Index: EMPLEADO_FK                                           */
/*==============================================================*/
create index EMPLEADO_FK on EMPLEADO_CARGO (
   CODEMPLEADO ASC
);

/*==============================================================*/
/* Index: CARGO_FK                                              */
/*==============================================================*/
create index CARGO_FK on EMPLEADO_CARGO (
   IDCARGO ASC
);

/*==============================================================*/
/* Index: ESPACIO_FK                                            */
/*==============================================================*/
create index ESPACIO_FK on EMPLEADO_CARGO (
   CODESPACIO ASC
);

/*==============================================================*/
/* Table: EQUIPO                                                */
/*==============================================================*/
create table EQUIPO 
(
   CONSEEQUIPO          NUMBER(3,0)          not null,
   IDDEPORTE            VARCHAR2(2)          not null,
   CODEMPLEADO          VARCHAR2(4)          not null,
   FECHARESOL           DATE                 not null,
   constraint PK_EQUIPO primary key (CONSEEQUIPO)
);

/*==============================================================*/
/* Index: DEPORTEE_FK                                           */
/*==============================================================*/
create index DEPORTEE_FK on EQUIPO (
   IDDEPORTE ASC
);

/*==============================================================*/
/* Index: ENTRENADOR_FK                                         */
/*==============================================================*/
create index ENTRENADOR_FK on EQUIPO (
   CODEMPLEADO ASC
);

/*==============================================================*/
/* Table: ESPACIO                                               */
/*==============================================================*/
create table ESPACIO 
(
   CODESPACIO           VARCHAR2(2)          not null,
   ESP_CODESPACIO       VARCHAR2(2),
   IDTIPOESPACIO        VARCHAR2(2)          not null,
   NOMESPACIO           VARCHAR2(30)         not null,
   constraint PK_ESPACIO primary key (CODESPACIO)
);

/*==============================================================*/
/* Index: SEDE_FK                                               */
/*==============================================================*/
create index SEDE_FK on ESPACIO (
   ESP_CODESPACIO ASC
);

/*==============================================================*/
/* Index: TIPOESPACIO_FK                                        */
/*==============================================================*/
create index TIPOESPACIO_FK on ESPACIO (
   IDTIPOESPACIO ASC
);

/*==============================================================*/
/* Table: ESPACIO_DEPORTE                                       */
/*==============================================================*/
create table ESPACIO_DEPORTE 
(
   IDDEPORTE            VARCHAR2(2)          not null,
   CODESPACIO           VARCHAR2(2)          not null,
   constraint PK_ESPACIO_DEPORTE primary key (IDDEPORTE, CODESPACIO)
);

/*==============================================================*/
/* Index: ESPACIO_DEPORTE2_FK                                   */
/*==============================================================*/
create index ESPACIO_DEPORTE2_FK on ESPACIO_DEPORTE (
   CODESPACIO ASC
);

/*==============================================================*/
/* Index: ESPACIO_DEPORTE_FK                                    */
/*==============================================================*/
create index ESPACIO_DEPORTE_FK on ESPACIO_DEPORTE (
   IDDEPORTE ASC
);

/*==============================================================*/
/* Table: ESTADO                                                */
/*==============================================================*/
create table ESTADO 
(
   IDESTADO             VARCHAR2(2)          not null,
   DESCESTADO           VARCHAR2(20)         not null,
   constraint PK_ESTADO primary key (IDESTADO)
);

/*==============================================================*/
/* Table: ESTUDIANTE                                            */
/*==============================================================*/
create table ESTUDIANTE 
(
   CODESTU              VARCHAR2(12)         not null,
   CODESPACIO           VARCHAR2(2)          not null,
   NOMESTU              VARCHAR2(30)         not null,
   APELESTU             VARCHAR2(30)         not null,
   FECHAREGESTU         DATE                 not null,
   CORREOUDESTU         CHAR(30)             not null,
   FECHANACESTU         DATE                 not null,
   constraint PK_ESTUDIANTE primary key (CODESTU)
);

/*==============================================================*/
/* Index: PERTENECE_FK                                          */
/*==============================================================*/
create index PERTENECE_FK on ESTUDIANTE (
   CODESPACIO ASC
);

/*==============================================================*/
/* Table: HORA                                                  */
/*==============================================================*/
create table HORA 
(
   IDHORA               VARCHAR2(5)          not null,
   constraint PK_HORA primary key (IDHORA)
);

/*==============================================================*/
/* Table: INSCRITOPRACLIBRE                                     */
/*==============================================================*/
create table INSCRITOPRACLIBRE 
(
   CONSECPROGRA         NUMBER(4,0)          not null,
   CONSECPRACT          NUMBER(4,0)          not null,
   CODESTU              VARCHAR2(12),
   CODEMPLEADO          VARCHAR2(4),
   constraint PK_INSCRITOPRACLIBRE primary key (CONSECPROGRA, CONSECPRACT)
);

/*==============================================================*/
/* Index: ESTUDIANTES_FK                                        */
/*==============================================================*/
create index ESTUDIANTES_FK on INSCRITOPRACLIBRE (
   CODESTU ASC
);

/*==============================================================*/
/* Index: PRROGRAMACION_FK                                      */
/*==============================================================*/
create index PRROGRAMACION_FK on INSCRITOPRACLIBRE (
   CONSECPROGRA ASC
);

/*==============================================================*/
/* Index: EMPLEADOS_FK                                          */
/*==============================================================*/
create index EMPLEADOS_FK on INSCRITOPRACLIBRE (
   CODEMPLEADO ASC
);

/*==============================================================*/
/* Table: MARCA                                                 */
/*==============================================================*/
create table MARCA 
(
   IDMARCA              VARCHAR2(3)          not null,
   NOMMARCA             VARCHAR2(20)         not null,
   constraint PK_MARCA primary key (IDMARCA)
);

/*==============================================================*/
/* Table: MIEMBROEQUIPO                                         */
/*==============================================================*/
create table MIEMBROEQUIPO 
(
   CONSEEQUIPO          NUMBER(3,0)          not null,
   ITEMMIEMBRO          NUMBER(3,0)          not null,
   CODESTU              VARCHAR2(12)         not null,
   constraint PK_MIEMBROEQUIPO primary key (CONSEEQUIPO, ITEMMIEMBRO)
);

/*==============================================================*/
/* Index: EQUIPO_FK                                             */
/*==============================================================*/
create index EQUIPO_FK on MIEMBROEQUIPO (
   CONSEEQUIPO ASC
);

/*==============================================================*/
/* Index: ESTUDIANTE_FK                                         */
/*==============================================================*/
create index ESTUDIANTE_FK on MIEMBROEQUIPO (
   CODESTU ASC
);

/*==============================================================*/
/* Table: PERIODO                                               */
/*==============================================================*/
create table PERIODO 
(
   IDPERIODO            VARCHAR2(5)          not null,
   constraint PK_PERIODO primary key (IDPERIODO)
);

/*==============================================================*/
/* Table: PRESTAMO                                              */
/*==============================================================*/
create table PRESTAMO 
(
   CONSECPRESTAMO       NUMBER(4,0)          not null,
   CONSECPROGRA         NUMBER(4,0)          not null,
   CONSECRES            NUMBER(4,0)          not null,
   CONSECASISRES        NUMBER(4,0)          not null,
   CONSECELEMENTO       NUMBER(5,0)          not null,
   constraint PK_PRESTAMO primary key (CONSECPRESTAMO)
);

/*==============================================================*/
/* Index: ASISTENCIAR_FK                                        */
/*==============================================================*/
create index ASISTENCIAR_FK on PRESTAMO (
   CONSECPROGRA ASC,
   CONSECRES ASC,
   CONSECASISRES ASC
);

/*==============================================================*/
/* Index: ELEMENTO_FK                                           */
/*==============================================================*/
create index ELEMENTO_FK on PRESTAMO (
   CONSECELEMENTO ASC
);

/*==============================================================*/
/* Table: PROGRAMACION                                          */
/*==============================================================*/
create table PROGRAMACION 
(
   CONSECPROGRA         NUMBER(4,0)          not null,
   IDPERIODO            VARCHAR2(5)          not null,
   IDACTIVIDAD          VARCHAR2(2)          not null,
   IDHORA               VARCHAR2(5)          not null,
   IDDIA                VARCHAR2(1)          not null,
   HOR_IDHORA           VARCHAR2(5)          not null,
   CODESPACIO           VARCHAR2(2)          not null,
   IDDEPORTE            VARCHAR2(2)          not null,
   CUPO                 NUMBER(3,0)          not null,
   NOINSCRITO           NUMBER(3,0),
   constraint PK_PROGRAMACION primary key (CONSECPROGRA)
);

/*==============================================================*/
/* Index: PERIODO_FK                                            */
/*==============================================================*/
create index PERIODO_FK on PROGRAMACION (
   IDPERIODO ASC
);

/*==============================================================*/
/* Index: ACTIVIDAD_FK                                          */
/*==============================================================*/
create index ACTIVIDAD_FK on PROGRAMACION (
   IDACTIVIDAD ASC
);

/*==============================================================*/
/* Index: HORAINICIO_FK                                         */
/*==============================================================*/
create index HORAINICIO_FK on PROGRAMACION (
   IDHORA ASC
);

/*==============================================================*/
/* Index: DIA_FK                                                */
/*==============================================================*/
create index DIA_FK on PROGRAMACION (
   IDDIA ASC
);

/*==============================================================*/
/* Index: HORAFIN_FK                                            */
/*==============================================================*/
create index HORAFIN_FK on PROGRAMACION (
   HOR_IDHORA ASC
);

/*==============================================================*/
/* Index: ESPACIOP_FK                                           */
/*==============================================================*/
create index ESPACIOP_FK on PROGRAMACION (
   CODESPACIO ASC
);

/*==============================================================*/
/* Index: DEPORTEP_FK                                           */
/*==============================================================*/
create index DEPORTEP_FK on PROGRAMACION (
   IDDEPORTE ASC
);

/*==============================================================*/
/* Table: RESPONSABLE                                           */
/*==============================================================*/
create table RESPONSABLE 
(
   CONSECPROGRA         NUMBER(4,0)          not null,
   CONSECRES            NUMBER(4,0)          not null,
   IDROL                VARCHAR2(1),
   CODESTU              VARCHAR2(12),
   CODEMPLEADO          VARCHAR2(4)          not null,
   FECHAINI             DATE                 not null,
   FECHAFIN             DATE                 not null,
   constraint PK_RESPONSABLE primary key (CONSECPROGRA, CONSECRES)
);

/*==============================================================*/
/* Index: PROGRAMACION_FK                                       */
/*==============================================================*/
create index PROGRAMACION_FK on RESPONSABLE (
   CONSECPROGRA ASC
);

/*==============================================================*/
/* Index: ROL_FK                                                */
/*==============================================================*/
create index ROL_FK on RESPONSABLE (
   IDROL ASC
);

/*==============================================================*/
/* Index: RELATIONSHIP_15_FK                                    */
/*==============================================================*/
create index RELATIONSHIP_15_FK on RESPONSABLE (
   CODESTU ASC
);

/*==============================================================*/
/* Index: EMPLEADOR_FK                                          */
/*==============================================================*/
create index EMPLEADOR_FK on RESPONSABLE (
   CODEMPLEADO ASC
);

/*==============================================================*/
/* Table: ROL                                                   */
/*==============================================================*/
create table ROL 
(
   IDROL                VARCHAR2(1)          not null,
   DESCROL              VARCHAR2(20)         not null,
   constraint PK_ROL primary key (IDROL)
);

/*==============================================================*/
/* Table: TIPOELEMENTO                                          */
/*==============================================================*/
create table TIPOELEMENTO 
(
   IDTIPOELEMENTO       VARCHAR2(2)          not null,
   DESCTIPOELEMENTO     VARCHAR2(40)         not null,
   constraint PK_TIPOELEMENTO primary key (IDTIPOELEMENTO)
);

/*==============================================================*/
/* Table: TIPOESPACIO                                           */
/*==============================================================*/
create table TIPOESPACIO 
(
   IDTIPOESPACIO        VARCHAR2(2)          not null,
   DESCTIPOESPACIO      VARCHAR2(30)         not null,
   constraint PK_TIPOESPACIO primary key (IDTIPOESPACIO)
);

alter table ASISMIEMBROEQUIPO
   add constraint FK_ASISMIEM_ASISTENTE_MIEMBROE foreign key (CONSEEQUIPO, ITEMMIEMBRO)
      references MIEMBROEQUIPO (CONSEEQUIPO, ITEMMIEMBRO);

alter table ASISMIEMBROEQUIPO
   add constraint FK_ASISMIEM_PROGRAMAC_PROGRAMA foreign key (CONSECPROGRA)
      references PROGRAMACION (CONSECPROGRA);

alter table ASISTIRRESPONSABLE
   add constraint FK_ASISTIRR_RESPONSAB_RESPONSA foreign key (CONSECPROGRA, CONSECRES)
      references RESPONSABLE (CONSECPROGRA, CONSECRES);

alter table DEPORTE_TIPOELEMENTO
   add constraint FK_DEPORTE__DEPORTE_T_TIPOELEM foreign key (IDTIPOELEMENTO)
      references TIPOELEMENTO (IDTIPOELEMENTO);

alter table DEPORTE_TIPOELEMENTO
   add constraint FK_DEPORTE__DEPORTE_T_DEPORTE foreign key (IDDEPORTE)
      references DEPORTE (IDDEPORTE);

alter table ELEMENTODEPORTIVO
   add constraint FK_ELEMENTO_ESPACIOE_ESPACIO foreign key (CODESPACIO)
      references ESPACIO (CODESPACIO);

alter table ELEMENTODEPORTIVO
   add constraint FK_ELEMENTO_ESTADOELE_ESTADO foreign key (IDESTADO)
      references ESTADO (IDESTADO);

alter table ELEMENTODEPORTIVO
   add constraint FK_ELEMENTO_MARCA_MARCA foreign key (IDMARCA)
      references MARCA (IDMARCA);

alter table ELEMENTODEPORTIVO
   add constraint FK_ELEMENTO_TIPODEPOR_TIPOELEM foreign key (IDTIPOELEMENTO)
      references TIPOELEMENTO (IDTIPOELEMENTO);

alter table EMPLEADO_CARGO
   add constraint FK_EMPLEADO_CARGO_CARGO foreign key (IDCARGO)
      references CARGO (IDCARGO);

alter table EMPLEADO_CARGO
   add constraint FK_EMPLEADO_EMPLEADO_EMPLEADO foreign key (CODEMPLEADO)
      references EMPLEADO (CODEMPLEADO);

alter table EMPLEADO_CARGO
   add constraint FK_EMPLEADO_ESPACIO_ESPACIO foreign key (CODESPACIO)
      references ESPACIO (CODESPACIO);

alter table EQUIPO
   add constraint FK_EQUIPO_DEPORTEE_DEPORTE foreign key (IDDEPORTE)
      references DEPORTE (IDDEPORTE);

alter table EQUIPO
   add constraint FK_EQUIPO_ENTRENADO_EMPLEADO foreign key (CODEMPLEADO)
      references EMPLEADO (CODEMPLEADO);

alter table ESPACIO
   add constraint FK_ESPACIO_SEDE_ESPACIO foreign key (ESP_CODESPACIO)
      references ESPACIO (CODESPACIO);

alter table ESPACIO
   add constraint FK_ESPACIO_TIPOESPAC_TIPOESPA foreign key (IDTIPOESPACIO)
      references TIPOESPACIO (IDTIPOESPACIO);

alter table ESPACIO_DEPORTE
   add constraint FK_ESPACIO__ESPACIO_D_DEPORTE foreign key (IDDEPORTE)
      references DEPORTE (IDDEPORTE);

alter table ESPACIO_DEPORTE
   add constraint FK_ESPACIO__ESPACIO_D_ESPACIO foreign key (CODESPACIO)
      references ESPACIO (CODESPACIO);

alter table ESTUDIANTE
   add constraint FK_ESTUDIAN_PERTENECE_ESPACIO foreign key (CODESPACIO)
      references ESPACIO (CODESPACIO);

alter table INSCRITOPRACLIBRE
   add constraint FK_INSCRITO_EMPLEADOS_EMPLEADO foreign key (CODEMPLEADO)
      references EMPLEADO (CODEMPLEADO);

alter table INSCRITOPRACLIBRE
   add constraint FK_INSCRITO_ESTUDIANT_ESTUDIAN foreign key (CODESTU)
      references ESTUDIANTE (CODESTU);

alter table INSCRITOPRACLIBRE
   add constraint FK_INSCRITO_PRROGRAMA_PROGRAMA foreign key (CONSECPROGRA)
      references PROGRAMACION (CONSECPROGRA);

alter table MIEMBROEQUIPO
   add constraint FK_MIEMBROE_EQUIPO_EQUIPO foreign key (CONSEEQUIPO)
      references EQUIPO (CONSEEQUIPO);

alter table MIEMBROEQUIPO
   add constraint FK_MIEMBROE_ESTUDIANT_ESTUDIAN foreign key (CODESTU)
      references ESTUDIANTE (CODESTU);

alter table PRESTAMO
   add constraint FK_PRESTAMO_ASISTENCI_ASISTIRR foreign key (CONSECPROGRA, CONSECRES, CONSECASISRES)
      references ASISTIRRESPONSABLE (CONSECPROGRA, CONSECRES, CONSECASISRES);

alter table PRESTAMO
   add constraint FK_PRESTAMO_ELEMENTO_ELEMENTO foreign key (CONSECELEMENTO)
      references ELEMENTODEPORTIVO (CONSECELEMENTO);

alter table PROGRAMACION
   add constraint FK_PROGRAMA_ACTIVIDAD_ACTIVIDA foreign key (IDACTIVIDAD)
      references ACTIVIDAD (IDACTIVIDAD);

alter table PROGRAMACION
   add constraint FK_PROGRAMA_DEPORTEP_DEPORTE foreign key (IDDEPORTE)
      references DEPORTE (IDDEPORTE);

alter table PROGRAMACION
   add constraint FK_PROGRAMA_DIA_DIA foreign key (IDDIA)
      references DIA (IDDIA);

alter table PROGRAMACION
   add constraint FK_PROGRAMA_ESPACIOP_ESPACIO foreign key (CODESPACIO)
      references ESPACIO (CODESPACIO);

alter table PROGRAMACION
   add constraint FK_PROGRAMA_HORAFIN_HORA foreign key (HOR_IDHORA)
      references HORA (IDHORA);

alter table PROGRAMACION
   add constraint FK_PROGRAMA_HORAINICI_HORA foreign key (IDHORA)
      references HORA (IDHORA);

alter table PROGRAMACION
   add constraint FK_PROGRAMA_PERIODO_PERIODO foreign key (IDPERIODO)
      references PERIODO (IDPERIODO);

alter table RESPONSABLE
   add constraint FK_RESPONSA_EMPLEADOR_EMPLEADO foreign key (CODEMPLEADO)
      references EMPLEADO (CODEMPLEADO);

alter table RESPONSABLE
   add constraint FK_RESPONSA_PROGRAMAC_PROGRAMA foreign key (CONSECPROGRA)
      references PROGRAMACION (CONSECPROGRA);

alter table RESPONSABLE
   add constraint FK_RESPONSA_RELATIONS_ESTUDIAN foreign key (CODESTU)
      references ESTUDIANTE (CODESTU);

alter table RESPONSABLE
   add constraint FK_RESPONSA_ROL_ROL foreign key (IDROL)
      references ROL (IDROL);

