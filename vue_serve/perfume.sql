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


#搞一个分类页面商品数据表
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

#搞一个首页商品数据表
CREATE TABLE pf_product2(
id INT PRIMARY KEY AUTO_INCREMENT,
uid INT,   #商品id
name VARCHAR(64),
ad  VARCHAR(64),
price DECIMAL(10,2),   
sell INT,
url VARCHAR(60)
);

#往商品数据表插入数据（定义向前台传递的接口）
INSERT INTO pf_product2 VALUES(null,1,'试香 YSL/圣罗兰 黑鸦片','大气，成熟，老故事的感觉','12.00','51','http://localhost:8000/lbt1.jpg');
INSERT INTO pf_product2 VALUES(null,2,'试香 芦丹氏 柏林少女','大气，成熟，老故事的感觉','5.00','12','http://localhost:8000/lbt2.jpg');
INSERT INTO pf_product2 VALUES(null,3,'试香 阿蒂仙 冥府之路','大气，成熟，老故事的感觉','98.00','39','http://localhost:8000/lbt3.jpg');
INSERT INTO pf_product2 VALUES(null,4,'试香 三宅一生 一生之水','大气，成熟，老故事的感觉','36.00','54','http://localhost:8000/lbt4.jpg');
INSERT INTO pf_product2 VALUES(null,5,'试香 百瑞德 无人区玫瑰 Byredo Rose Of No Man’s Land','大气，成熟，老故事的感觉','36.00','51','http://localhost:8000/lbt5.jpg');
INSERT INTO pf_product2 VALUES(null,6,'试香 古驰 绽放','大气，成熟，老故事的感觉','8.00','552','http://localhost:8000/lbt1.jpg');
INSERT INTO pf_product2 VALUES(null,7,'试香 祖马龙 英国梨和小苍兰','大气，成熟，老故事的感觉','36.00','51','http://localhost:8000/lbt6.jpg');
INSERT INTO pf_product2 VALUES(null,8,'试香 桃丝熊 淘气小熊宝宝','大气，成熟，老故事的感觉','1.00','685','http://localhost:8000/lbt1.jpg');
INSERT INTO pf_product2 VALUES(null,9,'试香 Burberry/巴宝莉 红粉恋歌','大气，成熟，老故事的感觉','25.00','5534','http://localhost:8000/lbt2.jpg');
INSERT INTO pf_product2 VALUES(null,10,'试香 Juicy/橘滋 脏话男士','大气，成熟，老故事的感觉','36.00','1534','http://localhost:8000/lbt3.jpg');
INSERT INTO pf_product2 VALUES(null,11,'试香 Creed/信仰 银色山泉','大气，成熟，老故事的感觉','89.00','2551','http://localhost:8000/lbt4.jpg');
INSERT INTO pf_product2 VALUES(null,12,'试香 Bvlgari/宝格丽白茶','大气，成熟，老故事的感觉','1236.00','6351','http://localhost:8000/lbt5.jpg');
INSERT INTO pf_product2 VALUES(null,13,'试香 Kenzo/高田贤三风之恋','大气，成熟，老故事的感觉','326.00','521','http://localhost:8000/lbt6.jpg');
INSERT INTO pf_product2 VALUES(null,14,'试香 Diptyque/蒂普提克 东京柑橘','大气，成熟，老故事的感觉','36.00','510','http://localhost:8000/lbt1.jpg');
INSERT INTO pf_product2 VALUES(null,15,'试香 欧珑 无极乌龙 Atelier Cologne','大气，成熟，老故事的感觉','36.00','351','http://localhost:8000/lbt2.jpg');
INSERT INTO pf_product2 VALUES(null,16,'试香 爱马仕 地中海花园','大气，成熟，老故事的感觉','96.00','451','http://localhost:8000/lbt3.jpg');
INSERT INTO pf_product2 VALUES(null,17,'试香 FM 一轮玫瑰','大气，成熟，老故事的感觉','16.00','851','http://localhost:8000/lbt4.jpg');
INSERT INTO pf_product2 VALUES(null,18,'试香 Ck one','大气，成熟，老故事的感觉','866.00','151','http://localhost:8000/lbt5.jpg');
INSERT INTO pf_product2 VALUES(null,19,'试香 宝格丽 绿茶','大气，成熟，老故事的感觉','36.00','31','http://localhost:8000/lbt6.jpg');
INSERT INTO pf_product2 VALUES(null,20,'试香 维多利亚秘密 性感炸弹','大气，成熟，老故事的感觉','36.00','51','http://localhost:8000/lbt1.jpg');
INSERT INTO pf_product2 VALUES(null,21,'试香 Clean/洁净 雨后','大气，成熟，老故事的感觉','126.00','51','http://localhost:8000/lbt2.jpg');
INSERT INTO pf_product2 VALUES(null,22,'试香 4711 白桃与芫荽','大气，成熟，老故事的感觉','536.00','11','http://localhost:8000/lbt3.jpg');
INSERT INTO pf_product2 VALUES(null,23,'试香 Loewe 事后清晨','大气，成熟，老故事的感觉','336.00','81','http://localhost:8000/lbt4.jpg');


