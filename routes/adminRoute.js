var router = require('koa-router')();
var adminCtrl = require('./../controllers/adminCtrl')

router.get('/admin', adminCtrl.showDashboard);
router.get('/admin-attendance', adminCtrl.attendance);
router.get('/admin-create-exam', adminCtrl.createNewExam);
router.get('/admin-fee-status', adminCtrl.showFeeStatus);
router.get('/admin-result', adminCtrl.showResult);
router.get('/admin-view-attendance', adminCtrl.viewAttendance);
router.get('/admin-update-syllabus', adminCtrl.updateSyllabus);
router.get('/admin-update-timetable', adminCtrl.updateTimeTable);
router.post('/admin-register-student',adminCtrl.registerStudent)

module.exports=router;