const oracledb = require('oracledb');
import config from "./../config";

const connection = oracledb.getConnection({
    user: config.user,
    password: config.password,
    tns: config.host + ":" + config.port + "/" + config.database
});

const getConnection = () => {
    return connection;
}

module.exports = {
    getConnection
};