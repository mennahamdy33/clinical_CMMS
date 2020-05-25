const express = require('express');
const path = require('path');
const router = express.Router();
const bcrypt = require('bcryptjs');
const bodyParser = require('body-parser');
const app = express();
let date_ob = new Date();
// current date
// adjust 0 before single digit date
let date = ("0" + date_ob.getDate()).slice(-2);
// current month
let month = ("0" + (date_ob.getMonth() + 1)).slice(-2);
// current year
let year = date_ob.getFullYear();
let today =year + "-" + month + "-" + date;
// prints date in YYYY-MM-DD format
console.log(year + "-" + month + "-" + date);
var mysql = require('mysql');
var pool = mysql.createPool({
    host: "localhost",
    user: "root",
    database: "cmms",
    multipleStatements: true
});
app.use(bodyParser.json());
router.get('/',(req,res)=>{
    res.render('login/login');
});
router.get('/index',(req,res)=>{

    res.render('home/index',{layout:'home'});
});
router.post('/',(req,res)=>{
    if(req.body.id==='YoussefMohamed' && req.body.password==="YouMo1998")
    {
        res.redirect('/index');
    }
    else
    {
        res.redirect('/');
    }

});
router.get('/SearchEquipment',(req,res)=>{

    res.render('home/SearchEquipment',{layout:'home'});
});
router.get('/calibration1',(req,res)=>{

    res.render('home/calibration1',{layout:'home'});
});
router.get('/calibration2',(req,res)=>{

    res.render('home/calibration2',{layout:'home'});
});

router.get('/Employee',(req,res)=>{

    res.render('home/Employee',{layout:'home'});
});
router.get('/Scrap',(req,res)=>{
    res.render('home/Scrap',{layout:'home'});
});
router.get('/department',(req,res)=>{

    res.render('home/department',{layout:'home'});
});
router.get('/report',(req,res)=>{

    res.render('home/report',{layout:'home'});
});

router.get('/ppm1',(req,res)=>{

    res.render('home/ppm1',{layout:'home'});
});

router.get('/ppm2',(req,res)=>{

    res.render('home/ppm2',{layout:'home'});
});
router.get('/AddEquipment',(req,res)=>{
    res.render('home/AddEquipment',{layout:'home'});
});



router.get('/DailyPassTable',(req,res)=>{
    pool.getConnection(function (err) {
        if (err) throw err;

        var sql = `SELECT * FROM daily_inspection `;
        pool.query(sql,  async function (err,rows,fields) {
            res.render('home/DailyPassTable', {daily_inspection: rows,layout:'home'});

            console.log("ww", {daily_inspection: rows});

        });
    });
});
router.get('/ReportTable',(req,res)=>{
    pool.getConnection(function (err) {
        if (err) throw err;

        var sql = `SELECT * FROM reports `;
        pool.query(sql,  async function (err,rows,fields) {
            res.render('home/ReportTable', {reports: rows,layout:'home'});

            console.log("ww", {reports: rows});

        });
    });
});


router.get('/about',(req,res)=>{
    res.render('home/about',{layout:'home'});
});
// router.get('/equipment',(req,res)=>{
//     pool.getConnection(function (err) {
//         if (err) throw err;
//
//         var sql2 = `DELETE d
//                 FROM equipment As d
//                 JOIN scrap ON d.serial_no=scrap.serial_no
//                 WHERE scrap.deletion_date<=?`;
//
//     pool.query(sql2,[today] , async function (err,rows,fields) {
//         console.log(today);
//         console.log("done"+rows.affectedRows);
//
//     });
//         var sql= `SELECT * FROM equipment`;
//
//         pool.query(sql,[today] , async function (err,rows,fields) {
//             res.render('home/Equipment', {equipment: rows,layout:'home'});
//
//             console.log("ww", {equipment: rows});
//
//         });
//     });});
router.get('/Equipment',(req,res)=>{

    pool.getConnection(function (err) {
        if (err) throw err;

        var sql1 = `DELETE reports
                    FROM reports
                    JOIN equipment AS f ON f.id=reports.report_id
                    JOIN scrap ON f.serial_no=scrap.serial_no
                    WHERE scrap.deletion_date<=?;
                    DELETE ppm
                    FROM ppm
                    JOIN equipment AS b ON b.id=ppm.ppm_id
                    JOIN scrap ON b.serial_no=scrap.serial_no
                    WHERE scrap.deletion_date<=?;
                    DELETE calibration
                    FROM calibration
                    JOIN equipment AS n ON n.id=calibration.cal_id
                    JOIN scrap ON n.serial_no=scrap.serial_no
                    WHERE scrap.deletion_date<=?;
                    DELETE daily_inspection
                    FROM daily_inspection
                    JOIN equipment AS m ON m.id=daily_inspection.dinspect_id
                    JOIN scrap ON m.serial_no=scrap.serial_no
                    WHERE scrap.deletion_date<=?;
                    DELETE d
                    FROM equipment As d
                    JOIN scrap ON d.serial_no=scrap.serial_no
                    WHERE scrap.deletion_date<=?`;


        pool.query(sql1,[today,today,today,today,today] , async function (err,rows,fields) {
            console.log(today);
            console.log("done"+rows[0].affectedRows+rows[1].affectedRows+rows[2].affectedRows+rows[3].affectedRows+rows[4].affectedRows);

        });

        var sql= `SELECT * FROM equipment`;

        pool.query(sql,[today] , async function (err,rows,fields) {
            if(req.query.id==='1'){
            res.render('home/Equipment', {equipment:  rows.slice(0,100),layout:'home'});
                console.log("ww", {equipment: rows.slice(0,100)});
            }
            else if(req.query.id==='2'){
                res.render('home/Equipment', {equipment:  rows.slice(100,200),layout:'home'});
                console.log("ss", {equipment: rows.slice(100,200)});
            }
            else if(req.query.id==='3'){
                res.render('home/Equipment', {equipment:  rows.slice(200,300),layout:'home'});
                console.log("aa", {equipment: rows.slice(200,300)});
            }
            else if(req.query.id==='4'){
                res.render('home/Equipment', {equipment:  rows.slice(300),layout:'home'});
                console.log("zz", {equipment: rows.slice(0,100)});
            }
            else
            {
                res.render('home/Equipment', {equipment:  rows.slice(0,100),layout:'home'});
                console.log("ww", {equipment: rows.slice(0,100)});

            }


        });
});});
router.get('/aEquipment',(req,res)=>{


    pool.getConnection(function (err) {
        if (err) throw err;
        var sql=`SELECT *  FROM equipment as eq WHERE warrenty_period IS NOT NULL;
        SELECT * FROM equipment as eq2 WHERE maintenance_assessment=?`;
        pool.query(sql,["Y"],async function (err,rows,fields) {
            if (req.query.id==='z')
            {res.render('home/Equipment', {eq2: rows[1],layout:'home'});
                console.log( {eq2: rows[1]});}
            else if(req.query.id==='y'){
                res.render('home/Equipment', {eq: rows[0],layout:'home'});
                    console.log( {eq: rows[0]});}
        });
    });});
router.get('/aReportTable',(req,res)=>{


    pool.getConnection(function (err) {
        if (err) throw err;
        var sql=`SELECT *  FROM reports AS rep WHERE solved=?`;

        pool.query(sql,["no"],async function (err,rows,fields) {

            res.render('home/ReportTable', {rep: rows,layout:'home'});
                console.log( {rep: rows});

        });
    });});
router.get('/appmtable',(req,res)=>{


    pool.getConnection(function (err) {
        if (err) throw err;
        var sql=`SELECT *  FROM ppm AS PPM WHERE from_date<=? AND to_date>=? AND status IS NULL`;

        pool.query(sql,[today,today],async function (err,rows,fields) {

            res.render('home/PPM_table', {PPM: rows,layout:'home'});
            console.log( {PPM: rows});

        });
    });});
router.get('/acalitable',(req,res)=>{


    pool.getConnection(function (err) {
        if (err) throw err;
        var sql=`SELECT *  FROM calibration AS cali WHERE from_date<=? AND to_date>=? AND status IS NULL`;

        pool.query(sql,[today],async function (err,rows,fields) {

            res.render('home/Calib_table', {cali: rows,layout:'home'});
            console.log( {cali: rows});

        });
    });});
router.get('/Scrap_table',(req,res)=>{

    pool.getConnection(function (err) {
        if (err) throw err;
        var sql = `SELECT * FROM scrap `;
        pool.query(sql,  async function (err,rows,fields) {
            res.render('home/Scrap_table', {scrap: rows,layout:'home'});

            console.log("ww", {scrap: rows});

        });
    });});
router.post('/Scrap_table',(req,res)=>{

    pool.getConnection(function (err) {
        if (err) throw err;


        var sql = `SELECT * FROM scrap WHERE serial_no =?`;
        pool.query(sql,[req.body.search] , async function (err,rows,fields) {

            res.render('home/Scrap_table', {scrap: rows,layout:'home'});

            console.log("ww", {scrap: rows});

        });
    });});
router.get('/Dashboard',(req,res)=>{

    var sql = `SELECT count(*) As x FROM equipment;
        SELECT count(*) As y FROM equipment as eq WHERE warrenty_period IS NOT NULL;
        SELECT count(*) As z FROM equipment as eq2 WHERE maintenance_assessment=?;
        SELECT count(*) As a FROM reports WHERE solved=?;
    SELECT count(*) As a FROM reports AS s WHERE fault_date=?;
    SELECT count(*) As a FROM ppm WHERE from_date<=? AND to_date>=? AND status IS NULL;
    SELECT count(*) As a FROM calibration WHERE from_date<=? AND to_date>=? AND status IS NULL;
    SELECT MONTH(fault_date) as e,count(*) as h FROM reports as re WHERE YEAR(fault_date)=?  GROUP BY MONTH(fault_date)`;
    pool.query(sql ,['Y','no',today,today,today,today,today,year], async function (err,rows,fields) {

        res.render('home/Dashboard', {equipment: rows[0][0],reports:rows[3][0],eq:rows[1][0],eq2:rows[2][0],s:rows[4][0],ppm:rows[5][0],calibration:rows[6][0],re:rows[7]});

        console.log("ww", {equipment: rows[0][0],reports:rows[3][0],eq:rows[1][0],eq2:rows[2][0],s:rows[4][0],ppm:rows[5][0],calibration:rows[6][0],re:rows[7]});


    });
    });

router.get('/Calib_table',(req,res)=>{

    pool.getConnection(function (err) {
        if (err) throw err;

        var sql = `SELECT * FROM calibration `;
        pool.query(sql,  async function (err,rows,fields) {
            res.render('home/Calib_table', {calibration: rows,layout:'home'});

            console.log("ww", {calibration: rows});

        });
    });});
router.get('/dep_table',(req,res)=>{

    pool.getConnection(function (err) {
        if (err) throw err;

        var sql = `SELECT * FROM department `;
        pool.query(sql,  async function (err,rows,fields) {
            res.render('home/dep_table', {department: rows,layout:'home'});

            console.log("ww", {department: rows});

        });
    });});
router.post('/dep_table',(req,res)=>{

    pool.getConnection(function (err) {
        if (err) throw err;


        var sql = `SELECT * FROM department WHERE code =?`;
        pool.query(sql,[req.body.search] , async function (err,rows,fields) {

            res.render('home/dep_table', {department: rows,layout:'home'});

            console.log("ww", {department: rows});

        });
    });});
router.post('/Calib_table',(req,res)=>{

    pool.getConnection(function (err) {
        if (err) throw err;


        var sql = `SELECT * FROM calibration WHERE cal_id =?`;
        pool.query(sql,[req.body.search] , async function (err,rows,fields) {

            res.render('home/Calib_table', {calibration: rows,layout:'home'});

            console.log("ww", {calibration: rows});

        });
    });});

router.get('/Emp_table',(req,res)=>{

    pool.getConnection(function (err) {
        if (err) throw err;

        var sql = `SELECT * FROM employee `;
        pool.query(sql,  async function (err,rows,fields) {
            res.render('home/Emp_table', {employee: rows,layout:'home'});

            console.log("ww", {employee: rows});

        });
    });});
router.get('/solved',(req,res)=>{


    pool.getConnection(function (err) {
        if (err) throw err;

        console.log(req.query.id);
        var sql = `UPDATE reports SET solved=? ,end_date=? WHERE job_no =?`;
        pool.query(sql,['yes',today,req.query.id] , async function (err,rows,fields) {

            res.redirect('/ReportTable');

            console.log("ww", {reports: rows});

        });
    });


});
router.post('/Emp_table',(req,res)=>{

    pool.getConnection(function (err) {
        if (err) throw err;


        var sql = `SELECT * FROM employee WHERE national_id =?`;
        pool.query(sql,[req.body.search] , async function (err,rows,fields) {

            res.render('home/Emp_table', {employee: rows,layout:'home'});

            console.log("ww", {employee: rows});

        });
    });});
router.get('/PPM_table',(req,res)=>{
    pool.getConnection(function (err) {

        if (err) throw err;

        var sql = `SELECT * FROM ppm `;
        pool.query(sql,  async function (err,rows,fields) {
            res.render('home/PPM_table', {ppm: rows,layout:'home'});
            console.log("ww", {ppm: rows});

        });
    });});

router.post('/PPM_table',(req,res)=>{

    pool.getConnection(function (err) {
        if (err) throw err;


        var sql = `SELECT * FROM ppm WHERE ppm_id =?`;
        pool.query(sql,[req.body.search] , async function (err,rows,fields) {

            res.render('home/PPM_table', {ppm: rows,layout:'home'});

            console.log("ww", {ppm: rows});

        });
    });});
router.post('/PPM_table',(req,res)=>{

    pool.getConnection(function (err) {
        if (err) throw err;


        var sql = `SELECT * FROM ppm WHERE ppm_id =?`;
        pool.query(sql,[req.body.search] , async function (err,rows,fields) {

            res.render('home/PPM_table', {ppm: rows,layout:'home'});

            console.log("ww", {ppm: rows});

        });
    });});
router.post('/DailyPassTable',(req,res)=>{

    pool.getConnection(function (err) {
        if (err) throw err;


        var sql = `SELECT * FROM daily_inspection WHERE dinspect_id =?`;
        pool.query(sql,[req.body.search] , async function (err,rows,fields) {

            res.render('home/DailyPassTable', {daily_inspection: rows,layout:'home'});

            console.log("ww", {daily_inspection: rows});

        });
    });});
router.post('/ReportTable',(req,res)=>{

    pool.getConnection(function (err) {
        if (err) throw err;

        // solve=req.body.search;
        // console.log(solve);
        var sql = `SELECT * FROM reports WHERE report_id =?`;
        pool.query(sql,[req.body.search] , async function (err,rows,fields) {

            res.render('home/ReportTable', {reports: rows,layout:'home'});

            console.log("ww", {reports: rows});

        });
    });});
router.post('/SearchEquipment',(req,res)=>{

    pool.getConnection(function (err) {
        if (err) throw err;


        var sql = `SELECT * FROM equipment WHERE id =? OR nomenclature=?`;
        pool.query(sql,[req.body.id,req.body.nomenclature] , async function (err,rows,fields) {

            res.render('home/Equipment', {equipment: rows,layout:'home'});

            console.log("ww", {equipment: rows});

        });
    });});
router.get('/contact',(req,res)=>{
    res.render('home/contact',{layout:'home'});
});
router.get('/support',(req,res)=>{
    res.render('home/support',{layout:'home'});
});
router.get('/Dailypass',(req,res)=>{
    res.render('home/Dailypass',{layout:'home'});
});


router.post('/AddEquipment', (req, res) => {
    console.log(req.body);
    pool.getConnection(function (err) {
        if (err) throw err;
        console.log("Connected!");


    var sql = `INSERT INTO equipment (department,dep_code,nomenclature,serial_no,id,model,manufacturer,contact_manufacturer,local_agent,contact_agent,condition_code,price,install_date,warrenty_period,maintenance_assessment) VALUES ('${req.body.department}','${req.body.departmentcode}', '${req.body.nomenclature}','${req.body.serialnumber}','${req.body.id}','${req.body.model}','${req.body.manufacturer}', '${req.body.contactmanufacturer}', '${req.body.localagent}', '${req.body.contactagent}', '${req.body.conditioncode}', '${req.body.price}', '${req.body.installationdate}', '${req.body.warrentlyperiod}','${req.body.maintainanceassessment}')`;

    pool.query(sql, function (err, res) {
        if (err) throw err;
        console.log("1 record inserted");
    });
});




        res.redirect('/AddEquipment');


});

router.post('/department', (req, res) => {
    console.log(req.body);
    pool.getConnection(function (err) {
        if (err) throw err;
        console.log("Connected!");


        var sql = `INSERT INTO department (name,floor,building,location,b_id,code) VALUES ('${req.body.name}','${req.body.floor}', '${req.body.building}','${req.body.location}','${req.body.b_id}','${req.body.code}')`;

        pool.query(sql, function (err, res) {
            if (err) throw err;
            console.log("1 record inserted");
        });
    });




    res.redirect('/department');


});
router.post('/Scrap', (req, res) => {
    console.log(req.body);
    pool.getConnection(function (err) {
        if (err) throw err;
        var sql = `INSERT INTO scrap (nomenclature,serial_no,model,manufacturer,local_agent,warrenty_period,stop_production_date,end_support_date,deletion_date) VALUES ( '${req.body.nomenclature}','${req.body.serialnumber}','${req.body.model}','${req.body.manufacturer}', '${req.body.localagent}',  '${req.body.warrentlyperiod}','${req.body.stopproductiondate}','${req.body.endproductiondate}','${req.body.deletiondate}')`;
        pool.query(sql, function (err, res) {
            if (err) throw err;
            console.log("1 record inserted");
        });
    });




    res.redirect('/Scrap');


});

router.post('/calibration1', (req, res) => {
    console.log(req.body);
    pool.getConnection(function (err) {
        if (err) throw err;
        var sql = `INSERT INTO calibration (department,dcode,nomenclature,cal_id,time_period,from_date,to_date,calibration_task,contract_id) VALUES ('${req.body.department}','${req.body.departmentcode}' ,'${req.body.nomenclature}','${req.body.id}','${req.body.timeperiod}','${req.body.fromdate}','${req.body.todate}',  '${req.body.calibrationtask}', '${req.body.contractid}')`;
        pool.query(sql, function (err, res) {
            if (err) throw err;
            console.log("1 record inserted");
        });
    });




    res.redirect('/calibration1');


});

router.post('/calibration2', (req, res) => {
    console.log(req.body);
    pool.getConnection(function (err) {
        if (err) throw err;
        console.log("why");
        var sql = `UPDATE calibration SET assigned_to=? ,status=? WHERE cal_id =? AND from_date<=? AND to_date>=?`;

        pool.query(sql,[req.body.assignedto,req.body.status,req.body.id,today,today] ,function (err, res) {
            if (err) throw err;
            console.log("1 record inserted");
        });
    });




    res.redirect('/calibration2');


});
router.post('/Dailypass', (req, res) => {
    console.log(req.body);
    pool.getConnection(function (err) {
        if (err) throw err;
        console.log("Connected!");


        var sql = `INSERT INTO daily_inspection (nomenclature,dinspect_id,department,d_code,physical_condition,batteries,cables_port,self_test,tech_name,inspection_date,comment) VALUES ( '${req.body.nomenclature}','${req.body.id}','${req.body.department}','${req.body.departmentcode}','${req.body.physicalcondition}', '${req.body.batteriescondition}', '${req.body.cablesportscondition}', '${req.body.selftest}', '${req.body.technicianname}', '${req.body.inspectiondate}', '${req.body.comment}')`;
        pool.query(sql, function (err, res) {
            if (err) throw err;
            console.log("1 record inserted");
        });
    });




    res.redirect('/Dailypass');


});
router.post('/Report', (req, res) => {
    console.log(req.body);
    pool.getConnection(function (err) {
        if (err) throw err;
        console.log("Connected!");


        var sql = `INSERT INTO reports (department,	de_code,equip_name,manufacturer,model,fault_date,priority,fault_description,job_no,tech_name,action_taken,solved,end_date,report_id) VALUES ('${req.body.department}','${req.body.departmentcode}', '${req.body.equipmentname}','${req.body.manufacturer}','${req.body.model}','${req.body.faultdate}', '${req.body.priority}', '${req.body.faultdescription}', '${req.body.jobnumber}', '${req.body.technicianname}', '${req.body.actiontaken}', '${req.body.solved}', '${req.body.enddate}','${req.body.id}')`;
        pool.query(sql, function (err, res) {
            if (err) throw err;
            console.log("1 record inserted");
        });
    });




    res.redirect('/Report');


});

router.post('/Employee', (req, res) => {
    console.log(req.body);
    pool.getConnection(function (err) {
        if (err) throw err;
        console.log("Connected!");


        var sql = `INSERT INTO employee (name,national_id,email,mobile_no,role,position,department,depart_code,qualifications,salary) VALUES ('${req.body.name}', '${req.body.ID}','${req.body.email}','${req.body.mobilenumber}','${req.body.role}','${req.body.position}', '${req.body.department}','${req.body.departmentcode}',  '${req.body.qualification}', '${req.body.salary}')`;
        pool.query(sql, function (err, res) {
            if (err) throw err;
            console.log("1 record inserted");
        });
    });




    res.redirect('/Employee');


});
router.post('/ppm1', (req, res) => {
    console.log(req.body);
    pool.getConnection(function (err) {
        if (err) throw err;
        console.log("why");
        var sql = `INSERT INTO ppm (department,department_code,nomenclature,ppm_id,time_period,from_date,to_date,ppm_task,contract_id) VALUES ('${req.body.department}', '${req.body.departmentcode}', '${req.body.nomenclature}','${req.body.ID}','${req.body.timeperiod}','${req.body.fromdate}','${req.body.todate}',  '${req.body.ppmtask}', '${req.body.contractid}')`;
        pool.query(sql, function (err, res) {
            if (err) throw err;
            console.log("1 record inserted");
        });
    });




    res.redirect('/ppm1');


});
router.post('/ppm2', (req, res) => {
    console.log(req.body);
    pool.getConnection(function (err) {
        if (err) throw err;
        console.log("why");
        var sql = `UPDATE ppm SET assigned_to=? ,status=? WHERE ppm_id =?`;

        pool.query(sql,[req.body.assignedto,req.body.status,req.body.ID] ,function (err, res) {
            if (err) throw err;
            console.log("1 record inserted");
        });
    });




    res.redirect('/ppm2');


});
router.post('/index',(req,res)=>{

    pool.getConnection(function (err) {
        if (err) throw err;
            var sql = `SELECT solved,count(*) AS x FROM reports GROUP BY solved  ;
            SELECT nomenclature,count(*) AS x FROM equipment WHERE  nomenclature =?`;
            pool.query(sql ,req.body.editbox_search, async function (err,rows,fields) {

                res.render('home/index', {reports:rows[0],equipment:rows[1],layout:'home'});

                console.log("ww",{reports:rows[0], equipment:rows[1]});

        });
    });});

module.exports = router;
