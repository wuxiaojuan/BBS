/*
Navicat MySQL Data Transfer

Source Server         : bbs
Source Server Version : 50624
Source Host           : localhost:3306
Source Database       : test

Target Server Type    : MYSQL
Target Server Version : 50624
File Encoding         : 65001

Date: 2016-04-01 17:03:24
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `qq` varchar(50) NOT NULL,
  `type` int(11) NOT NULL DEFAULT '1' COMMENT '1为普通用户，2为管理员',
  `valid` int(11) NOT NULL DEFAULT '1' COMMENT '1:有效 0:无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('12', 'admin', '96e79218965eb72c92a549dd5a330112', '12121312', '1');
INSERT INTO `t_user` VALUES ('12', 'admin', '96e79218965eb72c92a549dd5a330112', '12121312', '2');
