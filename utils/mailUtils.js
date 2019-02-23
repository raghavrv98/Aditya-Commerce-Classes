var nodemailer=require('nodemailer');

module.exports={
    sendMail:function(receiver,subject,msg,msgType='text'){
    var transporter=nodemailer.createTransport({
        service:'Gmail',
        auth:{
            user:'adityacommerceclasses@gmail.com',
            pass:'adityaayushijiya'
        }
    });

    if(msgType==='html'){
        var mailOptions={
            from:'adityacommerceclasses@gmail.com',
            to:receiver,
            subject:subject,
            html:msg
        }
    }
    else{
        var mailOptions={
            from:'adityacommerceclasses@gmail.com',
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