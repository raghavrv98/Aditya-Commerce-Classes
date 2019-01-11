var nodemailer=require('nodemailer');

module.exports={
    sendMail:function(receiver,subject,msg,msgType='text'){
    var transporter=nodemailer.createTransport({
        service:'gmail',
        auth:{
            user:'agrawalraghav669@gmail.com',
            pass:'QWERTYzxc'
        }
    });

    if(msgType==='html'){
        var mailOptions={
            from:receiver,
            to:'agrawalraghav669@gla.ac.in',
            subject:subject,
            html:msg
        }
    }
    else{
        var mailOptions={
            from:receiver,
            to:'agrawalraghav669@gla.ac.in',
            subject:subject,
            text:msg
        }

    }

    transporter.sendMail(mailOptions,function(err,info){
        if(err)
            console.log(err)
        else
            console.log(info)
    });
  }
}