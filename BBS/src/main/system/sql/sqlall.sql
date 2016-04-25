/*
Navicat MySQL Data Transfer

Source Server         : bbs
Source Server Version : 50624
Source Host           : localhost:3306
Source Database       : test

Target Server Type    : MYSQL
Target Server Version : 50624
File Encoding         : 65001

Date: 2016-04-01 17:01:20
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_article`
-- ----------------------------
DROP TABLE IF EXISTS `t_article`;
CREATE TABLE `t_article` (
  `aid` int(4) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` text NOT NULL COMMENT '标题',
  `content` text NOT NULL COMMENT '博客内容',
  `create_time` varchar(50) NOT NULL COMMENT '创建时间',
  `userid` varchar(64) NOT NULL COMMENT '创建用户',
  `section_id` int(4) NOT NULL,
  `type` int(4) DEFAULT '1' COMMENT '1:发布  2:草稿',
  PRIMARY KEY (`aid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='发博客表';

-- ----------------------------
-- Records of t_article
-- ----------------------------
INSERT INTO `t_article` VALUES ('1', '10个太阳挂天上，有多热？ ', '<p>\r\n	知识点：地球在太阳的照耀下保持热平衡的状态，也就是说，地球得到的热量与散发出去的热量是相等的。</p>\r\n<p>\r\n	小时候，家长大都会给我们讲这样 一个故事。说的是古时候，天上有10个太阳。起初，他们就跟咱们轮流做值日似的，非常自觉，排到自己了，就按时到天空上班。那时候，地上的万物都过得相当 滋润，人类也和谐幸福。可是呢，有一天，这群家伙突然脑洞大开，觉得一个人上班太寂寞，要10个人开团一起天空嗨一把。</p>\r\n', '2016-03-31 14:53:04', '12', '1', '1');
INSERT INTO `t_article` VALUES ('2', '宝宝由于消化不良引起的便秘该怎么办', '<p>\r\n	<span class=\"con\">宝宝大便干硬，排便时哭闹费力。次数比平时明显减少，有时2&mdash;3天甚至6&mdash;7天排便一次。<br />\r\n	　　你可以让宝宝多吃含粗纤维丰富的蔬菜和水果，如芹菜、韭菜、萝卜、香蕉等，以刺激肠壁，使肠蠕动加快，粪便就容易排出体外。<br />\r\n	　　清晨起床后给宝宝饮温开水1杯，可以促进肠蠕动。要注意多绐宝宝饮水，最好是蜂蜜水，蜂蜜水能润肠，也有助于缓解便秘。</span></p>\r\n', '2016-03-31 15:38:12', '12', '2', '1');
INSERT INTO `t_article` VALUES ('3', '我雇佣产品经理的重大标准：你以前从来没有当过产品经理', '<p>\r\n	　&nbsp;&nbsp; 我在建设并领导团队上已经有了 20 年经验，但是在一个问题上我一直有个非主流的观点，那就是我认为产品经理非常没用。而在我的招聘列别上，产品经理一直是个待勾选项。</p>\r\n<p>\r\n	　　当我投身科技领域并开始创业的时候，发现在发展企业中除了找到支援资金之外，最紧要的任务就是在招聘中寻找有经验的人才。而产品经理几乎是每个科技创业公司都必招但目前有个很奇怪的现象，就是所有产品经理都想离开自己的工作岗位，去商学院取得一个商业管理学位。</p>\r\n<p>\r\n	　　在以前，商业管理技能是管理层必备技能，而产品经理几乎处在在公司高管链条方面的最底层。因此，大量资深的产品经理都迫不及待地想脱离原本的工作岗位，想要学习一些商业管理经验，并不奇怪。</p>\r\n<p>\r\n	　　但风水轮流转， 如今在创业公司，那种「极具商业管理技能」的创始人或者公司成员绝不会被风投所喜。如今区分公司与公司不同的，仅仅只是产品和设计，而不是商业管理技能。因此，产品经理似乎不再需要管理技能。</p>\r\n<p>\r\n	　　有个现象可能存在已久了，但我自己是直到在哈佛商学院参加完演讲后回来才发现的。以前在我的公司，所有产品经理都是干一段时间后就想辞职去上个 MBA 班了。但如今，所有从 MBA 班出来的人都不约而同想在取得学位后成为产品经理。</p>\r\n<p>\r\n	　　<strong>「你在招聘产品经理时候看重什么？」</strong></p>\r\n<p>\r\n	　　这好像是我经常会被问到的问题，而我愿意把自己的要求分享出来：</p>\r\n<p>\r\n	　　<strong>我招聘产品经理的有一项要求就是，这个应聘者以前从来没有做过产品经理。</strong></p>\r\n<p>\r\n	　　这个要求想必有些奇怪，尤其是再联想到在创业初期，招聘几乎是最难的工作。但是我可以给出我自己的理由：</p>\r\n<p>\r\n	　　经验真的不重要。我见过成功的专职职业经理人，而我从来没有见过任何一位成功的专职产品经理。为什么？</p>\r\n<p>\r\n	　　在现在这个世界，尤其是科技领域，更新迭代的速度是非常快的。比起拥有丰富经验的人，我们更需要能接受改变并能良好适应的人才。更何况，我认为产品经理确实不仅仅需要经验。</p>\r\n<p>\r\n	　　产品经理在每个公司都是非常独特的角色。甚至可以说，你去见五家不同公司的产品经理，会发现这五个人每个人做的工作都不同。确实，在不同的公 司，产品经理担任不同的工作。在有些公司，产品经理就只是产品经理，负责产品。但有的公司，产品经理是负责项目的，或者是负责产品营销，再或者是负责一些 团队里非常琐碎的事情。</p>\r\n<p>\r\n	　　根据职责，不同的产品经理会向不同的人汇报。可能是负责产品的副总裁，可能是 CTO。在一些小的创业公司，产品经理可能直接对 CEO 汇报，也可能会和市场部汇报。我甚至还见过少部分产品经理向销售部汇报。</p>\r\n<p>\r\n	　　看到这里的问题了吗？在我二十年的工作经验里，每个人定义产品经理都用了不同的词汇。这不像销售，人力和技术。你知道这职位是什么的。</p>\r\n<p>\r\n	　　对我自己的创业公司来说，我们公司是以产品为导向的。从这个公司起步的第一天开始，就是产品在驱动它前进，而如果你的公司也和我的一样，是以产 品或者决心以产品驱动。你在组建团队就要像清楚，你永远要找和你理念相符的人。因为只有理解产品意义的人，才能把它宣扬出去。因为你超过你竞争对手的东 西，就是产品。</p>\r\n<p>\r\n	　　但如果你想找产品经理，却不妨找个和你团队熟悉领域相反（但并非融洽）的人，来成为你的产品经理。对我而言，我不熟悉的领域是人力，销售和金融。而给自己团队引入不同领域和经验的人，可以帮助你更好地看待整个团队的实力和前进道路。</p>\r\n<p>\r\n	　　也就是说，你最好找个能给你团队带来启发性的人物，来成为你的产品经理。</p>\r\n<p>\r\n	　　<strong>我想找一个什么样的产品经理</strong></p>\r\n<p>\r\n	　　当我说想找个产品经理的时候，以下是我非常看重的部分。</p>\r\n<p>\r\n	　　<strong>这个人是真正的产品迷吗？</strong></p>\r\n<p>\r\n	　　他们对新产品感兴趣吗？他们每天都会关注网站上有关产品的最新消息吗？他们在新产品出现后会第一个下载吗？他们在有关产品方面能告诉哪些我不知道的东西？他们比我知道更多的产品吗？他们有激情吗？</p>\r\n<p>\r\n	　　我在面试的过程中，很喜欢询问候选人跟我介绍他们桌面或者电话桌面最新或者最喜欢使用的新产品。有关这点，都无法伪造。</p>\r\n<p>\r\n	　　<strong>这个人是否具有强烈的好奇心？</strong></p>\r\n<p>\r\n	　　我喜欢寻找具有好奇心的人，他们相信什么，质疑什么，为什么？他们希望从其他人身上学习到什么？太多的人想重新发明轮子，而不是去从其他公司已经具备的积累中改善。</p>\r\n<p>\r\n	　　<strong>这个人是否具有强烈的纠错精神？</strong></p>\r\n<p>\r\n	　　他们如何能让现有的产品更好？他们有什么打算？他们想把事情做得更好吗？你可以当场选择一个产品，让候选人演示自己如何使用它，并可以演示如何改善它，他希望做到哪些改善。</p>\r\n<p>\r\n	　　<strong>这个人每天的工作应用程序是什么？</strong></p>\r\n<p>\r\n	　　他们使用 Trello 吗？他们使用 Evernote 和 ProdPad 吗？更关键的一点是，他们喜欢使用新事物吗？并会想改善团队的流程和快捷吗？</p>\r\n<p>\r\n	　　<strong>这个人具有消费者驱动力吗？</strong></p>\r\n<p>\r\n	　　项目经理应该比团队中的任何人都更了解客户，不仅如此，项目经理应该在公司里代表客户。毕竟，商业的目的是生成并维持客户。而项目经理理应对顾客感到兴奋。</p>\r\n<p>\r\n	　　<strong>两件事在招聘项目经理的时候完全不重要</strong></p>\r\n<p>\r\n	　　1，科技技能。当你见过很多产品经理时候，发现其实产品经理不需要很懂技术，你懂得。</p>\r\n<p>\r\n	　　2，ppt 技能。产品经理不是整天蹲在会议室里展示各种幻灯片和 excel 。你不需要一个精于数据但毫无常识的产品经理。</p>\r\n', '2016-03-31 16:02:16', '12', '2', '1');
INSERT INTO `t_article` VALUES ('4', '你以为谷歌用施密特私人飞机不花钱？每小时7500美元', '<p>\r\n	BI 中文站 3 月 31 日报道</p>\r\n<p>\r\n	　　据谷歌母公司 Alphabet 周二公布的最新 10-K 文件显示，因为使用了执行董事长埃里克&middot;施密特（Eric Schmidt）的私人飞机，公司必须向施密特支付 39.6 万美元的报销款。</p>\r\n<p>\r\n	　　文件表示，施密特拥有其中一架飞机 100% 的产权和另一架飞机 33% 的产权，而施密特和公司其他高管在出差公干时一直在使用这两架飞机。</p>\r\n<p>\r\n	　　因此，Alphabet 董事会批准按每小时 7500 美元的报销标准支付飞机使用费。照此计算，Alphabet 2015 年一共要向施密特支付 39.6 万美元的报销款，也就是说 Alphabet 的高管们去年在施密特的飞机上一共待了大约 52 小时。</p>\r\n<p>\r\n	　　幸运地是，这笔开支比 2014 年的开支少多了。2014 年的时候，仅仅是接送来宾参加某一项会议，谷歌就要向施密特支付 67.24 万美元的报销款。谷歌 2013 年花在飞机报销款上的开支只有 6 万多美元。这笔开支在 2012 年就更少了，只有 1.4 万美元。</p>\r\n<p>\r\n	　　虽然这笔开支不小，但公司坚称施密特并未从中获利。</p>\r\n<p>\r\n	　　文件表示：&ldquo;每小时 7500 美元的报销款标准其实比埃里克作为这些飞机的所有者花费的运营成本要低一些，埃里克并没有从中牟利。&rdquo;</p>\r\n<p>\r\n	　　但是 Alphabet 却赚了一点钱回来，因为公司也拥有飞机的部分产权。当施密特并非因为公务而是因为私人原因使用它们时，Alphabet 还可以小赚一点点。</p>\r\n<p>\r\n	　　Alphabet 在 2015 年初成为墨菲特联邦机场的运营商，从那时开始，公司就允许拉里&middot;佩奇（Larry Page）、谢尔盖&middot;布林（Sergey Brin）、拉姆&middot;施雷姆（Ram Shriram）和施密特将他们的私人飞机停在这里。</p>\r\n<p>\r\n	　　这也会产生相关的费用，但最新 10-K 文件称，这笔费用与公司需要支付给施密特的报销款不相关。2015 年，Alphabet 向 4 人一共收取了 172.5 万美元的机场使用费。</p>\r\n<p>\r\n	　　Alphabet 对此未予置评。</p>\r\n', '2016-03-31 17:01:50', '12', '2', '1');


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
-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('12', 'admin', '96e79218965eb72c92a549dd5a330112', '12121312', '1','1');
INSERT INTO `t_user` VALUES ('12', 'admin', '96e79218965eb72c92a549dd5a330112', '12121312', '2','1');