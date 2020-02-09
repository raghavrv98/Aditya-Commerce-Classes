var util = require('util')
var databaseUtils = require('./../utils/databaseUtils')
var sessionUtils = require('./../utils/sessionUtils')
var mailUtils = require('./../utils/mailUtils')
module.exports = {
    showHome: function* (next) {
        if (!this.currentUser) {
            yield this.render('index', {
                'currentUser': this.currentUser
            })
        } else if (this.currentUser.isAdmin) {
            this.redirect('/admin')
        } else {
            this.redirect('/student')
        }
    },

    showScholarshipRegistrationForm: function* (next) {
        yield this.render('scholarship_registration_form');
    },

    showRegistrationSuccessfull: function* (next) {
        yield this.render('registration_successfull');
    },

    scholarshipTestInstructions: function* (next) {
        yield this.render('scholarship_test_instructions');
    },

    scholarshipTest: function* (next) {
        yield this.render('scholarship_test');
    },
    scholarshipTestSubmission: function* (next) {
        yield this.render('scholarship_test_submission');
    },
    
    login: function* (next) {
        var mobile = this.request.body.userid
        var password = this.request.body.password
        console.log('password: ', password);
        // var query = util.format("select * from student where mobile=%s", mobile)
        var query = util.format("select * from student inner join enrollment on student.id=enrollment.stu_id where student.mobile=%s", mobile)
        var result = yield databaseUtils.executeQuery(query)
        console.log('query: ', query);
        var user = result[0]
        console.log('user: ', user);
        if (user && password === user.password && user.active == 1) {
            user["isAdmin"] = false
            sessionUtils.saveUserInSession(user, this.cookies)
            this.redirect('/student')
        } else {
            query = util.format("select * from super_user where mobile=%s", mobile)
            result = yield databaseUtils.executeQuery(query)
            user = result[0]
            console.log('superuser: ', user);
            if (user && password === user.password) {
                user["isAdmin"] = true
                sessionUtils.saveUserInSession(user, this.cookies)
                this.redirect('/admin')
            } else {
                this.redirect('/')
            }
        }

    },
    changePassword: function* (next) {
        var oldp = this.request.body.oldp
        var newp = this.request.body.newp



        var query = util.format('select password from super_user where password="%s"', oldp)
        var result = yield databaseUtils.executeQuery(query)
        var user = result[0]


        if (user && oldp === user.password) {

            user["isAdmin"] = true


            var queryp = util.format('update super_user set password="%s" where password="%s"', newp, oldp)

            var resultp = yield databaseUtils.executeQuery(queryp)

            sessionUtils.saveUserInSession(user, this.cookies)


            this.redirect('/admin')
        } else {
            query = util.format('select password from student where password="%s"', oldp)
            result = yield databaseUtils.executeQuery(query)
            user = result[0]


            if (user && oldp === user.password) {
                user["isAdmin"] = false


                var queryp = util.format('update student set password="%s" where password="%s"', newp, oldp)
                var resultp = yield databaseUtils.executeQuery(queryp)
                sessionUtils.saveUserInSession(user, this.cookies)
                this.redirect('/student')
            } else {
                this.redirect('/')
            }
        }

    },

    logout: function* (next) {
        var sessionId = this.cookies.get("SESSION_ID");
        if (sessionId) {
            sessionUtils.deleteSession(sessionId);
        }
        this.cookies.set("SESSION_ID", '', {
            expires: new Date(1),
            path: '/'
        });
        this.redirect('/')
    },
    forgotPassword: function* (next) {
        var userEmail = this.request.body.email
        var userMobile = this.request.body.mobile
        var query = util.format('select email,mobile,password from student where mobile="%s"', userMobile)
        var result = yield databaseUtils.executeQuery(query)
        var isMatch = false;
        if (result.length == 1) {
            if (result[0].email == userEmail && result[0].mobile == userMobile) {
                mailUtils.sendMail(userEmail, 'Password@Aditya Classes', "Your password is: " + result[0].password, 'text')
                isMatch = true
            }
            yield this.render('forgot_password', {
                'isMatch': isMatch
            })
        } else {
            yield this.render('forgot_password', {
                'isMatch': isMatch
            })
        }
    },

    enquiryMail: function* (next) {
        var name = this.request.body.name
        var email = this.request.body.email
        var mobile = this.request.body.phone
        var message = this.request.body.message + "\n Email:" + email + "\nMobile:" + mobile + "\nName:" + name
        mailUtils.sendMail('webadityacommerceclasses@gmail.com', "Enquiry Form", message)
        this.redirect('/')
    },

    scholarshipRegistrationFormSubmit: function* (next) {
        var name = this.request.body.name
        var school = this.request.body.school
        var grade = this.request.body.grade
        var subject = this.request.body.subject
        var fName = this.request.body.fatherName
        var mName = this.request.body.motherName
        var cNumber = this.request.body.cNumber
        var wNumber = this.request.body.wNumber
        var address = this.request.body.address
        var email = this.request.body.email
        var message = "Student's name : " + name +
            "\nName of the present school : " + school +
            "\nCurrent class of the student : " + grade +
            "\nSubject for Test : " + subject +
            "\nFather's name : " + fName +
            "\nMother's name : " + mName +
            "\nContact no.: " + cNumber +
            "\nWhatsapp no. : " + wNumber +
            "\nAddress : " + address +
            "\nEmail Id : " + email
        mailUtils.sendMail('webadityacommerceclasses@gmail.com', "Registration Successfull", message)
        mailUtils.sendMail(email, "Confirmation of applicant ", "Thank you for your registration. Test Date is March 15,2020.")
        this.redirect('/registration-successfull')
    },

    scholarshipTestRegistrationSubmit: function* (next) {
        var name = this.request.body.name
        var school = this.request.body.school
        var grade = this.request.body.grade
        var subject = this.request.body.subject
        var fName = this.request.body.fatherName
        var mName = this.request.body.motherName
        var cNumber = this.request.body.cNumber
        var wNumber = this.request.body.wNumber
        var address = this.request.body.address
        var email = this.request.body.email
        var message = "Student's name : " + name +
            "\nName of the present school : " + school +
            "\nCurrent class of the student : " + grade +
            "\nSubject for Test : " + subject +
            "\nFather's name : " + fName +
            "\nMother's name : " + mName +
            "\nContact no.: " + cNumber +
            "\nWhatsapp no. : " + wNumber +
            "\nAddress : " + address +
            "\nEmail Id : " + email
        mailUtils.sendMail('webadityacommerceclasses@gmail.com', "Test registration successfull for " + name, message)
        this.redirect('/scholarship-test')
    }

}