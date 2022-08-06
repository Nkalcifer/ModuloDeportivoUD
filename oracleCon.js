const express=require('express');
const OracleDB = require('oracledb');
var router=express.Router();


router.post('reg-std'),function(req,res,next){
    //get the data from req 
    const {name,rno,loc} =req.body;

    var conString ="(DESCRIPTION =(LOAD_BALANCE = ON)(FAILOVER = ON)(ADDRES =(PROTOCOL = TCP)(HOST =192.168.43.89)(PORT = 1521))(ADDRES = (PROTOCOL = TCP)(HOST = server2)(PORT = 1521))(CONNECT_DATA = (SERVICE_NAME=XE)(FAILOVER_MODE=(TYPE=SELECT)(METHOD=BASIC))))";

    OracleDB.getConnection({
        user: 'prueba',
        password: '1234',
        tns: conString          
    },function(err,con){
        if(err){
            res.send('db con error');
        }else{
            var q="insert into"
        }
    })

}




