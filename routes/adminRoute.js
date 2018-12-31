var router = require('koa-router')();
var adminCtrl = require('./../controllers/adminCtrl')

router.get('/admin', adminCtrl.showDashboard);

module.exports=router;