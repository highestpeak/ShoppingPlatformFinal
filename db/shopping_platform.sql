/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 80015
Source Host           : localhost:3306
Source Database       : shopping_platform

Target Server Type    : MYSQL
Target Server Version : 80015
File Encoding         : 65001

Date: 2019-07-23 10:30:47
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
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of classify_of_goods
-- ----------------------------
INSERT INTO `classify_of_goods` VALUES ('2', '2', '003');
INSERT INTO `classify_of_goods` VALUES ('3', '3', '101');
INSERT INTO `classify_of_goods` VALUES ('4', '4955cf9b1909412cbfd8479a8162a0b7', '001');
INSERT INTO `classify_of_goods` VALUES ('5', 'a3fc77b3d94845c68f726aa6b2a42e52', '002');
INSERT INTO `classify_of_goods` VALUES ('5818e501a638416abb9c0448864aadc4', 'a3fc77b3d94845c68f726aa6b2a42e52', '108e7176cd0e4a1dbfa8c73263994307');
INSERT INTO `classify_of_goods` VALUES ('61eb48d1934a475b8221310af3321b86', 'a3fc77b3d94845c68f726aa6b2a42e52', 'f3e60646e899474990f4bb5a0fc2ef26');
INSERT INTO `classify_of_goods` VALUES ('9e9f0dd75c344d25bf89ccebda72da50', 'a3fc77b3d94845c68f726aa6b2a42e52', '59181ea38f0742a191964843b04ddea8');

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `goods_id` varchar(36) NOT NULL,
  `store_id` varchar(36) NOT NULL,
  `goods_name` varchar(36) DEFAULT NULL,
  `price` int(11) DEFAULT '0',
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
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('001', '0000', '快乐的快乐水', '0', '第一个商店的商品', null, null, null, '20190722-215855', '20190722-215855');
INSERT INTO `goods` VALUES ('002', '0000', '不快乐的水', '0', '阿斯顿撒', null, null, null, '20190722-215855', '20190722-215855');
INSERT INTO `goods` VALUES ('003', '0000', 'github文化衫', '0', '修改描述测试', 'https://www.google.com/', '', '', '20190718-134040', '20190721-222604');
INSERT INTO `goods` VALUES ('053e64e8ee0948d7a7f93849feca8911', '0000', 'helloworld的仆人', '1024', '阿三大苏打实打实', null, '卖着呢', 'new', '20190722-224758', '20190722-224758');
INSERT INTO `goods` VALUES ('101', '0001', '川大文化衫', '0', null, 'https://www.google.com/', 'selling', 'new', '20190718-111541', '20190718-111541');
INSERT INTO `goods` VALUES ('102', '0001', '川大快乐水', '0', null, 'https://www.google.com/', 'selling', 'new', '20190718-111541', '20190718-111541');
INSERT INTO `goods` VALUES ('103', '0001', '肥宅的快乐', '0', null, 'https://www.google.com/', 'selling', 'new', '20190718-111541', '20190718-111541');
INSERT INTO `goods` VALUES ('108e7176cd0e4a1dbfa8c73263994307', '0000', '伟大的码农5', '1024', '站在天台上的码农', null, '即将跳下来', '没头发', '20190723-102625', '20190723-102625');
INSERT INTO `goods` VALUES ('2b0012cdaa4e43799e7bd443b7b2d91f', '0000', 'helloworld的宠儿', '2048', '阿三大苏打实打实', null, '卖着呢', 'new', '20190722-224923', '20190722-224923');
INSERT INTO `goods` VALUES ('2e7cc5e5486e455aadf6c746b4136184', '0000', '伟大的码农0', '1024', '站在天台上的码农', null, '即将跳下来', '没头发', '20190722-230817', '20190722-230817');
INSERT INTO `goods` VALUES ('59181ea38f0742a191964843b04ddea8', '0000', '伟大的码农3', '1024', '站在天台上的码农', null, '即将跳下来', '没头发', '20190722-231835', '20190722-231835');
INSERT INTO `goods` VALUES ('5a19450b764c4ffc9503d2a2e7e6f7b0', '0000', 'helloworld的爸爸', '2048', '阿三大苏打实打实', null, '卖着呢', 'new', '20190722-225142', '20190722-225142');
INSERT INTO `goods` VALUES ('835cb022a93e45778b747acbc608acb4', '0000', 'helloworld的妈妈', '2048', '阿三大苏打实打实', null, '卖着呢', 'new', '20190722-225222', '20190722-225222');
INSERT INTO `goods` VALUES ('835e382d60c44a96be7222438f20ea17', '0000', 'helloworld的姐姐', '2048', '阿三大苏打实打实', null, '卖着呢', 'new', '20190722-225415', '20190722-225415');
INSERT INTO `goods` VALUES ('bda5075cf4c547d791245c9216a41568', '0000', 'helloworld', '0', '阿三大苏打实打实', null, '卖着呢', 'new', '20190722-162227', '20190722-162227');
INSERT INTO `goods` VALUES ('dc0b65ad3b6e4f898f4efc3c5d69e40b', '0000', '伟大的码农1', '1024', '站在天台上的码农', null, '即将跳下来', '没头发', '20190722-230857', '20190722-230857');
INSERT INTO `goods` VALUES ('e105b16a043443f28b0219a850249754', '0000', '伟大的码农', '1024', '站在天台上的码农', null, '即将跳下来', '没头发', '20190722-225639', '20190722-225639');
INSERT INTO `goods` VALUES ('f3e60646e899474990f4bb5a0fc2ef26', '0000', '伟大的码农4', '1024', '站在天台上的码农', null, '即将跳下来', '没头发', '20190722-231905', '20190722-231905');

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
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of goods_classify
-- ----------------------------
INSERT INTO `goods_classify` VALUES ('0f12485760664e03a20c93b374e7e3a6', '011', '2273be4ae8a64e23a119c1b1370654e6', 'helloworldchild', '20190722-215118', '20190722-215118');
INSERT INTO `goods_classify` VALUES ('1', '0', '0', '食品', '20190718-134138', '20190718-134138');
INSERT INTO `goods_classify` VALUES ('2', '0', '0', '服装', '20190718-111541', '20190718-111541');
INSERT INTO `goods_classify` VALUES ('2273be4ae8a64e23a119c1b1370654e6', '01', '7', 'helloworld', '20190722-215052', '20190722-215052');
INSERT INTO `goods_classify` VALUES ('3', '1', '1', '方便面', '20190718-111541', '20190718-111541');
INSERT INTO `goods_classify` VALUES ('4', '1', '1', '冰红茶', '20190718-111541', '20190718-111541');
INSERT INTO `goods_classify` VALUES ('5', '2', '3', '汤达人', '20190718-111541', '20190718-111541');
INSERT INTO `goods_classify` VALUES ('6', '1', '2', '耐克', '20190718-111541', '20190718-111541');
INSERT INTO `goods_classify` VALUES ('7', '0', '0', '阿迪', '20190718-111541', '20190718-111541');
INSERT INTO `goods_classify` VALUES ('8', '2', '6', 'AJ球鞋', '20190718-111541', '20190718-111541');
INSERT INTO `goods_classify` VALUES ('934049ded75a43f78e80323ccc89c699', '01', '2', '服装的弟弟', '20190722-215217', '20190722-215217');
INSERT INTO `goods_classify` VALUES ('9be55239a9ce435da119ac8bb61af917', '0', '0', '服装的兄弟', '20190722-215544', '20190722-215544');

-- ----------------------------
-- Table structure for goods_viewed
-- ----------------------------
DROP TABLE IF EXISTS `goods_viewed`;
CREATE TABLE `goods_viewed` (
  `view_id` varchar(36) NOT NULL,
  `buyer_id` varchar(36) DEFAULT NULL,
  `goods_id` varchar(36) DEFAULT NULL,
  `view_time` varchar(19) DEFAULT NULL,
  `classify_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`view_id`),
  KEY `goods_viewed_buyer_user_id_fk` (`buyer_id`),
  KEY `goods_viewed_goods_goods_id_fk` (`goods_id`),
  KEY `goods_viewed_goods_classify_classify_id_fk` (`classify_id`),
  CONSTRAINT `goods_viewed_buyer_user_id_fk` FOREIGN KEY (`buyer_id`) REFERENCES `buyer` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `goods_viewed_goods_classify_classify_id_fk` FOREIGN KEY (`classify_id`) REFERENCES `goods_classify` (`classify_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `goods_viewed_goods_goods_id_fk` FOREIGN KEY (`goods_id`) REFERENCES `goods` (`goods_id`) ON DELETE CASCADE ON UPDATE CASCADE
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of goods_viewed
-- ----------------------------
INSERT INTO `goods_viewed` VALUES ('001', '654321', '003', '20190718-134040', '4');
INSERT INTO `goods_viewed` VALUES ('002', '654321', null, '20190718-134040', '4');
INSERT INTO `goods_viewed` VALUES ('003', '654321', null, '20190718-134040', null);
INSERT INTO `goods_viewed` VALUES ('004', '654321', '101', '20190718-134040', '5');
INSERT INTO `goods_viewed` VALUES ('005', '654321', null, '20190718-134040', '6');

-- ----------------------------
-- Table structure for interested_classify
-- ----------------------------
DROP TABLE IF EXISTS `interested_classify`;
CREATE TABLE `interested_classify` (
  `classifyStar_id` varchar(36) NOT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `classify_id` varchar(36) DEFAULT NULL,
  `setStar_time` varchar(19) DEFAULT NULL,
  PRIMARY KEY (`classifyStar_id`),
  KEY `interested_classify_user_user_id_fk` (`user_id`),
  KEY `interested_classify_goods_classify_classify_id_fk` (`classify_id`),
  CONSTRAINT `interested_classify_goods_classify_classify_id_fk` FOREIGN KEY (`classify_id`) REFERENCES `goods_classify` (`classify_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `interested_classify_user_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of interested_classify
-- ----------------------------

-- ----------------------------
-- Table structure for interested_goods
-- ----------------------------
DROP TABLE IF EXISTS `interested_goods`;
CREATE TABLE `interested_goods` (
  `goodsStar_id` varchar(36) NOT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `goods_id` varchar(36) DEFAULT NULL,
  `setStar_time` varchar(19) DEFAULT NULL,
  PRIMARY KEY (`goodsStar_id`),
  KEY `interested_goods_user_user_id_fk` (`user_id`),
  KEY `interested_goods_goods_goods_id_fk` (`goods_id`),
  CONSTRAINT `interested_goods_goods_goods_id_fk` FOREIGN KEY (`goods_id`) REFERENCES `goods` (`goods_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `interested_goods_user_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of interested_goods
-- ----------------------------
INSERT INTO `interested_goods` VALUES ('bb55aab6a2d04f8abf5f4c321e950f41', '654321', '003', '20190722-105917');

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
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of in_cart_of
-- ----------------------------

-- ----------------------------
-- Table structure for on_sale
-- ----------------------------
DROP TABLE IF EXISTS `on_sale`;
CREATE TABLE `on_sale` (
  `on_sale_id` varchar(36) NOT NULL,
  `store_id` varchar(36) DEFAULT NULL,
  `goods_id` varchar(36) DEFAULT NULL,
  `create_time` varchar(19) DEFAULT NULL,
  `due_time` varchar(36) DEFAULT NULL,
  `note` text,
  `discount` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`on_sale_id`),
  KEY `on_sale_store_store_id_fk` (`store_id`),
  KEY `on_sale_goods_goods_id_fk` (`goods_id`),
  CONSTRAINT `on_sale_goods_goods_id_fk` FOREIGN KEY (`goods_id`) REFERENCES `goods` (`goods_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `on_sale_store_store_id_fk` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of on_sale
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
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of store_sell_classify
-- ----------------------------
INSERT INTO `store_sell_classify` VALUES ('4955cf9b1909412cbfd8479a8162a0b7', '0000', '0f12485760664e03a20c93b374e7e3a6');
INSERT INTO `store_sell_classify` VALUES ('4', '0000', '2');
INSERT INTO `store_sell_classify` VALUES ('a3fc77b3d94845c68f726aa6b2a42e52', '0000', '2273be4ae8a64e23a119c1b1370654e6');
INSERT INTO `store_sell_classify` VALUES ('2', '0000', '4');
INSERT INTO `store_sell_classify` VALUES ('99d73b3df3004ef4801e697ad22a6a1a', '0000', '934049ded75a43f78e80323ccc89c699');
INSERT INTO `store_sell_classify` VALUES ('698a983495284646b698793d7f212c3c', '0000', '9be55239a9ce435da119ac8bb61af917');
INSERT INTO `store_sell_classify` VALUES ('3', '0001', '2');
INSERT INTO `store_sell_classify` VALUES ('7', '0001', '6');

-- ----------------------------
-- Table structure for userId
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
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of userId
-- ----------------------------
INSERT INTO `user` VALUES ('111111111', '123456', null, null, null, null, '123@126.com', null, null, '20190719-235233', '20190720-143032');
INSERT INTO `user` VALUES ('123456', '000000', null, null, null, '1', '123@163.com', null, 'admin', '20190718-134600', '20190718-134600');
INSERT INTO `user` VALUES ('142536', '000000', 'hello', null, null, null, '321@163.com', null, 'seller', '20190718-134600', '20190718-134600');
INSERT INTO `user` VALUES ('654321', '000000', '张三', '332', null, '0', '', null, 'buyer', '20190718-134600', '20190719-224928');
INSERT INTO `user` VALUES ('654987321', '123456', null, null, null, null, '123@126.com', null, null, '20190718-164750', '20190718-164750');
