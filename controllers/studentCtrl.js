module.exports = {
    showDashboard: function* (next) {
        yield this.render('student_dashboard', {});
    }
}