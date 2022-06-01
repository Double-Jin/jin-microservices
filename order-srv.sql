/*
 Navicat Premium Data Transfer

 Source Server         : order-srv
 Source Server Type    : MySQL
 Source Server Version : 80024
 Source Host           : 39.108.236.73:3306
 Source Schema         : order-srv

 Target Server Type    : MySQL
 Target Server Version : 80024
 File Encoding         : 65001

 Date: 30/05/2022 14:35:03
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
-- Table structure for jin_order
-- ----------------------------
DROP TABLE IF EXISTS `jin_order`;
CREATE TABLE `jin_order` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `order_no` varchar(35) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '订单编号',
  `user_id` varchar(35) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '线下订单编号',
  `coupon_id` int unsigned NOT NULL COMMENT '会员优惠券id',
  `order_money` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '订单金额',
  `order_discount` decimal(5,3) NOT NULL DEFAULT '0.000' COMMENT '订单折扣',
  `order_fact_money` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '订单实际金额',
  `consume_number` int DEFAULT NULL COMMENT '商品数量',
  `order_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '订单状态, -1 已关闭 0 待支付 1 支付成功 2 已发货 3 退款处理  4 已完成\r\n订单状态（旧）, -1 已取消 0 待支付 1 支付成功 2 申请退款 3 完成退款  4 已完成',
  `payment` tinyint(1) NOT NULL DEFAULT '1' COMMENT '支付方式 1储值 2微信',
  `create_time` int DEFAULT '0' COMMENT '创建时间',
  `update_time` int DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='订单表';

-- ----------------------------
-- Records of jin_order
-- ----------------------------
BEGIN;
INSERT INTO `jin_order` VALUES (1, '20220527', '1', 0, 100.00, 99.999, 100.00, 1, 1, 1, 1653447191, 1653447191);
INSERT INTO `jin_order` VALUES (10, '20220528063525', '1', 0, 100.00, 99.999, 0.00, 1, 0, 1, 1653719726, 1653719726);
INSERT INTO `jin_order` VALUES (12, '20220528082010', '1', 0, 100.00, 99.999, 0.00, 1, 0, 1, 1653726011, 1653726011);
INSERT INTO `jin_order` VALUES (13, '20220528082448', '1', 0, 100.00, 99.999, 0.00, 1, 0, 1, 1653726288, 1653726288);
COMMIT;

-- ----------------------------
-- Table structure for jin_order_goods
-- ----------------------------
DROP TABLE IF EXISTS `jin_order_goods`;
CREATE TABLE `jin_order_goods` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `order_no` varchar(35) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '订单编号',
  `goods_id` int NOT NULL DEFAULT '0' COMMENT '商品id',
  `goods_sn` varchar(35) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '商品编号',
  `sku_id` int NOT NULL DEFAULT '0' COMMENT 'skuid',
  `user_id` int NOT NULL DEFAULT '0' COMMENT '用户id',
  `goods_name` varchar(35) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '商品名称',
  `number` int NOT NULL DEFAULT '0' COMMENT '个数',
  `goods_tag_price` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '吊牌价',
  `goods_real_price` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '实际价',
  `goods_discount` decimal(6,3) NOT NULL DEFAULT '0.000' COMMENT '商户折扣',
  `goods_fact_money` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '商品实际金额',
  `create_time` int DEFAULT '0' COMMENT '创建时间',
  `update_time` int DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='订单商品详情表';

-- ----------------------------
-- Records of jin_order_goods
-- ----------------------------
BEGIN;
INSERT INTO `jin_order_goods` VALUES (1, '20220527', 2, 'AS12', 10, 1, '测试商品', 1, 100.00, 100.00, 100.000, 100.00, 1653447191, 1653447191);
INSERT INTO `jin_order_goods` VALUES (4, '20220528063525', 1, 'JIN02', 1, 1, '测试商品', 1, 100.00, 100.00, 100.000, 0.00, 1653719726, 1653719726);
INSERT INTO `jin_order_goods` VALUES (6, '20220528082010', 1, 'JIN02', 1, 1, '测试商品', 1, 100.00, 100.00, 100.000, 0.00, 1653726011, 1653726011);
INSERT INTO `jin_order_goods` VALUES (7, '20220528082448', 1, 'JIN02', 1, 1, '测试商品', 1, 100.00, 100.00, 100.000, 0.00, 1653726288, 1653726288);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
