#设置客户端连接的编码kk
SET NAMES UTF8;
#丢弃数据库
DROP DATABASE IF EXISTS perfume;
#创建数据库
CREATE DATABASE perfume CHARSET=UTF8;
#进入该数据库
USE perfume;

##################################################

#创建用户数据表  个人中心
CREATE TABLE pf_login(
	id INT AUTO_INCREMENT UNIQUE,
  uname CHAR(32),
  upwd CHAR(32)
  # md5()  单向加密没有解密算法 32位
);

#往用户数据表插入数据（定义向前台传递的接口）
INSERT INTO pf_login VALUES('1','tom','12138');
INSERT INTO pf_login VALUES(NULL,'jerry','12138');


#搞一个商品数据表
CREATE TABLE pf_product(
id INT PRIMARY KEY AUTO_INCREMENT,
uid INT,   #商品id
name VARCHAR(64),
ad  VARCHAR(64),
price DECIMAL(10,2),   
sell INT,
img VARCHAR(60)
);

#往商品数据表插入数据（定义向前台传递的接口）
INSERT INTO pf_product VALUES(null,1,'西柚芝士茉香茶','大气，成熟，老故事的感觉','18.36','999','http://localhost:8000/2cy4.jpg');
INSERT INTO pf_product VALUES(null,2,'西柚芝士茉香茶','大气，成熟，老故事的感觉','18.36','999','http://localhost:8000/2cy5.jpg');
INSERT INTO pf_product VALUES(null,3,'陨石拿铁','大气，成熟，老故事的感觉','18.36','999','http://localhost:8000/2cy3.jpg');
INSERT INTO pf_product VALUES(null,4,'桃桃芝士红宝石茶','大气，成熟，老故事的感觉','18.36','999','http://localhost:8000/2cy2.jpg');
INSERT INTO pf_product VALUES(null,5,'香草拿铁','大气，成熟，老故事的感觉','18.36','999','http://localhost:8000/2cy1.jpg');
INSERT INTO pf_product VALUES(null,6,'香草拿铁','大气，成熟，老故事的感觉','18.36','999','http://localhost:8000/fj4.jpg');
INSERT INTO pf_product VALUES(null,7,'香草拿铁','大气，成熟，老故事的感觉','18.36','999','http://localhost:8000/fj2.jpg');
INSERT INTO pf_product VALUES(null,8,'香草拿铁','大气，成熟，老故事的感觉','18.36','999','http://localhost:8000/fj1.jpg');
INSERT INTO pf_product VALUES(null,9,'香草拿铁','大气，成熟，老故事的感觉','18.36','999','http://localhost:8000/fj0.jpg');
INSERT INTO pf_product VALUES(null,10,'香草拿铁','大气，成熟，老故事的感觉','18.36','999','http://localhost:8000/2cy4.jpg');
INSERT INTO pf_product VALUES(null,11,'香草拿铁','大气，成熟，老故事的感觉','18.36','999','http://localhost:8000/2cy4.jpg');
INSERT INTO pf_product VALUES(null,12,'香草拿铁','大气，成熟，老故事的感觉','18.36','999','http://localhost:8000/2cy4.jpg');