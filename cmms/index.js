//mvc moddel view control
const express = require('express');
const app = express();
const fs = require('fs');
const readline = require('readline');
const {google} = require('googleapis');
//we add the path module which is built in node.js
const path = require('path');
//we add the handlebars engine module
const exphbs = require('express-handlebars');
//connecting the routes/home/main file to index file to make them see each other
const main = require('./routes/main');
//require body parser to parse date from front-end
const bodyParser = require('body-parser');
//setting the methodoverride to be able to use put,patch,etc in the url
const methodOverride = require('method-override');
const bcrypt = require('bcryptjs');
//we add the middle ware for the public folder and join it to the path to call our styles from it
app.use(express.static(path.join(__dirname,'public')));
const users = require('./routes/users');
//const mysql = require('mysql');
//we add the middle wares for the engine
app.engine('handlebars',exphbs({defaultLayout: 'login'}));
app.set('view engine','handlebars');
//always put it before the routes or it will not work
app.use(bodyParser.urlencoded({extended: true}));
app.use(bodyParser.json());

//using the method override in the middleware
app.use(methodOverride('_method'));


app.use('/',main);
app.use('/',users);

const port = process.env.PORT || 1000;
app.listen(port, () => console.log(`Listening on port ${port}...`));
