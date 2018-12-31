var databaseUtils=require('./../utils/databaseUtils')
var util=require('util')

module.exports = {
    showDashboard: function* (next) {
        yield this.render('student_dashboard', {
            'currentUser': this.currentUser
        });
    },

    showAttendance: function* (next) {
        var stu_id=this.currentUser.id
        var query=util.format("SELECT student.name as name, course.name as course, lecture_date,attendance.present FROM student JOIN attendance ON student.id=attendance.stu_id JOIN lecture ON lecture.id = attendance.lecture_id JOIN course ON course.id=lecture.course_id WHERE student.id = %s ORDER BY  lecture_date DESC;",stu_id)
        var result=yield databaseUtils.executeQuery(query)
        console.log(result)
        yield this.render('student_attendance',{
            'attendanceList':result,
            'currentUser':this.currentUser
        })
    }
}