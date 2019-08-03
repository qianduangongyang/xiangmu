//引入express
const express=require("express");
//引入body-parser
const bodyParser=require("body-parser");
//创建web服务器
var server=express();
//设置端口
server.listen(8080);
//托管静态资源到public
server.use( express.static("user/zhuce") )
server.use( express.static("user/denglu") )
server.use( express.static("mypro") )
//使用body-parser中间件,将post请求的数据格式化为对象
server.use( bodyParser.urlencoded({
	extended:false
}));

//引入路由器
const userRouter=require("./routes/user.js");


//使用路由器
//参数1 使用url :/user
//  /user/login
server.use("/user",userRouter);