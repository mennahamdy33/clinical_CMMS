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
    database: "cmms"
});
app.use(bodyParser.json());
router.get('/index',(req,res)=>{

    res.render('home/index',{layout:'home'});
});
router.get('/AddEquipment',(req,res)=>{
    res.render('home/AddEquipment',{layout:'home'});
});
router.get('/',(req,res)=>{
    res.render('login/login');
});
router.get('/about',(req,res)=>{
    res.render('home/about',{layout:'home'});
});
router.get('/blog',(req,res)=>{
    res.render('home/blog',{layout:'home'});
});
router.get('/contact',(req,res)=>{
    res.render('home/contact',{layout:'home'});
});
router.get('/support',(req,res)=>{
    res.render('home/support',{layout:'home'});
});

 router.post('/', (req, res) => {
     res.render('home/index',{layout:'home'});
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