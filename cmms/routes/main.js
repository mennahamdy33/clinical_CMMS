const express = require('express');
const path = require('path');
const router = express.Router();
const bcrypt = require('bcryptjs');
const bodyParser = require('body-parser');
const app = express();
//const mysql = require('mysql2');
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
router.get('/Calibration',(req,res)=>{

    res.render('home/Calibration',{layout:'home'});
});

router.get('/Employee',(req,res)=>{

    res.render('home/Employee',{layout:'home'});
});


router.get('/store',(req,res)=>{

    res.render('home/store',{layout:'home'});
});

router.get('/report',(req,res)=>{

    res.render('home/report',{layout:'home'});
});

router.get('/PPM',(req,res)=>{

    res.render('home/PPM',{layout:'home'});
});
    
router.get('/calender',(req,res)=>{

    res.render('home/calender');
});
router.get('/AddEquipment',(req,res)=>{
    res.render('home/AddEquipment',{layout:'home'});
});
router.get('/',(req,res)=>{
    res.render('login/login');
});
router.post('/',(req,res)=>{
    res.redirect('/index');
});
router.get('/about',(req,res)=>{
    res.render('home/about',{layout:'home'});
});

router.get('/Equipment',(req,res)=>{

    pool.getConnection(function (err) {
        if (err) throw err;

        var sql = `SELECT * FROM equipment `;
    pool.query(sql,  async function (err,rows,fields) {
        res.render('home/Equipment', {equipment: rows,layout:'home'});

        console.log("ww", {equipment: rows});

    });
});});
// router.post('/blog',(req,res)=>{
//
//     pool.getConnection(function (err) {
//         if (err) throw err;
//
//
//         var sql = `SELECT * FROM equipment WHERE serial_no =?`;
//         pool.query(sql,[req.body.editbox_search] , async function (err,rows,fields) {
//
//             res.render('home/blog', {equipment: rows,layout:'home'});
//
//             console.log("ww", {equipment: rows});
//
//         });
//     });});
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
        pool.query(sql,[req.body.editbox_search] , async function (err,rows,fields) {

            res.render('home/store_table', {store: rows,layout:'home'});

            console.log("ww", {store: rows});

        });
    });});
router.get('/Dashboard',(req,res)=>{

    pool.getConnection(function (err) {
        if (err) throw err;
        var sql = `SELECT * FROM reports ;SELECT * FROM ppm ;SELECT * FROM daily_inspection ;`
        pool.query(sql,  async function (err,rows,fields) {
            res.render('home/Dashboard', {reports: rows[0],ppm:rows[1],daily_inspection:rows[2],layout:'home'});

            console.log("ww", {reports: rows[0],ppm:rows[1],daily_inspection:rows[2]});

        });
    });});
router.post('/Dashboard',(req,res)=>{

    pool.getConnection(function (err) {
        if (err) throw err;


        var sql = `SELECT * FROM reports WHERE serial_no =?`;
        pool.query(sql,[req.body.editbox_search] , async function (err,rows,fields) {

            res.render('home/Dashboard', {reports: rows,layout:'home'});

            console.log("ww", {reports: rows});

        });
    });});
router.get('/Calib_table',(req,res)=>{

    pool.getConnection(function (err) {
        if (err) throw err;

        var sql = `SELECT * FROM calibration `;
        pool.query(sql,  async function (err,rows,fields) {
            res.render('home/Calib_table', {calibration: rows,layout:'home'});

            console.log("ww", {calibration: rows});

        });
    });});
router.post('/Calib_table',(req,res)=>{

    pool.getConnection(function (err) {
        if (err) throw err;


        var sql = `SELECT * FROM calibration WHERE serial_no =?`;
        pool.query(sql,[req.body.editbox_search] , async function (err,rows,fields) {

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
router.post('/Emp_table',(req,res)=>{

    pool.getConnection(function (err) {
        if (err) throw err;


        var sql = `SELECT * FROM employee WHERE id =?`;
        pool.query(sql,[req.body.editbox_search] , async function (err,rows,fields) {

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


        var sql = `SELECT * FROM ppm WHERE serial_no =?`;
        pool.query(sql,[req.body.editbox_search] , async function (err,rows,fields) {

            res.render('home/PPM_table', {ppm: rows,layout:'home'});

            console.log("ww", {ppm: rows});

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
        var sql = `INSERT INTO calibration (department,nomenclature,serial_no,calib_id,time_period,from_date,to_date,assigned_to,calibration_task,contract_id,status) VALUES ('${req.body.department}', '${req.body.nomenclature}','${req.body.serialnumber}','${req.body.id}','${req.body.timeperiod}','${req.body.fromdate}','${req.body.todate}', '${req.body.assignedto}', '${req.body.calibrationtask}', '${req.body.contractid}', '${req.body.status}')`;
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


        var sql = `INSERT INTO daily_inspection (nomenclature,serial_no,dailypass_id,department,physical_condition,batteries,cables_port,self_test,tech_name,inspection_date,comment) VALUES ( '${req.body.equipmentname}','${req.body.serialnumber}','${req.body.id}','${req.body.department}','${req.body.physicalcondition}', '${req.body.batteriescondition}', '${req.body.cablesportscondition}', '${req.body.selftest}', '${req.body.technicianname}', '${req.body.inspectiondate}', '${req.body.comment}')`;
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


        var sql = `INSERT INTO reports (department,equip_name,manufacturer,model,serial_no,fault_date,priority,fault_description,job_no,tech_name,action_taken,solved,end_date,report_id) VALUES ('${req.body.department}', '${req.body.equipmentname}','${req.body.manufacturer}','${req.body.model}','${req.body.serialnumber}','${req.body.faultdate}', '${req.body.priority}', '${req.body.faultdescription}', '${req.body.jobnumber}', '${req.body.technicianname}', '${req.body.actiontaken}', '${req.body.solution}', '${req.body.enddate}','${req.body.id}')`;
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

        //
        // var sql = `SELECT nomenclature,count(*) AS x FROM equipment WHERE  nomenclature =?`;
        // pool.query(sql,[req.body.editbox_search] , async function (err,rows,fields) {
        //
        //     res.render('home/index', {equipment: rows, layout: 'home'});
        //
        //     console.log("ww", {equipment: rows});
        // });
            var sql = `SELECT solved,count(*) AS x FROM reports GROUP BY solved  ;SELECT nomenclature,count(*) AS x FROM equipment WHERE  nomenclature =?`;
            pool.query(sql ,req.body.editbox_search, async function (err,rows,fields) {

                res.render('home/index', {reports:rows[0],equipment:rows[1],layout:'home'});

                console.log("ww",{reports:rows[0], equipment:rows[1]});

        });
    });});

// router.get('/contactUs',(req,res)=>{
//     res.render('home/contactUs');
// });
// router.get('/signUp1',(req,res)=>{
//     console.log('connected to signup page!');
//     res.render('home/SignUp1');
//     //res.sendFile(path.join(__dirname, '..', 'views', 'home', 'SignUp1.html'));
// });
//
// router.get('/p_login',(req,res)=>{
//     res.render('home/p_login');
// });
// router.get('/thank_you',(req,res)=>{
//     res.render('home/thank_you');
// });
//
//
//
// router.get('/patient',(req,res)=>{
//     res.render('home/patient');
// });
// var mysql = require('mysql');
//
// var pool = mysql.createPool({
//     host: "localhost",
//     user: "root",
//     database: "icu"
// });
// router.get('/doctor',(req,res)=>{
//     res.render('home/doctor');
// });

//
// router.post('/SignUp1', (req, res) => {
//     console.log('data sent!!!!!!');
//     console.log(req.body);
//     pool.getConnection(function (err) {
//         if (err) throw err;
//         console.log("Connected!");
//         if (req.body.password !== req.body.confirm_password) {
//             req.flash("passwords don't match");
//             console.log("passwords don't match");
//             res.render('/signUp1');
//         }
//         else {
//
//             var pass = req.body.password;
//             bcrypt.genSalt(10, (err, salt) => {
//                 bcrypt.hash(pass, salt, (err, hash) => {
//                     pass = hash;
//
//                     var sql = `INSERT INTO doctor (ID,SSN, F_Name,L_Name,Admin,Password,Gender,Phone,Address,Position,Degree,birth_of_date,Department,E_mail) VALUES ('${req.body.id}', '${req.body.ssn}','${req.body.fname}','${req.body.lname}','0', '${pass}', '${req.body.gender}', '${req.body.phone}', '${req.body.address}', '${req.body.position}', '${req.body.degree}', '${req.body.bd}', '${req.body.depart}','${req.body.email}')`;
//                     pool.query(sql, function (err, res) {
//                         if (err) throw err;
//                         console.log("1 record inserted");
//                     });
//                 });
//             });
//         }
//
//
//         res.redirect('/login');
//
//     });
// });
//router.post('/login', (req, res) => {
//     pool.getConnection(function (err) {
//         if (err) throw err;
//         console.log("Login Connected!");
//
//         var sql = `SELECT * FROM doctor WHERE ID = ?`;
//         pool.query(sql, [req.body.id], async function (err,rows,fields) {
//
//             bcrypt.compare(req.body.password, rows[0].Password).then((returnPassword) => {
//                 console.log(`this is respone ${returnPassword}`);
//                 if(!returnPassword){
//                     console.log('wrong pass')
//                     res.redirect('/login')
//                 }
//                 else{
//                     console.log('hello');
//                     if(rows[0].Admin == 1){
//                         res.render('adminview/index', {doctor: rows[0]});
//                         console.log("ww",{doctor : rows[0]});
//
//                     }
//                     else{
//                         res.render('home/doctor', {doctor: rows[0]});
//                         console.log({doctor : rows[0]});
//                     }
//                 }
//             });
//
//
//             if (err) throw err;
//         });
//
//     });
//
// });
module.exports = router;
