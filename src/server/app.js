var express=require('express');
var app=express();
var conn=require('./module/connmysql');
var session=require("express-session");
 app.use(session({'secret':'wy'}));
// var imgCode=require('./modules/imgCode');
var md5=require('./module/md5');
var bodyParser=require('body-parser');
var urlencode=bodyParser.urlencoded();


app.get('/getCode',(request,response)=>{
    response.writeHead(200,{
        'content-type':'text/html;charset=utf-8',
        'Access-Control-Allow-Origin':'*'
    });
   
   var svg=imgCode(request,response);
   request.session.code=svg[1];
   response.end(JSON.stringify(svg));
   
});

//请求验证码
app.get('/getCode',(request,response)=>{
    response.writeHead(200,{
        'content-type':'text/html;charset=utf-8',
        'Access-Control-Allow-Origin':'*'
    });
   var svg=imgCode(request,response);
   request.session.code=svg[1];
   response.end(JSON.stringify(svg));
   
});
//验证码是否正确
app.post('/defCode',urlencode,(request,response)=>{
    response.writeHead(200,{
        'content-type':'text/html;charset=utf-8',
        'Access-Control-Allow-Origin':'*',
        "Access-Control-Allow-Credentials": "true"    
    });
    request.body.trueCode==request.session.code ?  response.end('true') :  response.end('false');
});



//验证用户名密码是否正确
app.post('/login',urlencode,(request,response)=>{
    response.writeHead(200,{
        'content-type':'text/html;charset=utf-8',
        'Access-Control-Allow-Origin':'*',
        // "Access-Control-Allow-Credentials": "true"    
    });
    // if(request.method.toLocaleLowerCase() === 'options'){
    //     request.send()
    // }
    // console.log(23232)
    // console.log(request.body);
    // response.end('收到')
    // console.log("login");
    // response.end('5666')
    console.log(request.body);
    // console.log(request.body)
    var name=request.body.user;
    console.log(name);
    // console.log(conn)
    // var password=request.query.checkPass;
    var password=request.body.pass;
    //链接数据库
    var sql= 'select * from login where admin="'+name+'" and pass="'+password+'"';
     conn.query(sql,(err,result)=>{
        //   console.log(err)
         result.length!=0?response.end('success'): response.end('erro');
        // console.log(result);
        // response.end(result)
     })

});


//修改密码
app.post('/personData',urlencode,(request,response)=>{
    response.writeHead(200,{
        'content-type':'text/html;charset=utf-8',
        'Access-Control-Allow-Origin':'*',
    });
    var name =  request.body.name;
    var pass =  request.body;
    var sql = 'update login set pass="'+pass+'" where name="'+name+'"';
    conn.query(sql,(err,result)=>{
         response.end(JSON.stringify(result));
    })


});


// app.post('/resetname',(request,response)=>{
//     response.writeHead(200,{
//         'content-type':'text/html;charset=utf-8',
//         'Access-Control-Allow-Origin':'*',
//     });
//     // update MyGuests set name='Mary' where id=1
//      var  name = request.query.name;
//      var  password=request.query.password;
//     var sql =' update login set pass="'+"123"+'" where name="'+'老王'+'"';
//     conn.query(sql,(err,result)=>{
//          response.end('a')
//     })

   

// });

//获取商品列表
app.get('/productlist',urlencode,(request,response)=>{
    response.writeHead(200,{
        'content-type':'text/html;charset=utf-8',
        'Access-Control-Allow-Origin':'*',
    });
    
    var sql='select * from productlist ';
    conn.query(sql,(err,result)=>{
        response.end(JSON.stringify(result));
    })


});

//获取分类信息
app.get('/fenlei',(request,response)=>{
    response.writeHead(200,{
        'content-type':'text/html;charset=utf-8',
        'Access-Control-Allow-Origin':'*',
    });
    // var name=  request.query.name;
    var sql='select * from typelist ';
    conn.query(sql,(err,result)=>{
        response.end(JSON.stringify(result));
    })


});

//插入用户信息
//获取商品列表
app.post('/data_management',urlencode,(request,response)=>{
    response.writeHead(200,{
        'content-type':'text/html;charset=utf-8',
        'Access-Control-Allow-Origin':'*',
    });

    console.log(request.body);
    var gender = request.body.gender;
    var nickname = request.body.nickname;
    var remark = request.body.remark;
    var phone = request.body.phone;
    var email = request.body.email;
    var id = request.body.id;

   
    // var sql = 'insert into userlist (name,iphone,email,juese,status) values ("'+name+'","'+iphone+'","'+email+'","'+juese+'","'+status+'")';
    // update 表 set (字段1=值1, 字段2=值2) where 条件
    // sql =' update login set pass="'+"123"+'" where name="'+'老王'+'"';
    // var sql='insert into login(nickname,gender,phone,email,remark) values ("'+nickname+'","'+gender+'","'+phone+'","'+email+'","'+remark+'")';

    var  sql ='update login set nickname="'+nickname+'",gender="'+gender+'",phone="'+phone+'",email="'+email+'",remark="'+remark+'" where id="'+id+'"';

        conn.query(sql,(err,result)=>{
            console.log(err)
            result.length!=0?response.end('更新成功'): response.end('失败');
        })
});

//分页
app.get('/goods',(request,response)=>{
    response.writeHead(200,{
        'content-type':'text/html;charset=utf-8',
        'Access-Control-Allow-Origin':'*',
    });
    var start=request.query.start;
    var count=request.query.count;

    var sql = 'select * from goodslist  '
    conn.query(sql,(err,result)=>{
        console.log(err)
        //获取商品总数量
        var length=result.length;
        //查询商拼
        var sql='select * from goodslist order by id limit '+start+', '+count+' ';
        conn.query(sql,(err,result)=>{
              console.log(result);
              response.end(JSON.stringify(result));
        })

    })
})


//获取用户信息
app.get('/user',(request,response)=>{
    response.writeHead(200,{
        'content-type':'text/html;charset=utf-8',
        'Access-Control-Allow-Origin':'*',
    });

    console.log(request.query)
    var name=  request.query.name;
    var sql='select * from login where admin="'+name+'"';
    conn.query(sql,(err,result)=>{
        response.end(JSON.stringify(result));
    })


});
 


app.listen(8888)