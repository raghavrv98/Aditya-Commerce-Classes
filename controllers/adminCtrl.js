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
        var query=util.format('SELECT student.id, student.name FROM student JOIN enrollment ON enrollment.stu_id=student.id WHERE enrollment.course_id=1 AND student.active=1 ORDER BY student.name;')
        var accStudentList=yield databaseUtils.executeQuery(query)

        query=util.format('SELECT student.id, student.name FROM student JOIN enrollment ON enrollment.stu_id=student.id WHERE enrollment.course_id=2 AND student.active=1 ORDER BY student.name;')
        var ecoStudentList=yield databaseUtils.executeQuery(query)

        query=util.format('SELECT student.id, student.name FROM student JOIN enrollment ON enrollment.stu_id=student.id WHERE enrollment.course_id=3 AND student.active=1 ORDER BY student.name;')
        var bsStudentList=yield databaseUtils.executeQuery(query)

        query=util.format('SELECT student.id, student.name FROM student JOIN enrollment ON enrollment.stu_id=student.id WHERE enrollment.course_id=4 AND student.active=1 ORDER BY student.name;')
        var engStudentList=yield databaseUtils.executeQuery(query)

        yield this.render('teacher_attendance',{
            'currentUser':this.currentUser,
            'accStudentList':accStudentList,
            'ecoStudentList':ecoStudentList,
            'bsStudentList':bsStudentList,
            'engStudentList':engStudentList
        })
    },

    uploadAttendance:function*(next){
        console.log(this.request.body)
        var lectureDate=this.request.body.lectureDate
        var courseId=this.request.body.courseId
        var present=this.request.body.present
        var query=util.format('INSERT INTO lecture (lecture_date, course_id) VALUES ("%s", "%s")', lectureDate, courseId)
        var result=yield databaseUtils.executeQuery(query)
        var lectureId=result.insertId
        if(typeof present==typeof 'string'){
            query=util.format('INSERT INTO attendance (lecture_id, stu_id, present) VALUES ("%s", "%s", "1")', lectureId, present)
            result=yield databaseUtils.executeQuery(query)
            console.log(result)
        }else{
            for(var i=0;i<present.length;i++){
                query=util.format('INSERT INTO attendance (lecture_id, stu_id, present) VALUES ("%s", "%s", "1")', lectureId, present[i])
                result=yield databaseUtils.executeQuery(query)
                console.log(result)
            }
        }
        this.redirect('/admin-attendance')
    },
    
    viewAttendance:function*(next){
        yield this.render('teacher_view_attendance',{
            'currentUser':this.currentUser
        })
    },
    
    showDeregistrationForm:function*(next){
        var query=util.format('SELECT student.id as sid, enrollment.id as eid, student.name, student.mobile FROM student JOIN enrollment ON enrollment.stu_id=student.id WHERE enrollment.course_id=1 AND student.active=1 ORDER BY student.name;')
        var accStudentList=yield databaseUtils.executeQuery(query)

        query=util.format('SELECT student.id as sid, enrollment.id as eid, student.name, student.mobile FROM student JOIN enrollment ON enrollment.stu_id=student.id WHERE enrollment.course_id=2 AND student.active=1 ORDER BY student.name;')
        var ecoStudentList=yield databaseUtils.executeQuery(query)

        query=util.format('SELECT student.id as sid, enrollment.id as eid, student.name, student.mobile FROM student JOIN enrollment ON enrollment.stu_id=student.id WHERE enrollment.course_id=3 AND student.active=1 ORDER BY student.name;')
        var bsStudentList=yield databaseUtils.executeQuery(query)

        query=util.format('SELECT student.id as sid, enrollment.id as eid, student.name, student.mobile FROM student JOIN enrollment ON enrollment.stu_id=student.id WHERE enrollment.course_id=4 AND student.active=1 ORDER BY student.name;')
        var engStudentList=yield databaseUtils.executeQuery(query)
        yield this.render('teacher_deregister_student',{
            'currentUser':this.currentUser,
            'accStudentList':accStudentList,
            'ecoStudentList':ecoStudentList,
            'bsStudentList':bsStudentList,
            'engStudentList':engStudentList
        })
    },

    deregisterStudent:function*(next){
        var eid_sid=this.request.body.eid_sid
        var query=''
        var result=''
        if(typeof eid_sid==typeof "strings"){
            var eid=eid_sid.split('_')[0]
            var sid=eid_sid.split('_')[1]
            console.log(eid,"INSIDE IF---------",sid)
            query=util.format('DELETE FROM enrollment WHERE id="%s";',eid)
            result=yield databaseUtils.executeQuery(query)
            console.log(query,result)
            // query=util.format('UPDATE student SET active="0" where id="%s";',sid)
            // result=yield databaseUtils.executeQuery(query)
            // console.log(query,result)
        }else{
            console.log(typeof eid_sid, eid_sid)
            for(var i=0;i<eid_sid.length;i++){
                var eid=eid_sid[i].split('_')[0]
                var sid=eid_sid[i].split('_')[1]
                console.log(eid,"INSIDE ELSE---------",sid)
                query=util.format('DELETE FROM enrollment WHERE id="%s";',eid)
                result=yield databaseUtils.executeQuery(query)
                console.log(query,result)
                // query=util.format('UPDATE student SET active="0" where id="%s";',sid)
                // result=yield databaseUtils.executeQuery(query)
                // console.log(query,result)
            }
        }
        this.redirect('/deregister-student')
    },

    showNewExamForm:function*(next){
        console.log()
        yield this.render('teacher_create_exam',{
            'currentUser':this.currentUser
        })
    },

    showFeeStatus:function*(next){
        var query=util.format('SELECT student.name, fee_status.id as fid, jan, feb, mar, apr, may, jun, jul, aug, sep, oct, nov, decem FROM fee_status JOIN enrollment ON enrollment.id=fee_status.enrol_id JOIN student ON student.id=enrollment.stu_id WHERE enrollment.course_id=1 AND student.active=1 ORDER BY student.name;')
        var accFees=yield databaseUtils.executeQuery(query)

        query=util.format('SELECT student.name, fee_status.id as fid, jan, feb, mar, apr, may, jun, jul, aug, sep, oct, nov, decem FROM fee_status JOIN enrollment ON enrollment.id=fee_status.enrol_id JOIN student ON student.id=enrollment.stu_id WHERE enrollment.course_id=2 AND student.active=1 ORDER BY student.name;')
        var ecoFees=yield databaseUtils.executeQuery(query)

        query=util.format('SELECT student.name, fee_status.id as fid, jan, feb, mar, apr, may, jun, jul, aug, sep, oct, nov, decem FROM fee_status JOIN enrollment ON enrollment.id=fee_status.enrol_id JOIN student ON student.id=enrollment.stu_id WHERE enrollment.course_id=3 AND student.active=1 ORDER BY student.name;')
        var bsFees=yield databaseUtils.executeQuery(query)

        query=util.format('SELECT student.name, fee_status.id as fid, jan, feb, mar, apr, may, jun, jul, aug, sep, oct, nov, decem FROM fee_status JOIN enrollment ON enrollment.id=fee_status.enrol_id JOIN student ON student.id=enrollment.stu_id WHERE enrollment.course_id=4 AND student.active=1 ORDER BY student.name;')
        var engFees=yield databaseUtils.executeQuery(query)

        yield this.render('teacher_fee_status',{
            'currentUser':this.currentUser,
            'accFees':accFees,
            'ecoFees':ecoFees,
            'bsFees':bsFees,
            'engFees':engFees
        })
    },

    updateFeeStatus:function*(next){
        var month=this.request.body.month
        var fid=this.request.body.fid
        var result=''
        var query=''
        if(typeof fid==typeof 'string'){
            query=util.format('UPDATE fee_status SET %s=1 WHERE id="%s"',month,fid)
            result=yield databaseUtils.executeQuery(query)
            console.log("INSIDE IF",query,result)
        }else{
            for(var i=0;i<fid.length;i++){
                query=util.format('UPDATE fee_status SET %s=1 WHERE id="%s"',month,fid[i])
                result=yield databaseUtils.executeQuery(query)
                console.log("INSIDE ELSE",query,result)
            }
        }
        this.redirect('/admin-fee-status')
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
        var email_id=this.request.body.email_id
        var school=this.request.body.phone
        var joiningdate=this.request.body.joiningdate
        var address=this.request.body.address
        var password=this.request.body.password

        var query=util.format('INSERT INTO student(name,mobile,email_id,password,address,joining_date,school,parent,active)VALUES ("%s","%s","%s","%s","%s","%s","%s","%s","1");',studentname,phone,email_id,password,address,joiningdate,school,fathername);
        console.log("query",query)
        var result=yield databaseUtils.executeQuery(query)
        console.log("RESULT",result)
        var stu_id=result.insertId;
        if(this.request.body.bs){
            query=util.format('insert into enrollment(stu_id,course_id)values("%s","3")',stu_id)
            result=yield databaseUtils.executeQuery(query)
            query=util.format('insert into fee_status(enrol_id)values("%s")',result.insertId)
            result=yield databaseUtils.executeQuery(query)
        }
        if(this.request.body.accounts){
            query=util.format('insert into enrollment(stu_id,course_id)values("%s","1")',stu_id)
            result=yield databaseUtils.executeQuery(query)
            query=util.format('insert into fee_status(enrol_id)values("%s")',result.insertId)
            result=yield databaseUtils.executeQuery(query)
        }
        if(this.request.body.economics){
            query=util.format('insert into enrollment(stu_id,course_id)values("%s","2")',stu_id)
            result=yield databaseUtils.executeQuery(query)
            query=util.format('insert into fee_status(enrol_id)values("%s")',result.insertId)
            result=yield databaseUtils.executeQuery(query)
        }
        if(this.request.body.english){
            query=util.format('insert into enrollment(stu_id,course_id)values("%s","4")',stu_id)
            result=yield databaseUtils.executeQuery(query)
            query=util.format('insert into fee_status(enrol_id)values("%s")',result.insertId)
            result=yield databaseUtils.executeQuery(query)
        }
        this.redirect('/admin')
    },

    createNewExam:function*(next){
        console.log(this.request.body)
        var query=util.format('INSERT INTO test (test_date, batch_time, test_time, course_id, max_marks) VALUES ("%s","%s","%s","%s","%s");',this.request.body.testDate, this.request.body.batchtime, this.request.body.testtime, this.request.body.courseId, this.request.body.maxMarks)
        var result=yield databaseUtils.executeQuery(query)
        console.log(result)
        console.log(111111111)
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
    },

    
}