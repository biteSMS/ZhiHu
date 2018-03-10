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

 Date: 11/03/2018 00:58:18
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
INSERT INTO `amount` VALUES (2, 4, 1, 4);

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
INSERT INTO `answer` VALUES ('2018-03-11 00:29:26', 'pony马', 1, '有哪些小时候不明白，长大了才懂的事情？', NULL, '我tony马', 1, 0, 3);
INSERT INTO `answer` VALUES ('2018-03-11 00:46:43', 'pony马', 2, '这世界上有被禁止的知识吗？', NULL, '要是有被禁止或扭曲的知识，你在知乎上问也不会有人能告诉你。', 1, 0, 4);

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
INSERT INTO `question` VALUES (1, '有哪些小时候不明白，长大了才懂的事情？', 2, '默认用户', '2018-03-11 12:01:48', '');
INSERT INTO `question` VALUES (2, '这世界上有被禁止的知识吗？', 2, '默认用户', '2018-03-11 12:21:25', '这世界上有没有什么真理却被禁止或者被故意扭曲的？');

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

SET FOREIGN_KEY_CHECKS = 1;
