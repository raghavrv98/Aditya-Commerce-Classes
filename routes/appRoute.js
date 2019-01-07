var router = require('koa-router')();
var homeCtrl = require('./../controllers/homeCtrl')
var studentCtrl=require('./../controllers/studentCtrl')

router.get('/', homeCtrl.showHome)
router.post('/login',homeCtrl.login)
router.get('/logout',homeCtrl.logout)
router.post('/change-password',homeCtrl.changePassword)

router.get('/student',studentCtrl.showDashboard)
router.get('/student-attendance',studentCtrl.showAttendance)
router.get('/student-feesquery',studentCtrl.showFees)
router.get('/student-test-result',studentCtrl.showTestResult)
router.get('/student-exam-schedule',studentCtrl.showExamSchedule)
router.get('/student-timetable',studentCtrl.showTimeTable)
router.get('/student-syllabus',studentCtrl.showSyllabus)

module.exports=router;