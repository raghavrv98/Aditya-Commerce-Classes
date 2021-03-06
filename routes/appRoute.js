var router = require('koa-router')();
var homeCtrl = require('./../controllers/homeCtrl')
var studentCtrl=require('./../controllers/studentCtrl')

router.get('/', homeCtrl.showHome)
router.post('/login',homeCtrl.login)
router.get('/logout',homeCtrl.logout)
router.post('/change-password',homeCtrl.changePassword)
router.post('/forgot-password',homeCtrl.forgotPassword)
router.post('/enquiry-mail',homeCtrl.enquiryMail)

router.get('/scholarship-registration-form',homeCtrl.showScholarshipRegistrationForm)
router.post('/scholarship-registration-form-submit',homeCtrl.scholarshipRegistrationFormSubmit)
router.get('/registration-successfull',homeCtrl.showRegistrationSuccessfull)

router.get('/scholarship-test-instructions',homeCtrl.scholarshipTestInstructions)
router.post('/scholarship-test-registration-submit',homeCtrl.scholarshipTestRegistrationSubmit)
router.get('/scholarship-test',homeCtrl.scholarshipTest)
router.get('/scholarship-test-submission',homeCtrl.scholarshipTestSubmission)

router.get('/student',studentCtrl.showDashboard)
router.get('/student-attendance',studentCtrl.showAttendance)
router.get('/student-feesquery',studentCtrl.showFees)
router.get('/student-test-result',studentCtrl.showTestResult)
router.get('/student-exam-schedule',studentCtrl.showExamSchedule)
router.get('/student-timetable',studentCtrl.showTimeTable)
router.get('/student-syllabus',studentCtrl.showSyllabus)

module.exports=router;