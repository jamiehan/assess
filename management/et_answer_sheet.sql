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

 Date: 02/01/2021 19:24:32
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for et_answer_sheet
-- ----------------------------
DROP TABLE IF EXISTS `et_answer_sheet`;
CREATE TABLE `et_answer_sheet`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '答题卡主表ID',
  `exam_history_id` int(11) NULL DEFAULT NULL COMMENT '考试历史表ID',
  `exam_id` int(11) NULL DEFAULT NULL COMMENT '考试ID',
  `exam_paper_id` int(11) NULL DEFAULT NULL COMMENT '试卷ID',
  `duration` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '做题时间',
  `point_max` float(5,2) NULL DEFAULT NULL,
  `point_raw` float(5,2) NULL DEFAULT NULL,
  `start_time` datetime(0) NULL DEFAULT NULL,
  `user_id` int(11) NULL DEFAULT NULL COMMENT '学生ID',
  `times` int(11) NULL DEFAULT NULL COMMENT '考试轮次',
  `point` int(255) NULL DEFAULT NULL COMMENT '总分',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `creator_id` int(11) NULL DEFAULT NULL COMMENT '创建者ID',
  `modify_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `modifier_id` int(11) NULL DEFAULT NULL COMMENT '更新者ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
