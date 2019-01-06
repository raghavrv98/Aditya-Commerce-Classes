var router = require('koa-router')();
var adminCtrl = require('./../controllers/adminCtrl')

router.get('/admin', adminCtrl.showDashboard);
router.get('/admin-attendance', adminCtrl.attendance);
router.post('/admin-upload-attendance', adminCtrl.uploadAttendance);
router.get('/admin-create-exam', adminCtrl.showNewExamForm);
router.post('/admin-create-exam',adminCtrl.createNewExam)
router.get('/admin-fee-status', adminCtrl.showFeeStatus);
router.get('/admin-result', adminCtrl.showUploadResultForm);
router.post('/admin-result', adminCtrl.uploadResult);
router.get('/deregister-student', adminCtrl.showDeregistrationForm);
router.post('/deregister-student', adminCtrl.deregisterStudent);
router.get('/admin-update-syllabus', adminCtrl.showSyllabusUpdateForm);
router.post('/admin-update-syllabus', adminCtrl.updateSyllabus);
router.get('/admin-update-timetable', adminCtrl.showTimeTable);
router.post('/admin-update-timetable', adminCtrl.updateTimeTable);
router.post('/admin-register-student',adminCtrl.registerStudent)

module.exports=router;