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

 Date: 10/03/2018 23:02:18
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
INSERT INTO `amount` VALUES (5, 5, 1, 4);

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
INSERT INTO `answer` VALUES ('2018-03-10 22:01:02', '熊猫大哥', 2, '有哪些堪称神转折的故事？', NULL, '神转折，理解前后转折很大，我周边的朋友同事都说我是个特能折腾的人，我说说我自己人生转折，权当是听个故事，不喜勿喷。煤矿工人电焊工出身，数次转折后成为通信行业营销领域的职业职业培训师。是因为欣赏了马未都先生博文 《第七百二十三篇•三十年》，忽然想起我职业生涯的3个十年。从1988年到1998年十年，煤矿工人电焊工到副厂长兼书记；从2001年9月到2011年十年，而立之年放弃原有的人生积累，北方到南方，从头再来成功转型职业培训师。到今年职业生涯刚好三十年。', 2, 0, 1);
INSERT INTO `answer` VALUES ('2018-03-10 22:23:04', '小透明', 3, '最流氓的软件可以流氓到什么程度？', NULL, '最流氓的软件可以流氓到什么程度？', 5, 0, 2);
INSERT INTO `answer` VALUES ('2018-03-10 22:24:31', '小透明', 1, '有哪些小时候不明白，长大了才懂的事情？', NULL, '读初中的时候我很穷，每一次去食堂打饭我就真的只能打饭。那时候我的同桌是一个胖胖的女生，她告诉我她得了一种病只能吃饭不能吃菜，一吃任何菜就会全身过敏，她对我说因为不想让其他同学知道她这个怪病所以她每次打了菜都不会吃，正好可以给我吃，但是前提是我不能告诉其他同学，我欣然接受并常常以此为借口威胁她让她交出家庭作业。说出来你们可能不信，直到高考结束即将跨入大学之际我才猛地发现世上哪会有这种病嘛。', 5, 0, 3);
INSERT INTO `answer` VALUES ('2018-03-10 22:27:58', '励志哥', 3, '最流氓的软件可以流氓到什么程度？', NULL, '就问你们谁敢在安卓机上装一个腾讯推荐的KingRoot试试！！！哈哈哈，除非把手机炸了，否则这玩意永远存在，任何办法包括恢复出厂设置都没办法完全删除！！！这不是流氓，这是你爹啊！舍我其谁啊！哈哈哈哈！不说了，我要准备换手机了！', 1, 0, 4);

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
INSERT INTO `question` VALUES (1, '有哪些小时候不明白，长大了才懂的事情？', 1, '默认用户', '2018-03-07 06:24:55', '');
INSERT INTO `question` VALUES (2, '有哪些堪称神转折的故事？', 1, '默认用户', '2018-03-10 09:55:05', '');
INSERT INTO `question` VALUES (3, '最流氓的软件可以流氓到什么程度？', 2, '默认用户', '2018-03-10 10:21:30', '');
INSERT INTO `question` VALUES (5, '有哪些骗得过自己、骗不过别人的事情？', 0, '默认用户', '2018-03-10 10:27:05', '');

-- ----------------------------
-- Table structure for test
-- ----------------------------
DROP TABLE IF EXISTS `test`;
CREATE TABLE `test`  (
  `name` int(255) NULL DEFAULT NULL,
  `id` int(11) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

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
INSERT INTO `user_description` VALUES ('姚明', 'D:JAVA	ianjiaxinjiekouzhihuwebwebimagesuser_picture姚明.png', NULL);
INSERT INTO `user_description` VALUES ('小猫', NULL, NULL);
INSERT INTO `user_description` VALUES ('熊猫大哥', NULL, NULL);
INSERT INTO `user_description` VALUES ('小透明', NULL, '畅游在腐海的小透明');
INSERT INTO `user_description` VALUES ('励志哥', NULL, NULL);

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
INSERT INTO `user_register` VALUES ('姚明', '202CB962AC59075B964B07152D234B70', 1);
INSERT INTO `user_register` VALUES ('小猫', 'E10ADC3949BA59ABBE56E057F20F883E', 2);
INSERT INTO `user_register` VALUES ('熊猫大哥', 'E10ADC3949BA59ABBE56E057F20F883E', 3);
INSERT INTO `user_register` VALUES ('小透明', 'E10ADC3949BA59ABBE56E057F20F883E', 4);
INSERT INTO `user_register` VALUES ('励志哥', 'E10ADC3949BA59ABBE56E057F20F883E', 5);

SET FOREIGN_KEY_CHECKS = 1;
