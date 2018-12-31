var router = require('koa-router')();
var homeCtrl = require('./../controllers/homeCtrl')
var studentCtrl=require('./../controllers/studentCtrl')

router.get('/', homeCtrl.showHome)
router.post('/login',homeCtrl.login)
router.get('/logout',homeCtrl.logout)

router.get('/student',studentCtrl.showDashboard)
router.get('/student/attendance',studentCtrl.showAttendance)
router.get('/student/feesquery',studentCtrl.showFees)

module.exports=router;