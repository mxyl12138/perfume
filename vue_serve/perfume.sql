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