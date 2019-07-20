/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 80015
Source Host           : localhost:3306
Source Database       : shopping_platform

Target Server Type    : MYSQL
Target Server Version : 80015
File Encoding         : 65001

Date: 2019-07-20 15:08:47
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `user_id` varchar(36) NOT NULL,
  `permission` text,
  `create_time` varchar(19) NOT NULL,
  `update_time` varchar(19) NOT NULL,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `admin_user_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('123456', 'this is a note', '20190718-134600', '20190718-134600');

-- ----------------------------
-- Table structure for buyer
-- ----------------------------
DROP TABLE IF EXISTS `buyer`;
CREATE TABLE `buyer` (
  `user_id` varchar(36) NOT NULL,
  `bank_card` varchar(36) DEFAULT NULL,
  `create_time` varchar(19) NOT NULL,
  `update_time` varchar(19) NOT NULL,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `buyer_user_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of buyer
-- ----------------------------
INSERT INTO `buyer` VALUES ('654321', '9999888877776666', '20190718-134600', '20190718-134600');
INSERT INTO `buyer` VALUES ('654987321', null, '20190718-164750', '20190718-164750');

-- ----------------------------
-- Table structure for classify_of_goods
-- ----------------------------
DROP TABLE IF EXISTS `classify_of_goods`;
CREATE TABLE `classify_of_goods` (
  `id` varchar(36) NOT NULL,
  `classify_selled_id` varchar(36) DEFAULT NULL,
  `goods_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `classify_of_goods_store_sell_classify_id_fk` (`classify_selled_id`),
  KEY `classify_of_goods_goods_goods_id_fk` (`goods_id`),
  CONSTRAINT `classify_of_goods_goods_goods_id_fk` FOREIGN KEY (`goods_id`) REFERENCES `goods` (`goods_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `classify_of_goods_store_sell_classify_id_fk` FOREIGN KEY (`classify_selled_id`) REFERENCES `store_sell_classify` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of classify_of_goods
-- ----------------------------
INSERT INTO `classify_of_goods` VALUES ('2', '2', '003');
INSERT INTO `classify_of_goods` VALUES ('3', '3', '101');

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `goods_id` varchar(36) NOT NULL,
  `store_id` varchar(36) NOT NULL,
  `goods_name` varchar(36) DEFAULT NULL,
  `description` text,
  `pic_url` text,
  `status` varchar(20) DEFAULT NULL,
  `old_level` varchar(20) DEFAULT NULL,
  `create_time` varchar(19) NOT NULL,
  `update_time` varchar(19) NOT NULL,
  PRIMARY KEY (`goods_id`),
  UNIQUE KEY `store_id` (`store_id`,`goods_name`),
  KEY `goods_store_store_id_fk` (`store_id`),
  CONSTRAINT `goods_store_store_id_fk` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('003', '0000', 'github文化衫', null, 'https://www.google.com/', 'selling', 'new', '20190718-134040', '20190718-134040');
INSERT INTO `goods` VALUES ('101', '0001', '川大文化衫', null, 'https://www.google.com/', 'selling', 'new', '20190718-111541', '20190718-111541');
INSERT INTO `goods` VALUES ('102', '0001', '川大快乐水', null, 'https://www.google.com/', 'selling', 'new', '20190718-111541', '20190718-111541');
INSERT INTO `goods` VALUES ('103', '0001', '肥宅的快乐', null, 'https://www.google.com/', 'selling', 'new', '20190718-111541', '20190718-111541');
INSERT INTO `goods` VALUES ('9f5ab1d7d7af451a9e633e994bee8b4b', '0000', '芒果', null, null, null, null, '20190720-124846', '20190720-124846');
INSERT INTO `goods` VALUES ('d0d8c6dc87a1474e90f99df97fa48cdb', '0000', '菠菜', null, null, null, null, '20190720-124854', '20190720-124854');

-- ----------------------------
-- Table structure for goods_classify
-- ----------------------------
DROP TABLE IF EXISTS `goods_classify`;
CREATE TABLE `goods_classify` (
  `classify_id` varchar(36) NOT NULL,
  `top_level_classify_id` varchar(36) NOT NULL,
  `parent_id` varchar(36) DEFAULT NULL,
  `classify_name` varchar(36) DEFAULT NULL,
  `create_time` varchar(19) NOT NULL,
  `update_time` varchar(19) NOT NULL,
  PRIMARY KEY (`classify_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of goods_classify
-- ----------------------------
INSERT INTO `goods_classify` VALUES ('1', '0', '0', '食品', '20190718-134138', '20190718-134138');
INSERT INTO `goods_classify` VALUES ('2', '0', '0', '服装', '20190718-111541', '20190718-111541');
INSERT INTO `goods_classify` VALUES ('3', '1', '1', '方便面', '20190718-111541', '20190718-111541');
INSERT INTO `goods_classify` VALUES ('4', '1', '1', '冰红茶', '20190718-111541', '20190718-111541');
INSERT INTO `goods_classify` VALUES ('5', '2', '3', '汤达人', '20190718-111541', '20190718-111541');
INSERT INTO `goods_classify` VALUES ('6', '1', '2', '耐克', '20190718-111541', '20190718-111541');
INSERT INTO `goods_classify` VALUES ('7', '1', '2', '阿迪达斯', '20190718-111541', '20190718-111541');
INSERT INTO `goods_classify` VALUES ('8', '2', '6', 'AJ球鞋', '20190718-111541', '20190718-111541');

-- ----------------------------
-- Table structure for in_cart_of
-- ----------------------------
DROP TABLE IF EXISTS `in_cart_of`;
CREATE TABLE `in_cart_of` (
  `id` varchar(36) NOT NULL,
  `buyer_id` varchar(36) NOT NULL,
  `good_id` varchar(36) NOT NULL,
  `good_num` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `in_cart_of_buyer_user_id_fk` (`buyer_id`),
  KEY `in_cart_of_goods_goods_id_fk` (`good_id`),
  CONSTRAINT `in_cart_of_buyer_user_id_fk` FOREIGN KEY (`buyer_id`) REFERENCES `buyer` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `in_cart_of_goods_goods_id_fk` FOREIGN KEY (`good_id`) REFERENCES `goods` (`goods_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of in_cart_of
-- ----------------------------

-- ----------------------------
-- Table structure for seller
-- ----------------------------
DROP TABLE IF EXISTS `seller`;
CREATE TABLE `seller` (
  `user_id` varchar(36) NOT NULL,
  `bank_card` varchar(36) DEFAULT NULL,
  `create_time` varchar(19) NOT NULL,
  `update_time` varchar(19) NOT NULL,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `seller_user_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of seller
-- ----------------------------
INSERT INTO `seller` VALUES ('142536', '9999888877776666', '20190718-134600', '20190718-134600');

-- ----------------------------
-- Table structure for store
-- ----------------------------
DROP TABLE IF EXISTS `store`;
CREATE TABLE `store` (
  `store_id` varchar(36) NOT NULL,
  `note` text,
  `store_pic_url` text,
  `store_classify` varchar(36) DEFAULT NULL,
  `level` varchar(36) DEFAULT NULL,
  `certification` varchar(36) DEFAULT NULL,
  `create_time` varchar(19) NOT NULL,
  `update_time` varchar(19) NOT NULL,
  PRIMARY KEY (`store_id`),
  KEY `store_goods_classify_classify_id_fk` (`store_classify`),
  CONSTRAINT `store_goods_classify_classify_id_fk` FOREIGN KEY (`store_classify`) REFERENCES `goods_classify` (`classify_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of store
-- ----------------------------
INSERT INTO `store` VALUES ('0000', 'first store', 'https://www.google.com/', '3', '5', 'fastExpress', '20190718-111541', '20190720-135224');
INSERT INTO `store` VALUES ('0001', 'second store', 'https://www.google.com/', '4', '1', 'fastExpress', '20190718-111541', '20190718-111541');

-- ----------------------------
-- Table structure for store_sell_classify
-- ----------------------------
DROP TABLE IF EXISTS `store_sell_classify`;
CREATE TABLE `store_sell_classify` (
  `id` varchar(36) NOT NULL,
  `store_id` varchar(36) DEFAULT NULL,
  `classify_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `store_sell_classify_classify_id_store_id_unique` (`store_id`,`classify_id`) USING BTREE,
  KEY `store_sell_classify_store_store_id_fk` (`store_id`),
  KEY `store_sell_classify_goods_classify_classify_id_fk` (`classify_id`),
  CONSTRAINT `store_sell_classify_goods_classify_classify_id_fk` FOREIGN KEY (`classify_id`) REFERENCES `goods_classify` (`classify_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `store_sell_classify_store_store_id_fk` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of store_sell_classify
-- ----------------------------
INSERT INTO `store_sell_classify` VALUES ('4', '0000', '2');
INSERT INTO `store_sell_classify` VALUES ('2', '0000', '4');
INSERT INTO `store_sell_classify` VALUES ('6', '0000', '7');
INSERT INTO `store_sell_classify` VALUES ('3', '0001', '2');
INSERT INTO `store_sell_classify` VALUES ('7', '0001', '6');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` varchar(36) NOT NULL,
  `verify` varchar(16) NOT NULL,
  `realname` varchar(36) DEFAULT NULL,
  `nickname` varchar(36) DEFAULT NULL,
  `avator_url` text,
  `sex` tinyint(1) DEFAULT NULL,
  `email` varchar(320) NOT NULL,
  `note` text,
  `identity` varchar(20) DEFAULT NULL,
  `create_time` varchar(19) NOT NULL,
  `update_time` varchar(19) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('111111111', '123456', null, null, null, null, '123@126.com', null, null, '20190719-235233', '20190720-143032');
INSERT INTO `user` VALUES ('123456', '000000', null, null, null, '1', '123@163.com', null, 'admin', '20190718-134600', '20190718-134600');
INSERT INTO `user` VALUES ('142536', '000000', 'hello', null, null, null, '321@163.com', null, 'seller', '20190718-134600', '20190718-134600');
INSERT INTO `user` VALUES ('654321', '000000', '张三', '332', null, '0', '', null, 'buyer', '20190718-134600', '20190719-224928');
INSERT INTO `user` VALUES ('654987321', '123456', null, null, null, null, '123@126.com', null, null, '20190718-164750', '20190718-164750');
