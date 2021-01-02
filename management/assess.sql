/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50717
 Source Host           : localhost:3306
 Source Schema         : assess

 Target Server Type    : MySQL
 Target Server Version : 50717
 File Encoding         : 65001

 Date: 02/01/2021 01:39:41
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for cms_cat
-- ----------------------------
DROP TABLE IF EXISTS `cms_cat`;
CREATE TABLE `cms_cat`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `type` bigint(4) NULL DEFAULT NULL COMMENT '分类类型',
  `cat_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分类名称',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `creator_id` int(11) NULL DEFAULT NULL,
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_cat
-- ----------------------------
INSERT INTO `cms_cat` VALUES (16, 1, '规章制度', '2020-10-06 18:11:41', 1, 'admin');
INSERT INTO `cms_cat` VALUES (17, 1, '对外培训一', '2020-10-04 00:41:53', 1, 'admin');
INSERT INTO `cms_cat` VALUES (18, 1, '对外培训五', '2020-10-04 00:42:14', 1, 'admin');
INSERT INTO `cms_cat` VALUES (19, 1, '培训资料三', '2020-10-06 16:13:48', 1, 'admin');
INSERT INTO `cms_cat` VALUES (20, 2, '职业标准制定专家', '2020-10-06 17:54:59', 1, 'admin');
INSERT INTO `cms_cat` VALUES (21, 2, '督导员', '2020-10-06 17:55:23', 1, 'admin');
INSERT INTO `cms_cat` VALUES (22, 2, '考评员', '2020-10-06 18:11:58', 1, 'admin');

-- ----------------------------
-- Table structure for cms_evaluation
-- ----------------------------
DROP TABLE IF EXISTS `cms_evaluation`;
CREATE TABLE `cms_evaluation`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content` varchar(20480) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `creator_id` int(11) NULL DEFAULT NULL,
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_evaluation
-- ----------------------------
INSERT INTO `cms_evaluation` VALUES (20, '使用百度编辑器ueditor表格', '<h1><span style=\"font-size: 32px;\">使用百度编辑器ueditor表格无法显示边框以及边框颜色等系列问题解决方案</span></h1><p><span style=\"font-size: 18px;\">最近在使用百度编辑器ueditor时遇到了<strong>表格无法显示边框</strong>以及边框颜色等系列问题，网上查了很多方法都无法实现，于是自己找了一下原因，发现其实挺简单的，下面将自己的终极方法告诉大家，希望和大家分享自己的心得体会。</span></p><p><span style=\"font-size: 18px;\">分三步骤：</span></p><p><span style=\"font-size: 18px;\"><strong>1.第一步，设置ueditor.all.js文件，在如下位置设置边框效果：</strong></span></p><p>&nbsp;</p><p><span style=\"font-size: 18px;\"><img alt=\"\" src=\"https://img-blog.csdn.net/20170324001542815?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQva2luZ3FpamkwMQ==/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/Center\"/><br/></span></p><p><span style=\"font-size: 18px;\">这样，我们就设置了一个简单的效果。</span></p><p><span style=\"font-size: 18px;\"><br/></span></p><p><span style=\"font-size: 18px;\"><strong>第二步，设置ueditor.config.js文件，在如下位置设置允许使用属性cellpadding和cellspacing:</strong><img alt=\"\" src=\"https://img-blog.csdn.net/20170324001713092?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQva2luZ3FpamkwMQ==/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/Center\"/></span></p><p><span style=\"font-size: 18px;\"><br/></span></p><p><span style=\"font-size: 18px;\">这样，整个设置就完成了，这里我们在页面上不需要设置引用什么ueditor.parse.js文件</span></p><p><span style=\"font-size: 18px;\"><br/></span></p><p><span style=\"font-size: 18px;\"><strong>第三步，我们就需要在使用ueditor的页面来使用我们的设置了，过程如下：</strong></span></p><p><span style=\"font-size: 18px;\"><img alt=\"\" src=\"https://img-blog.csdn.net/20170324002054000?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQva2luZ3FpamkwMQ==/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/Center\"/><br/></span></p><p><span style=\"font-size: 18px;\"><img alt=\"\" src=\"https://img-blog.csdn.net/20170324002457233?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQva2luZ3FpamkwMQ==/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/Center\"/><br/></span></p><p><span style=\"font-size: 18px;\"><img alt=\"\" src=\"https://img-blog.csdn.net/20170324002508003?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQva2luZ3FpamkwMQ==/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/Center\"/><br/></span></p><p><span style=\"font-size: 18px;\"><br/></span></p><p><span style=\"font-size: 18px;\">ueditor页面显示效果：</span></p><p><span style=\"font-size: 18px;\"><img alt=\"\" src=\"https://img-blog.csdn.net/20170324002908286?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQva2luZ3FpamkwMQ==/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/Center\"/><br/></span></p><p><span style=\"font-size: 18px;\">最后，希望浏览者多批评指正，这就是我给出的使用百度编辑器ueditor表格无法显示边框以及边框颜色等系列问题解决方案。</span></p><p></p>', '2020-09-20 21:33:29', 1, 'admin');
INSERT INTO `cms_evaluation` VALUES (23, 'properties文件偶尔丢失', '<pre class=\"prettyprint\" style=\"color: rgb(51, 51, 51); line-height: 1.5em; font-family: Monaco, Menlo, Consolas, &quot;Courier New&quot;, monospace; font-size: 13px;\" name=\"code\">build&gt;\n		&lt;resources&gt;\n			&lt;resource&gt;\n				&lt;directory&gt;src/main/java&lt;/directory&gt;\n				&lt;includes&gt;\n					&lt;include&gt;**/*.properties&lt;/include&gt;\n				&lt;/includes&gt;\n			&lt;/resource&gt;\n			&lt;resource&gt;\n				&lt;directory&gt;src/main/resources&lt;/directory&gt;\n			&lt;/resource&gt;\n		&lt;/resources&gt;\n	&lt;/build&gt;</pre><p style=\"color: rgb(51, 51, 51); line-height: 28.79px; text-indent: 1em; font-family: &quot;Helvetica Neue&quot;, Helvetica, Tahoma, Arial, STXihei, &quot;Microsoft YaHei&quot;, &quot;微软雅黑&quot;, sans-serif; font-size: 16px;\">说明：</p><p style=\"color: rgb(51, 51, 51); line-height: 28.79px; text-indent: 1em; font-family: &quot;Helvetica Neue&quot;, Helvetica, Tahoma, Arial, STXihei, &quot;Microsoft YaHei&quot;, &quot;微软雅黑&quot;, sans-serif; font-size: 16px;\">首先了解<span style=\"color: rgb(0, 0, 0);\">maven</span>生命周期如下：</p><table><tbody><tr class=\"firstRow\" style=\"line-height: 1.8em;\"><td width=\"208\" height=\"19\" style=\"line-height: 1.8em; font-size: 16px;\">生命周期阶段</td><td width=\"263\" height=\"19\" style=\"line-height: 1.8em; font-size: 16px;\">目标</td></tr><tr style=\"line-height: 1.8em;\"><td width=\"208\" height=\"19\" style=\"line-height: 1.8em; font-size: 16px;\">process-resources</td><td width=\"263\" height=\"19\" style=\"line-height: 1.8em; font-size: 16px;\">resources:resources</td></tr><tr style=\"line-height: 1.8em;\"><td width=\"208\" height=\"19\" style=\"line-height: 1.8em; font-size: 16px;\">compile</td><td width=\"263\" height=\"19\" style=\"line-height: 1.8em; font-size: 16px;\">compiler:compile</td></tr><tr style=\"line-height: 1.8em;\"><td width=\"208\" height=\"19\" style=\"line-height: 1.8em; font-size: 16px;\">process-test-resources</td><td width=\"263\" height=\"19\" style=\"line-height: 1.8em; font-size: 16px;\">resources:testResources</td></tr><tr style=\"line-height: 1.8em;\"><td width=\"208\" height=\"19\" style=\"line-height: 1.8em; font-size: 16px;\">test-compile</td><td width=\"263\" height=\"19\" style=\"line-height: 1.8em; font-size: 16px;\">compiler:testCompile</td></tr><tr style=\"line-height: 1.8em;\"><td width=\"208\" height=\"19\" style=\"line-height: 1.8em; font-size: 16px;\">test</td><td width=\"263\" height=\"19\" style=\"line-height: 1.8em; font-size: 16px;\">surefire:test</td></tr></tbody></table><p></p>', '2020-09-20 21:36:25', 1, 'admin');

-- ----------------------------
-- Table structure for cms_expert
-- ----------------------------
DROP TABLE IF EXISTS `cms_expert`;
CREATE TABLE `cms_expert`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cat_id` int(11) NULL DEFAULT NULL,
  `content` varchar(20480) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `creator_id` int(11) NULL DEFAULT NULL,
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for cms_note
-- ----------------------------
DROP TABLE IF EXISTS `cms_note`;
CREATE TABLE `cms_note`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `note_name` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `note_content` varchar(20480) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `creator_id` int(11) NULL DEFAULT NULL,
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for cms_rules
-- ----------------------------
DROP TABLE IF EXISTS `cms_rules`;
CREATE TABLE `cms_rules`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content` varchar(20480) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cat_id` int(11) NULL DEFAULT NULL,
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `creator_id` int(11) NULL DEFAULT NULL,
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 54 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for et_comment
-- ----------------------------
DROP TABLE IF EXISTS `et_comment`;
CREATE TABLE `et_comment`  (
  `comment_id` int(10) NOT NULL AUTO_INCREMENT,
  `refer_id` int(10) NOT NULL,
  `comment_type` tinyint(1) NOT NULL DEFAULT 0,
  `index_id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL,
  `content_msg` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `quoto_id` int(10) NOT NULL DEFAULT 0,
  `re_id` int(10) NOT NULL DEFAULT 0,
  `create_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`comment_id`) USING BTREE,
  INDEX `fk_u_id`(`user_id`) USING BTREE,
  CONSTRAINT `et_comment_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `et_user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for et_department
-- ----------------------------
DROP TABLE IF EXISTS `et_department`;
CREATE TABLE `et_department`  (
  `dep_id` int(11) NOT NULL AUTO_INCREMENT,
  `dep_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `memo` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`dep_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for et_exam
-- ----------------------------
DROP TABLE IF EXISTS `et_exam`;
CREATE TABLE `et_exam`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exam_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `exam_subscribe` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `exam_type` tinyint(4) NOT NULL COMMENT '公有、私有、模拟考试',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `start_time` datetime(0) NULL DEFAULT NULL,
  `end_time` datetime(0) NULL DEFAULT NULL,
  `exam_paper_id` int(11) NOT NULL,
  `creator` int(11) NULL DEFAULT NULL,
  `creator_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `approved` tinyint(4) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_exam_2pid`(`exam_paper_id`) USING BTREE,
  CONSTRAINT `fk_exam_2pid` FOREIGN KEY (`exam_paper_id`) REFERENCES `et_exam_paper` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of et_exam
-- ----------------------------
INSERT INTO `et_exam` VALUES (26, '学生A康复计划一', NULL, 1, '2021-01-01 12:02:08', '2021-01-01 08:00:00', '2021-01-31 08:00:00', 12, 1, 'admin', 1);
INSERT INTO `et_exam` VALUES (27, '学生A评估', NULL, 1, '2021-01-01 14:54:45', '2021-01-01 08:00:00', '2021-01-31 08:00:00', 12, 1, 'admin', 1);
INSERT INTO `et_exam` VALUES (28, '55555', NULL, 2, '2021-01-01 23:20:44', '2021-01-01 08:00:00', '2021-01-31 08:00:00', 12, 1, 'admin', 1);

-- ----------------------------
-- Table structure for et_exam_2_paper
-- ----------------------------
DROP TABLE IF EXISTS `et_exam_2_paper`;
CREATE TABLE `et_exam_2_paper`  (
  `exam_id` int(11) NOT NULL,
  `paper_id` int(11) NOT NULL,
  UNIQUE INDEX `idx_exam_epid`(`exam_id`, `paper_id`) USING BTREE,
  INDEX `fk_exam_pid`(`paper_id`) USING BTREE,
  CONSTRAINT `fk_exam_eid` FOREIGN KEY (`exam_id`) REFERENCES `et_exam` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_exam_pid` FOREIGN KEY (`paper_id`) REFERENCES `et_exam_paper` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for et_exam_paper
-- ----------------------------
DROP TABLE IF EXISTS `et_exam_paper`;
CREATE TABLE `et_exam_paper`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `duration` int(11) NOT NULL COMMENT '试卷考试时间',
  `total_point` int(11) NULL DEFAULT 0,
  `pass_point` int(11) NULL DEFAULT 0,
  `group_id` int(11) NOT NULL COMMENT '班组ID',
  `is_visible` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否所有用户可见，默认为0',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '试卷状态， 0未完成 -> 1已完成 -> 2已发布 -> 3通过审核 （已发布和通过审核的无法再修改）',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `summary` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '试卷介绍',
  `is_subjective` tinyint(1) NULL DEFAULT NULL COMMENT '为1表示为包含主观题的试卷，需阅卷',
  `answer_sheet` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '试卷答案，用答题卡的结构保存',
  `creator` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人的账号',
  `paper_type` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1' COMMENT '0 真题 1 模拟 2 专家',
  `field_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of et_exam_paper
-- ----------------------------
INSERT INTO `et_exam_paper` VALUES (12, '康复计划一', '[{\"questionId\":3151,\"content\":\"{\\\"title\\\":\\\"B1.给孩子一件物品，孩子能从摆出的三种物品中找出完全相同的物品\\\",\\\"titleImg\\\":\\\"\\\",\\\"choiceList\\\":{\\\"A\\\":\\\"1.能配对1种物品\\\",\\\"B\\\":\\\"2.能配对至少2种物品\\\",\\\"C\\\":\\\"3.能配对至少5种物品\\\",\\\"D\\\":\\\"4.能配对至少10种物品\\\"},\\\"choiceImgList\\\":{}}\",\"answer\":\"A\",\"analysis\":\"\",\"questionTypeId\":1,\"referenceName\":\"\",\"pointName\":\"评估系统\\n\\t\\t\\u003e B.视觉任务 \\u003e \\n\\t\\t知识关键点：\",\"fieldName\":\"评估系统\",\"questionPoint\":4.0,\"examingPoint\":\"\",\"knowledgePointId\":0},{\"questionId\":3152,\"content\":\"{\\\"title\\\":\\\"B2.给孩子一张图片，孩子能从摆出的三张图片中找出完全相同的图片\\\",\\\"titleImg\\\":\\\"\\\",\\\"choiceList\\\":{\\\"A\\\":\\\"1.能配对1种图片。\\\",\\\"B\\\":\\\"2.能配对至少2种图片。\\\",\\\"C\\\":\\\"3.能配对至少5种图片。\\\",\\\"D\\\":\\\"4.能配对至少10种图片。\\\"},\\\"choiceImgList\\\":{}}\",\"answer\":\"A\",\"analysis\":\"\",\"questionTypeId\":1,\"referenceName\":\"\",\"pointName\":\"评估系统\\n\\t\\t\\u003e B.视觉任务 \\u003e \\n\\t\\t知识关键点：\",\"fieldName\":\"评估系统\",\"questionPoint\":4.0,\"examingPoint\":\"\",\"knowledgePointId\":0}]', 60, 8, 60, 0, 0, 0, '2021-01-01 11:44:44', NULL, 1, '{\"examHistroyId\":0,\"examId\":0,\"examPaperId\":12,\"duration\":0,\"answerSheetItems\":[{\"point\":4.0,\"questionTypeId\":1,\"answer\":\"A\",\"questionId\":3151,\"right\":false},{\"point\":4.0,\"questionTypeId\":1,\"answer\":\"A\",\"questionId\":3152,\"right\":false}],\"pointMax\":8.0,\"pointRaw\":0.0}', 'admin', '1', 4);
INSERT INTO `et_exam_paper` VALUES (13, '总体评估', '[{\"questionId\":3151,\"content\":\"{\\\"title\\\":\\\"B1.给孩子一件物品，孩子能从摆出的三种物品中找出完全相同的物品\\\",\\\"titleImg\\\":\\\"\\\",\\\"choiceList\\\":{\\\"A\\\":\\\"1.能配对1种物品\\\",\\\"B\\\":\\\"2.能配对至少2种物品\\\",\\\"C\\\":\\\"3.能配对至少5种物品\\\",\\\"D\\\":\\\"4.能配对至少10种物品\\\"},\\\"choiceImgList\\\":{}}\",\"answer\":\"A\",\"analysis\":\"\",\"questionTypeId\":1,\"referenceName\":\"\",\"pointName\":\"评估系统\\n\\t\\t\\u003e B.视觉任务 \\u003e \\n\\t\\t知识关键点：\",\"fieldName\":\"评估系统\",\"questionPoint\":4.0,\"examingPoint\":\"\",\"knowledgePointId\":0},{\"questionId\":3152,\"content\":\"{\\\"title\\\":\\\"B2.给孩子一张图片，孩子能从摆出的三张图片中找出完全相同的图片\\\",\\\"titleImg\\\":\\\"\\\",\\\"choiceList\\\":{\\\"A\\\":\\\"1.能配对1种图片。\\\",\\\"B\\\":\\\"2.能配对至少2种图片。\\\",\\\"C\\\":\\\"3.能配对至少5种图片。\\\",\\\"D\\\":\\\"4.能配对至少10种图片。\\\"},\\\"choiceImgList\\\":{}}\",\"answer\":\"A\",\"analysis\":\"\",\"questionTypeId\":1,\"referenceName\":\"\",\"pointName\":\"评估系统\\n\\t\\t\\u003e B.视觉任务 \\u003e \\n\\t\\t知识关键点：\",\"fieldName\":\"评估系统\",\"questionPoint\":4.0,\"examingPoint\":\"\",\"knowledgePointId\":0},{\"questionId\":3153,\"content\":\"{\\\"title\\\":\\\"A1.当给予孩子强化物时，他能接受该强化物\\\",\\\"titleImg\\\":\\\"\\\",\\\"choiceList\\\":{\\\"A\\\":\\\"1.拒绝任何东西，但是情绪良好\\\",\\\"B\\\":\\\"2.不是每次接受，或有时反应比较慢\\\",\\\"C\\\":\\\"3.比较快的接受大部分强化物\\\",\\\"D\\\":\\\"4.总是很快地接受任何强化物\\\"},\\\"choiceImgList\\\":{}}\",\"answer\":\"A\",\"analysis\":\"\",\"questionTypeId\":1,\"referenceName\":\"\",\"pointName\":\"评估系统\\n\\t\\t\\u003e A.配合与强化物的效能 \\u003e \\n\\t\\t知识关键点：\",\"fieldName\":\"评估系统\",\"questionPoint\":4.0,\"examingPoint\":\"\",\"knowledgePointId\":0},{\"questionId\":3154,\"content\":\"{\\\"title\\\":\\\"A2.给孩子两样东西，一个是强化物，一个不是，孩子能选择出强化物（物品或活动）\\\",\\\"titleImg\\\":\\\"\\\",\\\"choiceList\\\":{\\\"A\\\":\\\"1.物质性强化物，不是每次，或有时反应比较慢\\\",\\\"B\\\":\\\"2.总是能很快地选出物质性强化物\\\",\\\"C\\\":\\\"3.可以选出活动性强化\\\",\\\"D\\\":\\\"4.总是很快地接受任何强化物\\\"},\\\"choiceImgList\\\":{}}\",\"answer\":\"A\",\"analysis\":\"\",\"questionTypeId\":1,\"referenceName\":\"\",\"pointName\":\"评估系统\\n\\t\\t\\u003e A.配合与强化物的效能 \\u003e \\n\\t\\t知识关键点：\",\"fieldName\":\"评估系统\",\"questionPoint\":4.0,\"examingPoint\":\"\",\"knowledgePointId\":0}]', 60, 16, 60, 0, 0, 0, '2021-01-01 14:53:21', NULL, 1, '{\"examHistroyId\":0,\"examId\":0,\"examPaperId\":13,\"duration\":0,\"answerSheetItems\":[{\"point\":4.0,\"questionTypeId\":1,\"answer\":\"A\",\"questionId\":3151,\"right\":false},{\"point\":4.0,\"questionTypeId\":1,\"answer\":\"A\",\"questionId\":3152,\"right\":false},{\"point\":4.0,\"questionTypeId\":1,\"answer\":\"A\",\"questionId\":3153,\"right\":false},{\"point\":4.0,\"questionTypeId\":1,\"answer\":\"A\",\"questionId\":3154,\"right\":false}],\"pointMax\":16.0,\"pointRaw\":0.0}', 'admin', '1', 4);
INSERT INTO `et_exam_paper` VALUES (14, '康复计划二', '[{\"questionId\":3153,\"content\":\"{\\\"title\\\":\\\"A1.当给予孩子强化物时，他能接受该强化物\\\",\\\"titleImg\\\":\\\"\\\",\\\"choiceList\\\":{\\\"A\\\":\\\"1.拒绝任何东西，但是情绪良好\\\",\\\"B\\\":\\\"2.不是每次接受，或有时反应比较慢\\\",\\\"C\\\":\\\"3.比较快的接受大部分强化物\\\",\\\"D\\\":\\\"4.总是很快地接受任何强化物\\\"},\\\"choiceImgList\\\":{}}\",\"answer\":\"A\",\"analysis\":\"\",\"questionTypeId\":1,\"referenceName\":\"\",\"pointName\":\"评估系统\\n\\t\\t\\u003e A.配合与强化物的效能 \\u003e \\n\\t\\t知识关键点：\",\"fieldName\":\"评估系统\",\"questionPoint\":0.0,\"examingPoint\":\"\",\"knowledgePointId\":0},{\"questionId\":3154,\"content\":\"{\\\"title\\\":\\\"A2.给孩子两样东西，一个是强化物，一个不是，孩子能选择出强化物（物品或活动）\\\",\\\"titleImg\\\":\\\"\\\",\\\"choiceList\\\":{\\\"A\\\":\\\"1.物质性强化物，不是每次，或有时反应比较慢\\\",\\\"B\\\":\\\"2.总是能很快地选出物质性强化物\\\",\\\"C\\\":\\\"3.可以选出活动性强化\\\",\\\"D\\\":\\\"4.总是很快地接受任何强化物\\\"},\\\"choiceImgList\\\":{}}\",\"answer\":\"A\",\"analysis\":\"\",\"questionTypeId\":1,\"referenceName\":\"\",\"pointName\":\"评估系统\\n\\t\\t\\u003e A.配合与强化物的效能 \\u003e \\n\\t\\t知识关键点：\",\"fieldName\":\"评估系统\",\"questionPoint\":0.0,\"examingPoint\":\"\",\"knowledgePointId\":0}]', 60, 100, 60, 0, 0, 0, '2021-01-01 16:29:24', NULL, 1, '{\"examHistroyId\":0,\"examId\":0,\"examPaperId\":14,\"duration\":0,\"answerSheetItems\":[{\"point\":0.0,\"questionTypeId\":1,\"answer\":\"A\",\"questionId\":3153,\"right\":false},{\"point\":0.0,\"questionTypeId\":1,\"answer\":\"A\",\"questionId\":3154,\"right\":false}],\"pointMax\":0.0,\"pointRaw\":0.0}', 'admin', '1', 4);
INSERT INTO `et_exam_paper` VALUES (15, '初始评估', '[{\"questionId\":3151,\"content\":\"{\\\"title\\\":\\\"B1.给孩子一件物品，孩子能从摆出的三种物品中找出完全相同的物品\\\",\\\"titleImg\\\":\\\"\\\",\\\"choiceList\\\":{\\\"A\\\":\\\"1.能配对1种物品\\\",\\\"B\\\":\\\"2.能配对至少2种物品\\\",\\\"C\\\":\\\"3.能配对至少5种物品\\\",\\\"D\\\":\\\"4.能配对至少10种物品\\\"},\\\"choiceImgList\\\":{}}\",\"answer\":\"A\",\"analysis\":\"\",\"questionTypeId\":1,\"referenceName\":\"\",\"pointName\":\"评估系统\\n\\t\\t\\u003e B.视觉任务 \\u003e \\n\\t\\t知识关键点：\",\"fieldName\":\"评估系统\",\"questionPoint\":4.0,\"examingPoint\":\"\",\"knowledgePointId\":0},{\"questionId\":3152,\"content\":\"{\\\"title\\\":\\\"B2.给孩子一张图片，孩子能从摆出的三张图片中找出完全相同的图片\\\",\\\"titleImg\\\":\\\"\\\",\\\"choiceList\\\":{\\\"A\\\":\\\"1.能配对1种图片。\\\",\\\"B\\\":\\\"2.能配对至少2种图片。\\\",\\\"C\\\":\\\"3.能配对至少5种图片。\\\",\\\"D\\\":\\\"4.能配对至少10种图片。\\\"},\\\"choiceImgList\\\":{}}\",\"answer\":\"A\",\"analysis\":\"\",\"questionTypeId\":1,\"referenceName\":\"\",\"pointName\":\"评估系统\\n\\t\\t\\u003e B.视觉任务 \\u003e \\n\\t\\t知识关键点：\",\"fieldName\":\"评估系统\",\"questionPoint\":4.0,\"examingPoint\":\"\",\"knowledgePointId\":0},{\"questionId\":3153,\"content\":\"{\\\"title\\\":\\\"A1.当给予孩子强化物时，他能接受该强化物\\\",\\\"titleImg\\\":\\\"\\\",\\\"choiceList\\\":{\\\"A\\\":\\\"1.拒绝任何东西，但是情绪良好\\\",\\\"B\\\":\\\"2.不是每次接受，或有时反应比较慢\\\",\\\"C\\\":\\\"3.比较快的接受大部分强化物\\\",\\\"D\\\":\\\"4.总是很快地接受任何强化物\\\"},\\\"choiceImgList\\\":{}}\",\"answer\":\"A\",\"analysis\":\"\",\"questionTypeId\":1,\"referenceName\":\"\",\"pointName\":\"评估系统\\n\\t\\t\\u003e A.配合与强化物的效能 \\u003e \\n\\t\\t知识关键点：\",\"fieldName\":\"评估系统\",\"questionPoint\":4.0,\"examingPoint\":\"\",\"knowledgePointId\":0},{\"questionId\":3154,\"content\":\"{\\\"title\\\":\\\"A2.给孩子两样东西，一个是强化物，一个不是，孩子能选择出强化物（物品或活动）\\\",\\\"titleImg\\\":\\\"\\\",\\\"choiceList\\\":{\\\"A\\\":\\\"1.物质性强化物，不是每次，或有时反应比较慢\\\",\\\"B\\\":\\\"2.总是能很快地选出物质性强化物\\\",\\\"C\\\":\\\"3.可以选出活动性强化\\\",\\\"D\\\":\\\"4.总是很快地接受任何强化物\\\"},\\\"choiceImgList\\\":{}}\",\"answer\":\"A\",\"analysis\":\"\",\"questionTypeId\":1,\"referenceName\":\"\",\"pointName\":\"评估系统\\n\\t\\t\\u003e A.配合与强化物的效能 \\u003e \\n\\t\\t知识关键点：\",\"fieldName\":\"评估系统\",\"questionPoint\":4.0,\"examingPoint\":\"\",\"knowledgePointId\":0}]', 60, 16, 60, 0, 0, 0, '2021-01-02 00:10:21', NULL, 1, '{\"examHistroyId\":0,\"examId\":0,\"examPaperId\":15,\"duration\":0,\"answerSheetItems\":[{\"point\":4.0,\"questionTypeId\":1,\"answer\":\"A\",\"questionId\":3151,\"right\":false},{\"point\":4.0,\"questionTypeId\":1,\"answer\":\"A\",\"questionId\":3152,\"right\":false},{\"point\":4.0,\"questionTypeId\":1,\"answer\":\"A\",\"questionId\":3153,\"right\":false},{\"point\":4.0,\"questionTypeId\":1,\"answer\":\"A\",\"questionId\":3154,\"right\":false}],\"pointMax\":16.0,\"pointRaw\":0.0}', 'admin', '1', -1);

-- ----------------------------
-- Table structure for et_field
-- ----------------------------
DROP TABLE IF EXISTS `et_field`;
CREATE TABLE `et_field`  (
  `field_id` int(5) NOT NULL AUTO_INCREMENT,
  `field_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `memo` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `state` decimal(1, 0) NOT NULL DEFAULT 1 COMMENT '1 正常 0 废弃',
  PRIMARY KEY (`field_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of et_field
-- ----------------------------
INSERT INTO `et_field` VALUES (4, '评估系统', '评估系统', 0);

-- ----------------------------
-- Table structure for et_group
-- ----------------------------
DROP TABLE IF EXISTS `et_group`;
CREATE TABLE `et_group`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `user_id` int(11) NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_group_uid`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of et_group
-- ----------------------------
INSERT INTO `et_group` VALUES (4, '默认分组', '2020-09-06 17:39:51', 4716, 1);
INSERT INTO `et_group` VALUES (6, '张老师学生组', '2021-01-01 12:04:43', 1, 0);
INSERT INTO `et_group` VALUES (7, '王老师学生组', '2021-01-01 12:06:13', 1, 0);
INSERT INTO `et_group` VALUES (9, '默认分组', '2021-01-01 18:01:57', 4722, 1);

-- ----------------------------
-- Table structure for et_knowledge_point
-- ----------------------------
DROP TABLE IF EXISTS `et_knowledge_point`;
CREATE TABLE `et_knowledge_point`  (
  `point_id` int(5) NOT NULL AUTO_INCREMENT,
  `point_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `field_id` int(5) NOT NULL,
  `memo` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `state` decimal(1, 0) NULL DEFAULT 1 COMMENT '1:正常 0：废弃',
  PRIMARY KEY (`point_id`) USING BTREE,
  UNIQUE INDEX `idx_point_name`(`point_name`) USING BTREE,
  INDEX `fk_knowledge_field`(`field_id`) USING BTREE,
  CONSTRAINT `et_knowledge_point_ibfk_1` FOREIGN KEY (`field_id`) REFERENCES `et_field` (`field_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of et_knowledge_point
-- ----------------------------
INSERT INTO `et_knowledge_point` VALUES (6, 'B.视觉任务', 4, NULL, 0);
INSERT INTO `et_knowledge_point` VALUES (7, 'C.接受性语言', 4, NULL, 0);
INSERT INTO `et_knowledge_point` VALUES (8, 'A.配合与强化物的效能', 4, NULL, 0);

-- ----------------------------
-- Table structure for et_menu_item
-- ----------------------------
DROP TABLE IF EXISTS `et_menu_item`;
CREATE TABLE `et_menu_item`  (
  `menu_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `menu_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `menu_href` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `menu_seq` int(5) NOT NULL,
  `authority` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `parent_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `icon` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `visiable` tinyint(4) NOT NULL DEFAULT 1
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of et_menu_item
-- ----------------------------
INSERT INTO `et_menu_item` VALUES ('question', '题目管理', 'admin/question/question-list', 1001, 'ROLE_ADMIN', '-1', 'fa-cloud', 1);
INSERT INTO `et_menu_item` VALUES ('question-list', '题目管理', 'admin/question/question-list', 100101, 'ROLE_ADMIN', 'question', 'fa-list', 1);
INSERT INTO `et_menu_item` VALUES ('question-add', '添加题目', 'admin/question/question-add', 100102, 'ROLE_ADMIN', 'question', 'fa-plus', 1);
INSERT INTO `et_menu_item` VALUES ('question-import', '导入试题', 'admin/question/question-import', 100103, 'ROLE_ADMIN1', 'question', 'fa-cloud-upload', 1);
INSERT INTO `et_menu_item` VALUES ('exampaper', '康复计划管理', 'admin/exampaper/exampaper-list/0', 1002, 'ROLE_ADMIN', '-1', 'fa-file-text-o', 1);
INSERT INTO `et_menu_item` VALUES ('exampaper-list', '康复计划管理', 'admin/exampaper/exampaper-list/0', 100201, 'ROLE_ADMIN', 'exampaper', 'fa-list', 1);
INSERT INTO `et_menu_item` VALUES ('exampaper-add', '创建康复计划', 'admin/exampaper/exampaper-add', 100202, 'ROLE_ADMIN', 'exampaper', 'fa-leaf', 1);
INSERT INTO `et_menu_item` VALUES ('exampaper-edit', '修改康复计划', '', 100203, 'ROLE_ADMIN', 'exampaper', 'fa-pencil', 0);
INSERT INTO `et_menu_item` VALUES ('exampaper-preview', '预览康复计划', '', 100204, 'ROLE_ADMIN', 'exampaper', 'fa-eye', 0);
INSERT INTO `et_menu_item` VALUES ('exam', '评估管理', 'admin/exam/exam-list', 1003, 'ROLE_ADMIN', '-1', 'fa-trophy', 1);
INSERT INTO `et_menu_item` VALUES ('exam-list', '评估管理', 'admin/exam/exam-list', 100301, 'ROLE_ADMIN', 'exam', 'fa-list', 1);
INSERT INTO `et_menu_item` VALUES ('exam-add', '创建评估', 'admin/exam/exam-add', 100302, 'ROLE_ADMIN', 'exam', 'fa-plus-square-o', 1);
INSERT INTO `et_menu_item` VALUES ('exam-student-list', '学员名单', '', 100305, 'ROLE_ADMIN', 'exam', 'fa-sitemap', 0);
INSERT INTO `et_menu_item` VALUES ('student-answer-sheet', '学员试卷', '', 100306, 'ROLE_ADMIN', 'exam', 'fa-file-o', 0);
INSERT INTO `et_menu_item` VALUES ('mark-exampaper', '人工阅卷', '', 100307, 'ROLE_ADMIN', 'exam', 'fa-circle-o-notch', 0);
INSERT INTO `et_menu_item` VALUES ('user', '用户管理', 'admin/user/student-list', 1005, 'ROLE_ADMIN', '-1', 'fa-user', 1);
INSERT INTO `et_menu_item` VALUES ('student-list', '学生管理', 'admin/user/student-list', 100501, 'ROLE_ADMIN', 'user', 'fa-users', 1);
INSERT INTO `et_menu_item` VALUES ('student-examhistory', '评估历史', '', 100502, 'ROLE_ADMIN', 'user', 'fa-glass', 0);
INSERT INTO `et_menu_item` VALUES ('student-profile', '学生资料', '', 100503, 'ROLE_ADMIN', 'user', 'fa-flag-o', 0);
INSERT INTO `et_menu_item` VALUES ('teacher-list', '老师管理', 'admin/user/teacher-list', 100504, 'ROLE_TEACHER', 'user', 'fa-cubes', 1);
INSERT INTO `et_menu_item` VALUES ('teacher-profile', '老师资料', '', 100505, 'ROLE_ADMIN', 'user', NULL, 0);
INSERT INTO `et_menu_item` VALUES ('student-practice-status', '学习进度', '', 100403, 'ROLE_ADMIN1', 'training', 'fa-rocket', 0);
INSERT INTO `et_menu_item` VALUES ('student-training-history', '培训进度', '', 100404, 'ROLE_ADMIN1', 'training', 'fa-star-half-full', 0);
INSERT INTO `et_menu_item` VALUES ('common', '评估领域管理', 'admin/common/knowledge-list/0', 1006, 'ROLE_ADMIN', '-1', 'fa-cubes', 1);
INSERT INTO `et_menu_item` VALUES ('cms-rules-list', '资料库', 'admin/cms/cms-rules-list', 100605, 'ROLE_ADMIN1', 'common', 'fa-file-text-o', 1);
INSERT INTO `et_menu_item` VALUES ('field-list', '专业题库', 'admin/common/field-list', 100602, 'ROLE_ADMIN1', 'common', 'fa-anchor', 1);
INSERT INTO `et_menu_item` VALUES ('knowledge-list', '评估领域', 'admin/common/knowledge-list/0', 100603, 'ROLE_ADMIN', 'common', 'fa-flag', 1);
INSERT INTO `et_menu_item` VALUES ('question', '题目管理', 'teacher/question/question-list', 2001, 'ROLE_TEACHER', '-1', 'fa-cloud', 1);
INSERT INTO `et_menu_item` VALUES ('question-list', '题目管理', 'teacher/question/question-list', 200101, 'ROLE_TEACHER', 'question', 'fa-list', 1);
INSERT INTO `et_menu_item` VALUES ('question-add', '添加题目', 'teacher/question/question-add', 200102, 'ROLE_TEACHER', 'question', 'fa-plus', 1);
INSERT INTO `et_menu_item` VALUES ('question-import', '导入试题', 'teacher/question/question-import', 200103, 'ROLE_TEACHER1', 'question', 'fa-cloud-upload', 1);
INSERT INTO `et_menu_item` VALUES ('exampaper', '康复计划管理', 'teacher/exampaper/exampaper-list/0', 2002, 'ROLE_TEACHER', '-1', 'fa-file-text-o', 1);
INSERT INTO `et_menu_item` VALUES ('exampaper-list', '康复计划管理', 'teacher/exampaper/exampaper-list/0', 200201, 'ROLE_TEACHER', 'exampaper', 'fa-list', 1);
INSERT INTO `et_menu_item` VALUES ('exampaper-add', '创建康复计划', 'teacher/exampaper/exampaper-add', 200202, 'ROLE_TEACHER', 'exampaper', 'fa-leaf', 1);
INSERT INTO `et_menu_item` VALUES ('exampaper-edit', '修改康复计划', '', 200203, 'ROLE_TEACHER', 'exampaper', 'fa-pencil', 0);
INSERT INTO `et_menu_item` VALUES ('exampaper-preview', '预览康复计划', '', 200204, 'ROLE_TEACHER', 'exampaper', 'fa-eye', 0);
INSERT INTO `et_menu_item` VALUES ('exam', '评估管理', 'teacher/exam/exam-list', 2003, 'ROLE_TEACHER', '-1', 'fa-trophy', 1);
INSERT INTO `et_menu_item` VALUES ('exam-list', '评估管理', 'teacher/exam/exam-list', 200301, 'ROLE_TEACHER', 'exam', 'fa-list', 1);
INSERT INTO `et_menu_item` VALUES ('exam-add', '创建评估', 'teacher/exam/exam-add', 200302, 'ROLE_TEACHER', 'exam', 'fa-plus-square-o', 1);
INSERT INTO `et_menu_item` VALUES ('exam-student-list', '学员名单', '', 200303, 'ROLE_TEACHER', 'exam', 'fa-sitemap', 0);
INSERT INTO `et_menu_item` VALUES ('student-answer-sheet', '学员试卷', '', 200304, 'ROLE_TEACHER', 'exam', 'fa-file-o', 0);
INSERT INTO `et_menu_item` VALUES ('mark-exampaper', '人工阅卷', '', 200305, 'ROLE_TEACHER', 'exam', 'fa-circle-o-notch', 0);
INSERT INTO `et_menu_item` VALUES ('user', '学生管理', 'teacher/user/student-list', 2005, 'ROLE_TEACHER', '-1', 'fa-user', 1);
INSERT INTO `et_menu_item` VALUES ('student-list', '学生管理', 'teacher/user/student-list', 200501, 'ROLE_TEACHER', 'user', 'fa-users', 1);
INSERT INTO `et_menu_item` VALUES ('student-examhistory', '评估历史', '', 200502, 'ROLE_TEACHER', 'user', 'fa-glass', 0);
INSERT INTO `et_menu_item` VALUES ('student-profile', '学生资料', '', 200503, 'ROLE_TEACHER', 'user', 'fa-flag-o', 0);
INSERT INTO `et_menu_item` VALUES ('training', '培训', 'teacher/training/training-list', 2004, 'ROLE_TEACHER1', '-1', 'fa-laptop', 0);
INSERT INTO `et_menu_item` VALUES ('training-list', '培训管理', 'teacher/training/training-list', 200401, 'ROLE_TEACHER1', 'training', 'fa-list', 1);
INSERT INTO `et_menu_item` VALUES ('training-add', '添加培训', 'teacher/training/training-add', 200402, 'ROLE_TEACHER1', 'training', 'fa-plus', 1);
INSERT INTO `et_menu_item` VALUES ('student-practice-status', '学习进度', '', 200403, 'ROLE_TEACHER1', 'training', 'fa-rocket', 0);
INSERT INTO `et_menu_item` VALUES ('student-training-history', '培训进度', '', 200404, 'ROLE_TEACHER1', 'training', 'fa-star-half-full', 0);
INSERT INTO `et_menu_item` VALUES ('system', '系统设置', 'admin/system/admin-list', 1007, 'ROLE_ADMIN', '-1', 'fa-cog', 1);
INSERT INTO `et_menu_item` VALUES ('admin-list', '管理员列表', 'admin/system/admin-list', 100701, 'ROLE_ADMIN', 'system', 'fa-group', 1);
INSERT INTO `et_menu_item` VALUES ('news-list', '系统公告', 'admin/system/news-list', 100703, 'ROLE_ADMIN1', 'system', 'fa-volume-up', 1);
INSERT INTO `et_menu_item` VALUES ('dep-list', '部门管理', 'admin/common/dep-list', 100604, 'ROLE_ADMIN1', 'common', 'fa-leaf', 1);
INSERT INTO `et_menu_item` VALUES ('model-test-add', '创建康复训练', 'admin/exam/model-test-add', 100304, 'ROLE_ADMIN', 'exam', 'fa-flag', 1);
INSERT INTO `et_menu_item` VALUES ('model-test-list', '康复训练管理', 'admin/exam/model-test-list', 100303, 'ROLE_ADMIN', 'exam', 'fa-glass', 1);
INSERT INTO `et_menu_item` VALUES ('dashboard', '控制面板', 'admin/dashboard', 1000, 'ROLE_ADMIN1', '-1', 'fa-dashboard', 1);
INSERT INTO `et_menu_item` VALUES ('cms-expert-list', '专家库管理', 'admin/cms/cms-expert-list', 100606, 'ROLE_ADMIN1', 'common', 'fa-cubes', 1);
INSERT INTO `et_menu_item` VALUES ('cms-evaluation-list', '考核评价记录', 'admin/cms/cms-rules-list', 100607, 'ROLE_ADMIN', 'common', 'fa-glass', 0);
INSERT INTO `et_menu_item` VALUES ('tag-list', '标签管理', 'admin/common/tag-list', 100601, 'ROLE_ADMIN1', 'common', 'fa-tags', 1);
INSERT INTO `et_menu_item` VALUES ('cms', '内容发布', 'admin/cms/cms-note-list', 3001, 'ROLE_ADMIN1', '-1', 'fa-cloud', 0);
INSERT INTO `et_menu_item` VALUES ('cms_add', '内容发布', 'admin/cms/cms_add', 300100, 'ROLE_ADMIN1', 'cms', 'fa-cloud', 0);
INSERT INTO `et_menu_item` VALUES ('cms-note-list', '通知列表', 'admin/cms/cms-note-list', 300101, 'ROLE_ADMIN', 'cms', 'fa-list', 0);
INSERT INTO `et_menu_item` VALUES ('training', '培训', 'teacher/training/training-list', 1004, 'ROLE_ADMIN1', '-1', 'fa-laptop', 0);
INSERT INTO `et_menu_item` VALUES ('training-list', '培训管理', 'teacher/training/training-list', 100401, 'ROLE_ADMIN1', 'training', 'fa-list', 1);
INSERT INTO `et_menu_item` VALUES ('training-add', '添加培训', 'teacher/training/training-add', 100402, 'ROLE_ADMIN1', 'training', 'fa-plus', 1);
INSERT INTO `et_menu_item` VALUES ('cms-cat-list', '分类管理', 'admin/cms/cms-cat-list', 100604, 'ROLE_ADMIN1', 'common', 'fa-list', 1);
INSERT INTO `et_menu_item` VALUES ('question-answer', '试卷答案', 'admin/question/questionTest-list', 100104, 'ROLE_ADMIN1', 'question', 'fa-flag', 1);
INSERT INTO `et_menu_item` VALUES ('teacher-list', '老师管理', 'admin/user/teacher-list', 100504, 'ROLE_ADMIN', 'user', 'fa-cubes', 1);

-- ----------------------------
-- Table structure for et_news
-- ----------------------------
DROP TABLE IF EXISTS `et_news`;
CREATE TABLE `et_news`  (
  `news_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` int(11) NOT NULL COMMENT '创建人',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  PRIMARY KEY (`news_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `et_news_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `et_user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for et_practice_paper
-- ----------------------------
DROP TABLE IF EXISTS `et_practice_paper`;
CREATE TABLE `et_practice_paper`  (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `duration` int(11) NOT NULL COMMENT '试卷考试时间',
  `total_point` int(11) NULL DEFAULT 0,
  `pass_point` int(11) NULL DEFAULT 0,
  `group_id` int(11) NOT NULL COMMENT '班组ID',
  `is_visible` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否所有用户可见，默认为0',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '试卷状态， 0未完成 -> 1已完成 -> 2已发布 -> 3通过审核 （已发布和通过审核的无法再修改）',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `summary` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '试卷介绍',
  `is_subjective` tinyint(1) NULL DEFAULT NULL COMMENT '为1表示为包含主观题的试卷，需阅卷',
  `answer_sheet` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '试卷答案，用答题卡的结构保存',
  `creator` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人的账号',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `group_id`(`group_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for et_question
-- ----------------------------
DROP TABLE IF EXISTS `et_question`;
CREATE TABLE `et_question`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `question_type_id` int(11) NOT NULL COMMENT '题型',
  `duration` int(11) NULL DEFAULT NULL COMMENT '试题考试时间',
  `points` int(11) NULL DEFAULT NULL,
  `group_id` int(11) NULL DEFAULT NULL COMMENT '班组ID',
  `is_visible` tinyint(1) NOT NULL DEFAULT 0 COMMENT '试题可见性',
  `create_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  `creator` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'admin' COMMENT '创建者',
  `last_modify` timestamp(0) NULL DEFAULT NULL,
  `answer` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `expose_times` int(11) NOT NULL DEFAULT 2,
  `right_times` int(11) NOT NULL DEFAULT 1,
  `wrong_times` int(11) NOT NULL DEFAULT 1,
  `difficulty` int(5) NOT NULL DEFAULT 1,
  `analysis` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `reference` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `examing_point` varchar(5000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `keyword` varchar(5000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `test_num` int(5) NULL DEFAULT NULL,
  `test_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `question_type_id`(`question_type_id`) USING BTREE,
  INDEX `et_question_ibfk_5`(`creator`) USING BTREE,
  CONSTRAINT `et_question_ibfk_1` FOREIGN KEY (`question_type_id`) REFERENCES `et_question_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3155 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of et_question
-- ----------------------------
INSERT INTO `et_question` VALUES (3151, 'B1.给孩子一件物品，孩子能从摆出的三种物品中找出完全相同的物品', '{\"title\":\"B1.给孩子一件物品，孩子能从摆出的三种物品中找出完全相同的物品\",\"titleImg\":\"\",\"choiceList\":{\"A\":\"1.能配对1种物品\",\"B\":\"2.能配对至少2种物品\",\"C\":\"3.能配对至少5种物品\",\"D\":\"4.能配对至少10种物品\"},\"choiceImgList\":{}}', 1, NULL, 0, NULL, 0, '2021-01-01 11:24:38', 'admin', NULL, 'A', 2, 1, 1, 1, '', '', '', '', 0, 0);
INSERT INTO `et_question` VALUES (3152, 'B2.给孩子一张图片，孩子能从摆出的三张图片中找出完全相同的图片', '{\"title\":\"B2.给孩子一张图片，孩子能从摆出的三张图片中找出完全相同的图片\",\"titleImg\":\"\",\"choiceList\":{\"A\":\"1.能配对1种图片。\",\"B\":\"2.能配对至少2种图片。\",\"C\":\"3.能配对至少5种图片。\",\"D\":\"4.能配对至少10种图片。\"},\"choiceImgList\":{}}', 1, NULL, 0, NULL, 0, '2021-01-01 11:31:37', 'admin', NULL, 'A', 2, 1, 1, 1, '', '', '', '', 0, 0);
INSERT INTO `et_question` VALUES (3153, 'A1.当给予孩子强化物时，他能接受该强化物', '{\"title\":\"A1.当给予孩子强化物时，他能接受该强化物\",\"titleImg\":\"\",\"choiceList\":{\"A\":\"1.拒绝任何东西，但是情绪良好\",\"B\":\"2.不是每次接受，或有时反应比较慢\",\"C\":\"3.比较快的接受大部分强化物\",\"D\":\"4.总是很快地接受任何强化物\"},\"choiceImgList\":{}}', 1, NULL, 0, NULL, 0, '2021-01-01 16:38:14', 'admin', NULL, 'A', 2, 1, 1, 1, '', '', '', '', 0, 0);
INSERT INTO `et_question` VALUES (3154, 'A2.给孩子两样东西，一个是强化物，一个不是，孩子能选择出强化物（物品或活动）', '{\"title\":\"A2.给孩子两样东西，一个是强化物，一个不是，孩子能选择出强化物（物品或活动）\",\"titleImg\":\"\",\"choiceList\":{\"A\":\"1.物质性强化物，不是每次，或有时反应比较慢\",\"B\":\"2.总是能很快地选出物质性强化物\",\"C\":\"3.可以选出活动性强化\",\"D\":\"4.总是很快地接受任何强化物\"},\"choiceImgList\":{}}', 1, NULL, 0, NULL, 0, '2021-01-01 16:43:18', 'admin', NULL, 'A', 2, 1, 1, 1, '', '', '', '', 0, 0);

-- ----------------------------
-- Table structure for et_question_2_point
-- ----------------------------
DROP TABLE IF EXISTS `et_question_2_point`;
CREATE TABLE `et_question_2_point`  (
  `question_2_point_id` int(10) NOT NULL AUTO_INCREMENT,
  `question_id` int(10) NULL DEFAULT NULL,
  `point_id` int(10) NULL DEFAULT NULL,
  PRIMARY KEY (`question_2_point_id`) USING BTREE,
  INDEX `fk_question_111`(`question_id`) USING BTREE,
  INDEX `fk_point_111`(`point_id`) USING BTREE,
  CONSTRAINT `et_question_2_point_ibfk_1` FOREIGN KEY (`point_id`) REFERENCES `et_knowledge_point` (`point_id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `et_question_2_point_ibfk_2` FOREIGN KEY (`question_id`) REFERENCES `et_question` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5063 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of et_question_2_point
-- ----------------------------
INSERT INTO `et_question_2_point` VALUES (5059, 3151, 6);
INSERT INTO `et_question_2_point` VALUES (5060, 3152, 6);
INSERT INTO `et_question_2_point` VALUES (5061, 3153, 8);
INSERT INTO `et_question_2_point` VALUES (5062, 3154, 8);

-- ----------------------------
-- Table structure for et_question_2_tag
-- ----------------------------
DROP TABLE IF EXISTS `et_question_2_tag`;
CREATE TABLE `et_question_2_tag`  (
  `question_tag_id` int(11) NOT NULL AUTO_INCREMENT,
  `question_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `creator` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`question_tag_id`) USING BTREE,
  INDEX `fk_question_tag_tid`(`tag_id`) USING BTREE,
  INDEX `fk_question_tag_qid`(`question_id`) USING BTREE,
  CONSTRAINT `et_question_2_tag_ibfk_1` FOREIGN KEY (`question_id`) REFERENCES `et_question` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `et_question_2_tag_ibfk_2` FOREIGN KEY (`tag_id`) REFERENCES `et_tag` (`tag_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for et_question_test
-- ----------------------------
DROP TABLE IF EXISTS `et_question_test`;
CREATE TABLE `et_question_test`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `point_ids` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  `creator` int(11) NULL DEFAULT NULL,
  `is_private` tinyint(1) NULL DEFAULT 0,
  `memo` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_tag_creator`(`creator`) USING BTREE,
  CONSTRAINT `et_question_test_ibfk_1` FOREIGN KEY (`creator`) REFERENCES `et_user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for et_question_type
-- ----------------------------
DROP TABLE IF EXISTS `et_question_type`;
CREATE TABLE `et_question_type`  (
  `id` int(11) NOT NULL,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `subjective` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of et_question_type
-- ----------------------------
INSERT INTO `et_question_type` VALUES (1, '单选题', 0);

-- ----------------------------
-- Table structure for et_reference
-- ----------------------------
DROP TABLE IF EXISTS `et_reference`;
CREATE TABLE `et_reference`  (
  `reference_id` int(5) NOT NULL,
  `reference_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `memo` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `state` decimal(10, 0) NOT NULL DEFAULT 1 COMMENT '1 正常 0 废弃',
  PRIMARY KEY (`reference_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for et_role
-- ----------------------------
DROP TABLE IF EXISTS `et_role`;
CREATE TABLE `et_role`  (
  `id` int(11) NOT NULL,
  `authority` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `code` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of et_role
-- ----------------------------
INSERT INTO `et_role` VALUES (1, 'ROLE_ADMIN', '超级管理员', 'admin');
INSERT INTO `et_role` VALUES (2, 'ROLE_TEACHER', '教师', 'teacher');
INSERT INTO `et_role` VALUES (3, 'ROLE_STUDENT', '学员', 'student');

-- ----------------------------
-- Table structure for et_rules
-- ----------------------------
DROP TABLE IF EXISTS `et_rules`;
CREATE TABLE `et_rules`  (
  `rules_id` int(11) NOT NULL AUTO_INCREMENT,
  `rules_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `creator` int(11) NOT NULL,
  `is_private` tinyint(1) NOT NULL DEFAULT 0,
  `memo` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`rules_id`) USING BTREE,
  INDEX `fk_rules_creator`(`creator`) USING BTREE,
  CONSTRAINT `et_rules_ibfk_1` FOREIGN KEY (`creator`) REFERENCES `et_user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for et_tag
-- ----------------------------
DROP TABLE IF EXISTS `et_tag`;
CREATE TABLE `et_tag`  (
  `tag_id` int(11) NOT NULL AUTO_INCREMENT,
  `tag_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `creator` int(11) NOT NULL,
  `is_private` tinyint(1) NOT NULL DEFAULT 0,
  `memo` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`tag_id`) USING BTREE,
  INDEX `fk_tag_creator`(`creator`) USING BTREE,
  CONSTRAINT `et_tag_ibfk_1` FOREIGN KEY (`creator`) REFERENCES `et_user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for et_training
-- ----------------------------
DROP TABLE IF EXISTS `et_training`;
CREATE TABLE `et_training`  (
  `training_id` int(11) NOT NULL AUTO_INCREMENT,
  `training_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `training_desc` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `is_private` tinyint(1) NOT NULL DEFAULT 0,
  `field_id` int(11) NOT NULL,
  `create_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `creator` int(11) NULL DEFAULT NULL COMMENT '创建人',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0:未发布；1：发布；2：失效',
  `state_time` timestamp(0) NULL DEFAULT NULL,
  `exp_time` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`training_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of et_training
-- ----------------------------
INSERT INTO `et_training` VALUES (1, '考前培训', '考前培训', 0, 2, '2020-08-27 00:06:34', 1, 0, NULL, NULL);
INSERT INTO `et_training` VALUES (2, '专业知识培训', '专业知识上岗培训', 0, 1, '2020-09-12 20:07:35', 1, 0, NULL, NULL);

-- ----------------------------
-- Table structure for et_training_section
-- ----------------------------
DROP TABLE IF EXISTS `et_training_section`;
CREATE TABLE `et_training_section`  (
  `section_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '1',
  `section_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `section_desc` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `training_id` int(11) NOT NULL,
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `user_id` int(11) NOT NULL,
  `file_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `file_path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `file_md5` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `file_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`section_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of et_training_section
-- ----------------------------
INSERT INTO `et_training_section` VALUES (1, '销售技能', '销售基本技能', 1, '2020-09-12 20:05:35', 1, '职业院校学生顶岗实习安全管理问题研究.pdf', 'files\\training\\admin\\5e32a92b7fdc952af48fe29a135e8325.pdf', NULL, '.pdf');
INSERT INTO `et_training_section` VALUES (2, '产品介绍', '产品知识介绍', 2, '2020-09-12 20:08:34', 1, '职业院校学生顶岗实习安全管理问题研究.pdf', 'files\\training\\admin\\5e32a92b7fdc952af48fe29a135e8325.pdf', NULL, '.pdf');

-- ----------------------------
-- Table structure for et_user
-- ----------------------------
DROP TABLE IF EXISTS `et_user`;
CREATE TABLE `et_user`  (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'PK',
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '账号',
  `true_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '真实姓名',
  `national_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '身份证号',
  `password` char(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `phone_num` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `create_by` int(11) NULL DEFAULT NULL COMMENT '创建人',
  `enabled` tinyint(1) NOT NULL DEFAULT 1 COMMENT '激活状态：0-未激活 1-激活',
  `field_id` int(10) NOT NULL,
  `last_login_time` timestamp(0) NULL DEFAULT NULL,
  `login_time` timestamp(0) NULL DEFAULT NULL,
  `department` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `company` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '1',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `idx_user_uid`(`user_name`) USING BTREE,
  INDEX `idx_user_national_id`(`national_id`) USING BTREE,
  INDEX `idx_user_email`(`email`) USING BTREE,
  INDEX `idx_user_phone`(`phone_num`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4723 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of et_user
-- ----------------------------
INSERT INTO `et_user` VALUES (1, 'admin', 'admin', '000000000000000000', '260acbffd3c30786febc29d7dd71a9880a811e77', '1111@111.com', '18908600000', '2015-09-29 14:38:23', 0, 1, 1, '2015-08-06 11:31:34', '2015-08-06 11:31:50', '', '');
INSERT INTO `et_user` VALUES (2, 'student', '学员', '420000000000000000', '3f70af5072e23c9bf59dd1ac1c91f9f8fcc81478', '133@189.cn', '13333333333', '2015-12-11 21:32:07', 1, 1, 0, '2015-08-06 11:31:34', '2015-08-06 11:31:34', '', '');
INSERT INTO `et_user` VALUES (4714, 'test', 'test', '111111111111111111', 'ae07ccd72a38944df8ffc3f1529aeffae16bc989', '111@111.com', '13912345678', '2020-09-14 09:59:43', -1, 1, 0, NULL, NULL, NULL, '');
INSERT INTO `et_user` VALUES (4715, 'zhangsan', '张三', '111111111111111111', '20c95bcf4c1889946720fb0073e9bee43d9c28be', '123@123.com', '13612345678', '2020-08-25 01:40:29', -1, 1, 0, NULL, NULL, NULL, '');
INSERT INTO `et_user` VALUES (4716, 'zhang', '张老师', '522228200112110112', '1f8d375ffd7fa9a8ad7f445f870d1542cb5c46e8', 'hfk@qq.com', '13988881111', '2020-09-06 17:39:51', 1, 1, 0, NULL, NULL, NULL, '');
INSERT INTO `et_user` VALUES (4717, '管理员1', '张主任', '522228200705061019', 'c80af01e934e0b01426e28b906edabcbd9361c53', 'zhang@qq.com', '13912346677', '2020-09-13 20:35:36', 1, 0, 0, NULL, NULL, NULL, '');
INSERT INTO `et_user` VALUES (4718, 'admin2', 'admin2', '522228199003120012', 'd7a890d5f075b8741a0fca1b86074ca6f259092e', 'admin@qq.com', '13900123345', '2020-09-13 20:36:25', 1, 1, 0, NULL, NULL, NULL, '');
INSERT INTO `et_user` VALUES (4719, 'teacher1', '张老师', '522228198604021119', '260acbffd3c30786febc29d7dd71a9880a811e77', 'teache@qq.com', '13911103212', '2020-09-29 16:13:30', -1, 1, 0, NULL, NULL, NULL, '');
INSERT INTO `et_user` VALUES (4720, 'teacher2', '张老师', '522228198604021119', '21e0aba50598f3230ba285f8d8a45d5579dbbb84', 'teache@qq.com', '13911103212', '2020-09-29 16:13:54', -1, 1, 0, NULL, NULL, NULL, '');
INSERT INTO `et_user` VALUES (4721, 'aaaa', 'aaa', '111111111111111111', '2054b98af4aca1819b579b882c62fc7b938dfcec', '1111@1111.com', '13611111111', '2020-11-08 00:25:36', 1, 1, 0, NULL, NULL, NULL, '');
INSERT INTO `et_user` VALUES (4722, 'wang', '王老师', '110101199011110010', 'd588ab60bf0c59eaa9711cc530817878a4d84958', '111@163.com', '13888888888', '2021-01-01 18:01:57', 1, 1, 0, NULL, NULL, NULL, '');

-- ----------------------------
-- Table structure for et_user_2_department
-- ----------------------------
DROP TABLE IF EXISTS `et_user_2_department`;
CREATE TABLE `et_user_2_department`  (
  `user_id` int(11) NOT NULL,
  `dep_id` int(11) NOT NULL,
  INDEX `fk_ud_uid`(`user_id`) USING BTREE,
  INDEX `fk_ud_did`(`dep_id`) USING BTREE,
  CONSTRAINT `fk_ud_did` FOREIGN KEY (`dep_id`) REFERENCES `et_department` (`dep_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_ud_uid` FOREIGN KEY (`user_id`) REFERENCES `et_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for et_user_2_group
-- ----------------------------
DROP TABLE IF EXISTS `et_user_2_group`;
CREATE TABLE `et_user_2_group`  (
  `group_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `is_admin` tinyint(4) NULL DEFAULT 0,
  UNIQUE INDEX `idx_user_guid`(`group_id`, `user_id`) USING BTREE,
  INDEX `idx_user_gid`(`group_id`) USING BTREE,
  INDEX `idx_user_uid`(`user_id`) USING BTREE,
  CONSTRAINT `fk_et_user_group_et_group_1` FOREIGN KEY (`group_id`) REFERENCES `et_group` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_et_user_group_et_user_1` FOREIGN KEY (`user_id`) REFERENCES `et_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of et_user_2_group
-- ----------------------------
INSERT INTO `et_user_2_group` VALUES (6, 2, '2021-01-01 12:06:23', 0);
INSERT INTO `et_user_2_group` VALUES (7, 2, '2021-01-01 12:06:35', 0);
INSERT INTO `et_user_2_group` VALUES (7, 4721, '2021-01-01 18:37:52', 0);

-- ----------------------------
-- Table structure for et_user_2_role
-- ----------------------------
DROP TABLE IF EXISTS `et_user_2_role`;
CREATE TABLE `et_user_2_role`  (
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `role_id`(`role_id`) USING BTREE,
  CONSTRAINT `et_r_user_role_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `et_user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_user_rid` FOREIGN KEY (`role_id`) REFERENCES `et_role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of et_user_2_role
-- ----------------------------
INSERT INTO `et_user_2_role` VALUES (1, 1);
INSERT INTO `et_user_2_role` VALUES (2, 3);
INSERT INTO `et_user_2_role` VALUES (4714, 3);
INSERT INTO `et_user_2_role` VALUES (4715, 3);
INSERT INTO `et_user_2_role` VALUES (4716, 2);
INSERT INTO `et_user_2_role` VALUES (4717, 1);
INSERT INTO `et_user_2_role` VALUES (4718, 1);
INSERT INTO `et_user_2_role` VALUES (4719, 3);
INSERT INTO `et_user_2_role` VALUES (4720, 3);
INSERT INTO `et_user_2_role` VALUES (4721, 3);
INSERT INTO `et_user_2_role` VALUES (4722, 2);

-- ----------------------------
-- Table structure for et_user_exam_history
-- ----------------------------
DROP TABLE IF EXISTS `et_user_exam_history`;
CREATE TABLE `et_user_exam_history`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL,
  `start_time` timestamp(0) NULL DEFAULT NULL,
  `exam_id` int(10) NOT NULL,
  `exam_paper_id` int(10) NOT NULL,
  `enabled` tinyint(4) NULL DEFAULT NULL,
  `point` int(5) NULL DEFAULT 0,
  `seri_no` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `answer_sheet` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `duration` int(10) NOT NULL,
  `point_get` float(10, 1) NOT NULL DEFAULT 0.0,
  `submit_time` timestamp(0) NULL DEFAULT NULL,
  `approved` tinyint(4) NULL DEFAULT 0,
  `verify_time` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_exam_his_seri_no`(`seri_no`) USING BTREE,
  UNIQUE INDEX `idx_exam_pid`(`exam_id`, `exam_paper_id`, `user_id`) USING BTREE,
  INDEX `fk_exam_his_uid`(`user_id`) USING BTREE,
  INDEX `fk_exam_paper_id`(`exam_paper_id`) USING BTREE,
  CONSTRAINT `fk_exam_his_uid` FOREIGN KEY (`user_id`) REFERENCES `et_user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_exam_id` FOREIGN KEY (`exam_id`) REFERENCES `et_exam` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_exam_paper_id` FOREIGN KEY (`exam_paper_id`) REFERENCES `et_exam_paper` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 61 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of et_user_exam_history
-- ----------------------------
INSERT INTO `et_user_exam_history` VALUES (57, 2, NULL, 26, 12, 0, 0, '21010100201a', '[{\"questionId\":3151,\"content\":\"{\\\"title\\\":\\\"B1.给孩子一件物品，孩子能从摆出的三种物品中找出完全相同的物品\\\",\\\"titleImg\\\":\\\"\\\",\\\"choiceList\\\":{\\\"A\\\":\\\"1.能配对1种物品\\\",\\\"B\\\":\\\"2.能配对至少2种物品\\\",\\\"C\\\":\\\"3.能配对至少5种物品\\\",\\\"D\\\":\\\"4.能配对至少10种物品\\\"},\\\"choiceImgList\\\":{}}\",\"answer\":\"A\",\"analysis\":\"\",\"questionTypeId\":1,\"referenceName\":\"\",\"pointName\":\"评估系统\\n\\t\\t\\u003e B.视觉任务 \\u003e \\n\\t\\t知识关键点：\",\"fieldName\":\"评估系统\",\"questionPoint\":4.0,\"examingPoint\":\"\",\"knowledgePointId\":0},{\"questionId\":3152,\"content\":\"{\\\"title\\\":\\\"B2.给孩子一张图片，孩子能从摆出的三张图片中找出完全相同的图片\\\",\\\"titleImg\\\":\\\"\\\",\\\"choiceList\\\":{\\\"A\\\":\\\"1.能配对1种图片。\\\",\\\"B\\\":\\\"2.能配对至少2种图片。\\\",\\\"C\\\":\\\"3.能配对至少5种图片。\\\",\\\"D\\\":\\\"4.能配对至少10种图片。\\\"},\\\"choiceImgList\\\":{}}\",\"answer\":\"A\",\"analysis\":\"\",\"questionTypeId\":1,\"referenceName\":\"\",\"pointName\":\"评估系统\\n\\t\\t\\u003e B.视觉任务 \\u003e \\n\\t\\t知识关键点：\",\"fieldName\":\"评估系统\",\"questionPoint\":4.0,\"examingPoint\":\"\",\"knowledgePointId\":0}]', '2021-01-01 12:02:08', NULL, 60, 0.0, NULL, 1, '2021-01-01 12:02:08');
INSERT INTO `et_user_exam_history` VALUES (58, 2, NULL, 27, 12, 0, 0, '21010100201b', '[{\"questionId\":3151,\"content\":\"{\\\"title\\\":\\\"B1.给孩子一件物品，孩子能从摆出的三种物品中找出完全相同的物品\\\",\\\"titleImg\\\":\\\"\\\",\\\"choiceList\\\":{\\\"A\\\":\\\"1.能配对1种物品\\\",\\\"B\\\":\\\"2.能配对至少2种物品\\\",\\\"C\\\":\\\"3.能配对至少5种物品\\\",\\\"D\\\":\\\"4.能配对至少10种物品\\\"},\\\"choiceImgList\\\":{}}\",\"answer\":\"A\",\"analysis\":\"\",\"questionTypeId\":1,\"referenceName\":\"\",\"pointName\":\"评估系统\\n\\t\\t\\u003e B.视觉任务 \\u003e \\n\\t\\t知识关键点：\",\"fieldName\":\"评估系统\",\"questionPoint\":4.0,\"examingPoint\":\"\",\"knowledgePointId\":0},{\"questionId\":3152,\"content\":\"{\\\"title\\\":\\\"B2.给孩子一张图片，孩子能从摆出的三张图片中找出完全相同的图片\\\",\\\"titleImg\\\":\\\"\\\",\\\"choiceList\\\":{\\\"A\\\":\\\"1.能配对1种图片。\\\",\\\"B\\\":\\\"2.能配对至少2种图片。\\\",\\\"C\\\":\\\"3.能配对至少5种图片。\\\",\\\"D\\\":\\\"4.能配对至少10种图片。\\\"},\\\"choiceImgList\\\":{}}\",\"answer\":\"A\",\"analysis\":\"\",\"questionTypeId\":1,\"referenceName\":\"\",\"pointName\":\"评估系统\\n\\t\\t\\u003e B.视觉任务 \\u003e \\n\\t\\t知识关键点：\",\"fieldName\":\"评估系统\",\"questionPoint\":4.0,\"examingPoint\":\"\",\"knowledgePointId\":0}]', '2021-01-01 14:54:45', NULL, 60, 0.0, NULL, 1, '2021-01-01 14:54:45');
INSERT INTO `et_user_exam_history` VALUES (59, 2, NULL, 28, 12, 0, 0, '21010100201c', '[{\"questionId\":3151,\"content\":\"{\\\"title\\\":\\\"B1.给孩子一件物品，孩子能从摆出的三种物品中找出完全相同的物品\\\",\\\"titleImg\\\":\\\"\\\",\\\"choiceList\\\":{\\\"A\\\":\\\"1.能配对1种物品\\\",\\\"B\\\":\\\"2.能配对至少2种物品\\\",\\\"C\\\":\\\"3.能配对至少5种物品\\\",\\\"D\\\":\\\"4.能配对至少10种物品\\\"},\\\"choiceImgList\\\":{}}\",\"answer\":\"A\",\"analysis\":\"\",\"questionTypeId\":1,\"referenceName\":\"\",\"pointName\":\"评估系统\\n\\t\\t\\u003e B.视觉任务 \\u003e \\n\\t\\t知识关键点：\",\"fieldName\":\"评估系统\",\"questionPoint\":4.0,\"examingPoint\":\"\",\"knowledgePointId\":0},{\"questionId\":3152,\"content\":\"{\\\"title\\\":\\\"B2.给孩子一张图片，孩子能从摆出的三张图片中找出完全相同的图片\\\",\\\"titleImg\\\":\\\"\\\",\\\"choiceList\\\":{\\\"A\\\":\\\"1.能配对1种图片。\\\",\\\"B\\\":\\\"2.能配对至少2种图片。\\\",\\\"C\\\":\\\"3.能配对至少5种图片。\\\",\\\"D\\\":\\\"4.能配对至少10种图片。\\\"},\\\"choiceImgList\\\":{}}\",\"answer\":\"A\",\"analysis\":\"\",\"questionTypeId\":1,\"referenceName\":\"\",\"pointName\":\"评估系统\\n\\t\\t\\u003e B.视觉任务 \\u003e \\n\\t\\t知识关键点：\",\"fieldName\":\"评估系统\",\"questionPoint\":4.0,\"examingPoint\":\"\",\"knowledgePointId\":0}]', '2021-01-01 23:20:44', NULL, 60, 0.0, NULL, 1, '2021-01-01 23:20:44');
INSERT INTO `et_user_exam_history` VALUES (60, 4721, NULL, 28, 12, 0, 0, '210101127101c', '[{\"questionId\":3151,\"content\":\"{\\\"title\\\":\\\"B1.给孩子一件物品，孩子能从摆出的三种物品中找出完全相同的物品\\\",\\\"titleImg\\\":\\\"\\\",\\\"choiceList\\\":{\\\"A\\\":\\\"1.能配对1种物品\\\",\\\"B\\\":\\\"2.能配对至少2种物品\\\",\\\"C\\\":\\\"3.能配对至少5种物品\\\",\\\"D\\\":\\\"4.能配对至少10种物品\\\"},\\\"choiceImgList\\\":{}}\",\"answer\":\"A\",\"analysis\":\"\",\"questionTypeId\":1,\"referenceName\":\"\",\"pointName\":\"评估系统\\n\\t\\t\\u003e B.视觉任务 \\u003e \\n\\t\\t知识关键点：\",\"fieldName\":\"评估系统\",\"questionPoint\":4.0,\"examingPoint\":\"\",\"knowledgePointId\":0},{\"questionId\":3152,\"content\":\"{\\\"title\\\":\\\"B2.给孩子一张图片，孩子能从摆出的三张图片中找出完全相同的图片\\\",\\\"titleImg\\\":\\\"\\\",\\\"choiceList\\\":{\\\"A\\\":\\\"1.能配对1种图片。\\\",\\\"B\\\":\\\"2.能配对至少2种图片。\\\",\\\"C\\\":\\\"3.能配对至少5种图片。\\\",\\\"D\\\":\\\"4.能配对至少10种图片。\\\"},\\\"choiceImgList\\\":{}}\",\"answer\":\"A\",\"analysis\":\"\",\"questionTypeId\":1,\"referenceName\":\"\",\"pointName\":\"评估系统\\n\\t\\t\\u003e B.视觉任务 \\u003e \\n\\t\\t知识关键点：\",\"fieldName\":\"评估系统\",\"questionPoint\":4.0,\"examingPoint\":\"\",\"knowledgePointId\":0}]', '2021-01-01 23:20:44', NULL, 60, 0.0, NULL, 1, '2021-01-01 23:20:44');

-- ----------------------------
-- Table structure for et_user_question_history
-- ----------------------------
DROP TABLE IF EXISTS `et_user_question_history`;
CREATE TABLE `et_user_question_history`  (
  `question_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `question_type_id` int(11) NOT NULL,
  `is_right` tinyint(4) NOT NULL DEFAULT 1,
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  UNIQUE INDEX `idx_hist_uqid`(`question_id`, `user_id`) USING BTREE,
  INDEX `fk_hist_uid`(`user_id`) USING BTREE,
  INDEX `fk_hist_qid`(`question_id`) USING BTREE,
  CONSTRAINT `fk_hist_qid` FOREIGN KEY (`question_id`) REFERENCES `et_question` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_hist_uid` FOREIGN KEY (`user_id`) REFERENCES `et_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for et_user_training_history
-- ----------------------------
DROP TABLE IF EXISTS `et_user_training_history`;
CREATE TABLE `et_user_training_history`  (
  `training_id` int(11) NOT NULL COMMENT '培训ID',
  `section_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `duration` float(11, 4) NOT NULL DEFAULT 0.0000,
  `process` float(11, 2) NOT NULL,
  `start_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `last_state_time` timestamp(0) NULL DEFAULT NULL,
  `user_training_detail` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`section_id`, `user_id`) USING BTREE,
  UNIQUE INDEX `et_r_user_training_history_uk_1`(`user_id`, `section_id`) USING BTREE,
  CONSTRAINT `fk_user_training_history_sid` FOREIGN KEY (`section_id`) REFERENCES `et_training_section` (`section_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_user_training_history_uid` FOREIGN KEY (`user_id`) REFERENCES `et_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户培训历史记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of et_user_training_history
-- ----------------------------
INSERT INTO `et_user_training_history` VALUES (1, 1, 2, 0.0000, 1.00, '2020-11-14 13:56:26', '2020-11-14 13:56:26', NULL);
INSERT INTO `et_user_training_history` VALUES (1, 1, 4714, 0.0000, 1.00, '2020-10-03 20:43:10', '2020-10-03 20:43:10', NULL);
INSERT INTO `et_user_training_history` VALUES (2, 2, 2, 0.0000, 1.00, '2020-11-14 13:56:17', '2020-11-14 13:56:17', NULL);
INSERT INTO `et_user_training_history` VALUES (2, 2, 4714, 0.0000, 1.00, '2020-09-12 20:10:10', '2020-10-07 23:03:31', NULL);
INSERT INTO `et_user_training_history` VALUES (2, 2, 4720, 0.0000, 1.00, '2020-09-29 17:12:31', '2020-09-29 17:12:31', NULL);

-- ----------------------------
-- Table structure for et_view_type
-- ----------------------------
DROP TABLE IF EXISTS `et_view_type`;
CREATE TABLE `et_view_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '培训视图表现形式' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of et_view_type
-- ----------------------------
INSERT INTO `et_view_type` VALUES (1, 'PDF');
INSERT INTO `et_view_type` VALUES (2, 'PPT');
INSERT INTO `et_view_type` VALUES (3, 'WORD');
INSERT INTO `et_view_type` VALUES (4, 'TXT');
INSERT INTO `et_view_type` VALUES (5, 'SWF');
INSERT INTO `et_view_type` VALUES (6, 'EXCEL');
INSERT INTO `et_view_type` VALUES (7, 'MP4');
INSERT INTO `et_view_type` VALUES (8, 'FLV');

-- ----------------------------
-- Table structure for t_c3p0
-- ----------------------------
DROP TABLE IF EXISTS `t_c3p0`;
CREATE TABLE `t_c3p0`  (
  `a` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
