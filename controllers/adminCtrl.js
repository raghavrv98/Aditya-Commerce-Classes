module.exports = {
    showDashboard: function* (next) {
        yield this.render('teacher_dashboard', {});
    }
}