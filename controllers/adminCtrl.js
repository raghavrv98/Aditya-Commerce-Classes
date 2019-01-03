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
    }
}