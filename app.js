var app = require('koa')(),
  logger = require('koa-logger'),
  json = require('koa-json'),
  views = require('koa-views'),
  onerror = require('koa-onerror');

// var cors = require('koa-cors');
var path = require('path');

var bodyParser = require('koa-bodyparser')({
  formidable: {uploadDir: './public/uploads'},
  multipart: true,
  urlencoded: true
});

var sessionUtils = require('./utils/sessionUtils');

var appRoute = require('./routes/appRoute');
var adminRoute = require('./routes/adminRoute');

// error handler
onerror(app);

// global middlewares
app.use(views('views', {
  root: __dirname + '/views',
  default: 'ejs'
}));

app.use(json());
app.use(logger());

app.use(bodyParser);

app.use(function* (next) {
  var sessionId = this.cookies.get("SESSION_ID");
  console.log('COOKIE COOKIE-----------------',sessionId)
  this.currentUser = yield sessionUtils.getCurrentUser(sessionId);
 yield next;
});



app.use(function* (next) {
  var start = new Date;
  yield next;
  var ms = new Date - start;
  console.log('%s %s - %s', this.method, this.url, ms);
});

app.use(require('koa-static')(__dirname + '/public'));

// routes definition
app.use(adminRoute.routes(), adminRoute.allowedMethods());
app.use(appRoute.routes(), appRoute.allowedMethods());

// error-handling
app.on('error', (err, ctx) => {
  console.error('server error', err, ctx)
});

module.exports = app;