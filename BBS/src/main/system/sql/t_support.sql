/*
Navicat MySQL Data Transfer

Source Server         : bbs
Source Server Version : 50624
Source Host           : localhost:3306
Source Database       : test

Target Server Type    : MYSQL
Target Server Version : 50624
File Encoding         : 65001

Date: 2016-04-01 17:03:17
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_support`
-- ----------------------------
DROP TABLE IF EXISTS `t_support`;
CREATE TABLE `t_support` (
  `acid` int(4) NOT NULL AUTO_INCREMENT COMMENT '外键',
  `cid` int(4) NOT NULL COMMENT '主键',
  `type` char(1) NOT NULL DEFAULT 'a' COMMENT 'a:博客（支持，反对），c:评论（支持，反对）',
  `create_time` varchar(50) NOT NULL COMMENT '操作时间',
  `support` char(1) NOT NULL DEFAULT '1' COMMENT '1:支持，2:反对',
  `userid` varchar(64) NOT NULL COMMENT '操作用户',
  PRIMARY KEY (`acid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='评论支持表';

-- ----------------------------
-- Records of t_support
-- ----------------------------
