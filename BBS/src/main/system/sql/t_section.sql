/*
Navicat MySQL Data Transfer

Source Server         : bbs
Source Server Version : 50624
Source Host           : localhost:3306
Source Database       : test

Target Server Type    : MYSQL
Target Server Version : 50624
File Encoding         : 65001

Date: 2016-04-01 17:03:11
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_section`
-- ----------------------------
DROP TABLE IF EXISTS `t_section`;
CREATE TABLE `t_section` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL COMMENT '版块名字',
  `create_date` varchar(50) DEFAULT NULL,
  `create_user` varchar(50) DEFAULT NULL,
  `remarks` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Section（版块）';

-- ----------------------------
-- Records of t_section
-- ----------------------------
INSERT INTO `t_section` VALUES ('1', '学习天地', '2016-03-30 16:50:47', '20', null);
INSERT INTO `t_section` VALUES ('2', '娱乐八卦', '2016-03-30 16:50:47', '20', null);
