/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50719
 Source Host           : localhost:3306
 Source Schema         : zhihu

 Target Server Type    : MySQL
 Target Server Version : 50719
 File Encoding         : 65001

 Date: 11/03/2018 10:51:01
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for amount
-- ----------------------------
DROP TABLE IF EXISTS `amount`;
CREATE TABLE `amount`  (
  `question_amount` int(255) NULL DEFAULT NULL,
  `user_amount` int(255) NULL DEFAULT NULL,
  `id` int(10) NULL DEFAULT NULL,
  `answer_amount` int(255) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of amount
-- ----------------------------
INSERT INTO `amount` VALUES (3, 6, 1, 6);

-- ----------------------------
-- Table structure for answer
-- ----------------------------
DROP TABLE IF EXISTS `answer`;
CREATE TABLE `answer`  (
  `answer_time` datetime(0) NULL DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `question_id` int(11) NULL DEFAULT NULL,
  `question_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `toquestion_answeramount` int(255) NULL DEFAULT NULL,
  `answer_content` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `answer_support_amount` int(255) NULL DEFAULT NULL,
  `answer_against_amount` int(255) NULL DEFAULT NULL,
  `answer_id` int(255) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of answer
-- ----------------------------
INSERT INTO `answer` VALUES ('2018-03-11 00:02:21', '熊猫大哥', 1, '有哪些小时候不明白，长大了才懂的事情？', NULL, '读初中的时候我很穷，每一次去食堂打饭我就真的只能打饭。那时候我的同桌是一个胖胖的女生，她告诉我她得了一种病只能吃饭不能吃菜，一吃任何菜就会全身过敏，她对我说因为不想让其他同学知道她这个怪病所以她每次打了菜都不会吃，正好可以给我吃，但是前提是我不能告诉其他同学，我欣然接受并常常以此为借口威胁她让她交出家庭作业。说出来你们可能不信，直到高考结束即将跨入大学之际我才猛地发现世上哪会有这种病嘛。', 6, 0, 1);
INSERT INTO `answer` VALUES ('2018-03-11 00:22:36', '小透明', 2, '这世界上有被禁止的知识吗？', NULL, '某度上，现实如下字眼，根据国家政策及相关法律规定，您所搜索的内容不予显示，这就是被禁止的知识，例如你试着输入某些特殊人物名字或事件。', 5, 0, 2);
INSERT INTO `answer` VALUES ('2018-03-11 00:29:26', 'pony马', 1, '有哪些小时候不明白，长大了才懂的事情？', NULL, '我tony马', 3, 0, 3);
INSERT INTO `answer` VALUES ('2018-03-11 00:46:43', 'pony马', 2, '这世界上有被禁止的知识吗？', NULL, '要是有被禁止或扭曲的知识，你在知乎上问也不会有人能告诉你。', 1, 0, 4);
INSERT INTO `answer` VALUES ('2018-03-11 01:16:28', 'bibi', 3, '普通成年男性能赤手空拳战胜的最厉害的动物是什么？', NULL, '其实知乎上的猛兽区有一种不好的风气，就是非黑即白，但世界上的大多数事情并不是非黑即白。猛兽迷们喜欢把猛兽过分夸大，另一边看不爽这些人的答主又过分贬低。这其实都是不正确看待问题的态度，考虑问题要严谨，客观，多方面。', 3, 0, 5);
INSERT INTO `answer` VALUES ('2018-03-11 10:30:56', '刘看山', 1, '有哪些小时候不明白，长大了才懂的事情？', NULL, '还记得上小学的时候，每次考试完，老师都会说，不可以嫉妒其他的小朋友哦，但是平时又要求我们互相比着学习，那个时候，我内心很纠结，我是不想别人考的比我好的，非常不想，我明白这就是嫉妒，但是老师又说，心地善良的孩子不可以嫉妒别人，我看看周围的小朋友，大家好像都不嫉妒别人。', 1, 0, 6);

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `answer_id` int(255) NOT NULL,
  `comment_content` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `comment_time` datetime(0) NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for question
-- ----------------------------
DROP TABLE IF EXISTS `question`;
CREATE TABLE `question`  (
  `question_id` int(11) NOT NULL,
  `question_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `answeramount` int(100) NULL DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `question_time` datetime(0) NULL DEFAULT NULL,
  `question_description` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`question_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of question
-- ----------------------------
INSERT INTO `question` VALUES (1, '有哪些小时候不明白，长大了才懂的事情？', 5, '默认用户', '2018-03-11 12:01:48', '');
INSERT INTO `question` VALUES (2, '这世界上有被禁止的知识吗？', 2, '默认用户', '2018-03-11 12:21:25', '这世界上有没有什么真理却被禁止或者被故意扭曲的？');
INSERT INTO `question` VALUES (3, '普通成年男性能赤手空拳战胜的最厉害的动物是什么？', 1, '默认用户', '2018-03-11 01:14:27', '主要想讨论下未经专业格斗训练的普通成年人类男性的战斗力极限是多,条件：\r\n双方都不可以使用武器和额外的工具，包括火、水、树枝等自然工具。需要在动物能够正常活动的自然场景里面进行战斗，避免在陆地上战胜鲨鱼这种作弊情况\r\n一对一。双方都处于健康的状态下。对手必须是非人类的动物。');

-- ----------------------------
-- Table structure for user_description
-- ----------------------------
DROP TABLE IF EXISTS `user_description`;
CREATE TABLE `user_description`  (
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `userpicture_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `selfdescription` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_description
-- ----------------------------
INSERT INTO `user_description` VALUES ('熊猫大哥', NULL, '只吃竹子的熊猫');
INSERT INTO `user_description` VALUES ('小透明', 'C:Program Filesapache-tomcat-9.0.1webappszhihuimagesuser_picture小透明.png', '我是一个畅游在腐海的小透明~');
INSERT INTO `user_description` VALUES ('pony马', 'C:Program Filesapache-tomcat-9.0.1webappszhihuimagesuser_picturepony马.png', '快把你们的扣币都充起来~');
INSERT INTO `user_description` VALUES ('周杰伦', NULL, NULL);
INSERT INTO `user_description` VALUES ('bibi', 'C:Program Filesapache-tomcat-9.0.1webappszhihuimagesuser_pictureibi.png', NULL);
INSERT INTO `user_description` VALUES ('刘看山', 'C:Program Filesapache-tomcat-9.0.1webappszhihuimagesuser_picture刘看山.png', '刘看山的爸爸从小就喜欢看自家门前的那座雄伟的冰山，并且一直幻想着有朝一日能征服他，站在山顶看看山下的风景，但是这个愿望直到刘看山出生也没能实现，冰山却因为天气越来越热融化掉了，刘爸爸为了纪念这座冰山，同时为了纪念自己从小的愿望，给自己的儿子取名叫刘看山');

-- ----------------------------
-- Table structure for user_register
-- ----------------------------
DROP TABLE IF EXISTS `user_register`;
CREATE TABLE `user_register`  (
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `user_id` int(100) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_register
-- ----------------------------
INSERT INTO `user_register` VALUES ('熊猫大哥', 'E10ADC3949BA59ABBE56E057F20F883E', 1);
INSERT INTO `user_register` VALUES ('小透明', 'E10ADC3949BA59ABBE56E057F20F883E', 2);
INSERT INTO `user_register` VALUES ('pony马', 'E10ADC3949BA59ABBE56E057F20F883E', 3);
INSERT INTO `user_register` VALUES ('周杰伦', 'E10ADC3949BA59ABBE56E057F20F883E', 4);
INSERT INTO `user_register` VALUES ('bibi', 'E10ADC3949BA59ABBE56E057F20F883E', 5);
INSERT INTO `user_register` VALUES ('刘看山', 'E10ADC3949BA59ABBE56E057F20F883E', 6);

SET FOREIGN_KEY_CHECKS = 1;
