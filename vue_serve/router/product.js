//创建express模块
const express = require('express');
//express下创建用户路由器    
const product = express.Router();
const pool=require("../app.js")

product.get("/product",(req,res)=>{
  var id = req.query.id;
  
  // var sql = "SELECT uid,name,ad,price,sell,img from pf_product";
  var sql="select * from pf_product where id=?"
  // sql += "WHERE id = ?";
  pool.query(sql,[id],(err,result)=>{
    if (err) throw err;
    res.send({
      code: 1,msg: "查询成功",data:result
    })
  })
})

module.exports = product;