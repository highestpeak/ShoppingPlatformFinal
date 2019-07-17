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