var router = require('koa-router')();
var adminCtrl = require('./../controllers/adminCtrl')

router.get('/', adminCtrl.showDashboard);

module.exports=router;