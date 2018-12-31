var util = require('util')
var databaseUtils = require('./../utils/databaseUtils')
var sessionUtils = require('./../utils/sessionUtils')

module.exports = {
    showHome: function* (next) {
        yield this.render('index', {})
    },

    login: function* (next) {
        var mobile = this.request.body.userid
        var password = this.request.body.password
        console.log(mobile, password)
        var query = util.format("select * from student where mobile=%s", mobile)
        var result = yield databaseUtils.executeQuery(query)
        var user = result[0]
        if (user && password === user.password) {
            user["isAdmin"] = false
            sessionUtils.saveUserInSession(user, this.cookies)
            this.redirect('/student')
        } else {
            query = util.format("select * from admin where mobile=%s", mobile)
            result = yield databaseUtils.executeQuery(query)
            user = result[0]
            if (user && password === user.password) {
                user["isAdmin"] = true
                sessionUtils.saveUserInSession(user, this.cookies)
                this.redirect('/admin')
            } else {
                this.redirect('/')
            }
        }

    }
}