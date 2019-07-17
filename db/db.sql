drop database if EXISTS  mydb;
CREATE database mydb;
use mydb;
DROP TABLE IF EXISTS `admin`; -- 管理员表
CREATE TABLE `admin` (
  `id` varchar(64) NOT NULL PRIMARY KEY,
  `name` varchar(64) NOT NULL, -- 登录名
  `password` varchar(64) NOT NULL, -- password
  `remarks` varchar(255) DEFAULT NULL -- 备注信息
) ENGINE=InnoDB ;

insert INTO admin(id,name,password,remarks) VALUES('1221adaa324322','admin','admin',NULL);
