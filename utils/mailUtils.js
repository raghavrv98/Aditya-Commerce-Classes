var nodemailer=require('nodemailer');

module.exports={
    sendMail:function(receiver,subject,msg,msgType='text'){
    var transporter=nodemailer.createTransport({
        service:'gmail',
        auth:{
            user:'agrawalraghav669@gmail.com',
            pass:'8791834907'
        }
    });

    if(msgType==='html'){
        var mailOptions={
            from:'agrawalraghav669@gla.ac.in',
            to:receiver,
            subject:subject,
            html:msg
        }
    }
    else{
        var mailOptions={
            from:'agrawalraghav669@gla.ac.in',
            to:receiver,
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