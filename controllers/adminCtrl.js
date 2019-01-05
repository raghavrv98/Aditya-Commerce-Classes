var util=require('util')
var databaseUtils=require('./../utils/databaseUtils')

module.exports = {
    showDashboard: function* (next) {
        if (this.currentUser) {
            yield this.render('teacher_dashboard', {
                'currentUser': this.currentUser
            });
        }
        else{
            this.redirect('/')
        }
    },

    attendance:function*(next){
        yield this.render('teacher_attendance',{
            'currentUser':this.currentUser
        })
    },
    
    viewAttendance:function*(next){
        yield this.render('teacher_view_attendance',{
            'currentUser':this.currentUser
        })
    },

    showNewExamForm:function*(next){
        console.log()
        yield this.render('teacher_create_exam',{
            'currentUser':this.currentUser
        })
    },

    showFeeStatus:function*(next){
        yield this.render('teacher_fee_status',{
            'currentUser':this.currentUser
        })
    },

    showUploadResultForm:function*(next){
        var query=util.format('SELECT id,test_date, max_marks FROM test where course_id=1 ORDER BY test_date DESC LIMIT 10;')
        var accountsTestList=yield databaseUtils.executeQuery(query)

        query=util.format('SELECT id,test_date, max_marks FROM test where course_id=2 ORDER BY test_date DESC LIMIT 10;')
        var economicsTestList=yield databaseUtils.executeQuery(query)

        query=util.format('SELECT id,test_date, max_marks FROM test where course_id=3 ORDER BY test_date DESC LIMIT 10;')
        var bsTestList=yield databaseUtils.executeQuery(query)

        query=util.format('SELECT id,test_date, max_marks FROM test where course_id=4 ORDER BY test_date DESC LIMIT 10;')
        var englishTestList=yield databaseUtils.executeQuery(query)

        query=util.format('SELECT student.id, student.name FROM student JOIN enrollment ON enrollment.stu_id=student.id WHERE enrollment.course_id=1 AND student.active=1;')
        var accStudent=yield databaseUtils.executeQuery(query)

        query=util.format('SELECT student.id, student.name FROM student JOIN enrollment ON enrollment.stu_id=student.id WHERE enrollment.course_id=2 AND student.active=1;')
        var ecoStudent=yield databaseUtils.executeQuery(query)

        query=util.format('SELECT student.id, student.name FROM student JOIN enrollment ON enrollment.stu_id=student.id WHERE enrollment.course_id=3 AND student.active=1;')
        var bsStudent=yield databaseUtils.executeQuery(query)

        query=util.format('SELECT student.id, student.name FROM student JOIN enrollment ON enrollment.stu_id=student.id WHERE enrollment.course_id=4 AND student.active=1;')
        var engStudent=yield databaseUtils.executeQuery(query)

        yield this.render('teacher_test_result',{
            'currentUser':this.currentUser,
            'accountsTestList':accountsTestList,
            'economicsTestList':economicsTestList,
            'bsTestList':bsTestList,
            'englishTestList':englishTestList,
            'accStudent':accStudent,
            'ecoStudent':ecoStudent,
            'bsStudent':bsStudent,
            'engStudent':engStudent
        })
    },

    uploadResult:function*(next){
        console.log(this.request.body)
        var testId=this.request.body.testId
        var marks=this.request.body.marks
        var studentIds=this.request.body.studentId
        var query=''
        var result=''
        for(var i=0;i<marks.length;i++){
            query=util.format('INSERT INTO test_result(test_id, stu_id,marks_obtained) VALUES ("%s","%s","%s");',testId,studentIds[i],marks[i])
            result=yield databaseUtils.executeQuery(query)
            console.log(result)
        }
        this.redirect('/admin-result')
    },

    showTimeTable:function*(next){
        var query=util.format("SELECT course_id,img FROM timetable;")
        var result=yield databaseUtils.executeQuery(query)
        console.log(result)
        yield this.render('teacher_timetable',{
            'timetableList':result,
            'currentUser':this.currentUser
        })
    },

    showSyllabusUpdateForm:function*(next){
        yield this.render('teacher_update_syllabus',{
            'currentUser':this.currentUser
        })
    },

    registerStudent:function*(next){
        console.log(this.request.body)
        var studentname=this.request.body.studentname
        var fathername=this.request.body.fathername
        var phone=this.request.body.phone
        var school=this.request.body.phone
        var joiningdate=this.request.body.joiningdate
        var address=this.request.body.address
        var password=this.request.body.password

        var query=util.format('INSERT INTO student(name,mobile,password,address,joining_date,school,parent,active)VALUES ("%s","%s","%s","%s","%s","%s","%s","1");',studentname,phone,password,address,joiningdate,school,fathername);
        console.log("query",query)
        var result=yield databaseUtils.executeQuery(query)
        console.log("RESULT",result)
        var stu_id=result.insertId;
        if(this.request.body.bs){
            query=util.format('insert into enrollment(stu_id,course_id)values("%s","1")',stu_id)
            result=yield databaseUtils.executeQuery(query)
        }
        if(this.request.body.accounts){
            query=util.format('insert into enrollment(stu_id,course_id)values("%s","3")',stu_id)
            result=yield databaseUtils.executeQuery(query)
        }
        if(this.request.body.economics){
            query=util.format('insert into enrollment(stu_id,course_id)values("%s","2")',stu_id)
            result=yield databaseUtils.executeQuery(query)
        }
        if(this.request.body.english){
            query=util.format('insert into enrollment(stu_id,course_id)values("%s","4")',stu_id)
            result=yield databaseUtils.executeQuery(query)
        }
        this.redirect('/admin')
    },

    createNewExam:function*(next){
        console.log(this.request.body)
        var query=util.format('INSERT INTO test (test_date, course_id, max_marks) VALUES ("%s","%s","%s");',this.request.body.testDate, this.request.body.courseId, this.request.body.maxMarks)
        var result=yield databaseUtils.executeQuery(query)
        console.log(result)
        this.redirect('/admin-create-exam')
    },

    updateSyllabus:function*(next){
        console.log(this.request.body)
        var courseId=this.request.body.courseId
        var syllabus=this.request.body.syllabus
        var query=util.format('UPDATE course SET syllabus="%s" WHERE id="%s";',syllabus, courseId)
        console.log(query);
        var result=yield databaseUtils.executeQuery(query)
        console.log(result)
        this.redirect('/admin-update-syllabus')
    },

    updateTimeTable:function*(next){
        var courseId=this.request.body.fields.courseId
        var img=(this.request.body.files.timetable.path).split('\\')[2]
        var query=util.format('UPDATE timetable SET img="%s" WHERE course_id="%s";',img,courseId);
        var result=yield databaseUtils.executeQuery(query)
        console.log(result);
        this.redirect('/admin-update-timetable')
    }
}