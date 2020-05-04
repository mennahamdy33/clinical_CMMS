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
router.get('/index',(req,res)=>{

    res.render('home/index',{layout:'home'});
});
router.get('/SearchEquipment',(req,res)=>{

    res.render('home/SearchEquipment',{layout:'home'});
});
router.get('/Calibration',(req,res)=>{

    res.render('home/Calibration',{layout:'home'});
});

router.get('/Employee',(req,res)=>{

    res.render('home/Employee',{layout:'home'});
});
router.get('/store',(req,res)=>{
    res.render('home/store',{layout:'home'});
});
router.get('/department',(req,res)=>{

    res.render('home/department',{layout:'home'});
});
router.get('/report',(req,res)=>{

    res.render('home/report',{layout:'home'});
});

router.get('/PPM',(req,res)=>{

    res.render('home/PPM',{layout:'home'});
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

router.get('/',(req,res)=>{
    res.render('login/login');
});

router.get('/about',(req,res)=>{
    res.render('home/about',{layout:'home'});
});
router.post('/',(req,res)=>{
    res.redirect('/index');
});
router.get('/Equipment',(req,res)=>{

    pool.getConnection(function (err) {
        if (err) throw err;

        var sql1 = `DELETE reports,ppm,calibration,daily_inspection,f 
                    FROM reports
                    JOIN equipment AS f ON f.id=reports.report_id
                    JOIN ppm ON f.id=ppm.ppm_id
                    JOIN calibration ON f.id=calibration.cal_id
                    JOIN daily_inspection ON f.id=daily_inspection.dinspect_id
                    JOIN scrap ON f.serial_no=scrap.serial_no
                    WHERE scrap.deletion_date<=?`;
        pool.query(sql1,[today] , async function (err,rows,fields) {
            console.log(today);
            console.log("done"+rows.affectedRows);

        });
        var sql= `SELECT * FROM equipment`;

    pool.query(sql,[today] , async function (err,rows,fields) {
        res.render('home/Equipment', {equipment: rows,layout:'home'});

        console.log("ww", {equipment: rows});

    });
});});
router.get('/aEquipment',(req,res)=>{


    pool.getConnection(function (err) {
        if (err) throw err;
        var sql=`SELECT *  FROM equipment as eq WHERE warrenty_period>=?;
        SELECT * FROM equipment as eq2 WHERE maintenance_assessment=?`;
        pool.query(sql,[today,"Y"],async function (err,rows,fields) {
            if (req.query.id==='z')
            {res.render('home/Equipment', {eq2: rows[1],layout:'home'});
                console.log( {eq2: rows[1]});}
            else if(req.query.id==='y'){
                res.render('home/Equipment', {eq: rows[0],layout:'home'});
                    console.log( {eq: rows[0]});}
        });
    });});

router.get('/store_table',(req,res)=>{

    pool.getConnection(function (err) {
        if (err) throw err;
        var sql = `SELECT * FROM store `;
        pool.query(sql,  async function (err,rows,fields) {
            res.render('home/store_table', {store: rows,layout:'home'});

            console.log("ww", {store: rows});

        });
    });});
router.post('/store_table',(req,res)=>{

    pool.getConnection(function (err) {
        if (err) throw err;


        var sql = `SELECT * FROM store WHERE serial_no =?`;
        pool.query(sql,[req.body.search] , async function (err,rows,fields) {

            res.render('home/store_table', {store: rows,layout:'home'});

            console.log("ww", {store: rows});

        });
    });});
router.get('/Dashboard',(req,res)=>{

    var sql = `SELECT count(*) As x FROM equipment;
        SELECT count(*) As y FROM equipment as eq WHERE warrenty_period>=?;
        SELECT count(*) As z FROM equipment as eq2 WHERE maintenance_assessment=?;
        SELECT count(*) As a FROM reports WHERE solved=?;
    SELECT count(*) As a FROM reports AS s WHERE fault_date=?;
    SELECT count(*) As a FROM ppm WHERE to_date=?;
    SELECT count(*) As a FROM calibration WHERE to_date=?;
    SELECT MONTH(fault_date) as e,count(*) as h FROM reports as re WHERE YEAR(fault_date)=?  GROUP BY MONTH(fault_date)`;
    pool.query(sql ,[today,'Y','Y',today,today,today,year], async function (err,rows,fields) {

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
        var sql = `UPDATE reports SET solved=? ,end_date=? WHERE report_id =?`;
        pool.query(sql,['yes',today,req.query.id] , async function (err,rows,fields) {

            res.redirect('/ReportTable');

            console.log("ww", {reports: rows});

        });
    });


});
router.post('/Emp_table',(req,res)=>{

    pool.getConnection(function (err) {
        if (err) throw err;


        var sql = `SELECT * FROM employee WHERE id =?`;
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


                    var sql = `INSERT INTO equipment (department,nomenclature,serial_no,id,model,manufacturer,contact_manufacturer,local_agent,contact_agent,condition_code,price,install_date,warrenty_period,maintenance_assessment) VALUES ('${req.body.department}', '${req.body.equipmentname}','${req.body.serialnumber}','${req.body.id}','${req.body.model}','${req.body.manufacturer}', '${req.body.contactmanufacturer}', '${req.body.localagent}', '${req.body.contactagent}', '${req.body.conditioncode}', '${req.body.price}', '${req.body.installationdate}', '${req.body.warrentlyperiod}','${req.body.maintenanceassesment}')`;

                    pool.query(sql, function (err, res) {
                        if (err) throw err;
                        console.log("1 record inserted");
                    });
                });




        res.redirect('/AddEquipment');


});
router.post('/store', (req, res) => {
    console.log(req.body);
    pool.getConnection(function (err) {
        if (err) throw err;
        var sql = `INSERT INTO store (nomenclature,serial_no,store_id,model,manufacturer,local_agent,warrenty_period,stop_production_date,end_support_date) VALUES ( '${req.body.nomenclature}','${req.body.serialnumber}','${req.body.id}','${req.body.model}','${req.body.manufacturer}', '${req.body.localagent}',  '${req.body.warrentlyperiod}','${req.body.stopproductiondate}','${req.body.endsupportdate}')`;
        pool.query(sql, function (err, res) {
            if (err) throw err;
            console.log("1 record inserted");
        });
    });




    res.redirect('/store');


});
router.post('/Calibration', (req, res) => {
    console.log(req.body);
    pool.getConnection(function (err) {
        if (err) throw err;
        var sql = `INSERT INTO calibration (department,nomenclature,serial_no,cal_id,time_period,from_date,to_date,assigned_to,calibration_task,contract_id,status) VALUES ('${req.body.department}', '${req.body.nomenclature}','${req.body.serialnumber}','${req.body.id}','${req.body.timeperiod}','${req.body.fromdate}','${req.body.todate}', '${req.body.assignedto}', '${req.body.calibrationtask}', '${req.body.contractid}', '${req.body.status}')`;
        pool.query(sql, function (err, res) {
            if (err) throw err;
            console.log("1 record inserted");
        });
    });




    res.redirect('/Calib');


});
router.post('/Dailypass', (req, res) => {
    console.log(req.body);
    pool.getConnection(function (err) {
        if (err) throw err;
        console.log("Connected!");


        var sql = `INSERT INTO daily_inspection (nomenclature,serial_no,dinspect_id,department,physical_condition,batteries,cables_port,self_test,tech_name,inspection_date,comment) VALUES ( '${req.body.equipmentname}','${req.body.serialnumber}','${req.body.id}','${req.body.department}','${req.body.physicalcondition}', '${req.body.batteriescondition}', '${req.body.cablesportscondition}', '${req.body.selftest}', '${req.body.technicianname}', '${req.body.inspectiondate}', '${req.body.comment}')`;
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


        var sql = `INSERT INTO employee (name,id,email,mobile_no,role,position,department,qualifications,salary) VALUES ('${req.body.name}', '${req.body.ID}','${req.body.email}','${req.body.mobilenumber}','${req.body.role}','${req.body.position}', '${req.body.department}', '${req.body.qualification}', '${req.body.salary}')`;
        pool.query(sql, function (err, res) {
            if (err) throw err;
            console.log("1 record inserted");
        });
    });




    res.redirect('/Employee');


});
router.post('/PPM', (req, res) => {
    console.log(req.body);
    pool.getConnection(function (err) {
        if (err) throw err;
        console.log("why");
        var sql = `INSERT INTO ppm (department,nomenclature,serial_no,ppm_id,time_period,from_date,to_date,assigned_to,ppm_task,contract_id,status) VALUES ('${req.body.department}', '${req.body.nomenclature}','${req.body.serialnumber}','${req.body.ID}','${req.body.timeperiod}','${req.body.fromdate}','${req.body.todate}', '${req.body.assignedto}', '${req.body.ppmtask}', '${req.body.contractid}', '${req.body.status}')`;
        pool.query(sql, function (err, res) {
            if (err) throw err;
            console.log("1 record inserted");
        });
    });




    res.redirect('/PPM');


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
