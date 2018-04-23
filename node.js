// var http = require('http');
// var fs = require('fs');
// var events = require('events');

// function onRequest(req, res) {
//     res.writeHead(200, {'Content-Type': 'text/html'});
//     fs.readFile('./dbms.html', null, function(error, data){
//     	if (error) {
//     		res.writeHead(404);
//     		res.write('File not found!');
//     	} else{
//     		res.write(data);
//     	}
//     	res.end();
//     });
// }

// http.createServer(onRequest).listen(8080);

var express = require('express');
var app = express();
var exec = require('child_process').exec;
var http = require('http');
var fs = require('fs');
var events = require('events');
var bodyParser = require('body-parser')
var mysql = require('mysql');
var connection = mysql.createConnection({
  host     : 'localhost',
  user     : 'admin',
  password : 'password',
  database : 'bitbizzar'
});

connection.connect(function(err){
	if (err){
		console.log("Database is not connecting");
	} else{
	console.log("Connected!");
	}
});

app.listen(3000);
app.use(bodyParser());

app.get('/DBMS', function(req, res){
	res.writeHead(200, {'Content-Type': 'text/html'});
    fs.readFile('./dbms.html', null, function(error, data){
    	if (error) {
    		res.writeHead(404);
    		res.write('File not found!');
    	} else{
    		res.write(data);
    	}
    	res.end();
    });
	if(connection.state === 'disconnected'){
		res.write('Warning: MySQL Server is down!');
	} else{
		res.write('MySQL is connected');
	}
})

app.get('/', function(req, res){
	res.write('helloworld!');
	if(connection.state === 'disconnected'){
		res.write('Warning: MySQL Server is down!');
	} else{
		res.write('MySQL is connected');
	}
	res.end();
})

app.get('/backupDBs', function(req, res){
	exec('mysqldump -u admin -ppassword bitbizzar > BackUps/backup.sql');
	res.redirect('/DBMS')
	res.end()
})

app.get('/reloadBackUp', function(req, res){
	exec('mysql -u admin -ppassword bitbizzar < BackUps/backup.sql');
	res.redirect('/DBMS')
	res.end()
})

app.get('/querylog', function(req,res){
	exec('cp /var/log/mysql/slow.log /var/www/html/web/BitBizzar/DBMS/BackUps/query.log')


	fs.readFile('./BackUps/query.log', null, function(error, data){
    	if (error) {
    		res.writeHead(404);
    		res.write('File not found!');
    	} else{
    		res.write(data);
    	}
    	res.end();
    });

})