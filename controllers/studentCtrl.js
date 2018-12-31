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
        console.log(result)
        yield this.render('student_attendance', {
            'attendanceList': result,
            'currentUser': this.currentUser
        })
    },

    showFees: function* (next) {
        var stu_id=this.currentUser.id;
        var query=util.format("SELECT * FROM fee_status WHERE fee_status.stu_id=%s;",stu_id)
        var result=yield databaseUtils.executeQuery(query)
        result=result[0]
        delete result['id']
        delete result['creation_timestamp']
        delete result['stu_id']
        yield this.render('student_fees_details',{
            'feesList':result,
            'currentUser':this.currentUser
        })
    }
}