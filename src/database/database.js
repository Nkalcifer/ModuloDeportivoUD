const oracledb = require('oracledb');

const crd = require('../credenciales.json');

const connection = oracledb.getConnection({
    user: crd.user,
    password: crd.psswrd,
    tns: crd.host + ":" + crd.port + "/" + crd.db
});

const getConnection = () => {
    return connection;
}

module.exports = {
    getConnection
};