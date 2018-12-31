var router = require('koa-router')();
var homeCtrl = require('./../controllers/homeCtrl')
var studentCtrl=require('./../controllers/studentCtrl')
var adminCtrl=require('./../controllers/adminCtrl')

router.get('/', homeCtrl.showHome)
router.get('/admin',adminCtrl.showDashboard)
router.get('/student',studentCtrl.showDashboard)

module.exports=router;