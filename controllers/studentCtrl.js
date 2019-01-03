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
        var query = util.format("SELECT * FROM fee_status WHERE fee_status.stu_id=%s;", stu_id)
        var result = yield databaseUtils.executeQuery(query)
        result = result[0]
        delete result['id']
        delete result['creation_timestamp']
        delete result['stu_id']
        yield this.render('student_fees_details', {
            'feesList': result,
            'currentUser': this.currentUser
        })
    },

    showTestResult: function* (next) {
        var query = util.format("SELECT course.name as course, test.test_date, student.name,test_result.marks_obtained, test.max_marks FROM test_result JOIN test ON test.id=test_result.test_id JOIN course ON course.id=test.course_id JOIN student ON student.id=test_result.stu_id GROUP BY test.id ORDER BY test.test_date DESC;")
        var result = yield databaseUtils.executeQuery(query)
        yield this.render('test_result_for_student', {
            'resultList': result,
            'currentUser': this.currentUser
        })
    },

    showExamSchedule: function* (next) {
        yield this.render('student_exam_schedule', {
            'currentUser': this.currentUser
        })
    },

    showTimeTable: function* (next) {
        yield this.render('student_timetable', {
            'currentUser': this.currentUser
        })
    },

    showSyllabus: function* (next) {
        yield this.render('syllabus_for_student', {
            'currentUser': this.currentUser
        })
    }
}