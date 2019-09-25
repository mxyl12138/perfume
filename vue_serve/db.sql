#db.sql 创建表添加数据
#学子商城 mintui版本

#功能一:创建表xz_login 用户登录表
USE xz;

#功能二:添加二条测试数据 
INSERT INTO xz_login VALUES(null,'tom',md5('123'));
INSERT INTO xz_login VALUES(null,'jerry',md5('123'));

###功能商品添加
#功能三:向商品表中添加一列 img_url
USE xz;
ALTER TABLE xz_laptop ADD img_url VARCHAR(255);
#更新商品表图片 01.jpg 02.jpg
UPDATE xz_laptop SET img_url='lbt1.png'
WHERE lid = 1;
UPDATE xz_laptop SET img_url='lbt2.png'
WHERE lid = 2;
UPDATE xz_laptop SET img_url='lbt3.png'
WHERE lid = 3;
UPDATE xz_laptop SET img_url='bg4.jpg'
WHERE lid > 3;

#将商品表 img_url 一列删除
ALTER TABLE `xz_laptop` DROP `img_url`;

#DECIMAL=>高精度浮点数
CREATE TABLE xz_cart(
  id INT PRIMARY KEY AUTO_INCREMENT,
  lid INT,
  price DECIMAL(10,2),
  count INT,
  lname VARCHAR(255),
  uid  INT
);


#往xz_laptop插入商品二十列数据
INSERT INTO `xz_laptop` VALUES ('1', '1', 'Apple MacBook Air 13.3英寸笔记本 银色(Core i5 处理器/8GB内存/128GB SSD闪存 MMGF2CH/A)', '5月焕新季，领券买新机！神券满6000减600！一体成型金属机身，纤薄轻巧，长达12小时续航', '6988.00', '*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货', '双核i5/8GB内存/128GB闪存', 'AppleMacBook Air', 'MacOS', '8G', '1920*1080', '集成显卡', 'Intel i5低功耗版', '其它', '轻薄本', '128G固态', '000', '150123456789', '2968', '1');
