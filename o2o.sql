/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : o2o

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2020-06-14 22:42:48
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tb_area
-- ----------------------------
DROP TABLE IF EXISTS `tb_area`;
CREATE TABLE `tb_area` (
  `area_id` int(2) NOT NULL AUTO_INCREMENT,
  `area_name` varchar(200) NOT NULL,
  `priority` int(2) NOT NULL DEFAULT '0',
  `create_time` datetime DEFAULT NULL,
  `last_edit_time` datetime DEFAULT NULL,
  PRIMARY KEY (`area_id`),
  UNIQUE KEY `UK_AREA` (`area_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_area
-- ----------------------------
INSERT INTO `tb_area` VALUES ('2', '东苑', '1', null, null);
INSERT INTO `tb_area` VALUES ('3', '西苑', '2', null, null);

-- ----------------------------
-- Table structure for tb_award
-- ----------------------------
DROP TABLE IF EXISTS `tb_award`;
CREATE TABLE `tb_award` (
  `award_id` int(10) NOT NULL AUTO_INCREMENT,
  `award_name` varchar(256) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `award_desc` varchar(1024) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `award_img` varchar(1024) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `point` int(10) NOT NULL DEFAULT '0',
  `priority` int(2) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `last_edit_time` datetime DEFAULT NULL,
  `enable_status` int(2) NOT NULL DEFAULT '0',
  `shop_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`award_id`),
  KEY `fk_award_shop_idx` (`shop_id`),
  CONSTRAINT `fk_award_shop` FOREIGN KEY (`shop_id`) REFERENCES `tb_shop` (`shop_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_award
-- ----------------------------
INSERT INTO `tb_award` VALUES ('13', '美式咖啡', '咖啡', '/upload/images/item/shop/15/2017060523302118864.jpg', '6', '6', null, null, '1', '20');
INSERT INTO `tb_award` VALUES ('14', '红豆奶茶', '红豆奶茶', '/upload/images/item/shop/20/2017060620363014331.jpg', '5', '5', null, '2019-03-14 14:42:20', '1', '20');
INSERT INTO `tb_award` VALUES ('15', '绿豆冰', '绿豆冰', '/upload/images/item/shop/20/2017060620384620536.jpg', '3', '7', null, '2018-12-05 14:47:59', '1', '20');

-- ----------------------------
-- Table structure for tb_head_line
-- ----------------------------
DROP TABLE IF EXISTS `tb_head_line`;
CREATE TABLE `tb_head_line` (
  `line_id` int(100) NOT NULL AUTO_INCREMENT,
  `line_name` varchar(1000) DEFAULT NULL,
  `line_link` varchar(2000) NOT NULL,
  `line_img` varchar(2000) NOT NULL,
  `priority` int(2) DEFAULT NULL,
  `enable_status` int(2) NOT NULL DEFAULT '0',
  `create_time` datetime DEFAULT NULL,
  `last_edit_time` datetime DEFAULT NULL,
  PRIMARY KEY (`line_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_head_line
-- ----------------------------
INSERT INTO `tb_head_line` VALUES ('11', '1', 'http://115.28.159.6/myo2o/frontend/shopdetail?shopId=20', '/upload/images/item/headtitle/2017061320315746624.jpg', '1', '1', '2017-06-13 20:31:57', '2017-06-13 20:31:57');
INSERT INTO `tb_head_line` VALUES ('12', '2', 'http://115.28.159.6/myo2o/frontend/shopdetail?shopId=20', '/upload/images/item/headtitle/2017061320371786788.jpg', '2', '1', '2017-06-13 20:37:17', '2017-06-13 20:37:17');
INSERT INTO `tb_head_line` VALUES ('14', '3', 'http://115.28.159.6/myo2o/frontend/shopdetail?shopId=20', '/upload/images/item/headtitle/2017061320393452772.jpg', '3', '1', '2017-06-13 20:39:34', '2017-06-13 20:39:34');
INSERT INTO `tb_head_line` VALUES ('15', '4', 'http://115.28.159.6/myo2o/frontend/shopdetail?shopId=20', '/upload/images/item/headtitle/2017061320400198256.jpg', '4', '1', '2017-06-13 20:40:01', '2017-06-13 20:40:01');

-- ----------------------------
-- Table structure for tb_local_auth
-- ----------------------------
DROP TABLE IF EXISTS `tb_local_auth`;
CREATE TABLE `tb_local_auth` (
  `local_auth_id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL,
  `username` varchar(128) NOT NULL,
  `password` varchar(128) NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `last_edit_time` datetime DEFAULT NULL,
  PRIMARY KEY (`local_auth_id`),
  KEY `fk_localauth_profile` (`user_id`),
  CONSTRAINT `fk_localauth_profile` FOREIGN KEY (`user_id`) REFERENCES `tb_person_info` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_local_auth
-- ----------------------------
INSERT INTO `tb_local_auth` VALUES ('19', '1', 'testbind', '123456', '2019-05-29 02:15:53', '2019-06-20 01:24:47');

-- ----------------------------
-- Table structure for tb_person_info
-- ----------------------------
DROP TABLE IF EXISTS `tb_person_info`;
CREATE TABLE `tb_person_info` (
  `user_id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  `profile_img` varchar(1024) DEFAULT NULL,
  `email` varchar(1024) DEFAULT NULL,
  `gender` varchar(2) DEFAULT NULL,
  `enable_status` int(2) NOT NULL DEFAULT '0' COMMENT '0:禁止使用本商城，1:允许使用本商城',
  `user_type` int(2) NOT NULL DEFAULT '1' COMMENT '1:顾客，2:店家，3:超级管理员',
  `create_time` datetime DEFAULT NULL,
  `last_edit_time` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_person_info
-- ----------------------------
INSERT INTO `tb_person_info` VALUES ('1', '测试', 'test', 'test', '1', '1', '1', null, null);
INSERT INTO `tb_person_info` VALUES ('8', '李翔', 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJmNzyG67YKicCIOXYUKHEC32ZJANTfoaRGVB1MvkW8KagcYfDOic9IicZO5Gibp5QBsLC3p2tLq22quQ/0', null, '1', '1', '1', '2017-10-11 04:28:41', null);

-- ----------------------------
-- Table structure for tb_product
-- ----------------------------
DROP TABLE IF EXISTS `tb_product`;
CREATE TABLE `tb_product` (
  `product_id` int(100) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(100) NOT NULL,
  `product_desc` varchar(2000) DEFAULT NULL,
  `img_addr` varchar(2000) DEFAULT '',
  `normal_price` varchar(100) DEFAULT NULL,
  `promotion_price` varchar(100) DEFAULT NULL,
  `priority` int(2) NOT NULL DEFAULT '0',
  `create_time` datetime DEFAULT NULL,
  `last_edit_time` datetime DEFAULT NULL,
  `enable_status` int(2) NOT NULL DEFAULT '0',
  `product_category_id` int(11) DEFAULT NULL,
  `shop_id` int(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_id`),
  KEY `fk_product_procate` (`product_category_id`),
  KEY `fk_product_shop` (`shop_id`),
  CONSTRAINT `fk_product_procate` FOREIGN KEY (`product_category_id`) REFERENCES `tb_product_category` (`product_category_id`),
  CONSTRAINT `fk_product_shop` FOREIGN KEY (`shop_id`) REFERENCES `tb_shop` (`shop_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_product
-- ----------------------------
INSERT INTO `tb_product` VALUES ('1', '大黄人', '我是大黄人', '/upload/images/item/shop/29/2017092601204036435.jpg', '2', '1', '100', '2017-09-26 01:20:40', '2017-09-26 01:20:40', '1', '3', '29');
INSERT INTO `tb_product` VALUES ('2', '小黄人', '我是小黄人', '/upload/images/item/shop/29/2017092601212211185.jpg', '3', '2', '90', '2017-09-26 01:21:22', '2017-09-26 01:21:22', '1', null, '29');
INSERT INTO `tb_product` VALUES ('3', '暴漫人', '开心了', '/upload/images/item/shop/29/2017092601220059819.jpg', '3', '2', '80', '2017-09-26 01:22:00', '2017-09-26 01:22:00', '1', '3', '29');
INSERT INTO `tb_product` VALUES ('4', '宇宙第一', '宇宙无敌', '/upload/images/item/shop/29/2017092601224389939.jpg', '5', '2', '70', '2017-09-26 01:22:43', '2017-09-26 01:22:43', '1', '3', '29');
INSERT INTO `tb_product` VALUES ('5', '眼凸凸', '宇宙无敌', '/upload/images/item/shop/29/2017092601231570458.jpg', '3', '2', '60', '2017-09-26 01:23:15', '2017-09-26 01:23:15', '1', '3', '29');
INSERT INTO `tb_product` VALUES ('6', '笑眯眯', '笑眯眯 甜蜜蜜', '/upload/images/item/shop/29/2017092601234922140.jpg', '2', '2', '50', '2017-09-26 01:23:49', '2019-05-25 07:34:41', '1', '3', '29');
INSERT INTO `tb_product` VALUES ('7', '优质小黄人奶茶', '非常好喝哦', '/upload/images/item/shop/28/2017100216554368403.jpg', '6', '3', '100', '2017-10-02 16:55:43', '2017-10-02 16:55:43', '1', '4', '28');
INSERT INTO `tb_product` VALUES ('8', '优质暴漫奶茶', '非常好喝哦', '/upload/images/item/shop/28/2017100216561443475.jpg', '6', '3', '100', '2017-10-02 16:56:14', '2017-10-02 16:56:14', '1', '4', '28');
INSERT INTO `tb_product` VALUES ('9', '优质大白奶茶', '非常好喝哦', '/upload/images/item/shop/28/2017100216564398563.jpg', '6', '3', '90', '2017-10-02 16:56:43', '2017-10-02 16:56:43', '1', '4', '28');
INSERT INTO `tb_product` VALUES ('10', '优质二维码奶茶', '非常好喝哦', '/upload/images/item/shop/28/2017100216570762900.jpg', '5', '3', '80', '2017-10-02 16:57:07', '2017-10-02 16:57:07', '1', '4', '28');
INSERT INTO `tb_product` VALUES ('11', '优质二维码咖啡', '非常好喝哦', '/upload/images/item/shop/28/2017100216573090557.jpg', '8', '3', '60', '2017-10-02 16:57:30', '2017-10-02 16:57:30', '1', '6', '28');
INSERT INTO `tb_product` VALUES ('12', '优质大白咖啡', '非常好喝哦', '/upload/images/item/shop/28/2017100216575922088.jpg', '8', '3', '50', '2017-10-02 16:57:59', '2019-06-19 08:38:43', '1', '6', '28');

-- ----------------------------
-- Table structure for tb_product_category
-- ----------------------------
DROP TABLE IF EXISTS `tb_product_category`;
CREATE TABLE `tb_product_category` (
  `product_category_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_category_name` varchar(100) NOT NULL,
  `priority` int(2) DEFAULT '0',
  `create_time` datetime DEFAULT NULL,
  `shop_id` int(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_category_id`),
  KEY `fk_procate_shop` (`shop_id`),
  CONSTRAINT `fk_procate_shop` FOREIGN KEY (`shop_id`) REFERENCES `tb_shop` (`shop_id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_product_category
-- ----------------------------
INSERT INTO `tb_product_category` VALUES ('1', '眼镜类', '1', null, '29');
INSERT INTO `tb_product_category` VALUES ('2', '无镜类', '2', null, '29');
INSERT INTO `tb_product_category` VALUES ('3', '开心类', '3', null, '29');
INSERT INTO `tb_product_category` VALUES ('4', '优质奶茶', '6', null, '28');
INSERT INTO `tb_product_category` VALUES ('5', '劣质奶茶', '3', null, '28');
INSERT INTO `tb_product_category` VALUES ('6', '优质咖啡', '5', null, '28');
INSERT INTO `tb_product_category` VALUES ('7', '劣质咖啡', '2', null, '1');
INSERT INTO `tb_product_category` VALUES ('8', '甜品小吃', '4', null, '28');
INSERT INTO `tb_product_category` VALUES ('9', '苦品凉茶', '4', null, '28');
INSERT INTO `tb_product_category` VALUES ('37', '测试类别', '3', null, '50');
INSERT INTO `tb_product_category` VALUES ('38', '测试类别1', '2', null, '50');

-- ----------------------------
-- Table structure for tb_product_img
-- ----------------------------
DROP TABLE IF EXISTS `tb_product_img`;
CREATE TABLE `tb_product_img` (
  `product_img_id` int(20) NOT NULL AUTO_INCREMENT,
  `img_addr` varchar(2000) NOT NULL,
  `img_desc` varchar(2000) DEFAULT NULL,
  `priority` int(2) DEFAULT '0',
  `create_time` datetime DEFAULT NULL,
  `product_id` int(20) DEFAULT NULL,
  PRIMARY KEY (`product_img_id`),
  KEY `fk_proimg_product` (`product_id`),
  CONSTRAINT `fk_proimg_product` FOREIGN KEY (`product_id`) REFERENCES `tb_product` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_product_img
-- ----------------------------
INSERT INTO `tb_product_img` VALUES ('3', '/upload/images/item/shop/29/2017092601212217105.jpg', null, null, '2017-09-26 01:21:22', '2');
INSERT INTO `tb_product_img` VALUES ('4', '/upload/images/item/shop/29/2017092601212268219.jpg', null, null, '2017-09-26 01:21:22', '2');
INSERT INTO `tb_product_img` VALUES ('5', '/upload/images/item/shop/29/2017092601220074062.jpg', null, null, '2017-09-26 01:22:00', '3');
INSERT INTO `tb_product_img` VALUES ('6', '/upload/images/item/shop/29/2017092601220019993.jpg', null, null, '2017-09-26 01:22:00', '3');
INSERT INTO `tb_product_img` VALUES ('7', '/upload/images/item/shop/29/2017092601224322685.jpg', null, null, '2017-09-26 01:22:43', '4');
INSERT INTO `tb_product_img` VALUES ('8', '/upload/images/item/shop/29/2017092601224353777.jpg', null, null, '2017-09-26 01:22:43', '4');
INSERT INTO `tb_product_img` VALUES ('9', '/upload/images/item/shop/29/2017092601231572675.jpg', null, null, '2017-09-26 01:23:15', '5');
INSERT INTO `tb_product_img` VALUES ('10', '/upload/images/item/shop/29/2017092601231516853.jpg', null, null, '2017-09-26 01:23:15', '5');
INSERT INTO `tb_product_img` VALUES ('11', '/upload/images/item/shop/29/2017092601234987131.jpg', null, null, '2017-09-26 01:23:49', '6');
INSERT INTO `tb_product_img` VALUES ('12', '/upload/images/item/shop/29/2017092601234984991.jpg', null, null, '2017-09-26 01:23:49', '6');
INSERT INTO `tb_product_img` VALUES ('13', '/upload/images/item/shop/28/2017100216554379623.jpg', null, null, '2017-10-02 16:55:43', '7');
INSERT INTO `tb_product_img` VALUES ('14', '/upload/images/item/shop/28/2017100216554382464.jpg', null, null, '2017-10-02 16:55:43', '7');
INSERT INTO `tb_product_img` VALUES ('15', '/upload/images/item/shop/28/2017100216554324232.jpg', null, null, '2017-10-02 16:55:43', '7');
INSERT INTO `tb_product_img` VALUES ('16', '/upload/images/item/shop/28/2017100216561440352.jpg', null, null, '2017-10-02 16:56:14', '8');
INSERT INTO `tb_product_img` VALUES ('17', '/upload/images/item/shop/28/2017100216561435083.jpg', null, null, '2017-10-02 16:56:14', '8');
INSERT INTO `tb_product_img` VALUES ('18', '/upload/images/item/shop/28/2017100216561472866.jpg', null, null, '2017-10-02 16:56:14', '8');
INSERT INTO `tb_product_img` VALUES ('19', '/upload/images/item/shop/28/2017100216564440981.jpg', null, null, '2017-10-02 16:56:44', '9');
INSERT INTO `tb_product_img` VALUES ('20', '/upload/images/item/shop/28/2017100216564491563.jpg', null, null, '2017-10-02 16:56:44', '9');
INSERT INTO `tb_product_img` VALUES ('21', '/upload/images/item/shop/28/2017100216564437552.jpg', null, null, '2017-10-02 16:56:44', '9');
INSERT INTO `tb_product_img` VALUES ('22', '/upload/images/item/shop/28/2017100216570748189.jpg', null, null, '2017-10-02 16:57:07', '10');
INSERT INTO `tb_product_img` VALUES ('23', '/upload/images/item/shop/28/2017100216570710458.jpg', null, null, '2017-10-02 16:57:07', '10');
INSERT INTO `tb_product_img` VALUES ('24', '/upload/images/item/shop/28/2017100216570779065.jpg', null, null, '2017-10-02 16:57:07', '10');
INSERT INTO `tb_product_img` VALUES ('25', '/upload/images/item/shop/28/2017100216573094393.jpg', null, null, '2017-10-02 16:57:30', '11');
INSERT INTO `tb_product_img` VALUES ('26', '/upload/images/item/shop/28/2017100216573050300.jpg', null, null, '2017-10-02 16:57:30', '11');
INSERT INTO `tb_product_img` VALUES ('27', '/upload/images/item/shop/28/2017100216573037951.jpg', null, null, '2017-10-02 16:57:30', '11');
INSERT INTO `tb_product_img` VALUES ('28', '/upload/images/item/shop/28/2017100216580055004.jpg', null, null, '2017-10-02 16:58:00', '12');
INSERT INTO `tb_product_img` VALUES ('29', '/upload/images/item/shop/28/2017100216580081030.jpg', null, null, '2017-10-02 16:58:00', '12');
INSERT INTO `tb_product_img` VALUES ('30', '/upload/images/item/shop/28/2017100216580022626.jpg', null, null, '2017-10-02 16:58:00', '12');

-- ----------------------------
-- Table structure for tb_product_sell_daily
-- ----------------------------
DROP TABLE IF EXISTS `tb_product_sell_daily`;
CREATE TABLE `tb_product_sell_daily` (
  `product_sell_daily_id` int(100) NOT NULL AUTO_INCREMENT,
  `product_id` int(100) DEFAULT NULL,
  `shop_id` int(10) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `total` int(10) DEFAULT '0',
  PRIMARY KEY (`product_sell_daily_id`),
  UNIQUE KEY `uc_product_sell` (`product_id`,`shop_id`,`create_time`),
  KEY `fk_product_sell_product` (`product_id`),
  KEY `fk_product_sell_shop` (`shop_id`),
  CONSTRAINT `fk_product_sell_product` FOREIGN KEY (`product_id`) REFERENCES `tb_product` (`product_id`),
  CONSTRAINT `fk_product_sell_shop` FOREIGN KEY (`shop_id`) REFERENCES `tb_shop` (`shop_id`)
) ENGINE=InnoDB AUTO_INCREMENT=153 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_product_sell_daily
-- ----------------------------
INSERT INTO `tb_product_sell_daily` VALUES ('87', '12', '20', '2018-11-19 00:00:00', '1');
INSERT INTO `tb_product_sell_daily` VALUES ('88', '12', '20', '2017-12-17 00:00:00', '3');
INSERT INTO `tb_product_sell_daily` VALUES ('89', '12', '20', '2017-12-16 00:00:00', '2');
INSERT INTO `tb_product_sell_daily` VALUES ('90', '12', '20', '2017-12-15 00:00:00', '5');
INSERT INTO `tb_product_sell_daily` VALUES ('91', '12', '20', '2017-12-14 00:00:00', '3');
INSERT INTO `tb_product_sell_daily` VALUES ('92', '12', '20', '2017-12-13 00:00:00', '4');
INSERT INTO `tb_product_sell_daily` VALUES ('93', '12', '20', '2017-12-12 00:00:00', '2');
INSERT INTO `tb_product_sell_daily` VALUES ('96', '13', '20', '2017-12-18 00:00:00', '2');
INSERT INTO `tb_product_sell_daily` VALUES ('97', '13', '20', '2017-12-17 00:00:00', '2');
INSERT INTO `tb_product_sell_daily` VALUES ('98', '13', '20', '2017-12-16 00:00:00', '3');
INSERT INTO `tb_product_sell_daily` VALUES ('99', '13', '20', '2017-12-15 00:00:00', '3');
INSERT INTO `tb_product_sell_daily` VALUES ('100', '13', '20', '2017-12-14 00:00:00', '4');
INSERT INTO `tb_product_sell_daily` VALUES ('101', '13', '20', '2017-12-13 00:00:00', '4');
INSERT INTO `tb_product_sell_daily` VALUES ('102', '13', '20', '2017-12-12 00:00:00', '5');
INSERT INTO `tb_product_sell_daily` VALUES ('103', '14', '20', '2017-12-18 00:00:00', '7');
INSERT INTO `tb_product_sell_daily` VALUES ('104', '14', '20', '2017-12-17 00:00:00', '6');
INSERT INTO `tb_product_sell_daily` VALUES ('105', '14', '20', '2017-12-16 00:00:00', '5');
INSERT INTO `tb_product_sell_daily` VALUES ('106', '14', '20', '2017-12-15 00:00:00', '4');
INSERT INTO `tb_product_sell_daily` VALUES ('107', '14', '20', '2017-12-14 00:00:00', '1');
INSERT INTO `tb_product_sell_daily` VALUES ('108', '14', '20', '2017-12-13 00:00:00', '2');
INSERT INTO `tb_product_sell_daily` VALUES ('109', '14', '20', '2017-12-12 00:00:00', '3');
INSERT INTO `tb_product_sell_daily` VALUES ('110', '4', '15', '2017-12-18 00:00:00', '0');
INSERT INTO `tb_product_sell_daily` VALUES ('111', '5', '15', '2017-12-18 00:00:00', '0');
INSERT INTO `tb_product_sell_daily` VALUES ('112', '6', '15', '2017-12-18 00:00:00', '0');
INSERT INTO `tb_product_sell_daily` VALUES ('113', '7', '15', '2017-12-18 00:00:00', '0');
INSERT INTO `tb_product_sell_daily` VALUES ('114', '8', '16', '2017-12-18 00:00:00', '0');
INSERT INTO `tb_product_sell_daily` VALUES ('115', '9', '16', '2017-12-18 00:00:00', '0');
INSERT INTO `tb_product_sell_daily` VALUES ('116', '10', '20', '2017-12-18 00:00:00', '0');
INSERT INTO `tb_product_sell_daily` VALUES ('117', '11', '20', '2017-12-18 00:00:00', '0');
INSERT INTO `tb_product_sell_daily` VALUES ('118', '15', '20', '2017-12-18 00:00:00', '0');
INSERT INTO `tb_product_sell_daily` VALUES ('125', '4', '15', '2018-01-07 00:00:00', '0');
INSERT INTO `tb_product_sell_daily` VALUES ('126', '5', '15', '2018-01-07 00:00:00', '0');
INSERT INTO `tb_product_sell_daily` VALUES ('127', '6', '15', '2018-01-07 00:00:00', '0');
INSERT INTO `tb_product_sell_daily` VALUES ('128', '7', '15', '2018-01-07 00:00:00', '0');
INSERT INTO `tb_product_sell_daily` VALUES ('129', '8', '16', '2018-01-07 00:00:00', '0');
INSERT INTO `tb_product_sell_daily` VALUES ('130', '9', '16', '2018-01-07 00:00:00', '0');
INSERT INTO `tb_product_sell_daily` VALUES ('131', '10', '20', '2018-01-07 00:00:00', '0');
INSERT INTO `tb_product_sell_daily` VALUES ('132', '11', '20', '2018-01-07 00:00:00', '0');
INSERT INTO `tb_product_sell_daily` VALUES ('133', '12', '20', '2018-01-07 00:00:00', '0');
INSERT INTO `tb_product_sell_daily` VALUES ('134', '13', '20', '2018-01-07 00:00:00', '0');
INSERT INTO `tb_product_sell_daily` VALUES ('135', '14', '20', '2018-01-07 00:00:00', '0');
INSERT INTO `tb_product_sell_daily` VALUES ('136', '15', '20', '2018-01-07 00:00:00', '0');
INSERT INTO `tb_product_sell_daily` VALUES ('137', '4', '15', '2018-11-21 00:00:00', '0');
INSERT INTO `tb_product_sell_daily` VALUES ('138', '5', '15', '2018-11-21 00:00:00', '0');
INSERT INTO `tb_product_sell_daily` VALUES ('139', '6', '15', '2018-11-21 00:00:00', '0');
INSERT INTO `tb_product_sell_daily` VALUES ('140', '7', '15', '2018-11-21 00:00:00', '0');
INSERT INTO `tb_product_sell_daily` VALUES ('141', '8', '16', '2018-11-21 00:00:00', '0');
INSERT INTO `tb_product_sell_daily` VALUES ('142', '9', '16', '2018-11-21 00:00:00', '0');
INSERT INTO `tb_product_sell_daily` VALUES ('143', '10', '20', '2018-11-21 00:00:00', '0');
INSERT INTO `tb_product_sell_daily` VALUES ('144', '11', '20', '2018-11-21 00:00:00', '0');
INSERT INTO `tb_product_sell_daily` VALUES ('145', '12', '20', '2018-11-21 00:00:00', '0');
INSERT INTO `tb_product_sell_daily` VALUES ('146', '13', '20', '2018-11-21 00:00:00', '0');
INSERT INTO `tb_product_sell_daily` VALUES ('147', '14', '20', '2018-11-21 00:00:00', '0');
INSERT INTO `tb_product_sell_daily` VALUES ('148', '15', '20', '2018-11-21 00:00:00', '0');
INSERT INTO `tb_product_sell_daily` VALUES ('149', '16', '34', '2018-11-21 00:00:00', '0');
INSERT INTO `tb_product_sell_daily` VALUES ('150', '17', '34', '2018-11-21 00:00:00', '0');
INSERT INTO `tb_product_sell_daily` VALUES ('151', '4', '15', '2018-12-05 00:00:00', '1');
INSERT INTO `tb_product_sell_daily` VALUES ('152', '12', '20', '2019-03-07 00:00:00', '1');

-- ----------------------------
-- Table structure for tb_shop
-- ----------------------------
DROP TABLE IF EXISTS `tb_shop`;
CREATE TABLE `tb_shop` (
  `shop_id` int(10) NOT NULL AUTO_INCREMENT,
  `owner_id` int(10) NOT NULL COMMENT '店铺创建人',
  `area_id` int(5) DEFAULT NULL,
  `shop_category_id` int(11) DEFAULT NULL,
  `shop_name` varchar(256) NOT NULL,
  `shop_desc` varchar(1024) DEFAULT NULL,
  `shop_addr` varchar(200) DEFAULT NULL,
  `phone` varchar(128) DEFAULT NULL,
  `shop_img` varchar(1024) DEFAULT NULL,
  `priority` int(3) DEFAULT '0',
  `create_time` datetime DEFAULT NULL,
  `last_edit_time` datetime DEFAULT NULL,
  `enable_status` int(2) NOT NULL DEFAULT '0',
  `advice` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`shop_id`),
  KEY `fk_shop_area` (`area_id`),
  KEY `fk_shop_profile` (`owner_id`),
  KEY `fk_shop_shopcate` (`shop_category_id`),
  CONSTRAINT `fk_shop_area` FOREIGN KEY (`area_id`) REFERENCES `tb_area` (`area_id`),
  CONSTRAINT `fk_shop_profile` FOREIGN KEY (`owner_id`) REFERENCES `tb_person_info` (`user_id`),
  CONSTRAINT `fk_shop_shopcate` FOREIGN KEY (`shop_category_id`) REFERENCES `tb_shop_category` (`shop_category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_shop
-- ----------------------------
INSERT INTO `tb_shop` VALUES ('1', '1', '3', '14', '修改后的店铺名称', '测试描述', '正式地址', '13810524086', '/upload/images/item/shop/1/2017092400140110757.jpg', '10', '2017-08-03 00:08:32', '2019-05-22 10:13:56', '1', '审核中');
INSERT INTO `tb_shop` VALUES ('28', '1', '2', '22', '小黄人主题奶茶店', '不接受预订，请直接来店里进行消费', '位于东苑2号', '13810524086', '/upload/images/item/shop/28/2017100216580081030.jpg', '50', '2017-09-26 01:04:13', '2019-05-25 06:48:29', '1', null);
INSERT INTO `tb_shop` VALUES ('29', '1', '3', '22', '暴漫奶茶店', '过来喝喝就知道啦，你是我的奶茶', '西苑1号', '1211334565', '/upload/images/item/shop/29/2017092601054939287.jpg', '40', '2017-09-26 01:05:49', '2019-05-22 11:36:34', '1', null);
INSERT INTO `tb_shop` VALUES ('30', '1', '2', '20', '彪哥大排档', '敢说不好吃吗', '东苑1号', '13628763625', '/upload/images/item/shop/30/2017092601063878278.jpg', '30', '2017-09-26 01:06:37', '2017-09-26 01:06:37', '1', null);
INSERT INTO `tb_shop` VALUES ('31', '1', '2', '20', '威哥大排档', '干掉彪哥大排档', '东苑南路', '126554437261', '/upload/images/item/shop/31/2017092601072177572.jpg', '20', '2017-09-26 01:07:21', '2017-09-26 01:07:21', '1', null);
INSERT INTO `tb_shop` VALUES ('32', '1', '2', '22', '你是我的奶茶', '奶茶店再次来袭', '东苑六路', '13652384615', '/upload/images/item/shop/32/2017092601081463136.jpg', '10', '2017-09-26 01:08:13', '2017-09-26 01:08:13', '1', null);
INSERT INTO `tb_shop` VALUES ('35', '8', '2', '22', '奶茶来了', '奶茶来了', '西苑7路', null, null, '0', null, null, '0', null);

-- ----------------------------
-- Table structure for tb_shop_auth_map
-- ----------------------------
DROP TABLE IF EXISTS `tb_shop_auth_map`;
CREATE TABLE `tb_shop_auth_map` (
  `shop_auth_id` int(10) NOT NULL AUTO_INCREMENT,
  `employee_id` int(10) NOT NULL,
  `shop_id` int(10) NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `title_flag` int(2) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `last_edit_time` datetime DEFAULT NULL,
  `enable_status` int(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`shop_auth_id`),
  KEY `fk_shop_auth_map_shop` (`shop_id`),
  KEY `uk_shop_auth_map` (`employee_id`,`shop_id`),
  CONSTRAINT `fk_shop_auth_map_employee` FOREIGN KEY (`employee_id`) REFERENCES `tb_person_info` (`user_id`),
  CONSTRAINT `fk_shop_auth_map_shop` FOREIGN KEY (`shop_id`) REFERENCES `tb_shop` (`shop_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_shop_auth_map
-- ----------------------------
INSERT INTO `tb_shop_auth_map` VALUES ('1', '13', '34', '店家', '0', '2018-11-21 17:49:08', '2018-11-21 17:49:08', '1');

-- ----------------------------
-- Table structure for tb_shop_category
-- ----------------------------
DROP TABLE IF EXISTS `tb_shop_category`;
CREATE TABLE `tb_shop_category` (
  `shop_category_id` int(11) NOT NULL AUTO_INCREMENT,
  `shop_category_name` varchar(100) NOT NULL DEFAULT '',
  `shop_category_desc` varchar(1000) DEFAULT '',
  `shop_category_img` varchar(2000) DEFAULT NULL,
  `priority` int(2) NOT NULL DEFAULT '0',
  `create_time` datetime DEFAULT NULL,
  `last_edit_time` datetime DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`shop_category_id`),
  KEY `fk_shop_category_self` (`parent_id`),
  CONSTRAINT `fk_shop_category_self` FOREIGN KEY (`parent_id`) REFERENCES `tb_shop_category` (`shop_category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_shop_category
-- ----------------------------
INSERT INTO `tb_shop_category` VALUES ('1', 'test1', '', null, '0', null, null, '12');
INSERT INTO `tb_shop_category` VALUES ('10', '二手市场', '二手商品交易', '/upload/images/item/shopcategory/2017061223272255687.png', '100', '2017-06-04 20:10:58', '2017-06-12 23:27:22', null);
INSERT INTO `tb_shop_category` VALUES ('11', '美容美发', '美容美发', '/upload/images/item/shopcategory/2017061223273314635.png', '99', '2017-06-04 20:12:57', '2017-06-12 23:27:33', null);
INSERT INTO `tb_shop_category` VALUES ('12', '美食饮品', '美食饮品', '/upload/images/item/shopcategory/2017061223274213433.png', '98', '2017-06-04 20:15:21', '2017-06-12 23:27:42', null);
INSERT INTO `tb_shop_category` VALUES ('13', '休闲娱乐', '休闲娱乐', '/upload/images/item/shopcategory/2017061223275121460.png', '97', '2017-06-04 20:19:29', '2017-06-12 23:27:51', null);
INSERT INTO `tb_shop_category` VALUES ('14', '旧车', '旧车', '/upload/images/item/shopcategory/2017060420315183203.png', '80', '2017-06-04 20:31:51', '2017-06-04 20:31:51', '10');
INSERT INTO `tb_shop_category` VALUES ('15', '二手书籍', '二手书籍', '/upload/images/item/shopcategory/2017060420322333745.png', '79', '2017-06-04 20:32:23', '2017-06-04 20:32:23', '10');
INSERT INTO `tb_shop_category` VALUES ('17', '护理', '护理', '/upload/images/item/shopcategory/2017060420372391702.png', '76', '2017-06-04 20:37:23', '2017-06-04 20:37:23', '11');
INSERT INTO `tb_shop_category` VALUES ('18', '理发', '理发', '/upload/images/item/shopcategory/2017060420374775350.png', '74', '2017-06-04 20:37:47', '2017-06-04 20:37:47', '11');
INSERT INTO `tb_shop_category` VALUES ('20', '大排档', '大排档', '/upload/images/item/shopcategory/2017060420460491494.png', '59', '2017-06-04 20:46:04', '2017-06-04 20:46:04', '12');
INSERT INTO `tb_shop_category` VALUES ('22', '奶茶店', '奶茶店', '/upload/images/item/shopcategory/2017060420464594520.png', '58', '2017-06-04 20:46:45', '2017-06-04 20:46:45', '12');
INSERT INTO `tb_shop_category` VALUES ('24', '密室逃生', '密室逃生', '/upload/images/item/shopcategory/2017060420500783376.png', '56', '2017-06-04 20:50:07', '2017-06-04 21:45:53', '13');
INSERT INTO `tb_shop_category` VALUES ('25', 'KTV', 'KTV', '/upload/images/item/shopcategory/2017060420505834244.png', '57', '2017-06-04 20:50:58', '2017-06-04 20:51:14', '13');
INSERT INTO `tb_shop_category` VALUES ('27', '培训教育', '培训教育', '/upload/images/item/shopcategory/2017061223280082147.png', '96', '2017-06-04 21:51:36', '2017-06-12 23:28:00', null);
INSERT INTO `tb_shop_category` VALUES ('28', '租赁市场', '租赁市场', '/upload/images/item/shopcategory/2017061223281361578.png', '95', '2017-06-04 21:53:52', '2017-06-12 23:28:13', null);
INSERT INTO `tb_shop_category` VALUES ('29', '程序设计', '程序设计', '/upload/images/item/shopcategory/2017060421593496807.png', '50', '2017-06-04 21:59:34', '2017-06-04 21:59:34', '27');
INSERT INTO `tb_shop_category` VALUES ('30', '声乐舞蹈', '声乐舞蹈', '/upload/images/item/shopcategory/2017060421595843693.png', '49', '2017-06-04 21:59:58', '2017-06-04 21:59:58', '27');
INSERT INTO `tb_shop_category` VALUES ('31', '演出道具', '演出道具', '/upload/images/item/shopcategory/2017060422114076152.png', '45', '2017-06-04 22:11:40', '2017-06-04 22:11:40', '28');
INSERT INTO `tb_shop_category` VALUES ('32', '交通工具', '交通工具', '/upload/images/item/shopcategory/2017060422121144586.png', '44', '2017-06-04 22:12:11', '2017-06-04 22:12:11', '28');

-- ----------------------------
-- Table structure for tb_user_award_map
-- ----------------------------
DROP TABLE IF EXISTS `tb_user_award_map`;
CREATE TABLE `tb_user_award_map` (
  `user_award_id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL,
  `award_id` int(10) NOT NULL,
  `shop_id` int(10) NOT NULL,
  `operator_id` int(10) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `used_status` int(2) NOT NULL DEFAULT '0',
  `point` int(10) DEFAULT NULL,
  PRIMARY KEY (`user_award_id`),
  KEY `fk_user_award_map_profile` (`user_id`),
  KEY `fk_user_award_map_award` (`award_id`),
  KEY `fk_user_award_map_shop` (`shop_id`),
  KEY `fk_user_award_map_operator` (`operator_id`),
  CONSTRAINT `fk_user_award_map_award` FOREIGN KEY (`award_id`) REFERENCES `tb_award` (`award_id`),
  CONSTRAINT `fk_user_award_map_operator` FOREIGN KEY (`operator_id`) REFERENCES `tb_person_info` (`user_id`),
  CONSTRAINT `fk_user_award_map_profile` FOREIGN KEY (`user_id`) REFERENCES `tb_person_info` (`user_id`),
  CONSTRAINT `fk_user_award_map_shop` FOREIGN KEY (`shop_id`) REFERENCES `tb_shop` (`shop_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_user_award_map
-- ----------------------------
INSERT INTO `tb_user_award_map` VALUES ('1', '8', '15', '20', null, '2018-12-05 15:13:35', '0', '3');
INSERT INTO `tb_user_award_map` VALUES ('2', '13', '15', '20', null, '2019-03-14 14:21:41', '0', '3');
INSERT INTO `tb_user_award_map` VALUES ('3', '13', '15', '20', null, '2019-03-14 14:38:09', '0', '3');
INSERT INTO `tb_user_award_map` VALUES ('4', '13', '15', '20', null, '2019-03-14 14:44:30', '0', '3');

-- ----------------------------
-- Table structure for tb_user_product_map
-- ----------------------------
DROP TABLE IF EXISTS `tb_user_product_map`;
CREATE TABLE `tb_user_product_map` (
  `user_product_id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) DEFAULT NULL,
  `product_id` int(100) DEFAULT NULL,
  `shop_id` int(10) DEFAULT NULL,
  `operator_id` int(10) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `point` int(10) DEFAULT '0',
  PRIMARY KEY (`user_product_id`),
  KEY `fk_user_product_map_profile` (`user_id`),
  KEY `fk_user_product_map_product` (`product_id`),
  KEY `fk_user_product_map_shop` (`shop_id`),
  KEY `fk_user_product_map_operator` (`operator_id`),
  CONSTRAINT `fk_user_product_map_operator` FOREIGN KEY (`operator_id`) REFERENCES `tb_person_info` (`user_id`),
  CONSTRAINT `fk_user_product_map_product` FOREIGN KEY (`product_id`) REFERENCES `tb_product` (`product_id`),
  CONSTRAINT `fk_user_product_map_profile` FOREIGN KEY (`user_id`) REFERENCES `tb_person_info` (`user_id`),
  CONSTRAINT `fk_user_product_map_shop` FOREIGN KEY (`shop_id`) REFERENCES `tb_shop` (`shop_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_user_product_map
-- ----------------------------

-- ----------------------------
-- Table structure for tb_user_shop_map
-- ----------------------------
DROP TABLE IF EXISTS `tb_user_shop_map`;
CREATE TABLE `tb_user_shop_map` (
  `user_shop_id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL,
  `shop_id` int(10) NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `point` int(10) DEFAULT NULL,
  PRIMARY KEY (`user_shop_id`),
  UNIQUE KEY `uq_user_shop` (`user_id`,`shop_id`),
  KEY `fk_user_shop_shop` (`shop_id`),
  CONSTRAINT `fk_user_shop_shop` FOREIGN KEY (`shop_id`) REFERENCES `tb_shop` (`shop_id`),
  CONSTRAINT `fk_user_shop_user` FOREIGN KEY (`user_id`) REFERENCES `tb_person_info` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_user_shop_map
-- ----------------------------
INSERT INTO `tb_user_shop_map` VALUES ('1', '13', '34', '2018-11-22 14:35:38', '18');
INSERT INTO `tb_user_shop_map` VALUES ('2', '13', '20', '2018-11-22 15:07:54', '0');
INSERT INTO `tb_user_shop_map` VALUES ('3', '13', '15', '2018-12-05 14:27:43', '3');
INSERT INTO `tb_user_shop_map` VALUES ('4', '8', '20', '2018-12-05 15:03:47', '7');
