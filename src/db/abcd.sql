/*
Navicat MySQL Data Transfer

Source Server         : phone
Source Server Version : 50714
Source Host           : localhost:3306
Source Database       : abcd

Target Server Type    : MYSQL
Target Server Version : 50714
File Encoding         : 65001

Date: 2018-10-08 10:59:55
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL COMMENT '商品名称',
  `introduce` varchar(200) DEFAULT '' COMMENT '商品简介',
  `discount` varchar(100) DEFAULT '' COMMENT '优惠',
  `price` decimal(10,2) NOT NULL,
  `num` int(11) NOT NULL,
  `type` varchar(255) DEFAULT NULL COMMENT '商品类型',
  `kind` varchar(255) DEFAULT '' COMMENT '商品的种类',
  `imagelist` varchar(300) DEFAULT '' COMMENT '商品图片列表',
  `commentnum` int(11) DEFAULT NULL COMMENT '评论人数',
  `stock` varchar(255) DEFAULT '' COMMENT '库存',
  `decount` varchar(100) DEFAULT '' COMMENT '描述优惠',
  PRIMARY KEY (`id`),
  KEY `kind` (`kind`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('1', '../img/zb1.jpg', '映时时尚手工编红珊瑚圆珠手串', '', '', '1680.00', '20', '珠宝组合', '珠宝', '../img/zb1.jpg,../img/zb10.jpg,../img/zb4.jpg', '2', null, '');
INSERT INTO `goods` VALUES ('2', '../img/zb2.jpg', '卓凡猛犸象牙吉祥如意吊坠', '', '', '4980.00', '30', '珠宝组合', '珠宝', '../img/zb15.jpg', '2', null, '');
INSERT INTO `goods` VALUES ('3', '../img/zb3.jpg', '映时品牌特检手串3款可选', '', '', '799.00', '21', '珠宝组合', '珠宝', '../img/zb15.jpg', '2', null, '');
INSERT INTO `goods` VALUES ('4', '../img/zb4.jpg', '欧泊石套组 带证书', '满购加赠商品', '', '1999.00', '34', '珠宝组合', '珠宝', '../img/zb3.jpg,../img/zb3.jpg,../img/zb3.jpg,../img/zb3.jpg,../img/zb3.jpg', '2', null, '');
INSERT INTO `goods` VALUES ('5', '../img/zb5.jpg', '卓凡雅致查罗手镯', '', '1980', '1280.00', '55', '珠宝单件', '珠宝', '../img/zb4.jpg,../img/zb5.jpg,../img/zb8.jpg,../img/zb4.jpg,../img/zb4.jpg,../img/zb4.jpg,../img/zb4.jpg', '2', null, '平日价');
INSERT INTO `goods` VALUES ('6', '../img/zb6.jpg', '卓凡18K金镶嵌蓝宝石配钻戒指', '', '6800', '5800.00', '45', '珠宝组合', '珠宝', '../img/zb15.jpg', '0', null, '平日价');
INSERT INTO `goods` VALUES ('7', '../img/zb20.jpg', '卓凡18K金镶事业有成碧玺耳坠', '', '2880', '1780.00', '565', '珠宝单件', '珠宝', '../img/zb15.jpg', '0', null, '平日价');
INSERT INTO `goods` VALUES ('8', '../img/zb7.jpg', '映时红珊瑚圆珠编织项链', '', '', '4580.00', '76', '珠宝单件', '珠宝', '../img/zb7.jpg,../img/zb7.jpg,../img/zb7.jpg,../img/zb7.jpg,../img/zb7.jpg,../img/zb7.jpg', '2', null, '');
INSERT INTO `goods` VALUES ('9', '../img/zb8.jpg', '映时红珊瑚树枝文艺款吊坠', '', '', '2680.00', '76', '珠宝组合', '珠宝', '../img/zb15.jpg', '2', null, '');
INSERT INTO `goods` VALUES ('10', '../img/zb9.jpg', '曼丽翠S925银镶青金石 戒指简单爱', '', '', '399.00', '87', '珠宝单件', '珠宝', '../img/zb3.jpg../img/zb3.jpg../img/zb3.jpg,../img/zb3.jpg,../img/zb3.jpg,../img/zb3.jpg,../img/zb3.jpg,../img/zb3.jpg,../img/zb3.jpg,../img/zb3.jpg', '2', null, '');
INSERT INTO `goods` VALUES ('11', '../img/zb10.jpg', '曼丽翠925银查罗石水滴吊坠', '', '788', '709.00', '54', '珠宝单件', '珠宝', '../img/zb15.jpg', '0', null, '平日价');
INSERT INTO `goods` VALUES ('12', '../img/zb11.jpg', 'CDJ花容月貌18k红宝石吊坠·女', '', '', '12888.00', '23', '珠宝组合', '珠宝', '../img/zb15.jpg', '2', null, '');
INSERT INTO `goods` VALUES ('13', '../img/zb12.jpg', 'Powkeen珠宝“月光爱人”套组', '', '', '698.00', '12', '珠宝单件', '珠宝', '../img/zb15.jpg', '2', null, '');
INSERT INTO `goods` VALUES ('14', '../img/zb13.jpg', '安妮星光璀璨18K金珍珠项链', '', '', '980.00', '43', '珠宝组合', '珠宝', '../img/zb11.jpg,../img/zb11.jpg,../img/zb11.jpg,../img/zb11.jpg,../img/zb11.jpg,../img/zb11.jpg', '2', null, '');
INSERT INTO `goods` VALUES ('15', '../img/zb14.jpg', '喜满堂豪华镶嵌坦桑石项链', '', '', '3980.00', '556', '珠宝单件', '珠宝', '../img/zb15.jpg', '2', null, '');
INSERT INTO `goods` VALUES ('16', '../img/zb15.jpg', '爱华尚 “千年灵韵”精品蜜蜡大吊坠', '', '', '9980.00', '76', '珠宝组合', '珠宝', '../img/zb15.jpg', '0', null, '');
INSERT INTO `goods` VALUES ('17', '../img/zb16.jpg', '祥凤阁 鸽血红色托帕石戒指', '', '10000', '8800.00', '78', '珠宝单件', '珠宝', '../img/zb3.jpg,../img/zb3.jpg,../img/zb3.jpg,../img/zb3.jpg,../img/zb3.jpg,../img/zb3.jpg,../img/zb3.jpg,../img/zb3.jpg,../img/zb3.jpg', '2', null, '平日价');
INSERT INTO `goods` VALUES ('18', '../img/zb17.jpg', '梦思芭克 天幕繁星钻石戒指', '', '', '3999.00', '87', '珠宝组合', '珠宝', '../img/zb15.jpg', '2', null, '');
INSERT INTO `goods` VALUES ('19', '../img/zb18.jpg', '华翠缘天然A货翡翠貔貅吊坠', '', '', '2000.00', '43', '珠宝单件', '珠宝', '../img/zb15.jpg', '2', null, '');
INSERT INTO `goods` VALUES ('20', '../img/zb19.jpg', '水年华孔雀开屏淡水珍珠胸针·白色', '', '', '1000.00', '123', '珠宝单件', '珠宝', '../img/zb15.jpg', '0', null, '');

-- ----------------------------
-- Table structure for goodslist
-- ----------------------------
DROP TABLE IF EXISTS `goodslist`;
CREATE TABLE `goodslist` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of goodslist
-- ----------------------------
INSERT INTO `goodslist` VALUES ('1', '钻石');
INSERT INTO `goodslist` VALUES ('2', '厨房');
INSERT INTO `goodslist` VALUES ('3', '服饰');
INSERT INTO `goodslist` VALUES ('4', '美妆');
INSERT INTO `goodslist` VALUES ('5', '家居');
INSERT INTO `goodslist` VALUES ('6', '食品');

-- ----------------------------
-- Table structure for login
-- ----------------------------
DROP TABLE IF EXISTS `login`;
CREATE TABLE `login` (
  `admin` varchar(255) CHARACTER SET utf8 NOT NULL,
  `pass` varchar(255) CHARACTER SET utf8 NOT NULL,
  `nickname` varchar(255) CHARACTER SET utf8 DEFAULT '',
  `phone` varchar(255) DEFAULT NULL,
  `emie` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `beizu` varchar(255) CHARACTER SET utf8 DEFAULT '',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of login
-- ----------------------------
INSERT INTO `login` VALUES ('a123123', '123456', '行行的秀秀', '1387364672', '778847@qq.com', '秀秀秀', '1');
INSERT INTO `login` VALUES ('blilongwu', '654321', '梧州小肥仔', '15277748256', '1846580@qq.com', '死肥宅', '2');
INSERT INTO `login` VALUES ('Claoxie', '888888', '千锋谢老大', '13999999999', '2838474@qq.com', '', '3');
SET FOREIGN_KEY_CHECKS=1;
