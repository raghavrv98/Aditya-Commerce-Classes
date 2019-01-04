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

    createNewExam:function*(next){
        yield this.render('teacher_create_exam',{
            'currentUser':this.currentUser
        })
    },

    showFeeStatus:function*(next){
        yield this.render('teacher_fee_status',{
            'currentUser':this.currentUser
        })
    },

    showResult:function*(next){
        yield this.render('teacher_test_result',{
            'currentUser':this.currentUser
        })
    },

    updateTimeTable:function*(next){
        yield this.render('teacher_timetable',{
            'currentUser':this.currentUser
        })
    },

    updateSyllabus:function*(next){
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
    }
}