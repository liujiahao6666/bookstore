/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 80013
Source Host           : 127.0.0.1:3306
Source Database       : bookstore

Target Server Type    : MYSQL
Target Server Version : 80013
File Encoding         : 65001

Date: 2020-04-19 17:11:14
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for book
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book` (
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `publisher` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `id` int(6) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `price` float(10,2) NOT NULL,
  `img` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `storeCount` int(11) DEFAULT NULL,
  `info` varchar(512) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of book
-- ----------------------------
INSERT INTO `book` VALUES ('On the road', 'edu publisher', '000036', '39.90', '83c9d306-dcbc-4cde-9ee5-9ae2bcf148d7.jpg', '10', 'By Jack Kerouac');
INSERT INTO `book` VALUES ('On the road', 'edu publisher', '000040', '39.90', '27fa4468-16a7-4c3c-86d9-592b77d97300.jpg', '10', 'By Jack Kerouac');

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bookID` int(10) unsigned zerofill NOT NULL,
  `userAccount` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `count` int(10) unsigned zerofill NOT NULL,
  PRIMARY KEY (`id`),
  KEY `book_ref` (`bookID`),
  KEY `user_ref` (`userAccount`),
  CONSTRAINT `book_ref` FOREIGN KEY (`bookID`) REFERENCES `book` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `user_ref` FOREIGN KEY (`userAccount`) REFERENCES `user` (`account`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of order
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `account` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(16) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `province` varchar(16) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(16) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `money` float DEFAULT NULL,
  `info` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`account`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('test001', null, '123456', null, null, null, '0', null);
