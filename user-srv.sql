/*
 Navicat Premium Data Transfer

 Source Server         : user-srv
 Source Server Type    : MySQL
 Source Server Version : 80024
 Source Host           : 39.108.236.73:3306
 Source Schema         : user-srv

 Target Server Type    : MySQL
 Target Server Version : 80024
 File Encoding         : 65001

 Date: 30/05/2022 14:35:27
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for barrier
-- ----------------------------
DROP TABLE IF EXISTS `barrier`;
CREATE TABLE `barrier` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `trans_type` varchar(45) DEFAULT '',
  `gid` varchar(128) DEFAULT '',
  `branch_id` varchar(128) DEFAULT '',
  `op` varchar(45) DEFAULT '',
  `barrier_id` varchar(45) DEFAULT '',
  `reason` varchar(45) DEFAULT '' COMMENT 'the branch type who insert this record',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `gid` (`gid`,`branch_id`,`op`,`barrier_id`),
  KEY `create_time` (`create_time`),
  KEY `update_time` (`update_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of barrier
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for jin_user
-- ----------------------------
DROP TABLE IF EXISTS `jin_user`;
CREATE TABLE `jin_user` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户名',
  `user_image` varchar(255) DEFAULT NULL COMMENT '头像',
  `phone` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '手机号',
  `sex` tinyint(1) DEFAULT NULL COMMENT '性别,1男，2女，0未知',
  `create_time` int DEFAULT '0' COMMENT '创建时间',
  `update_time` int DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of jin_user
-- ----------------------------
BEGIN;
INSERT INTO `jin_user` VALUES (1, 'DoubleJin', 'http://thirdwx.qlogo.cn/mmopen/Px0DzaTpW96d5vicVMbA6hkjic31msWnF1gU1yicrfNsmkxd1UT8N4vlTV6UArXQm1cBo3AB9I74dfGIquZ21SuJRLCuA5fIia7v/132', '1358888888', 1, 1653545913, 1653545913);
COMMIT;

-- ----------------------------
-- Table structure for jin_user_bonus_log
-- ----------------------------
DROP TABLE IF EXISTS `jin_user_bonus_log`;
CREATE TABLE `jin_user_bonus_log` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL COMMENT '会员id',
  `type` tinyint NOT NULL COMMENT '积分类型 -1减去积分 1 增加积分',
  `bonus` int NOT NULL DEFAULT '0' COMMENT '积分值',
  `source` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '来源: order订单 admin_change后台调整',
  `remark` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `create_time` int NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `user_bonus_log_user_id_index` (`user_id`),
  KEY `user_id_type` (`user_id`,`type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=927 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of jin_user_bonus_log
-- ----------------------------
BEGIN;
INSERT INTO `jin_user_bonus_log` VALUES (665, 1, 1, 1, 'order', NULL, 1648733559, 1648733559);
INSERT INTO `jin_user_bonus_log` VALUES (666, 1, 1, 1, 'order', NULL, 1648735906, 1648735906);
INSERT INTO `jin_user_bonus_log` VALUES (667, 1, 1, 1, 'order', NULL, 1648735908, 1648735908);
INSERT INTO `jin_user_bonus_log` VALUES (668, 1, 1, 1, 'order', NULL, 1648735908, 1648735908);
INSERT INTO `jin_user_bonus_log` VALUES (669, 1, 1, 1, 'order', NULL, 1648735911, 1648735911);
INSERT INTO `jin_user_bonus_log` VALUES (670, 1, 1, 1, 'order', NULL, 1648735920, 1648735920);
INSERT INTO `jin_user_bonus_log` VALUES (671, 1, 1, 1, 'order', NULL, 1648735966, 1648735966);
INSERT INTO `jin_user_bonus_log` VALUES (672, 1, 1, 1, 'order', NULL, 1648735968, 1648735968);
INSERT INTO `jin_user_bonus_log` VALUES (673, 1, 1, 1, 'order', NULL, 1648735968, 1648735968);
INSERT INTO `jin_user_bonus_log` VALUES (674, 1, 1, 1, 'order', NULL, 1648735977, 1648735977);
COMMIT;

-- ----------------------------
-- Table structure for jin_user_stored_log
-- ----------------------------
DROP TABLE IF EXISTS `jin_user_stored_log`;
CREATE TABLE `jin_user_stored_log` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL COMMENT '会员id',
  `type` tinyint NOT NULL COMMENT '积分类型 -1减去储值 1 增加储值',
  `amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '金额',
  `source` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '来源: pay充值 order订单 admin_change后台调整',
  `remark` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `create_time` int NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `user_stored_log_user_id_index` (`user_id`),
  KEY `user_id_type` (`user_id`,`type`)
) ENGINE=InnoDB AUTO_INCREMENT=825 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of jin_user_stored_log
-- ----------------------------
BEGIN;
INSERT INTO `jin_user_stored_log` VALUES (541, 1, 1, 5000000.00, 'admin_change', '', 1648638057, 1648638057);
INSERT INTO `jin_user_stored_log` VALUES (542, 1, -1, -0.50, 'order', NULL, 1648646134, 1648646134);
INSERT INTO `jin_user_stored_log` VALUES (543, 1, -1, -0.10, 'order', NULL, 1648646182, 1648646182);
INSERT INTO `jin_user_stored_log` VALUES (544, 1, -1, -0.10, 'order', NULL, 1648646202, 1648646202);
INSERT INTO `jin_user_stored_log` VALUES (545, 1, -1, -0.10, 'order', NULL, 1648646222, 1648646222);
INSERT INTO `jin_user_stored_log` VALUES (546, 1, -1, -0.10, 'order', NULL, 1648646236, 1648646236);
INSERT INTO `jin_user_stored_log` VALUES (547, 1, -1, -0.10, 'order', NULL, 1648646249, 1648646249);
INSERT INTO `jin_user_stored_log` VALUES (548, 1, -1, -0.10, 'order', NULL, 1648646268, 1648646268);
INSERT INTO `jin_user_stored_log` VALUES (549, 1, -1, -0.10, 'order', NULL, 1648646296, 1648646296);
INSERT INTO `jin_user_stored_log` VALUES (550, 1, -1, -0.10, 'order', NULL, 1648646313, 1648646313);
INSERT INTO `jin_user_stored_log` VALUES (551, 1, -1, -0.10, 'order', NULL, 1648646330, 1648646330);
INSERT INTO `jin_user_stored_log` VALUES (552, 1, -1, -0.10, 'order', NULL, 1648646341, 1648646341);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
