var nodemailer=require('nodemailer');

module.exports={
    sendMail:function(receiver,subject,msg,msgType='text'){
        console.log('receiver,subject,msg: ', receiver,subject,msg);
    var transporter=nodemailer.createTransport({
        service:'Gmail',
        auth:{
            user:'webadityacommerceclasses@gmail.com',
            pass:'Acc!@9897165055'
        }
    });

    if(msgType==='html'){
        var mailOptions={
            from:'webadityacommerceclasses@gmail.com',
            to:receiver,
            subject:subject,
            html:msg
        }
    }
    else{
        var mailOptions={
            from:'webadityacommerceclasses@gmail.com',
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