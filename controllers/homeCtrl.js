var util = require('util')
var databaseUtils = require('./../utils/databaseUtils')
var sessionUtils = require('./../utils/sessionUtils')
var mailUtils=require('./../utils/mailUtils')
var enquirymailUtils=require('./../utils/enquirymailUtils')
module.exports = {
    showHome: function* (next) {
        yield this.render('index', {
            'currentUser':this.currentUser
        })
    },

    login: function* (next) {
        var mobile = this.request.body.userid
        var password = this.request.body.password
        var query = util.format("select * from student where mobile=%s", mobile)
        var result = yield databaseUtils.executeQuery(query)
        var user = result[0]
        if (user && password === user.password && user.active==1) {
            user["isAdmin"] = false
            sessionUtils.saveUserInSession(user, this.cookies)
            this.redirect('/student')
        } else {
            query = util.format("select * from super_user where mobile=%s", mobile)
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

    },
    changePassword: function* (next) {
        var oldp = this.request.body.oldp
        var newp = this.request.body.newp
        console.log(oldp);
        console.log(newp);
        
        var query = util.format('select password from super_user where password="%s"',oldp)
        var result = yield databaseUtils.executeQuery(query)
        var user = result[0]
        console.log(user);

        if (user && oldp === user.password) {
            console.log(1111111111);
            user["isAdmin"] = true
            console.log("admin");
            
            var queryp = util.format('update super_user set password="%s" where password="%s"',newp,oldp)
            console.log(queryp);
            var resultp = yield databaseUtils.executeQuery(queryp)
            console.log(resultp);
            sessionUtils.saveUserInSession(user, this.cookies)
            console.log("yahan par aagya hai");
            
            this.redirect('/admin')
        } else {
            query = util.format('select password from student where password="%s"',oldp)
            result = yield databaseUtils.executeQuery(query)
            user = result[0]
            console.log(user);
        
            if (user && oldp === user.password) {
                user["isAdmin"] = false
                console.log("student");
                
                var queryp = util.format('update student set password="%s" where password="%s"',newp,oldp)
                var resultp = yield databaseUtils.executeQuery(queryp)
                sessionUtils.saveUserInSession(user, this.cookies)
                this.redirect('/student')
            } else {
                this.redirect('/')
            }
        }

    },

    logout: function*(next){
        var sessionId = this.cookies.get("SESSION_ID");
		if (sessionId) {
			sessionUtils.deleteSession(sessionId);
		}
        this.cookies.set("SESSION_ID", '', { expires: new Date(1), path: '/' });
        this.redirect('/')
    },
    forgotPassword:function*(next){
        var userEmail=this.request.body.email
        var userMobile=this.request.body.mobile
        var query=util.format('select email_id,mobile,password from student where email_id="%s"',userEmail)
        var result=yield databaseUtils.executeQuery(query)
        var isMatch=false;
        if(result[0].email_id==userEmail && result[0].mobile==userMobile){
            mailUtils.sendMail(userEmail,'Password@Aditya Classes',"Your password is: "+result[0].password,'text')
            isMatch=true
        }
        yield this.render('forgot_password',{
            'isMatch':isMatch
        })
    },
    
    enquiryMail:function*(next){
        var firstname=this.request.body.firstname
        var lastname=this.request.body.lastname
        var email=this.request.body.email
        var mobile=this.request.body.mobile
        var message=this.request.body.message

            enquirymailUtils.sendMail(email,'Enquiry for classes',"My name is :"+firstname+" "+lastname+"\n"+"My mobile no. is :"+mobile+"\n"+message,)
        
        yield this.render('/')
    }    
    
}