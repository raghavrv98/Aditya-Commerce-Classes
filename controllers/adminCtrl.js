module.exports = {
    showDashboard: function* (next) {
        yield this.render('index', {});
    }
}