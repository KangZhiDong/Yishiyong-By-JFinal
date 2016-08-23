/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50629
 Source Host           : localhost
 Source Database       : yishiyong

 Target Server Type    : MySQL
 Target Server Version : 50629
 File Encoding         : utf-8

 Date: 08/23/2016 08:16:36 AM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `business`
-- ----------------------------
DROP TABLE IF EXISTS `business`;
CREATE TABLE `business` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) unsigned NOT NULL,
  `account` varchar(45) COLLATE utf8_bin NOT NULL,
  `mallPlatform` tinyint(4) NOT NULL,
  `wangWangId` varchar(45) COLLATE utf8_bin NOT NULL,
  `shopUrl` varchar(255) COLLATE utf8_bin NOT NULL,
  `shopLogoUrl` varchar(255) COLLATE utf8_bin NOT NULL,
  `uniqueCode` varchar(45) COLLATE utf8_bin NOT NULL,
  `productUrlByUniqueCode` varchar(225) COLLATE utf8_bin NOT NULL,
  `bindDate` datetime DEFAULT NULL,
  `status` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Table structure for `buyer`
-- ----------------------------
DROP TABLE IF EXISTS `buyer`;
CREATE TABLE `buyer` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) unsigned NOT NULL,
  `mallPlatformId` int(11) DEFAULT '1',
  `wangWangId` varchar(45) COLLATE utf8_bin NOT NULL,
  `screenshotWangWangInfoUrl` varchar(225) COLLATE utf8_bin NOT NULL,
  `alipayRealName` varchar(45) COLLATE utf8_bin NOT NULL,
  `alipayAccount` varchar(45) COLLATE utf8_bin NOT NULL,
  `identityCard` varchar(45) COLLATE utf8_bin NOT NULL,
  `screenshotAlipayRealNameUrl` varchar(225) COLLATE utf8_bin NOT NULL,
  `province` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `city` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `area` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `stree` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `screenshotIpUrl` varchar(225) COLLATE utf8_bin DEFAULT NULL,
  `fullName` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `phone` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `bindDate` datetime DEFAULT NULL,
  `lastModifyDate` datetime DEFAULT NULL,
  `auditDate` datetime DEFAULT NULL,
  `status` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `wangWangId_UNIQUE` (`wangWangId`),
  UNIQUE KEY `alipayAccount_UNIQUE` (`alipayAccount`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Table structure for `member`
-- ----------------------------
DROP TABLE IF EXISTS `member`;
CREATE TABLE `member` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `account` varchar(45) COLLATE utf8_bin NOT NULL COMMENT '用户登录账号',
  `password` varchar(45) COLLATE utf8_bin NOT NULL COMMENT '用户密码',
  `payPassword` varchar(45) COLLATE utf8_bin DEFAULT NULL COMMENT '用户支付密码',
  `qq` varchar(45) COLLATE utf8_bin NOT NULL,
  `email` varchar(45) COLLATE utf8_bin NOT NULL,
  `phone` varchar(45) COLLATE utf8_bin NOT NULL,
  `portrait` varchar(45) COLLATE utf8_bin DEFAULT NULL COMMENT '头像地址',
  `vipLevel` int(11) DEFAULT '0',
  `vipValidityDate` datetime DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `lastLoginDate` datetime DEFAULT NULL,
  `role` tinyint(4) DEFAULT '0',
  `isBindShop` tinyint(4) DEFAULT NULL,
  `points` double NOT NULL DEFAULT '0',
  `moneyAdvanced` double DEFAULT NULL COMMENT '金币数量',
  `moneyBacking` double DEFAULT NULL,
  `moneyBackingCount` int(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `account_UNIQUE` (`account`),
  UNIQUE KEY `qq_UNIQUE` (`qq`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `phone_UNIQUE` (`phone`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Table structure for `task`
-- ----------------------------
DROP TABLE IF EXISTS `task`;
CREATE TABLE `task` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL,
  `mallPlatformId` int(11) unsigned NOT NULL,
  `businessId` int(10) unsigned NOT NULL,
  `businessWangWangId` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `taskStatus` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `publishTime` datetime DEFAULT NULL,
  `productName` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `productUrl` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `productType` int(11) DEFAULT NULL,
  `productPictureUrl` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `productPrice` double DEFAULT NULL,
  `productNeedBuyAmount` int(11) DEFAULT NULL,
  `productAttr1` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `productAttr2` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `productMainPictureUrl` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `searchKeyword` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `searchFilter1` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `searchFilter2` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `searchFilter3` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `searchFilter4` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `searchStartPrice` double DEFAULT NULL,
  `searchEndPrice` double DEFAULT NULL,
  `searchArea` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `total` int(11) DEFAULT '0',
  `remain` int(11) DEFAULT '0',
  `totalPerDay` int(11) DEFAULT '0',
  `feedbackCoin` int(11) DEFAULT NULL,
  `applied` int(11) DEFAULT '0',
  `qualified` int(11) DEFAULT '0',
  `received` int(11) DEFAULT '0',
  `deadline` datetime DEFAULT NULL,
  `productDesc` text COLLATE utf8_bin,
  `auditDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=20151121211804454 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Table structure for `taskInstance`
-- ----------------------------
DROP TABLE IF EXISTS `taskInstance`;
CREATE TABLE `taskInstance` (
  `id` bigint(21) unsigned NOT NULL,
  `taskId` bigint(11) unsigned NOT NULL,
  `buyerId` int(11) unsigned NOT NULL,
  `wangWangId` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `applyStatus` int(11) NOT NULL DEFAULT '0' COMMENT '/**\n     * 申请状态\n     * (0:新建；1:搜索商品；2:核对商品；3:放入购物车；4:提交试用申请；\n     * 5:进入试用商品页；6:分享宝贝；7:收藏宝贝和店铺；8提交试用申请；\n     * 9:进入试用商品页；10',
  `awardgetStatus` int(11) DEFAULT '0',
  `applyTime` datetime DEFAULT NULL,
  `deadlineTime` datetime DEFAULT NULL,
  `deadlineTime2` datetime DEFAULT NULL,
  `ortherUrl1` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ortherUrl2` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ortherUrl3` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ortherUrl4` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `step1Time` datetime DEFAULT NULL,
  `step2Time` datetime DEFAULT NULL,
  `step3Time` datetime DEFAULT NULL,
  `step4Time` datetime DEFAULT NULL,
  `step5Time` datetime DEFAULT NULL,
  `step6Time` datetime DEFAULT NULL,
  `step7Time` datetime DEFAULT NULL,
  `step8Time` datetime DEFAULT NULL,
  `step9Time` datetime DEFAULT NULL,
  `step10Time` datetime DEFAULT NULL,
  `step11Time` datetime DEFAULT NULL,
  `checkedProductUrl` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `shareUrl` varchar(225) COLLATE utf8_bin DEFAULT NULL,
  `collectProductScreenshotUrl` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `collectShopScreenshotUrl` varchar(225) COLLATE utf8_bin DEFAULT NULL,
  `shopProductUrl1` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `shopProductUrl2` varchar(225) COLLATE utf8_bin DEFAULT NULL,
  `shopProductUrl3` varchar(225) COLLATE utf8_bin DEFAULT NULL,
  `shopProductUrl4` varchar(225) COLLATE utf8_bin DEFAULT NULL,
  `chatWithCustomServiceScreenshotUrl` varchar(225) COLLATE utf8_bin DEFAULT NULL,
  `succedOrderScreenshotUrl` varchar(225) COLLATE utf8_bin DEFAULT NULL,
  `orderId` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `realProductPrice` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `sysAwardgetDate` datetime DEFAULT NULL,
  `awardgetDeadline` datetime DEFAULT NULL,
  `isAbandoned` tinyint(4) DEFAULT '0',
  `productComment` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `finishedTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `task_buyer_index` (`taskId`,`buyerId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

SET FOREIGN_KEY_CHECKS = 1;
