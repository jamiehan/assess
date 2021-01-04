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

 Date: 02/01/2021 19:24:42
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for et_answer_sheet_item
-- ----------------------------
DROP TABLE IF EXISTS `et_answer_sheet_item`;
CREATE TABLE `et_answer_sheet_item`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `answer_sheet_id` int(11) NULL DEFAULT NULL COMMENT '答题卡ID',
  `point` int(255) NULL DEFAULT NULL COMMENT '得分点',
  `question_type_id` int(11) NULL DEFAULT NULL COMMENT '问题类型ID',
  `answer` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所选答案编号',
  `question_id` int(11) NULL DEFAULT NULL COMMENT '题目ID',
  `question_code` int(11) NULL DEFAULT NULL COMMENT '题目编码',
  `comment` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `right` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否正确',
  `student_id` int(11) NULL DEFAULT NULL COMMENT '学生ID',
  `teacher_id` int(11) NULL DEFAULT NULL COMMENT '评估老师ID',
  `assess_time` datetime(0) NULL DEFAULT NULL COMMENT '评估时间',
  `knowlege_point_id` int(11) NULL DEFAULT NULL COMMENT '评估领域ID',
  `knowlege_point_code` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评估领域编码',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `creator_id` int(11) NULL DEFAULT NULL COMMENT '创建者',
  `modify_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `modifier_id` int(11) NULL DEFAULT NULL COMMENT '更新者ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
