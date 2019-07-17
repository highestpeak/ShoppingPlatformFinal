drop database if EXISTS  shopping_platform;
CREATE database shopping_platform;
use shopping_platform;

-- 用户基本信息

DROP TABLE IF EXISTS `user`; -- 用户表
DROP TABLE IF EXISTS `admin`; -- 管理员表
DROP TABLE IF EXISTS `buyer`; -- 买家表
DROP TABLE IF EXISTS `seller`; -- 卖家表

CREATE TABLE `user` (
  `user_id` varchar(36) NOT NULL PRIMARY KEY,-- 32+4多四位
  `verify` varchar(16) NOT NULL CHECK(length(verify)>=6),-- 16位以下,6位以上
  `sex` BOOLEAN,
  `name` varchar(36),
  `email` varchar(320) NOT NULL,
  `identity` varchar(20),
  `create_time` varchar(19) NOT NULL, -- 20191212-110211
  `update_time` varchar(19) NOT NULL
);

CREATE TABLE `admin` (
  `user_id` varchar(36) NOT NULL PRIMARY KEY,
  `avator_url` TEXT,
  `note` varchar(260),
  `create_time` varchar(19) NOT NULL,
  `update_time` varchar(19) NOT NULL
);

CREATE TABLE `buyer` (
  `user_id` varchar(36) NOT NULL PRIMARY KEY,
  `nickname`varchar(36),
  `avator_url` TEXT,
  `bank_card` varchar(36),
  `create_time` varchar(19) NOT NULL,
  `update_time` varchar(19) NOT NULL
);

CREATE TABLE `seller` (
  `user_id` varchar(36) NOT NULL PRIMARY KEY,
  `nickname`varchar(36),
  `avator_url` TEXT,
  `bank_card` varchar(36),
  `create_time` varchar(19) NOT NULL,
  `update_time` varchar(19) NOT NULL
);
-- null值    ''空值   正常值

insert INTO user VALUES('123456','000000',TRUE ,NULL,'123@163.com','admin',
                        date_format(NOW(),'%Y%m%d-%H%i%s'),date_format(NOW(),'%Y%m%d-%H%i%s'));
insert INTO user VALUES('654321','000000',FALSE,'','','buyer',
                        date_format(NOW(),'%Y%m%d-%H%i%s'),date_format(NOW(),'%Y%m%d-%H%i%s'));
insert INTO user VALUES('142536','000000',NULL ,'hello','321@163.com','seller',
                        date_format(NOW(),'%Y%m%d-%H%i%s'),date_format(NOW(),'%Y%m%d-%H%i%s'));
insert INTO admin VALUES('123456','https://www.google.com/','this is a note',
                         date_format(NOW(),'%Y%m%d-%H%i%s'),date_format(NOW(),'%Y%m%d-%H%i%s'));
insert INTO buyer VALUES('654321','monkey','https://www.google.com/','9999888877776666',
                         date_format(NOW(),'%Y%m%d-%H%i%s'),date_format(NOW(),'%Y%m%d-%H%i%s'));
insert INTO seller VALUES('142536','monkey','https://www.google.com/','9999888877776666',
                          date_format(NOW(),'%Y%m%d-%H%i%s'),date_format(NOW(),'%Y%m%d-%H%i%s'));

-- 用户基本信息 end

-- 商品基本信息
DROP TABLE IF EXISTS `store`; --
DROP TABLE IF EXISTS `goods`; --
DROP TABLE IF EXISTS `goods_classify`;
DROP TABLE IF EXISTS `belongsTo`;
CREATE TABLE `store` (
  `store_id` varchar(36) NOT NULL PRIMARY KEY,-- 32+4多四位
  `note` TEXT,
  `store_pic_url` TEXT,-- 16位以下,6位以上
  `store_classify` varchar(36),-- classify的name

  `level` varchar(36),--
  `certification` varchar(36),-- classify的name
  `create_time` varchar(19) NOT NULL, -- 20191212-110211
  `update_time` varchar(19) NOT NULL
);

CREATE TABLE `goods` (
  `goods_id` varchar(36) NOT NULL PRIMARY KEY,-- 32+4多四位
  `store_id` varchar(36) NOT NULL,-- 16位以下,6位以上
  `pic_url` TEXT,
  `classify_id` varchar(36),-- classify的name
  `classify_name` varchar(36),-- classify的name

  `status` varchar(20),
  `old_level` varchar(20),
  `create_time` varchar(19) NOT NULL, -- 20191212-110211
  `update_time` varchar(19) NOT NULL
);

CREATE TABLE `goods_classify` (
  `classify_id` varchar(36) NOT NULL PRIMARY KEY,-- 32+4多四位
  `top_level_classify_id` varchar(36) NOT NULL,-- 16位以下,6位以上
  `classify_name` varchar(36),
  `create_time` varchar(19) NOT NULL, -- 20191212-110211
  `update_time` varchar(19) NOT NULL
);

CREATE TABLE `belongsTo` (
  `id` varchar(36) NOT NULL PRIMARY KEY,-- 32+4多四位
  `goods_id` varchar(36) NOT NULL,-- 16位以下,6位以上
  `classify_id` varchar(36),
  `create_time` varchar(19) NOT NULL, -- 20191212-110211
  `update_time` varchar(19) NOT NULL
);
insert INTO store VALUES('0000','first store','https://www.google.com/','1','5','fastExpress',date_format(NOW(),'%Y%m%d-%H%i%s'),date_format(NOW(),'%Y%m%d-%H%i%s'));
insert INTO store VALUES('0001','second store','https://www.google.com/','4','1','fastExpress',date_format(NOW(),'%Y%m%d-%H%i%s'),date_format(NOW(),'%Y%m%d-%H%i%s'));

insert INTO goods VALUES('001','0000','https://www.google.com/','1','food','selling','new',date_format(NOW(),'%Y%m%d-%H%i%s'),date_format(NOW(),'%Y%m%d-%H%i%s'));
insert INTO goods VALUES('002','0000','https://www.google.com/','2','food','selling','new',date_format(NOW(),'%Y%m%d-%H%i%s'),date_format(NOW(),'%Y%m%d-%H%i%s'));
insert INTO goods VALUES('003','0000','https://www.google.com/','3','clothes', 'selling','new',date_format(NOW(),'%Y%m%d-%H%i%s'),date_format(NOW(),'%Y%m%d-%H%i%s'));
insert INTO goods VALUES('101','0001','https://www.google.com/','4','clothes','selling','new',date_format(NOW(),'%Y%m%d-%H%i%s'),date_format(NOW(),'%Y%m%d-%H%i%s'));
insert INTO goods VALUES('102','0001','https://www.google.com/','5','playstation','selling','new',date_format(NOW(),'%Y%m%d-%H%i%s'),date_format(NOW(),'%Y%m%d-%H%i%s'));
insert INTO goods VALUES('103','0001','https://www.google.com/','6','playstation','selling','new',date_format(NOW(),'%Y%m%d-%H%i%s'),date_format(NOW(),'%Y%m%d-%H%i%s'));

INSERT INTO goods_classify VALUES('1', '0', '食品', date_format(NOW(),'%Y%m%d-%H%i%s'),date_format(NOW(),'%Y%m%d-%H%i%s'));
INSERT INTO goods_classify VALUES('2', '0', '服饰', date_format(NOW(),'%Y%m%d-%H%i%s'),date_format(NOW(),'%Y%m%d-%H%i%s'));
INSERT INTO goods_classify VALUES('3', '1', '方便面', date_format(NOW(),'%Y%m%d-%H%i%s'),date_format(NOW(),'%Y%m%d-%H%i%s'));
INSERT INTO goods_classify VALUES('4', '1', '冰红茶', date_format(NOW(),'%Y%m%d-%H%i%s'),date_format(NOW(),'%Y%m%d-%H%i%s'));
INSERT INTO goods_classify VALUES('5', '3', '汤达人', date_format(NOW(),'%Y%m%d-%H%i%s'),date_format(NOW(),'%Y%m%d-%H%i%s'));
INSERT INTO goods_classify VALUES('6', '2', '耐克', date_format(NOW(),'%Y%m%d-%H%i%s'),date_format(NOW(),'%Y%m%d-%H%i%s'));
INSERT INTO goods_classify VALUES('7', '2', '阿迪达斯', date_format(NOW(),'%Y%m%d-%H%i%s'),date_format(NOW(),'%Y%m%d-%H%i%s'));
INSERT INTO goods_classify VALUES('8', '5', 'AJ球鞋', date_format(NOW(),'%Y%m%d-%H%i%s'),date_format(NOW(),'%Y%m%d-%H%i%s'));

INSERT INTO belongsTo VALUES('1','001','1',date_format(NOW(),'%Y%m%d-%H%i%s'),date_format(NOW(),'%Y%m%d-%H%i%s'));
INSERT INTO belongsTo VALUES('2','002','2',date_format(NOW(),'%Y%m%d-%H%i%s'),date_format(NOW(),'%Y%m%d-%H%i%s'));
INSERT INTO belongsTo VALUES('3','003','3',date_format(NOW(),'%Y%m%d-%H%i%s'),date_format(NOW(),'%Y%m%d-%H%i%s'));
INSERT INTO belongsTo VALUES('4','101','4',date_format(NOW(),'%Y%m%d-%H%i%s'),date_format(NOW(),'%Y%m%d-%H%i%s'));
INSERT INTO belongsTo VALUES('5','102','5',date_format(NOW(),'%Y%m%d-%H%i%s'),date_format(NOW(),'%Y%m%d-%H%i%s'));
INSERT INTO belongsTo VALUES('6','103','6',date_format(NOW(),'%Y%m%d-%H%i%s'),date_format(NOW(),'%Y%m%d-%H%i%s'));

-- 商品基本信息 end