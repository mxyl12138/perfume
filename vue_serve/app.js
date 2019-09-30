//app.js 服务器端项目
//1:下载第三方模块 
//express/express-session/cors/mysql
//2:将第三方模块引入到当前程序中
const express = require("express");
const session = require("express-session");
const cors = require("cors");
const mysql = require("mysql");
//3:创建数据库连接池
var pool = mysql.createPool({
  host: "127.0.0.1",
  user: "root",
  password: "",
  port: 3306,
  connectionLimit: 20,
  database: "perfume"
})
module.exports = pool

//4:创建web服务器监听 8080 端口
var server = express();
server.listen(8000);

//5:处理跨域 cors 
//5.1：配置允许访问程序地址(脚手架)
//     http://127.0.0.1:8080  (ok)
//     http://localhost:8081
//5.2:每请求是否验证true
server.use(cors({
  origin: ["http://127.0.0.1:8080", "http://localhost:8081"],
  credentials: true
}))
//6:配置session
//#session配置一定要在所有请求之前
server.use(session({
  secret: "128位字符串",    //#安全字符串
  resave: true,            //#每次请求保存数据 
  saveUninitialized: true  //#保存初始化数据
}));

//7:配置静态目录
//http://127.0.0.1:8000/2cy1.jpg
server.use(express.static("public"));

const product = require("./router/product");
server.use('/product',product)

server.get("/product",(req,res)=>{
  var id = req.query.id;
  var sql="select uid,name,ad,price,sell,img from pf_product where id=?"
  pool.query(sql,[id],(err,result)=>{
    if (err) throw err;
    res.send({
      code: 1,msg: "查询成功",data:result
    })
  })
})