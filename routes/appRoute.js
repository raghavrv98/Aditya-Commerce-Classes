var router = require('koa-router')();
var homeCtrl = require('./../controllers/homeCtrl')
var adminCtrl=require('./../controllers/adminCtrl')

router.get('/', homeCtrl.showHome)
router.get('/admin',adminCtrl.showDashboard)

module.exports=router;