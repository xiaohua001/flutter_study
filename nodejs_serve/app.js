


var express = require('express');

var app=express();
var router=express.Router();
var bodyParser = require('body-parser');
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));
var multiparty = require('multiparty');
/*express允许跨域*/

app.all('*', function(req, res, next) {
    res.header("Access-Control-Allow-Origin", "*");
    res.header("Access-Control-Allow-Headers", "Content-Type,Content-Length, Authorization, Accept,X-Requested-With");
    res.header("Access-Control-Allow-Methods","PUT,POST,GET,DELETE,OPTIONS");
    res.header("X-Powered-By",' 3.2.1')
    if(req.method=="OPTIONS") res.send(200);
    else  next();
});




//app.use(express.static(path.join(__dirname, 'public')));

app.get('/',function(req,res){

	 res.send('首页');

})

app.post('/dologin',function(req,res){

	console.log(req.body);

 	res.json({"msg":'post成功'});



})

app.get('/news',function(req,res){

	//console.log(req.body);
	res.jsonp({"msg":'这是新闻数据'});

})
app.get('/userList',function(req,res){

     res.send({"result":[{"name":"张三","age":12},{"name":"李四","age":13},{"name":"王五","age":14}]});
})
//给编辑器提供的上传图片的接口
router.post('/imgupload',function(req,res){
    
    console.log('imgupload');

    var form = new multiparty.Form();
    form.uploadDir='public/upload'  /*设置图片上传的路径*/

    form.parse(req, function(err, fields, files) {

		console.log(files); //文件

		console.log(fields); //post数据

        var path="/"+files.file[0].path;

        res.json({"success":"ok","path":path})  /*给编辑器返回地址信息*/

    });
})

 app.listen(3000,'127.0.0.1');
//app.listen(3000,'0.0.0.0');
