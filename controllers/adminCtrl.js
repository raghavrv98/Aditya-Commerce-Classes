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
    }
}