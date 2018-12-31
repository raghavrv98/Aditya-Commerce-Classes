module.exports = {
    showHome: function* (next) {
        yield this.render('index', {});
    }
}