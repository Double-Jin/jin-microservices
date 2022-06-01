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
INSERT INTO `jin_user_bonus_log` VALUES (675, 1, 1, 1, 'order', NULL, 1648735995, 1648735995);
INSERT INTO `jin_user_bonus_log` VALUES (676, 1, 1, 1, 'order', NULL, 1648736076, 1648736076);
INSERT INTO `jin_user_bonus_log` VALUES (677, 1, 1, 1, 'order', NULL, 1648736129, 1648736129);
INSERT INTO `jin_user_bonus_log` VALUES (678, 1, 1, 1, 'order', NULL, 1648736129, 1648736129);
INSERT INTO `jin_user_bonus_log` VALUES (679, 1, 1, 1, 'order', NULL, 1648736130, 1648736130);
INSERT INTO `jin_user_bonus_log` VALUES (680, 1, 1, 1, 'order', NULL, 1648736130, 1648736130);
INSERT INTO `jin_user_bonus_log` VALUES (681, 1, 1, 1, 'order', NULL, 1648736132, 1648736132);
INSERT INTO `jin_user_bonus_log` VALUES (682, 1, 1, 7, 'order', NULL, 1648736187, 1648736187);
INSERT INTO `jin_user_bonus_log` VALUES (683, 1, 1, 1, 'order', NULL, 1648736303, 1648736303);
INSERT INTO `jin_user_bonus_log` VALUES (684, 1, 1, 1, 'order', NULL, 1648736305, 1648736305);
INSERT INTO `jin_user_bonus_log` VALUES (685, 1, 1, 1, 'order', NULL, 1648736306, 1648736306);
INSERT INTO `jin_user_bonus_log` VALUES (686, 1, 1, 1, 'order', NULL, 1648736309, 1648736309);
INSERT INTO `jin_user_bonus_log` VALUES (687, 1, 1, 1, 'order', NULL, 1648736314, 1648736314);
INSERT INTO `jin_user_bonus_log` VALUES (688, 1, 1, 1, 'order', NULL, 1648736471, 1648736471);
INSERT INTO `jin_user_bonus_log` VALUES (689, 1, 1, 1, 'order', NULL, 1648736493, 1648736493);
INSERT INTO `jin_user_bonus_log` VALUES (690, 1, 1, 1, 'order', NULL, 1648736648, 1648736648);
INSERT INTO `jin_user_bonus_log` VALUES (691, 1, 1, 1, 'order', NULL, 1648736737, 1648736737);
INSERT INTO `jin_user_bonus_log` VALUES (692, 1, 1, 1, 'order', NULL, 1648736738, 1648736738);
INSERT INTO `jin_user_bonus_log` VALUES (693, 1, 1, 1, 'order', NULL, 1648736762, 1648736762);
INSERT INTO `jin_user_bonus_log` VALUES (694, 1, 1, 1, 'order', NULL, 1648736763, 1648736763);
INSERT INTO `jin_user_bonus_log` VALUES (695, 1, 1, 1, 'order', NULL, 1648736764, 1648736764);
INSERT INTO `jin_user_bonus_log` VALUES (696, 1, 1, 1, 'order', NULL, 1648736854, 1648736854);
INSERT INTO `jin_user_bonus_log` VALUES (697, 1, 1, 1, 'order', NULL, 1648736855, 1648736855);
INSERT INTO `jin_user_bonus_log` VALUES (698, 1, 1, 1, 'order', NULL, 1648736857, 1648736857);
INSERT INTO `jin_user_bonus_log` VALUES (699, 1, 1, 1, 'order', NULL, 1648736876, 1648736876);
INSERT INTO `jin_user_bonus_log` VALUES (700, 1, 1, 1, 'order', NULL, 1648736880, 1648736880);
INSERT INTO `jin_user_bonus_log` VALUES (701, 1, 1, 7, 'order', NULL, 1648737084, 1648737084);
INSERT INTO `jin_user_bonus_log` VALUES (702, 1, 1, 7, 'order', NULL, 1648737173, 1648737173);
INSERT INTO `jin_user_bonus_log` VALUES (703, 1, 1, 7, 'order', NULL, 1648737216, 1648737216);
INSERT INTO `jin_user_bonus_log` VALUES (704, 1, 1, 6, 'order', NULL, 1648737440, 1648737440);
INSERT INTO `jin_user_bonus_log` VALUES (705, 1, 1, 8, 'order', NULL, 1648737471, 1648737471);
INSERT INTO `jin_user_bonus_log` VALUES (706, 1, 1, 1, 'order', NULL, 1648737551, 1648737551);
INSERT INTO `jin_user_bonus_log` VALUES (707, 1, 1, 1, 'order', NULL, 1648737578, 1648737578);
INSERT INTO `jin_user_bonus_log` VALUES (708, 1, 1, 7, 'order', NULL, 1648742526, 1648742526);
INSERT INTO `jin_user_bonus_log` VALUES (709, 1, 1, 1, 'order', NULL, 1648742895, 1648742895);
INSERT INTO `jin_user_bonus_log` VALUES (710, 1, 1, 1, 'order', NULL, 1648742952, 1648742952);
INSERT INTO `jin_user_bonus_log` VALUES (711, 1, 1, 1, 'order', NULL, 1648743073, 1648743073);
INSERT INTO `jin_user_bonus_log` VALUES (712, 1, 1, 1, 'order', NULL, 1648743204, 1648743204);
INSERT INTO `jin_user_bonus_log` VALUES (713, 1, 1, 1, 'order', NULL, 1648743544, 1648743544);
INSERT INTO `jin_user_bonus_log` VALUES (714, 1, 1, 1, 'order', NULL, 1648743668, 1648743668);
INSERT INTO `jin_user_bonus_log` VALUES (715, 1, 1, 1, 'order', NULL, 1648743732, 1648743732);
INSERT INTO `jin_user_bonus_log` VALUES (716, 1, 1, 1, 'order', NULL, 1648743786, 1648743786);
INSERT INTO `jin_user_bonus_log` VALUES (717, 1, 1, 1, 'order', NULL, 1648743868, 1648743868);
INSERT INTO `jin_user_bonus_log` VALUES (718, 1, 1, 1, 'order', NULL, 1648743953, 1648743953);
INSERT INTO `jin_user_bonus_log` VALUES (719, 1, 1, 1, 'order', NULL, 1648744106, 1648744106);
INSERT INTO `jin_user_bonus_log` VALUES (720, 1, 1, 1, 'order', NULL, 1648745019, 1648745019);
INSERT INTO `jin_user_bonus_log` VALUES (721, 1, 1, 1, 'order', NULL, 1648778115, 1648778115);
INSERT INTO `jin_user_bonus_log` VALUES (722, 1, 1, 1, 'order', NULL, 1648778139, 1648778139);
INSERT INTO `jin_user_bonus_log` VALUES (723, 1, 1, 1, 'order', NULL, 1648778725, 1648778725);
INSERT INTO `jin_user_bonus_log` VALUES (724, 1, 1, 1, 'order', NULL, 1648778769, 1648778769);
INSERT INTO `jin_user_bonus_log` VALUES (725, 1, 1, 1, 'order', NULL, 1648802513, 1648802513);
INSERT INTO `jin_user_bonus_log` VALUES (726, 1, 1, 1, 'order', NULL, 1648802893, 1648802893);
INSERT INTO `jin_user_bonus_log` VALUES (727, 1, 1, 1, 'order', NULL, 1648819415, 1648819415);
INSERT INTO `jin_user_bonus_log` VALUES (728, 1, 1, 1, 'order', NULL, 1648819813, 1648819813);
INSERT INTO `jin_user_bonus_log` VALUES (729, 1, 1, 1, 'order', NULL, 1648819814, 1648819814);
INSERT INTO `jin_user_bonus_log` VALUES (730, 1, 1, 1, 'order', NULL, 1648819822, 1648819822);
INSERT INTO `jin_user_bonus_log` VALUES (731, 1, 1, 1, 'order', NULL, 1648819824, 1648819824);
INSERT INTO `jin_user_bonus_log` VALUES (732, 1, 1, 1, 'order', NULL, 1648819837, 1648819837);
INSERT INTO `jin_user_bonus_log` VALUES (733, 1, 1, 1, 'order', NULL, 1648819865, 1648819865);
INSERT INTO `jin_user_bonus_log` VALUES (734, 1, 1, 1, 'order', NULL, 1648819871, 1648819871);
INSERT INTO `jin_user_bonus_log` VALUES (735, 1, 1, 1, 'order', NULL, 1648819872, 1648819872);
INSERT INTO `jin_user_bonus_log` VALUES (736, 1, 1, 1, 'order', NULL, 1648819880, 1648819880);
INSERT INTO `jin_user_bonus_log` VALUES (737, 1, 1, 1, 'order', NULL, 1648819884, 1648819884);
INSERT INTO `jin_user_bonus_log` VALUES (738, 1, 1, 1, 'order', NULL, 1648819908, 1648819908);
INSERT INTO `jin_user_bonus_log` VALUES (739, 1, 1, 1, 'order', NULL, 1648819911, 1648819911);
INSERT INTO `jin_user_bonus_log` VALUES (740, 1, 1, 1, 'order', NULL, 1648819913, 1648819913);
INSERT INTO `jin_user_bonus_log` VALUES (741, 1, 1, 1, 'order', NULL, 1648819915, 1648819915);
INSERT INTO `jin_user_bonus_log` VALUES (742, 1, 1, 1, 'order', NULL, 1648819915, 1648819915);
INSERT INTO `jin_user_bonus_log` VALUES (743, 1, 1, 1, 'order', NULL, 1648866091, 1648866091);
INSERT INTO `jin_user_bonus_log` VALUES (744, 1, 1, 1, 'order', NULL, 1648867594, 1648867594);
INSERT INTO `jin_user_bonus_log` VALUES (745, 1, 1, 1, 'order', NULL, 1648867669, 1648867669);
INSERT INTO `jin_user_bonus_log` VALUES (746, 1, 1, 7, 'order', NULL, 1648877826, 1648877826);
INSERT INTO `jin_user_bonus_log` VALUES (747, 1, 1, 7, 'order', NULL, 1648877920, 1648877920);
INSERT INTO `jin_user_bonus_log` VALUES (748, 1, 1, 7, 'order', NULL, 1648878341, 1648878341);
INSERT INTO `jin_user_bonus_log` VALUES (749, 1, 1, 7, 'order', NULL, 1648878492, 1648878492);
INSERT INTO `jin_user_bonus_log` VALUES (750, 1, 1, 7, 'order', NULL, 1648879043, 1648879043);
INSERT INTO `jin_user_bonus_log` VALUES (751, 1, 1, 1, 'order', NULL, 1648879209, 1648879209);
INSERT INTO `jin_user_bonus_log` VALUES (752, 1, 1, 1, 'order', NULL, 1648879224, 1648879224);
INSERT INTO `jin_user_bonus_log` VALUES (753, 1, 1, 1, 'order', NULL, 1648879235, 1648879235);
INSERT INTO `jin_user_bonus_log` VALUES (754, 1, 1, 1, 'order', NULL, 1648879249, 1648879249);
INSERT INTO `jin_user_bonus_log` VALUES (755, 1, 1, 1, 'order', NULL, 1648879299, 1648879299);
INSERT INTO `jin_user_bonus_log` VALUES (756, 1, 1, 1, 'order', NULL, 1648879322, 1648879322);
INSERT INTO `jin_user_bonus_log` VALUES (757, 1, 1, 1, 'order', NULL, 1648879341, 1648879341);
INSERT INTO `jin_user_bonus_log` VALUES (758, 1, 1, 1, 'order', NULL, 1648879692, 1648879692);
INSERT INTO `jin_user_bonus_log` VALUES (759, 1, 1, 1, 'order', NULL, 1648879827, 1648879827);
INSERT INTO `jin_user_bonus_log` VALUES (760, 1, 1, 1, 'order', NULL, 1648879980, 1648879980);
INSERT INTO `jin_user_bonus_log` VALUES (761, 1, 1, 1, 'order', NULL, 1648887980, 1648887980);
INSERT INTO `jin_user_bonus_log` VALUES (762, 1, 1, 1, 'order', NULL, 1648888017, 1648888017);
INSERT INTO `jin_user_bonus_log` VALUES (763, 1, 1, 1, 'order', NULL, 1648888064, 1648888064);
INSERT INTO `jin_user_bonus_log` VALUES (764, 1, 1, 1, 'order', NULL, 1648891133, 1648891133);
INSERT INTO `jin_user_bonus_log` VALUES (765, 1, 1, 1, 'order', NULL, 1648891151, 1648891151);
INSERT INTO `jin_user_bonus_log` VALUES (766, 1, 1, 1, 'order', NULL, 1648891179, 1648891179);
INSERT INTO `jin_user_bonus_log` VALUES (767, 1, 1, 1, 'order', NULL, 1648891247, 1648891247);
INSERT INTO `jin_user_bonus_log` VALUES (768, 1, 1, 1, 'order', NULL, 1648891377, 1648891377);
INSERT INTO `jin_user_bonus_log` VALUES (769, 1, 1, 1, 'order', NULL, 1648891390, 1648891390);
INSERT INTO `jin_user_bonus_log` VALUES (770, 1, 1, 1, 'order', NULL, 1648891430, 1648891430);
INSERT INTO `jin_user_bonus_log` VALUES (771, 1, 1, 1, 'order', NULL, 1648891468, 1648891468);
INSERT INTO `jin_user_bonus_log` VALUES (772, 1, 1, 1, 'order', NULL, 1648891614, 1648891614);
INSERT INTO `jin_user_bonus_log` VALUES (773, 1, 1, 1, 'order', NULL, 1648891687, 1648891687);
INSERT INTO `jin_user_bonus_log` VALUES (774, 1, 1, 1, 'order', NULL, 1648891918, 1648891918);
INSERT INTO `jin_user_bonus_log` VALUES (775, 1, 1, 1, 'order', NULL, 1648891949, 1648891949);
INSERT INTO `jin_user_bonus_log` VALUES (776, 1, 1, 1, 'order', NULL, 1648892096, 1648892096);
INSERT INTO `jin_user_bonus_log` VALUES (777, 1, 1, 1, 'order', NULL, 1648892183, 1648892183);
INSERT INTO `jin_user_bonus_log` VALUES (778, 1, 1, 1, 'order', NULL, 1648892227, 1648892227);
INSERT INTO `jin_user_bonus_log` VALUES (779, 1, 1, 1, 'order', NULL, 1648892238, 1648892238);
INSERT INTO `jin_user_bonus_log` VALUES (780, 1, 1, 1, 'order', NULL, 1648892254, 1648892254);
INSERT INTO `jin_user_bonus_log` VALUES (781, 1, 1, 1, 'order', NULL, 1648892574, 1648892574);
INSERT INTO `jin_user_bonus_log` VALUES (782, 1, 1, 1, 'order', NULL, 1648892590, 1648892590);
INSERT INTO `jin_user_bonus_log` VALUES (783, 1, 1, 1, 'order', NULL, 1648892604, 1648892604);
INSERT INTO `jin_user_bonus_log` VALUES (784, 1, 1, 1, 'order', NULL, 1648892630, 1648892630);
INSERT INTO `jin_user_bonus_log` VALUES (785, 1, 1, 1, 'order', NULL, 1648892695, 1648892695);
INSERT INTO `jin_user_bonus_log` VALUES (786, 1, 1, 1, 'order', NULL, 1648892773, 1648892773);
INSERT INTO `jin_user_bonus_log` VALUES (787, 1, 1, 1, 'order', NULL, 1648893074, 1648893074);
INSERT INTO `jin_user_bonus_log` VALUES (788, 1, 1, 1, 'order', NULL, 1648893082, 1648893082);
INSERT INTO `jin_user_bonus_log` VALUES (789, 1, 1, 1, 'order', NULL, 1648893091, 1648893091);
INSERT INTO `jin_user_bonus_log` VALUES (790, 1, 1, 1, 'order', NULL, 1648893132, 1648893132);
INSERT INTO `jin_user_bonus_log` VALUES (791, 1, 1, 1, 'order', NULL, 1648893143, 1648893143);
INSERT INTO `jin_user_bonus_log` VALUES (792, 1, 1, 1, 'order', NULL, 1648893170, 1648893170);
INSERT INTO `jin_user_bonus_log` VALUES (793, 1, 1, 1, 'order', NULL, 1648893271, 1648893271);
INSERT INTO `jin_user_bonus_log` VALUES (794, 1, 1, 1, 'order', NULL, 1648893284, 1648893284);
INSERT INTO `jin_user_bonus_log` VALUES (795, 1, 1, 1, 'order', NULL, 1648893300, 1648893300);
INSERT INTO `jin_user_bonus_log` VALUES (796, 1, 1, 1, 'order', NULL, 1648893805, 1648893805);
INSERT INTO `jin_user_bonus_log` VALUES (797, 1, 1, 1, 'order', NULL, 1648893825, 1648893825);
INSERT INTO `jin_user_bonus_log` VALUES (798, 1, 1, 1, 'order', NULL, 1648893864, 1648893864);
INSERT INTO `jin_user_bonus_log` VALUES (799, 1, 1, 1, 'order', NULL, 1648893909, 1648893909);
INSERT INTO `jin_user_bonus_log` VALUES (800, 1, 1, 1, 'order', NULL, 1648894152, 1648894152);
INSERT INTO `jin_user_bonus_log` VALUES (801, 1, 1, 1, 'order', NULL, 1648894183, 1648894183);
INSERT INTO `jin_user_bonus_log` VALUES (802, 1, 1, 1, 'order', NULL, 1648894209, 1648894209);
INSERT INTO `jin_user_bonus_log` VALUES (803, 1, 1, 1, 'order', NULL, 1648904856, 1648904856);
INSERT INTO `jin_user_bonus_log` VALUES (804, 1, 1, 1, 'order', NULL, 1648904871, 1648904871);
INSERT INTO `jin_user_bonus_log` VALUES (805, 1, 1, 1, 'order', NULL, 1648904892, 1648904892);
INSERT INTO `jin_user_bonus_log` VALUES (806, 1, 1, 1, 'order', NULL, 1648907359, 1648907359);
INSERT INTO `jin_user_bonus_log` VALUES (807, 1, 1, 1, 'order', NULL, 1648907397, 1648907397);
INSERT INTO `jin_user_bonus_log` VALUES (808, 1, 1, 1, 'order', NULL, 1648912594, 1648912594);
INSERT INTO `jin_user_bonus_log` VALUES (809, 1, 1, 1, 'order', NULL, 1648912695, 1648912695);
INSERT INTO `jin_user_bonus_log` VALUES (810, 1, 1, 1, 'order', NULL, 1648912709, 1648912709);
INSERT INTO `jin_user_bonus_log` VALUES (811, 1, 1, 1, 'order', NULL, 1648912796, 1648912796);
INSERT INTO `jin_user_bonus_log` VALUES (812, 1, 1, 1, 'order', NULL, 1648912822, 1648912822);
INSERT INTO `jin_user_bonus_log` VALUES (813, 1, 1, 1, 'order', NULL, 1648912846, 1648912846);
INSERT INTO `jin_user_bonus_log` VALUES (814, 1, 1, 1, 'order', NULL, 1648912872, 1648912872);
INSERT INTO `jin_user_bonus_log` VALUES (815, 1, 1, 1, 'order', NULL, 1648912928, 1648912928);
INSERT INTO `jin_user_bonus_log` VALUES (816, 1, 1, 1, 'order', NULL, 1648913094, 1648913094);
INSERT INTO `jin_user_bonus_log` VALUES (817, 1, 1, 1, 'order', NULL, 1648913115, 1648913115);
INSERT INTO `jin_user_bonus_log` VALUES (818, 1, 1, 1, 'order', NULL, 1648913134, 1648913134);
INSERT INTO `jin_user_bonus_log` VALUES (819, 1, 1, 1, 'order', NULL, 1648913233, 1648913233);
INSERT INTO `jin_user_bonus_log` VALUES (820, 1, 1, 1, 'order', NULL, 1648913246, 1648913246);
INSERT INTO `jin_user_bonus_log` VALUES (821, 1, 1, 1, 'order', NULL, 1648913262, 1648913262);
INSERT INTO `jin_user_bonus_log` VALUES (822, 1, 1, 1, 'order', NULL, 1648913276, 1648913276);
INSERT INTO `jin_user_bonus_log` VALUES (823, 1, 1, 1, 'order', NULL, 1648913299, 1648913299);
INSERT INTO `jin_user_bonus_log` VALUES (824, 1, 1, 1, 'order', NULL, 1648913340, 1648913340);
INSERT INTO `jin_user_bonus_log` VALUES (825, 1, 1, 1, 'order', NULL, 1648913570, 1648913570);
INSERT INTO `jin_user_bonus_log` VALUES (826, 1, 1, 1, 'order', NULL, 1648913582, 1648913582);
INSERT INTO `jin_user_bonus_log` VALUES (827, 1, 1, 1, 'order', NULL, 1648913596, 1648913596);
INSERT INTO `jin_user_bonus_log` VALUES (828, 1, 1, 1, 'order', NULL, 1648913607, 1648913607);
INSERT INTO `jin_user_bonus_log` VALUES (829, 1, 1, 1, 'order', NULL, 1648916133, 1648916133);
INSERT INTO `jin_user_bonus_log` VALUES (830, 1, 1, 1, 'order', NULL, 1648916231, 1648916231);
INSERT INTO `jin_user_bonus_log` VALUES (831, 1, 1, 1, 'order', NULL, 1648916260, 1648916260);
INSERT INTO `jin_user_bonus_log` VALUES (832, 1, 1, 1, 'order', NULL, 1648916737, 1648916737);
INSERT INTO `jin_user_bonus_log` VALUES (833, 1, 1, 1, 'order', NULL, 1648917025, 1648917025);
INSERT INTO `jin_user_bonus_log` VALUES (834, 1, 1, 1, 'order', NULL, 1648917048, 1648917048);
INSERT INTO `jin_user_bonus_log` VALUES (835, 1, 1, 1, 'order', NULL, 1648917068, 1648917068);
INSERT INTO `jin_user_bonus_log` VALUES (836, 1, 1, 1, 'order', NULL, 1648917084, 1648917084);
INSERT INTO `jin_user_bonus_log` VALUES (837, 1, 1, 1, 'order', NULL, 1648917105, 1648917105);
INSERT INTO `jin_user_bonus_log` VALUES (838, 1, 1, 1, 'order', NULL, 1648923135, 1648923135);
INSERT INTO `jin_user_bonus_log` VALUES (839, 1, 1, 1, 'order', NULL, 1648923149, 1648923149);
INSERT INTO `jin_user_bonus_log` VALUES (840, 1, 1, 1, 'order', NULL, 1648923163, 1648923163);
INSERT INTO `jin_user_bonus_log` VALUES (841, 1, 1, 1, 'order', NULL, 1648923176, 1648923176);
INSERT INTO `jin_user_bonus_log` VALUES (842, 1, 1, 1, 'order', NULL, 1648923201, 1648923201);
INSERT INTO `jin_user_bonus_log` VALUES (843, 1, 1, 1, 'order', NULL, 1648923214, 1648923214);
INSERT INTO `jin_user_bonus_log` VALUES (844, 1, 1, 1, 'order', NULL, 1648923258, 1648923258);
INSERT INTO `jin_user_bonus_log` VALUES (845, 1, 1, 1, 'order', NULL, 1648923270, 1648923270);
INSERT INTO `jin_user_bonus_log` VALUES (846, 1, 1, 1, 'order', NULL, 1648923280, 1648923280);
INSERT INTO `jin_user_bonus_log` VALUES (847, 1, 1, 1, 'order', NULL, 1648923378, 1648923378);
INSERT INTO `jin_user_bonus_log` VALUES (848, 1, 1, 1, 'order', NULL, 1648923390, 1648923390);
INSERT INTO `jin_user_bonus_log` VALUES (849, 1, 1, 1, 'order', NULL, 1648923401, 1648923401);
INSERT INTO `jin_user_bonus_log` VALUES (850, 1, 1, 1, 'order', NULL, 1648923413, 1648923413);
INSERT INTO `jin_user_bonus_log` VALUES (851, 1, 1, 1, 'order', NULL, 1648924636, 1648924636);
INSERT INTO `jin_user_bonus_log` VALUES (852, 1, 1, 1, 'order', NULL, 1648924734, 1648924734);
INSERT INTO `jin_user_bonus_log` VALUES (853, 1, 1, 1, 'order', NULL, 1648924895, 1648924895);
INSERT INTO `jin_user_bonus_log` VALUES (854, 1, 1, 1, 'order', NULL, 1648924934, 1648924934);
INSERT INTO `jin_user_bonus_log` VALUES (855, 1, 1, 1, 'order', NULL, 1648925008, 1648925008);
INSERT INTO `jin_user_bonus_log` VALUES (856, 1, 1, 1, 'order', NULL, 1648925053, 1648925053);
INSERT INTO `jin_user_bonus_log` VALUES (857, 1, 1, 1, 'order', NULL, 1648925069, 1648925069);
INSERT INTO `jin_user_bonus_log` VALUES (858, 1, 1, 1, 'order', NULL, 1648925098, 1648925098);
INSERT INTO `jin_user_bonus_log` VALUES (859, 1, 1, 1, 'order', NULL, 1648925218, 1648925218);
INSERT INTO `jin_user_bonus_log` VALUES (860, 1, 1, 1, 'order', NULL, 1648925322, 1648925322);
INSERT INTO `jin_user_bonus_log` VALUES (861, 1, 1, 1, 'order', NULL, 1648925335, 1648925335);
INSERT INTO `jin_user_bonus_log` VALUES (862, 1, 1, 1, 'order', NULL, 1648925576, 1648925576);
INSERT INTO `jin_user_bonus_log` VALUES (863, 1, 1, 1, 'order', NULL, 1648925594, 1648925594);
INSERT INTO `jin_user_bonus_log` VALUES (864, 1, 1, 1, 'order', NULL, 1648925607, 1648925607);
INSERT INTO `jin_user_bonus_log` VALUES (865, 1, 1, 1, 'order', NULL, 1648925668, 1648925668);
INSERT INTO `jin_user_bonus_log` VALUES (866, 1, 1, 1, 'order', NULL, 1648925738, 1648925738);
INSERT INTO `jin_user_bonus_log` VALUES (867, 1, 1, 1, 'order', NULL, 1648925761, 1648925761);
INSERT INTO `jin_user_bonus_log` VALUES (868, 1, 1, 1, 'order', NULL, 1648925779, 1648925779);
INSERT INTO `jin_user_bonus_log` VALUES (869, 1, 1, 1, 'order', NULL, 1648925899, 1648925899);
INSERT INTO `jin_user_bonus_log` VALUES (870, 1, 1, 1, 'order', NULL, 1648925932, 1648925932);
INSERT INTO `jin_user_bonus_log` VALUES (871, 1, 1, 1, 'order', NULL, 1648926043, 1648926043);
INSERT INTO `jin_user_bonus_log` VALUES (872, 1, 1, 1, 'order', NULL, 1648926066, 1648926066);
INSERT INTO `jin_user_bonus_log` VALUES (873, 1, 1, 1, 'order', NULL, 1648926080, 1648926080);
INSERT INTO `jin_user_bonus_log` VALUES (874, 1, 1, 1, 'order', NULL, 1648926150, 1648926150);
INSERT INTO `jin_user_bonus_log` VALUES (875, 1, 1, 1, 'order', NULL, 1648926163, 1648926163);
INSERT INTO `jin_user_bonus_log` VALUES (876, 1, 1, 1, 'order', NULL, 1648926178, 1648926178);
INSERT INTO `jin_user_bonus_log` VALUES (877, 1, 1, 1, 'order', NULL, 1648926203, 1648926203);
INSERT INTO `jin_user_bonus_log` VALUES (878, 1, 1, 1, 'order', NULL, 1648926215, 1648926215);
INSERT INTO `jin_user_bonus_log` VALUES (879, 1, 1, 1, 'order', NULL, 1648926228, 1648926228);
INSERT INTO `jin_user_bonus_log` VALUES (880, 1, 1, 1, 'order', NULL, 1648926263, 1648926263);
INSERT INTO `jin_user_bonus_log` VALUES (881, 1, 1, 1, 'order', NULL, 1648926276, 1648926276);
INSERT INTO `jin_user_bonus_log` VALUES (882, 1, 1, 1, 'order', NULL, 1648926292, 1648926292);
INSERT INTO `jin_user_bonus_log` VALUES (883, 1, 1, 1, 'order', NULL, 1648926305, 1648926305);
INSERT INTO `jin_user_bonus_log` VALUES (884, 1, 1, 1, 'order', NULL, 1648926336, 1648926336);
INSERT INTO `jin_user_bonus_log` VALUES (885, 1, 1, 1, 'order', NULL, 1648926349, 1648926349);
INSERT INTO `jin_user_bonus_log` VALUES (886, 1, -1, -10, 'admin_change', '测试', 1648949001, 1648949001);
INSERT INTO `jin_user_bonus_log` VALUES (887, 1, 1, 1, 'order', NULL, 1648957283, 1648957283);
INSERT INTO `jin_user_bonus_log` VALUES (888, 1, 1, 1, 'order', NULL, 1648957305, 1648957305);
INSERT INTO `jin_user_bonus_log` VALUES (889, 1, 1, 1, 'order', NULL, 1648957318, 1648957318);
INSERT INTO `jin_user_bonus_log` VALUES (890, 1, 1, 1, 'order', NULL, 1648957334, 1648957334);
INSERT INTO `jin_user_bonus_log` VALUES (891, 1, 1, 1, 'order', NULL, 1648957348, 1648957348);
INSERT INTO `jin_user_bonus_log` VALUES (892, 1, 1, 1, 'order', NULL, 1648957360, 1648957360);
INSERT INTO `jin_user_bonus_log` VALUES (893, 1, 1, 1, 'order', NULL, 1648957373, 1648957373);
INSERT INTO `jin_user_bonus_log` VALUES (894, 1, 1, 1, 'order', NULL, 1648957388, 1648957388);
INSERT INTO `jin_user_bonus_log` VALUES (895, 1, 1, 1, 'order', NULL, 1648957406, 1648957406);
INSERT INTO `jin_user_bonus_log` VALUES (896, 1, 1, 1, 'order', NULL, 1648957420, 1648957420);
INSERT INTO `jin_user_bonus_log` VALUES (897, 1, 1, 1, 'order', NULL, 1648957440, 1648957440);
INSERT INTO `jin_user_bonus_log` VALUES (898, 1, 1, 1, 'order', NULL, 1648957453, 1648957453);
INSERT INTO `jin_user_bonus_log` VALUES (899, 1, 1, 1, 'order', NULL, 1648957491, 1648957491);
INSERT INTO `jin_user_bonus_log` VALUES (900, 1, 1, 1, 'order', NULL, 1648957504, 1648957504);
INSERT INTO `jin_user_bonus_log` VALUES (901, 1, 1, 1, 'order', NULL, 1648957569, 1648957569);
INSERT INTO `jin_user_bonus_log` VALUES (902, 1, 1, 1, 'order', NULL, 1648957934, 1648957934);
INSERT INTO `jin_user_bonus_log` VALUES (903, 1, 1, 1, 'order', NULL, 1648957966, 1648957966);
INSERT INTO `jin_user_bonus_log` VALUES (904, 1, 1, 1, 'order', NULL, 1648959133, 1648959133);
INSERT INTO `jin_user_bonus_log` VALUES (905, 1, 1, 1, 'order', NULL, 1648959701, 1648959701);
INSERT INTO `jin_user_bonus_log` VALUES (906, 1, 1, 1, 'order', NULL, 1648959712, 1648959712);
INSERT INTO `jin_user_bonus_log` VALUES (907, 1, 1, 1, 'order', NULL, 1648959761, 1648959761);
INSERT INTO `jin_user_bonus_log` VALUES (908, 1, 1, 1, 'order', NULL, 1648959801, 1648959801);
INSERT INTO `jin_user_bonus_log` VALUES (909, 1, 1, 1, 'order', NULL, 1648961387, 1648961387);
INSERT INTO `jin_user_bonus_log` VALUES (910, 1, 1, 1, 'order', NULL, 1648961517, 1648961517);
INSERT INTO `jin_user_bonus_log` VALUES (911, 1, 1, 1, 'order', NULL, 1648975358, 1648975358);
INSERT INTO `jin_user_bonus_log` VALUES (912, 1, 1, 1, 'order', NULL, 1649133711, 1649133711);
INSERT INTO `jin_user_bonus_log` VALUES (913, 1, 1, 1, 'order', NULL, 1649133728, 1649133728);
INSERT INTO `jin_user_bonus_log` VALUES (914, 1, 1, 1, 'order', NULL, 1649133743, 1649133743);
INSERT INTO `jin_user_bonus_log` VALUES (915, 1, 1, 1, 'order', NULL, 1649133757, 1649133757);
INSERT INTO `jin_user_bonus_log` VALUES (916, 1, 1, 1, 'order', NULL, 1649133772, 1649133772);
INSERT INTO `jin_user_bonus_log` VALUES (917, 1, 1, 1, 'order', NULL, 1649162724, 1649162724);
INSERT INTO `jin_user_bonus_log` VALUES (918, 1, 1, 1, 'order', NULL, 1649162740, 1649162740);
INSERT INTO `jin_user_bonus_log` VALUES (919, 1, 1, 1, 'order', NULL, 1649162758, 1649162758);
INSERT INTO `jin_user_bonus_log` VALUES (920, 1, 1, 1, 'order', NULL, 1649162770, 1649162770);
INSERT INTO `jin_user_bonus_log` VALUES (921, 1, 1, 1, 'order', NULL, 1649162797, 1649162797);
INSERT INTO `jin_user_bonus_log` VALUES (922, 1, 1, 1, 'order', NULL, 1649162808, 1649162808);
INSERT INTO `jin_user_bonus_log` VALUES (923, 1, 1, 1, 'order', NULL, 1649162839, 1649162839);
INSERT INTO `jin_user_bonus_log` VALUES (924, 1, 1, 1, 'order', NULL, 1649162877, 1649162877);
INSERT INTO `jin_user_bonus_log` VALUES (925, 1, 1, 1, 'order', NULL, 1649162918, 1649162918);
INSERT INTO `jin_user_bonus_log` VALUES (926, 1, 1, 1, 'order', NULL, 1649573186, 1649573186);
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
INSERT INTO `jin_user_stored_log` VALUES (553, 1, -1, -0.10, 'order', NULL, 1648646355, 1648646355);
INSERT INTO `jin_user_stored_log` VALUES (554, 1, -1, -0.10, 'order', NULL, 1648646366, 1648646366);
INSERT INTO `jin_user_stored_log` VALUES (555, 1, -1, -0.10, 'order', NULL, 1648646398, 1648646398);
INSERT INTO `jin_user_stored_log` VALUES (556, 1, -1, -0.30, 'order', NULL, 1648646431, 1648646431);
INSERT INTO `jin_user_stored_log` VALUES (557, 1, 1, 20000.00, 'admin_change', '', 1648648650, 1648648650);
INSERT INTO `jin_user_stored_log` VALUES (558, 1, -1, -0.50, 'order', NULL, 1648648663, 1648648663);
INSERT INTO `jin_user_stored_log` VALUES (559, 1, 1, 1000.00, 'admin_change', '', 1648649213, 1648649213);
INSERT INTO `jin_user_stored_log` VALUES (560, 1, 1, 1000.00, 'admin_change', '', 1648649217, 1648649217);
INSERT INTO `jin_user_stored_log` VALUES (561, 1, 1, 1000.00, 'admin_change', '', 1648649220, 1648649220);
INSERT INTO `jin_user_stored_log` VALUES (562, 1, 1, 100000.00, 'admin_change', '', 1648654616, 1648654616);
INSERT INTO `jin_user_stored_log` VALUES (563, 1, -1, -5.90, 'order', NULL, 1648654634, 1648654634);
INSERT INTO `jin_user_stored_log` VALUES (564, 1, -1, -7.00, 'order', NULL, 1648654710, 1648654710);
INSERT INTO `jin_user_stored_log` VALUES (565, 1, -1, -7.00, 'order', NULL, 1648654762, 1648654762);
INSERT INTO `jin_user_stored_log` VALUES (566, 1, -1, -6.90, 'order', NULL, 1648655019, 1648655019);
INSERT INTO `jin_user_stored_log` VALUES (567, 1, -1, -7.00, 'order', NULL, 1648655122, 1648655122);
INSERT INTO `jin_user_stored_log` VALUES (568, 1, -1, -7.00, 'order', NULL, 1648655227, 1648655227);
INSERT INTO `jin_user_stored_log` VALUES (569, 1, -1, -7.00, 'order', NULL, 1648655340, 1648655340);
INSERT INTO `jin_user_stored_log` VALUES (570, 1, -1, -7.00, 'order', NULL, 1648655836, 1648655836);
INSERT INTO `jin_user_stored_log` VALUES (571, 1, -1, -7.00, 'order', NULL, 1648655983, 1648655983);
INSERT INTO `jin_user_stored_log` VALUES (572, 1, -1, -7.00, 'order', NULL, 1648656083, 1648656083);
INSERT INTO `jin_user_stored_log` VALUES (573, 1, -1, -7.00, 'order', NULL, 1648656315, 1648656315);
INSERT INTO `jin_user_stored_log` VALUES (574, 1, -1, -8.00, 'order', NULL, 1648657081, 1648657081);
INSERT INTO `jin_user_stored_log` VALUES (575, 1, -1, -0.50, 'order', NULL, 1648657501, 1648657501);
INSERT INTO `jin_user_stored_log` VALUES (576, 1, -1, -0.10, 'order', NULL, 1648659765, 1648659765);
INSERT INTO `jin_user_stored_log` VALUES (577, 1, -1, -0.10, 'order', NULL, 1648659767, 1648659767);
INSERT INTO `jin_user_stored_log` VALUES (578, 1, -1, -0.10, 'order', NULL, 1648659767, 1648659767);
INSERT INTO `jin_user_stored_log` VALUES (579, 1, -1, -0.10, 'order', NULL, 1648663056, 1648663056);
INSERT INTO `jin_user_stored_log` VALUES (580, 1, -1, -0.10, 'order', NULL, 1648663065, 1648663065);
INSERT INTO `jin_user_stored_log` VALUES (581, 1, -1, -0.30, 'order', NULL, 1648663069, 1648663069);
INSERT INTO `jin_user_stored_log` VALUES (582, 1, -1, -0.10, 'order', NULL, 1648663089, 1648663089);
INSERT INTO `jin_user_stored_log` VALUES (583, 1, -1, -0.30, 'order', NULL, 1648663096, 1648663096);
INSERT INTO `jin_user_stored_log` VALUES (584, 1, -1, -0.10, 'order', NULL, 1648663096, 1648663096);
INSERT INTO `jin_user_stored_log` VALUES (585, 1, -1, -0.50, 'order', NULL, 1648663390, 1648663390);
INSERT INTO `jin_user_stored_log` VALUES (586, 1, -1, -7.50, 'order', NULL, 1648663411, 1648663411);
INSERT INTO `jin_user_stored_log` VALUES (587, 1, -1, -8.00, 'order', NULL, 1648663425, 1648663425);
INSERT INTO `jin_user_stored_log` VALUES (588, 1, -1, -0.50, 'order', NULL, 1648663448, 1648663448);
INSERT INTO `jin_user_stored_log` VALUES (589, 1, -1, -0.50, 'order', NULL, 1648663454, 1648663454);
INSERT INTO `jin_user_stored_log` VALUES (590, 1, -1, -0.50, 'order', NULL, 1648663454, 1648663454);
INSERT INTO `jin_user_stored_log` VALUES (591, 1, -1, -0.50, 'order', NULL, 1648663459, 1648663459);
INSERT INTO `jin_user_stored_log` VALUES (592, 1, -1, -0.50, 'order', NULL, 1648663465, 1648663465);
INSERT INTO `jin_user_stored_log` VALUES (593, 1, -1, -0.50, 'order', NULL, 1648663470, 1648663470);
INSERT INTO `jin_user_stored_log` VALUES (594, 1, -1, -0.50, 'order', NULL, 1648663477, 1648663477);
INSERT INTO `jin_user_stored_log` VALUES (595, 1, -1, -0.50, 'order', NULL, 1648663516, 1648663516);
INSERT INTO `jin_user_stored_log` VALUES (596, 1, -1, -4.00, 'order', NULL, 1648663534, 1648663534);
INSERT INTO `jin_user_stored_log` VALUES (597, 1, -1, -8.00, 'order', NULL, 1648663658, 1648663658);
INSERT INTO `jin_user_stored_log` VALUES (598, 1, -1, -0.50, 'order', NULL, 1648663680, 1648663680);
INSERT INTO `jin_user_stored_log` VALUES (599, 1, -1, -0.10, 'order', NULL, 1648663682, 1648663682);
INSERT INTO `jin_user_stored_log` VALUES (600, 1, -1, -0.50, 'order', NULL, 1648663685, 1648663685);
INSERT INTO `jin_user_stored_log` VALUES (601, 1, -1, -0.50, 'order', NULL, 1648663691, 1648663691);
INSERT INTO `jin_user_stored_log` VALUES (602, 1, -1, -0.50, 'order', NULL, 1648663696, 1648663696);
INSERT INTO `jin_user_stored_log` VALUES (603, 1, -1, -0.10, 'order', NULL, 1648663697, 1648663697);
INSERT INTO `jin_user_stored_log` VALUES (604, 1, -1, -0.50, 'order', NULL, 1648663703, 1648663703);
INSERT INTO `jin_user_stored_log` VALUES (605, 1, -1, -0.50, 'order', NULL, 1648663709, 1648663709);
INSERT INTO `jin_user_stored_log` VALUES (606, 1, -1, -0.50, 'order', NULL, 1648663718, 1648663718);
INSERT INTO `jin_user_stored_log` VALUES (607, 1, -1, -0.50, 'order', NULL, 1648663724, 1648663724);
INSERT INTO `jin_user_stored_log` VALUES (608, 1, -1, -0.50, 'order', NULL, 1648663729, 1648663729);
INSERT INTO `jin_user_stored_log` VALUES (609, 1, -1, -3.30, 'order', NULL, 1648663734, 1648663734);
INSERT INTO `jin_user_stored_log` VALUES (610, 1, -1, -0.50, 'order', NULL, 1648693848, 1648693848);
INSERT INTO `jin_user_stored_log` VALUES (611, 1, -1, -8.00, 'order', NULL, 1648696187, 1648696187);
INSERT INTO `jin_user_stored_log` VALUES (612, 1, -1, -0.30, 'order', NULL, 1648697000, 1648697000);
INSERT INTO `jin_user_stored_log` VALUES (613, 1, -1, -7.70, 'order', NULL, 1648697053, 1648697053);
INSERT INTO `jin_user_stored_log` VALUES (614, 1, 1, 50000.00, 'admin_change', '', 1648736236, 1648736236);
INSERT INTO `jin_user_stored_log` VALUES (615, 1, 1, 50000.00, 'admin_change', '', 1648736243, 1648736243);
INSERT INTO `jin_user_stored_log` VALUES (616, 1, 1, 50000.00, 'admin_change', '', 1648736246, 1648736246);
INSERT INTO `jin_user_stored_log` VALUES (617, 1, 1, 50000.00, 'admin_change', '', 1648736249, 1648736249);
INSERT INTO `jin_user_stored_log` VALUES (618, 1, 1, 50000.00, 'admin_change', '', 1648736251, 1648736251);
INSERT INTO `jin_user_stored_log` VALUES (619, 1, -1, -0.10, 'order', NULL, 1648736303, 1648736303);
INSERT INTO `jin_user_stored_log` VALUES (620, 1, -1, -0.10, 'order', NULL, 1648736305, 1648736305);
INSERT INTO `jin_user_stored_log` VALUES (621, 1, -1, -0.10, 'order', NULL, 1648736306, 1648736306);
INSERT INTO `jin_user_stored_log` VALUES (622, 1, -1, -0.10, 'order', NULL, 1648736309, 1648736309);
INSERT INTO `jin_user_stored_log` VALUES (623, 1, -1, -0.10, 'order', NULL, 1648736314, 1648736314);
INSERT INTO `jin_user_stored_log` VALUES (624, 1, -1, -0.30, 'order', NULL, 1648736471, 1648736471);
INSERT INTO `jin_user_stored_log` VALUES (625, 1, -1, -0.20, 'order', NULL, 1648736492, 1648736492);
INSERT INTO `jin_user_stored_log` VALUES (626, 1, -1, -0.50, 'order', NULL, 1648736648, 1648736648);
INSERT INTO `jin_user_stored_log` VALUES (627, 1, -1, -0.30, 'order', NULL, 1648736737, 1648736737);
INSERT INTO `jin_user_stored_log` VALUES (628, 1, -1, -0.10, 'order', NULL, 1648736738, 1648736738);
INSERT INTO `jin_user_stored_log` VALUES (629, 1, -1, -0.30, 'order', NULL, 1648736762, 1648736762);
INSERT INTO `jin_user_stored_log` VALUES (630, 1, -1, -0.10, 'order', NULL, 1648736763, 1648736763);
INSERT INTO `jin_user_stored_log` VALUES (631, 1, -1, -0.10, 'order', NULL, 1648736764, 1648736764);
INSERT INTO `jin_user_stored_log` VALUES (632, 1, -1, -0.30, 'order', NULL, 1648736854, 1648736854);
INSERT INTO `jin_user_stored_log` VALUES (633, 1, -1, -0.50, 'order', NULL, 1648736855, 1648736855);
INSERT INTO `jin_user_stored_log` VALUES (634, 1, -1, -0.50, 'order', NULL, 1648736857, 1648736857);
INSERT INTO `jin_user_stored_log` VALUES (635, 1, -1, -0.50, 'order', NULL, 1648736876, 1648736876);
INSERT INTO `jin_user_stored_log` VALUES (636, 1, -1, -0.30, 'order', NULL, 1648736880, 1648736880);
INSERT INTO `jin_user_stored_log` VALUES (637, 1, -1, -0.30, 'order', NULL, 1648778115, 1648778115);
INSERT INTO `jin_user_stored_log` VALUES (638, 1, -1, -0.30, 'order', NULL, 1648778725, 1648778725);
INSERT INTO `jin_user_stored_log` VALUES (639, 1, -1, -0.10, 'order', NULL, 1648802892, 1648802892);
INSERT INTO `jin_user_stored_log` VALUES (640, 1, -1, -0.10, 'order', NULL, 1648819415, 1648819415);
INSERT INTO `jin_user_stored_log` VALUES (641, 1, -1, -0.10, 'order', NULL, 1648819813, 1648819813);
INSERT INTO `jin_user_stored_log` VALUES (642, 1, -1, -0.10, 'order', NULL, 1648819814, 1648819814);
INSERT INTO `jin_user_stored_log` VALUES (643, 1, -1, -0.10, 'order', NULL, 1648819871, 1648819871);
INSERT INTO `jin_user_stored_log` VALUES (644, 1, -1, -0.10, 'order', NULL, 1648819872, 1648819872);
INSERT INTO `jin_user_stored_log` VALUES (645, 1, -1, -0.10, 'order', NULL, 1648819911, 1648819911);
INSERT INTO `jin_user_stored_log` VALUES (646, 1, -1, -0.10, 'order', NULL, 1648819913, 1648819913);
INSERT INTO `jin_user_stored_log` VALUES (647, 1, 1, 100000.00, 'admin_change', '', 1648866080, 1648866080);
INSERT INTO `jin_user_stored_log` VALUES (648, 1, -1, -0.40, 'order', NULL, 1648866091, 1648866091);
INSERT INTO `jin_user_stored_log` VALUES (649, 1, -1, -0.50, 'order', NULL, 1648867594, 1648867594);
INSERT INTO `jin_user_stored_log` VALUES (650, 1, -1, -0.50, 'order', NULL, 1648867669, 1648867669);
INSERT INTO `jin_user_stored_log` VALUES (651, 1, -1, -7.00, 'order', NULL, 1648877826, 1648877826);
INSERT INTO `jin_user_stored_log` VALUES (652, 1, -1, -7.00, 'order', NULL, 1648877920, 1648877920);
INSERT INTO `jin_user_stored_log` VALUES (653, 1, -1, -7.00, 'order', NULL, 1648878341, 1648878341);
INSERT INTO `jin_user_stored_log` VALUES (654, 1, -1, -7.00, 'order', NULL, 1648878492, 1648878492);
INSERT INTO `jin_user_stored_log` VALUES (655, 1, -1, -7.00, 'order', NULL, 1648879043, 1648879043);
INSERT INTO `jin_user_stored_log` VALUES (656, 1, -1, -0.50, 'order', NULL, 1648879209, 1648879209);
INSERT INTO `jin_user_stored_log` VALUES (657, 1, -1, -0.50, 'order', NULL, 1648879224, 1648879224);
INSERT INTO `jin_user_stored_log` VALUES (658, 1, -1, -0.50, 'order', NULL, 1648879235, 1648879235);
INSERT INTO `jin_user_stored_log` VALUES (659, 1, -1, -0.50, 'order', NULL, 1648879249, 1648879249);
INSERT INTO `jin_user_stored_log` VALUES (660, 1, -1, -0.50, 'order', NULL, 1648879299, 1648879299);
INSERT INTO `jin_user_stored_log` VALUES (661, 1, -1, -0.50, 'order', NULL, 1648879322, 1648879322);
INSERT INTO `jin_user_stored_log` VALUES (662, 1, -1, -0.50, 'order', NULL, 1648879341, 1648879341);
INSERT INTO `jin_user_stored_log` VALUES (663, 1, -1, -0.50, 'order', NULL, 1648879692, 1648879692);
INSERT INTO `jin_user_stored_log` VALUES (664, 1, -1, -0.50, 'order', NULL, 1648879827, 1648879827);
INSERT INTO `jin_user_stored_log` VALUES (665, 1, -1, -0.50, 'order', NULL, 1648879980, 1648879980);
INSERT INTO `jin_user_stored_log` VALUES (666, 1, -1, -0.50, 'order', NULL, 1648887980, 1648887980);
INSERT INTO `jin_user_stored_log` VALUES (667, 1, -1, -0.50, 'order', NULL, 1648888017, 1648888017);
INSERT INTO `jin_user_stored_log` VALUES (668, 1, -1, -0.50, 'order', NULL, 1648888064, 1648888064);
INSERT INTO `jin_user_stored_log` VALUES (669, 1, -1, -0.50, 'order', NULL, 1648891133, 1648891133);
INSERT INTO `jin_user_stored_log` VALUES (670, 1, -1, -0.50, 'order', NULL, 1648891151, 1648891151);
INSERT INTO `jin_user_stored_log` VALUES (671, 1, -1, -0.50, 'order', NULL, 1648891179, 1648891179);
INSERT INTO `jin_user_stored_log` VALUES (672, 1, -1, -0.50, 'order', NULL, 1648891247, 1648891247);
INSERT INTO `jin_user_stored_log` VALUES (673, 1, -1, -0.10, 'order', NULL, 1648891377, 1648891377);
INSERT INTO `jin_user_stored_log` VALUES (674, 1, -1, -0.10, 'order', NULL, 1648891390, 1648891390);
INSERT INTO `jin_user_stored_log` VALUES (675, 1, -1, -0.10, 'order', NULL, 1648891430, 1648891430);
INSERT INTO `jin_user_stored_log` VALUES (676, 1, -1, -0.10, 'order', NULL, 1648891468, 1648891468);
INSERT INTO `jin_user_stored_log` VALUES (677, 1, -1, -0.10, 'order', NULL, 1648891614, 1648891614);
INSERT INTO `jin_user_stored_log` VALUES (678, 1, -1, -0.10, 'order', NULL, 1648891687, 1648891687);
INSERT INTO `jin_user_stored_log` VALUES (679, 1, -1, -0.10, 'order', NULL, 1648891918, 1648891918);
INSERT INTO `jin_user_stored_log` VALUES (680, 1, -1, -0.10, 'order', NULL, 1648891948, 1648891948);
INSERT INTO `jin_user_stored_log` VALUES (681, 1, -1, -0.10, 'order', NULL, 1648892096, 1648892096);
INSERT INTO `jin_user_stored_log` VALUES (682, 1, -1, -0.10, 'order', NULL, 1648892183, 1648892183);
INSERT INTO `jin_user_stored_log` VALUES (683, 1, -1, -0.10, 'order', NULL, 1648892227, 1648892227);
INSERT INTO `jin_user_stored_log` VALUES (684, 1, -1, -0.10, 'order', NULL, 1648892238, 1648892238);
INSERT INTO `jin_user_stored_log` VALUES (685, 1, -1, -0.10, 'order', NULL, 1648892254, 1648892254);
INSERT INTO `jin_user_stored_log` VALUES (686, 1, -1, -0.10, 'order', NULL, 1648892574, 1648892574);
INSERT INTO `jin_user_stored_log` VALUES (687, 1, -1, -0.10, 'order', NULL, 1648892590, 1648892590);
INSERT INTO `jin_user_stored_log` VALUES (688, 1, -1, -0.10, 'order', NULL, 1648892604, 1648892604);
INSERT INTO `jin_user_stored_log` VALUES (689, 1, -1, -0.10, 'order', NULL, 1648892630, 1648892630);
INSERT INTO `jin_user_stored_log` VALUES (690, 1, -1, -0.10, 'order', NULL, 1648892695, 1648892695);
INSERT INTO `jin_user_stored_log` VALUES (691, 1, -1, -0.10, 'order', NULL, 1648892773, 1648892773);
INSERT INTO `jin_user_stored_log` VALUES (692, 1, -1, -0.10, 'order', NULL, 1648893074, 1648893074);
INSERT INTO `jin_user_stored_log` VALUES (693, 1, -1, -0.10, 'order', NULL, 1648893082, 1648893082);
INSERT INTO `jin_user_stored_log` VALUES (694, 1, -1, -0.10, 'order', NULL, 1648893090, 1648893090);
INSERT INTO `jin_user_stored_log` VALUES (695, 1, -1, -0.10, 'order', NULL, 1648893132, 1648893132);
INSERT INTO `jin_user_stored_log` VALUES (696, 1, -1, -0.10, 'order', NULL, 1648893143, 1648893143);
INSERT INTO `jin_user_stored_log` VALUES (697, 1, -1, -0.10, 'order', NULL, 1648893170, 1648893170);
INSERT INTO `jin_user_stored_log` VALUES (698, 1, -1, -0.10, 'order', NULL, 1648893271, 1648893271);
INSERT INTO `jin_user_stored_log` VALUES (699, 1, -1, -0.10, 'order', NULL, 1648893284, 1648893284);
INSERT INTO `jin_user_stored_log` VALUES (700, 1, -1, -0.10, 'order', NULL, 1648893300, 1648893300);
INSERT INTO `jin_user_stored_log` VALUES (701, 1, -1, -0.10, 'order', NULL, 1648893805, 1648893805);
INSERT INTO `jin_user_stored_log` VALUES (702, 1, -1, -0.10, 'order', NULL, 1648893825, 1648893825);
INSERT INTO `jin_user_stored_log` VALUES (703, 1, -1, -0.10, 'order', NULL, 1648893864, 1648893864);
INSERT INTO `jin_user_stored_log` VALUES (704, 1, -1, -0.10, 'order', NULL, 1648893908, 1648893908);
INSERT INTO `jin_user_stored_log` VALUES (705, 1, -1, -0.10, 'order', NULL, 1648894152, 1648894152);
INSERT INTO `jin_user_stored_log` VALUES (706, 1, -1, -0.10, 'order', NULL, 1648894183, 1648894183);
INSERT INTO `jin_user_stored_log` VALUES (707, 1, -1, -0.10, 'order', NULL, 1648894209, 1648894209);
INSERT INTO `jin_user_stored_log` VALUES (708, 1, -1, -0.10, 'order', NULL, 1648904856, 1648904856);
INSERT INTO `jin_user_stored_log` VALUES (709, 1, -1, -0.10, 'order', NULL, 1648904892, 1648904892);
INSERT INTO `jin_user_stored_log` VALUES (710, 1, -1, -0.10, 'order', NULL, 1648912594, 1648912594);
INSERT INTO `jin_user_stored_log` VALUES (711, 1, -1, -0.10, 'order', NULL, 1648912695, 1648912695);
INSERT INTO `jin_user_stored_log` VALUES (712, 1, -1, -0.10, 'order', NULL, 1648912709, 1648912709);
INSERT INTO `jin_user_stored_log` VALUES (713, 1, -1, -0.10, 'order', NULL, 1648912796, 1648912796);
INSERT INTO `jin_user_stored_log` VALUES (714, 1, -1, -0.10, 'order', NULL, 1648912822, 1648912822);
INSERT INTO `jin_user_stored_log` VALUES (715, 1, -1, -0.10, 'order', NULL, 1648912846, 1648912846);
INSERT INTO `jin_user_stored_log` VALUES (716, 1, -1, -0.10, 'order', NULL, 1648912872, 1648912872);
INSERT INTO `jin_user_stored_log` VALUES (717, 1, -1, -0.10, 'order', NULL, 1648912928, 1648912928);
INSERT INTO `jin_user_stored_log` VALUES (718, 1, -1, -0.10, 'order', NULL, 1648913094, 1648913094);
INSERT INTO `jin_user_stored_log` VALUES (719, 1, -1, -0.10, 'order', NULL, 1648913115, 1648913115);
INSERT INTO `jin_user_stored_log` VALUES (720, 1, -1, -0.10, 'order', NULL, 1648913134, 1648913134);
INSERT INTO `jin_user_stored_log` VALUES (721, 1, -1, -0.10, 'order', NULL, 1648913233, 1648913233);
INSERT INTO `jin_user_stored_log` VALUES (722, 1, -1, -0.10, 'order', NULL, 1648913246, 1648913246);
INSERT INTO `jin_user_stored_log` VALUES (723, 1, -1, -0.10, 'order', NULL, 1648913262, 1648913262);
INSERT INTO `jin_user_stored_log` VALUES (724, 1, -1, -0.10, 'order', NULL, 1648913276, 1648913276);
INSERT INTO `jin_user_stored_log` VALUES (725, 1, -1, -0.10, 'order', NULL, 1648913299, 1648913299);
INSERT INTO `jin_user_stored_log` VALUES (726, 1, -1, -0.10, 'order', NULL, 1648913340, 1648913340);
INSERT INTO `jin_user_stored_log` VALUES (727, 1, -1, -0.10, 'order', NULL, 1648913570, 1648913570);
INSERT INTO `jin_user_stored_log` VALUES (728, 1, -1, -0.10, 'order', NULL, 1648913582, 1648913582);
INSERT INTO `jin_user_stored_log` VALUES (729, 1, -1, -0.10, 'order', NULL, 1648913596, 1648913596);
INSERT INTO `jin_user_stored_log` VALUES (730, 1, -1, -0.10, 'order', NULL, 1648913607, 1648913607);
INSERT INTO `jin_user_stored_log` VALUES (731, 1, -1, -0.10, 'order', NULL, 1648916133, 1648916133);
INSERT INTO `jin_user_stored_log` VALUES (732, 1, -1, -0.10, 'order', NULL, 1648916231, 1648916231);
INSERT INTO `jin_user_stored_log` VALUES (733, 1, -1, -0.10, 'order', NULL, 1648916260, 1648916260);
INSERT INTO `jin_user_stored_log` VALUES (734, 1, -1, -0.10, 'order', NULL, 1648917025, 1648917025);
INSERT INTO `jin_user_stored_log` VALUES (735, 1, -1, -0.10, 'order', NULL, 1648917048, 1648917048);
INSERT INTO `jin_user_stored_log` VALUES (736, 1, -1, -0.10, 'order', NULL, 1648917068, 1648917068);
INSERT INTO `jin_user_stored_log` VALUES (737, 1, -1, -0.10, 'order', NULL, 1648917084, 1648917084);
INSERT INTO `jin_user_stored_log` VALUES (738, 1, -1, -0.10, 'order', NULL, 1648917105, 1648917105);
INSERT INTO `jin_user_stored_log` VALUES (739, 1, -1, -0.10, 'order', NULL, 1648923135, 1648923135);
INSERT INTO `jin_user_stored_log` VALUES (740, 1, -1, -0.10, 'order', NULL, 1648923149, 1648923149);
INSERT INTO `jin_user_stored_log` VALUES (741, 1, -1, -0.10, 'order', NULL, 1648923163, 1648923163);
INSERT INTO `jin_user_stored_log` VALUES (742, 1, -1, -0.10, 'order', NULL, 1648923176, 1648923176);
INSERT INTO `jin_user_stored_log` VALUES (743, 1, -1, -0.10, 'order', NULL, 1648923201, 1648923201);
INSERT INTO `jin_user_stored_log` VALUES (744, 1, -1, -0.10, 'order', NULL, 1648923214, 1648923214);
INSERT INTO `jin_user_stored_log` VALUES (745, 1, -1, -0.10, 'order', NULL, 1648923258, 1648923258);
INSERT INTO `jin_user_stored_log` VALUES (746, 1, -1, -0.10, 'order', NULL, 1648923270, 1648923270);
INSERT INTO `jin_user_stored_log` VALUES (747, 1, -1, -0.10, 'order', NULL, 1648923280, 1648923280);
INSERT INTO `jin_user_stored_log` VALUES (748, 1, -1, -0.10, 'order', NULL, 1648923378, 1648923378);
INSERT INTO `jin_user_stored_log` VALUES (749, 1, -1, -0.10, 'order', NULL, 1648923390, 1648923390);
INSERT INTO `jin_user_stored_log` VALUES (750, 1, -1, -0.10, 'order', NULL, 1648923401, 1648923401);
INSERT INTO `jin_user_stored_log` VALUES (751, 1, -1, -0.10, 'order', NULL, 1648923413, 1648923413);
INSERT INTO `jin_user_stored_log` VALUES (752, 1, -1, -0.10, 'order', NULL, 1648924636, 1648924636);
INSERT INTO `jin_user_stored_log` VALUES (753, 1, -1, -0.10, 'order', NULL, 1648924734, 1648924734);
INSERT INTO `jin_user_stored_log` VALUES (754, 1, -1, -0.10, 'order', NULL, 1648924895, 1648924895);
INSERT INTO `jin_user_stored_log` VALUES (755, 1, -1, -0.10, 'order', NULL, 1648924934, 1648924934);
INSERT INTO `jin_user_stored_log` VALUES (756, 1, -1, -0.10, 'order', NULL, 1648925008, 1648925008);
INSERT INTO `jin_user_stored_log` VALUES (757, 1, -1, -0.10, 'order', NULL, 1648925053, 1648925053);
INSERT INTO `jin_user_stored_log` VALUES (758, 1, -1, -0.10, 'order', NULL, 1648925069, 1648925069);
INSERT INTO `jin_user_stored_log` VALUES (759, 1, -1, -0.10, 'order', NULL, 1648925097, 1648925097);
INSERT INTO `jin_user_stored_log` VALUES (760, 1, -1, -0.10, 'order', NULL, 1648925218, 1648925218);
INSERT INTO `jin_user_stored_log` VALUES (761, 1, -1, -0.10, 'order', NULL, 1648925322, 1648925322);
INSERT INTO `jin_user_stored_log` VALUES (762, 1, -1, -0.10, 'order', NULL, 1648925335, 1648925335);
INSERT INTO `jin_user_stored_log` VALUES (763, 1, -1, -0.10, 'order', NULL, 1648925575, 1648925575);
INSERT INTO `jin_user_stored_log` VALUES (764, 1, -1, -0.10, 'order', NULL, 1648925594, 1648925594);
INSERT INTO `jin_user_stored_log` VALUES (765, 1, -1, -0.10, 'order', NULL, 1648925607, 1648925607);
INSERT INTO `jin_user_stored_log` VALUES (766, 1, -1, -0.10, 'order', NULL, 1648925668, 1648925668);
INSERT INTO `jin_user_stored_log` VALUES (767, 1, -1, -0.10, 'order', NULL, 1648925738, 1648925738);
INSERT INTO `jin_user_stored_log` VALUES (768, 1, -1, -0.10, 'order', NULL, 1648925761, 1648925761);
INSERT INTO `jin_user_stored_log` VALUES (769, 1, -1, -0.10, 'order', NULL, 1648925779, 1648925779);
INSERT INTO `jin_user_stored_log` VALUES (770, 1, -1, -0.10, 'order', NULL, 1648925898, 1648925898);
INSERT INTO `jin_user_stored_log` VALUES (771, 1, -1, -0.80, 'order', NULL, 1648925932, 1648925932);
INSERT INTO `jin_user_stored_log` VALUES (772, 1, -1, -0.10, 'order', NULL, 1648926043, 1648926043);
INSERT INTO `jin_user_stored_log` VALUES (773, 1, -1, -0.10, 'order', NULL, 1648926066, 1648926066);
INSERT INTO `jin_user_stored_log` VALUES (774, 1, -1, -0.10, 'order', NULL, 1648926080, 1648926080);
INSERT INTO `jin_user_stored_log` VALUES (775, 1, -1, -0.10, 'order', NULL, 1648926150, 1648926150);
INSERT INTO `jin_user_stored_log` VALUES (776, 1, -1, -0.10, 'order', NULL, 1648926163, 1648926163);
INSERT INTO `jin_user_stored_log` VALUES (777, 1, -1, -0.10, 'order', NULL, 1648926177, 1648926177);
INSERT INTO `jin_user_stored_log` VALUES (778, 1, -1, -0.10, 'order', NULL, 1648926203, 1648926203);
INSERT INTO `jin_user_stored_log` VALUES (779, 1, -1, -0.10, 'order', NULL, 1648926215, 1648926215);
INSERT INTO `jin_user_stored_log` VALUES (780, 1, -1, -0.10, 'order', NULL, 1648926228, 1648926228);
INSERT INTO `jin_user_stored_log` VALUES (781, 1, -1, -0.10, 'order', NULL, 1648926263, 1648926263);
INSERT INTO `jin_user_stored_log` VALUES (782, 1, -1, -0.10, 'order', NULL, 1648926276, 1648926276);
INSERT INTO `jin_user_stored_log` VALUES (783, 1, -1, -0.10, 'order', NULL, 1648926292, 1648926292);
INSERT INTO `jin_user_stored_log` VALUES (784, 1, -1, -0.30, 'order', NULL, 1648926305, 1648926305);
INSERT INTO `jin_user_stored_log` VALUES (785, 1, -1, -0.10, 'order', NULL, 1648926336, 1648926336);
INSERT INTO `jin_user_stored_log` VALUES (786, 1, -1, -0.10, 'order', NULL, 1648926349, 1648926349);
INSERT INTO `jin_user_stored_log` VALUES (787, 1, -1, -0.10, 'order', NULL, 1648957283, 1648957283);
INSERT INTO `jin_user_stored_log` VALUES (788, 1, -1, -0.10, 'order', NULL, 1648957305, 1648957305);
INSERT INTO `jin_user_stored_log` VALUES (789, 1, -1, -0.10, 'order', NULL, 1648957317, 1648957317);
INSERT INTO `jin_user_stored_log` VALUES (790, 1, -1, -0.10, 'order', NULL, 1648957334, 1648957334);
INSERT INTO `jin_user_stored_log` VALUES (791, 1, -1, -0.10, 'order', NULL, 1648957348, 1648957348);
INSERT INTO `jin_user_stored_log` VALUES (792, 1, -1, -0.10, 'order', NULL, 1648957360, 1648957360);
INSERT INTO `jin_user_stored_log` VALUES (793, 1, -1, -0.10, 'order', NULL, 1648957373, 1648957373);
INSERT INTO `jin_user_stored_log` VALUES (794, 1, -1, -0.10, 'order', NULL, 1648957388, 1648957388);
INSERT INTO `jin_user_stored_log` VALUES (795, 1, -1, -0.10, 'order', NULL, 1648957406, 1648957406);
INSERT INTO `jin_user_stored_log` VALUES (796, 1, -1, -0.10, 'order', NULL, 1648957420, 1648957420);
INSERT INTO `jin_user_stored_log` VALUES (797, 1, -1, -0.10, 'order', NULL, 1648957440, 1648957440);
INSERT INTO `jin_user_stored_log` VALUES (798, 1, -1, -0.10, 'order', NULL, 1648957453, 1648957453);
INSERT INTO `jin_user_stored_log` VALUES (799, 1, -1, -0.10, 'order', NULL, 1648957491, 1648957491);
INSERT INTO `jin_user_stored_log` VALUES (800, 1, -1, -0.10, 'order', NULL, 1648957504, 1648957504);
INSERT INTO `jin_user_stored_log` VALUES (801, 1, -1, -0.10, 'order', NULL, 1648959701, 1648959701);
INSERT INTO `jin_user_stored_log` VALUES (802, 1, -1, -0.10, 'order', NULL, 1648959712, 1648959712);
INSERT INTO `jin_user_stored_log` VALUES (803, 1, -1, -0.10, 'order', NULL, 1648959761, 1648959761);
INSERT INTO `jin_user_stored_log` VALUES (804, 1, -1, -0.30, 'order', NULL, 1648959801, 1648959801);
INSERT INTO `jin_user_stored_log` VALUES (805, 1, -1, -0.10, 'order', NULL, 1648961387, 1648961387);
INSERT INTO `jin_user_stored_log` VALUES (806, 1, -1, -0.10, 'order', NULL, 1648961517, 1648961517);
INSERT INTO `jin_user_stored_log` VALUES (807, 1, -1, -0.10, 'order', NULL, 1649133711, 1649133711);
INSERT INTO `jin_user_stored_log` VALUES (809, 1, -1, -0.10, 'order', NULL, 1649133743, 1649133743);
INSERT INTO `jin_user_stored_log` VALUES (810, 1, -1, -0.10, 'order', NULL, 1649133757, 1649133757);
INSERT INTO `jin_user_stored_log` VALUES (811, 1, -1, -0.10, 'order', NULL, 1649133772, 1649133772);
INSERT INTO `jin_user_stored_log` VALUES (812, 1, -1, -0.10, 'order', NULL, 1649162724, 1649162724);
INSERT INTO `jin_user_stored_log` VALUES (813, 1, -1, -0.10, 'order', NULL, 1649162740, 1649162740);
INSERT INTO `jin_user_stored_log` VALUES (814, 1, -1, -0.10, 'order', NULL, 1649162757, 1649162757);
INSERT INTO `jin_user_stored_log` VALUES (815, 1, -1, -0.10, 'order', NULL, 1649162770, 1649162770);
INSERT INTO `jin_user_stored_log` VALUES (816, 1, -1, -0.10, 'order', NULL, 1649162796, 1649162796);
INSERT INTO `jin_user_stored_log` VALUES (817, 1, -1, -0.10, 'order', NULL, 1649162808, 1649162808);
INSERT INTO `jin_user_stored_log` VALUES (818, 1, -1, -0.50, 'order', NULL, 1649162839, 1649162839);
INSERT INTO `jin_user_stored_log` VALUES (819, 1, -1, -0.50, 'order', NULL, 1649162877, 1649162877);
INSERT INTO `jin_user_stored_log` VALUES (820, 1, -1, -0.50, 'order', NULL, 1649162918, 1649162918);
INSERT INTO `jin_user_stored_log` VALUES (821, 1, -1, -0.10, 'order', NULL, 1649573186, 1649573186);
INSERT INTO `jin_user_stored_log` VALUES (822, 1, -1, -100.00, 'order', '20220528063525', 1653719727, 1653719727);
INSERT INTO `jin_user_stored_log` VALUES (824, 1, -1, -100.00, 'order', '20220528082010', 1653726011, 1653726011);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
