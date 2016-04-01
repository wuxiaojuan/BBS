/*
Navicat MySQL Data Transfer

Source Server         : bbs
Source Server Version : 50624
Source Host           : localhost:3306
Source Database       : test

Target Server Type    : MYSQL
Target Server Version : 50624
File Encoding         : 65001

Date: 2016-04-01 17:03:03
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_comment`
-- ----------------------------
DROP TABLE IF EXISTS `t_comment`;
CREATE TABLE `t_comment` (
  `cid` int(4) NOT NULL AUTO_INCREMENT,
  `content` text NOT NULL COMMENT '评论内容',
  `create_time` varchar(50) NOT NULL COMMENT '评论时间',
  `userid` varchar(64) NOT NULL COMMENT '评论用户',
  `aid` int(4) NOT NULL COMMENT '博客aid(外键)',
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='评论表';

-- ----------------------------
-- Records of t_comment
-- ----------------------------
