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


// If modifying these scopes, delete token.json.
const SCOPES = ['https://www.googleapis.com/auth/calendar.readonly'];
// The file token.json stores the user's access and refresh tokens, and is
// created automatically when the authorization flow completes for the first
// time.
const TOKEN_PATH = 'token.json';

// Load client secrets from a local file.
fs.readFile('credentials.json', (err, content) => {
    if (err) return console.log('Error loading client secret file:', err);
    // Authorize a client with credentials, then call the Google Calendar API.
    authorize(JSON.parse(content), listEvents);
});

/**
 * Create an OAuth2 client with the given credentials, and then execute the
 * given callback function.
 * @param {Object} credentials The authorization client credentials.
 * @param {function} callback The callback to call with the authorized client.
 */
function authorize(credentials, callback) {
    const {client_secret, client_id, redirect_uris} = credentials.installed;
    const oAuth2Client = new google.auth.OAuth2(
        client_id, client_secret, redirect_uris[0]);

    // Check if we have previously stored a token.
    fs.readFile(TOKEN_PATH, (err, token) => {
        if (err) return getAccessToken(oAuth2Client, callback);
        oAuth2Client.setCredentials(JSON.parse(token));
        callback(oAuth2Client);
    });
}

/**
 * Get and store new token after prompting for user authorization, and then
 * execute the given callback with the authorized OAuth2 client.
 * @param {google.auth.OAuth2} oAuth2Client The OAuth2 client to get token for.
 * @param {getEventsCallback} callback The callback for the authorized client.
 */
function getAccessToken(oAuth2Client, callback) {
    const authUrl = oAuth2Client.generateAuthUrl({
        access_type: 'offline',
        scope: SCOPES,
    });
    console.log('Authorize this app by visiting this url:', authUrl);
    const rl = readline.createInterface({
        input: process.stdin,
        output: process.stdout,
    });
    rl.question('Enter the code from that page here: ', (code) => {
        rl.close();
        oAuth2Client.getToken(code, (err, token) => {
            if (err) return console.error('Error retrieving access token', err);
            oAuth2Client.setCredentials(token);
            // Store the token to disk for later program executions
            fs.writeFile(TOKEN_PATH, JSON.stringify(token), (err) => {
                if (err) return console.error(err);
                console.log('Token stored to', TOKEN_PATH);
            });
            callback(oAuth2Client);
        });
    });
}

/**
 * Lists the next 10 events on the user's primary calendar.
 * @param {google.auth.OAuth2} auth An authorized OAuth2 client.
 */
function listEvents(auth) {
    const calendar = google.calendar({version: 'v3', auth});
    calendar.events.list({
        calendarId: 'primary',
        timeMin: (new Date()).toISOString(),
        maxResults: 10,
        singleEvents: true,
        orderBy: 'startTime',
    }, (err, res) => {
        if (err) return console.log('The API returned an error: ' + err);
        const events = res.data.items;
        if (events.length) {
            console.log('Upcoming 10 events:');
            events.map((event, i) => {
                const start = event.start.dateTime || event.start.date;
                console.log(`${start} - ${event.summary}`);
            });
        } else {
            console.log('No upcoming events found.');
        }
    });
}
app.use('/',main);
app.use('/',users);
var Calendar = tui.Calendar;

var calendar = new Calendar('#calendar', {

    // options here
    // 'day', 'week', 'month'
    defaultView: 'week',

    // shows the milestone and task in weekly, daily view
    taskView: true,

    // shows the all day and time grid in weekly, daily view
    scheduleView: true,

    // template options
    template: {
        milestone: function(schedule) {
            return '<span style="color:red;"><i class="fa fa-flag"></i> ' + schedule.title + '</span>';
        },
        milestoneTitle: function() {
            return 'Milestone';
        },
        task: function(schedule) {
            return '&nbsp;&nbsp;#' + schedule.title;
        },
        taskTitle: function() {
            return '<label><input type="checkbox" />Task</label>';
        },
        allday: function(schedule) {
            return schedule.title + ' <i class="fa fa-refresh"></i>';
        },
        alldayTitle: function() {
            return 'All Day';
        },
        time: function(schedule) {
            return schedule.title + ' <i class="fa fa-refresh"></i>' + schedule.start;
        }
    },
    week: {
        daynames: ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'],
        startDayOfWeek: 0,
        narrowWeekend: true
    },
    month: {
        daynames: ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'],
        startDayOfWeek: 0,
        narrowWeekend: true
    },

    // list of Calendars that can be used to add new schedule
    calendars: [],

    // whether use default creation popup or not
    useCreationPopup: false,

    // whether use default detail popup or not
    useDetailPopup: false
});

const port = process.env.PORT || 1000;
app.listen(port, () => console.log(`Listening on port ${port}...`));
