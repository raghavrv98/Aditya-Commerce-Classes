var databaseUtils = require('./../utils/databaseUtils')
var util = require('util')

module.exports = {
    showDashboard: function* (next) {
        yield this.render('student_dashboard', {
            'currentUser': this.currentUser
        });
    },

    showAttendance: function* (next) {
        var stu_id = this.currentUser.id
        var query = util.format("SELECT student.name as name, course.name as course, lecture_date,attendance.present FROM student JOIN attendance ON student.id=attendance.stu_id JOIN lecture ON lecture.id = attendance.lecture_id JOIN course ON course.id=lecture.course_id WHERE student.id = %s ORDER BY lecture_date DESC;", stu_id)
        var result = yield databaseUtils.executeQuery(query)
        yield this.render('student_attendance', {
            'attendanceList': result,
            'currentUser': this.currentUser
        })
    },

    showFees: function* (next) {
        var stu_id = this.currentUser.id;
        var query = util.format('SELECT student.name as name, enrollment.course_id as cid , jan, feb, mar, apr, may, jun, jul, aug, sep, oct, nov, decem FROM fee_status JOIN enrollment ON enrollment.id=fee_status.enrol_id JOIN student ON student.id=enrollment.stu_id WHERE student.active=1 AND student.id="%s" ORDER BY student.name;', stu_id)
        var result = yield databaseUtils.executeQuery(query)
        console.log(typeof result)
        result = result
        delete result['id']
        delete result['creation_timestamp']
        yield this.render('student_fees_details', {
            'feesList': result,
            'currentUser': this.currentUser
        })
    },

    showTestResult: function* (next) {
        var query = util.format("SELECT course.name as course, test.test_date, student.name,test_result.marks_obtained, test.max_marks FROM test_result JOIN test ON test.id=test_result.test_id JOIN course ON course.id=test.course_id JOIN student ON student.id=test_result.stu_id ORDER BY test.test_date DESC, test_result.marks_obtained DESC;")
        var result = yield databaseUtils.executeQuery(query)
        yield this.render('test_result_for_student', {
            'resultList': result,
            'currentUser': this.currentUser
        })
    },

    showExamSchedule: function* (next) {
        var query="SELECT test.test_date,test.batch_time,test.test_time,course.name as course,test.max_marks FROM test JOIN course ON course.id=test.course_id ORDER BY test.test_date DESC;"
        var result=yield databaseUtils.executeQuery(query);
        yield this.render('student_exam_schedule', {
            'testList':result,
            'currentUser': this.currentUser
        })
    },

    showTimeTable: function* (next) {
        var query=util.format("SELECT course_id,img FROM timetable;")
        var result=yield databaseUtils.executeQuery(query)
        console.log(result)
        yield this.render('student_timetable',{
            'timetableList':result,
            'currentUser':this.currentUser
        })
    },

    showSyllabus: function* (next) {
        var query="SELECT course.name as course, course.syllabus as syllabus FROM course;"
        var result=yield databaseUtils.executeQuery(query)
        yield this.render('syllabus_for_student', {
            'syllabusList':result,
            'currentUser': this.currentUser
        })
    }
}