#!/bin/bash
# This script starts a NodeJS server project
# how I like 'em
# @author: Suyash Kumar

serverSTR="\n
// Set up Express.js \n\n
var express = require('express');\n
var app = express();\n
var server = require('http').Server(app);\n
var io = require('socket.io')(server);\n
\n
// Load libraries\n
var bodyParser = require('body-parser');\n
var morgan = require('morgan');\n
\n
\n
// Set up logging\n
app.use(morgan('dev'));\n
\n
// Set up body parsing\n
app.use(bodyParser.json());\n
app.use(bodyParser.urlencoded({ extended: false }));\n
\n
// Set up static content\n
app.use(express.static(__dirname + '/node_modules')); // client-side frameworks\n
app.use(express.static(__dirname + '/public')); // HTML, CSS\n
\n
// Set up favicon\n
//app.use(favicon(__dirname + '/public/favicon.ico'));\n
\n
// Connect to Mongodb\n
require('./config/db')();\n
\n
// Set up app routes\n
require('./config/routes')(app); \n
\n
io.on('connection',function(socket){\n
	\n
});\n
\n
exports = module.exports = app;\n
if (!module.parent) {\n
  var port = process.env.PORT || 9000; // 9000 as default\n
  // On Linux make sure you have root to open port 80\n
  server.listen(port, function() {\n
    console.log('Listening on port ' + port);\n
  });\n
}\n
"
routesStr="
module.exports = function(app) {\n
	app.get('/hello', function(req,res){\n
		res.send('hello');\n
	});\n
\n
}"\n
dbStr="\n
var mongoose = require('mongoose');\n
\n
var config = {\n
  url: process.env.MONGO_URI || 'mongodb://localhost/cloudpulse'\n
}; // The default port of MongoDB is 27017\n
\n
module.exports = function() {\n
  mongoose.connect(config.url);\n
};"

mkdir config models public 
sudo npm install --save body-parser express mongoose morgan # install common packages 
echo -e $serverSTR > server.js # write server.js
echo -e $routeStr > config/routes.js
echo -e $dbStr > config/db.js
