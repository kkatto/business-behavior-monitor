/*
 Navicat Premium Data Transfer

 Source Server         : 192.168.10.129
 Source Server Type    : MySQL
 Source Server Version : 80032
 Source Host           : 192.168.10.129:13306
 Source Schema         : business-behavior-monitor

 Target Server Type    : MySQL
 Target Server Version : 80032
 File Encoding         : 65001

 Date: 28/09/2024 11:10:30
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for monitor_data
-- ----------------------------
DROP TABLE IF EXISTS `monitor_data`;
CREATE TABLE `monitor_data`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `monitor_id` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '监控ID',
  `monitor_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '监控名称',
  `monitor_node_id` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '节点ID',
  `system_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '系统名称',
  `clazz_name` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '类的名称',
  `method_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '方法名称',
  `attribute_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '属性名称',
  `attribute_field` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '属性字段',
  `attribute_value` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '属性的值',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 151 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '监控数据' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of monitor_data
-- ----------------------------
INSERT INTO `monitor_data` VALUES (1, '129009', '测试监控流程', '1001', 'big-market', 'com.kou.monitor.test.ApiTest', 'test_log', '用户ID', 'userId', '10001', '2024-05-24 15:13:30', '2024-05-29 11:16:02');
INSERT INTO `monitor_data` VALUES (2, '129009', '测试监控流程', '1001', 'big-market', 'com.kou.monitor.test.ApiTest', 'test_log', '订单ID', 'orderId', '109099893222', '2024-05-24 15:13:33', '2024-05-29 11:16:02');
INSERT INTO `monitor_data` VALUES (3, '129009', '测试监控流程', '1001', 'big-market', 'com.kou.monitor.test.ApiTest', 'test_log_00', '用户ID', 'userId', '10001', '2024-05-28 15:09:18', '2024-05-29 11:16:03');
INSERT INTO `monitor_data` VALUES (4, '129009', '测试监控流程', '1001', 'big-market', 'com.kou.monitor.test.ApiTest', 'test_log_00', '订单ID', 'orderId', '109099893222', '2024-05-28 15:09:18', '2024-05-29 11:16:04');
INSERT INTO `monitor_data` VALUES (5, '129009', '测试监控流程', '1003', 'big-market', 'com.kou.monitor.test.ApiTest', 'test_log_02', '用户ID', 'userId', '10001', '2024-05-28 15:16:06', '2024-05-29 11:16:04');
INSERT INTO `monitor_data` VALUES (6, '129009', '测试监控流程', '1003', 'big-market', 'com.kou.monitor.test.ApiTest', 'test_log_02', '用户ID', 'userId', '10001', '2024-05-28 15:16:48', '2024-05-29 11:16:06');
INSERT INTO `monitor_data` VALUES (7, '129009', '测试监控流程', '1004', 'big-market', 'com.kou.monitor.test.ApiTest', 'test_log_03', '用户ID', 'userId', '10001', '2024-05-28 15:17:06', '2024-05-29 11:16:07');
INSERT INTO `monitor_data` VALUES (8, '129009', '测试监控流程', '1002', 'big-market', 'com.kou.monitor.test.ApiTest', 'test_log_01', '用户ID', 'userId', '10001', '2024-05-28 15:18:04', '2024-05-29 11:16:07');
INSERT INTO `monitor_data` VALUES (9, '129101', '大营销抽奖流程', '1001', 'big-market', 'com.kou.trigger.http.RaffleActivityController', 'draw', '用户ID', 'userId', 'xiaokou', '2024-06-09 16:39:17', '2024-06-09 16:39:17');
INSERT INTO `monitor_data` VALUES (10, '129101', '大营销抽奖流程', '1001', 'big-market', 'com.kou.trigger.http.RaffleActivityController', 'draw', '用户ID', 'userId', 'xiaokou', '2024-06-09 16:40:26', '2024-06-09 16:40:26');
INSERT INTO `monitor_data` VALUES (11, '129101', '大营销抽奖流程', '10011', 'big-market', 'com.kou.domain.activity.service.partake.AbstractRaffleActivityPartake', 'createOrder', '用户ID', 'userId', 'xiaokou', '2024-06-09 16:40:26', '2024-06-09 16:40:26');
INSERT INTO `monitor_data` VALUES (12, '129101', '大营销抽奖流程', '1001', 'big-market', 'com.kou.trigger.http.RaffleActivityController', 'draw', '用户ID', 'userId', 'xiaokou', '2024-06-09 16:48:29', '2024-06-09 16:48:29');
INSERT INTO `monitor_data` VALUES (13, '129101', '大营销抽奖流程', '10011', 'big-market', 'com.kou.domain.activity.service.partake.AbstractRaffleActivityPartake', 'createOrder', '用户ID', 'userId', 'xiaokou', '2024-06-09 16:48:29', '2024-06-09 16:48:29');
INSERT INTO `monitor_data` VALUES (14, '129101', '大营销抽奖流程', '1001', 'big-market', 'com.kou.trigger.http.RaffleActivityController', 'draw', '用户ID', 'userId', 'xiaokou', '2024-06-09 16:52:15', '2024-06-09 16:52:15');
INSERT INTO `monitor_data` VALUES (15, '129101', '大营销抽奖流程', '10011', 'big-market', 'com.kou.domain.activity.service.partake.AbstractRaffleActivityPartake', 'createOrder', '用户ID', 'userId', 'xiaokou', '2024-06-09 16:52:21', '2024-06-09 16:52:21');
INSERT INTO `monitor_data` VALUES (16, '129101', '大营销抽奖流程', '1001', 'big-market', 'com.kou.trigger.http.RaffleActivityController', 'draw', '用户ID', 'userId', 'xiaokou', '2024-06-09 16:54:54', '2024-06-09 16:54:54');
INSERT INTO `monitor_data` VALUES (17, '129101', '大营销抽奖流程', '10011', 'big-market', 'com.kou.domain.activity.service.partake.AbstractRaffleActivityPartake', 'createOrder', '用户ID', 'userId', 'xiaokou', '2024-06-09 16:54:58', '2024-06-09 16:54:58');
INSERT INTO `monitor_data` VALUES (18, '129101', '大营销抽奖流程', '1001', 'big-market', 'com.kou.trigger.http.RaffleActivityController', 'draw', '用户ID', 'userId', 'xiaokou', '2024-06-09 16:57:04', '2024-06-09 16:57:04');
INSERT INTO `monitor_data` VALUES (19, '129101', '大营销抽奖流程', '10011', 'big-market', 'com.kou.domain.activity.service.partake.AbstractRaffleActivityPartake', 'createOrder', '用户ID', 'userId', 'xiaokou', '2024-06-09 16:57:04', '2024-06-09 16:57:04');
INSERT INTO `monitor_data` VALUES (20, '129101', '大营销抽奖流程', '10015', 'big-market', 'com.kou.domain.activity.service.partake.AbstractRaffleActivityPartake', 'createOrder', '用户ID', 'userId', 'xiaokou', '2024-06-09 16:57:04', '2024-06-09 16:57:04');
INSERT INTO `monitor_data` VALUES (21, '129101', '大营销抽奖流程', '1001', 'big-market', 'com.kou.trigger.http.RaffleActivityController', 'draw', '用户ID', 'userId', 'xiaokou', '2024-06-09 17:50:03', '2024-06-09 17:50:03');
INSERT INTO `monitor_data` VALUES (22, '129101', '大营销抽奖流程', '10011', 'big-market', 'com.kou.domain.activity.service.partake.AbstractRaffleActivityPartake', 'createOrder', '用户ID', 'userId', 'xiaokou', '2024-06-09 17:50:03', '2024-06-09 17:50:03');
INSERT INTO `monitor_data` VALUES (23, '129101', '大营销抽奖流程', '10015', 'big-market', 'com.kou.domain.activity.service.partake.AbstractRaffleActivityPartake', 'createOrder', '用户ID', 'userId', 'xiaokou', '2024-06-09 17:50:04', '2024-06-09 17:50:04');
INSERT INTO `monitor_data` VALUES (24, '129101', '大营销抽奖流程', '1002', 'big-market', 'com.kou.domain.strategy.service.AbstractRaffleStrategy', 'performRaffle', '用户ID', 'userId', 'xiaokou', '2024-06-09 17:50:04', '2024-06-09 17:50:04');
INSERT INTO `monitor_data` VALUES (25, '129101', '大营销抽奖流程', '10021', 'big-market', 'com.kou.domain.strategy.service.raffle.DefaultRaffleStrategy', 'raffleLogicChain', '用户ID', 'userId', 'xiaokou', '2024-06-09 17:50:04', '2024-06-09 17:50:04');
INSERT INTO `monitor_data` VALUES (26, '129101', '大营销抽奖流程', '100211', 'big-market', 'com.kou.domain.strategy.service.rule.chain.impl.BlackListLogicChain', 'logic', '用户ID', 'userId', 'xiaokou', '2024-06-09 17:50:04', '2024-06-09 17:50:04');
INSERT INTO `monitor_data` VALUES (27, '129101', '大营销抽奖流程', '100212', 'big-market', 'com.kou.domain.strategy.service.rule.chain.impl.RuleWeightLogicChain', 'logic', '用户ID', 'userId', 'xiaokou', '2024-06-09 17:50:04', '2024-06-09 17:50:04');
INSERT INTO `monitor_data` VALUES (28, '129101', '大营销抽奖流程', '1001', 'big-market', 'com.kou.trigger.http.RaffleActivityController', 'draw', '用户ID', 'userId', 'xiaokou', '2024-06-09 18:01:20', '2024-06-09 18:01:20');
INSERT INTO `monitor_data` VALUES (29, '129101', '大营销抽奖流程', '10011', 'big-market', 'com.kou.domain.activity.service.partake.AbstractRaffleActivityPartake', 'createOrder', '用户ID', 'userId', 'xiaokou', '2024-06-09 18:01:20', '2024-06-09 18:01:20');
INSERT INTO `monitor_data` VALUES (30, '129101', '大营销抽奖流程', '10015', 'big-market', 'com.kou.domain.activity.service.partake.AbstractRaffleActivityPartake', 'createOrder', '用户ID', 'userId', 'xiaokou', '2024-06-09 18:01:20', '2024-06-09 18:01:20');
INSERT INTO `monitor_data` VALUES (31, '129101', '大营销抽奖流程', '1002', 'big-market', 'com.kou.domain.strategy.service.AbstractRaffleStrategy', 'performRaffle', '用户ID', 'userId', 'xiaokou', '2024-06-09 18:01:20', '2024-06-09 18:01:20');
INSERT INTO `monitor_data` VALUES (32, '129101', '大营销抽奖流程', '10021', 'big-market', 'com.kou.domain.strategy.service.raffle.DefaultRaffleStrategy', 'raffleLogicChain', '用户ID', 'userId', 'xiaokou', '2024-06-09 18:01:20', '2024-06-09 18:01:20');
INSERT INTO `monitor_data` VALUES (33, '129101', '大营销抽奖流程', '100212', 'big-market', 'com.kou.domain.strategy.service.rule.chain.impl.RuleWeightLogicChain', 'logic', '用户ID', 'userId', 'xiaokou', '2024-06-09 18:01:20', '2024-06-09 18:01:20');
INSERT INTO `monitor_data` VALUES (34, '129101', '大营销抽奖流程', '1004', 'big-market', 'com.kou.domain.award.service.AwardService', 'saveUserAwardRecord', '用户ID', 'userId', 'xiaokou', '2024-06-09 18:01:21', '2024-06-09 18:01:21');
INSERT INTO `monitor_data` VALUES (35, '129101', '大营销抽奖流程', '1001', 'big-market', 'com.kou.trigger.http.RaffleActivityController', 'draw', '用户ID', 'userId', 'xiaokou', '2024-06-09 18:44:47', '2024-06-09 18:44:47');
INSERT INTO `monitor_data` VALUES (36, '129101', '大营销抽奖流程', '10011', 'big-market', 'com.kou.domain.activity.service.partake.AbstractRaffleActivityPartake', 'createOrder', '用户ID', 'userId', 'xiaokou', '2024-06-09 18:44:47', '2024-06-09 18:44:47');
INSERT INTO `monitor_data` VALUES (37, '129101', '大营销抽奖流程', '10015', 'big-market', 'com.kou.domain.activity.service.partake.AbstractRaffleActivityPartake', 'createOrder', '用户ID', 'userId', 'xiaokou', '2024-06-09 18:44:47', '2024-06-09 18:44:47');
INSERT INTO `monitor_data` VALUES (38, '129101', '大营销抽奖流程', '1002', 'big-market', 'com.kou.domain.strategy.service.AbstractRaffleStrategy', 'performRaffle', '用户ID', 'userId', 'xiaokou', '2024-06-09 18:44:47', '2024-06-09 18:44:47');
INSERT INTO `monitor_data` VALUES (39, '129101', '大营销抽奖流程', '10021', 'big-market', 'com.kou.domain.strategy.service.raffle.DefaultRaffleStrategy', 'raffleLogicChain', '用户ID', 'userId', 'xiaokou', '2024-06-09 18:44:47', '2024-06-09 18:44:47');
INSERT INTO `monitor_data` VALUES (40, '129101', '大营销抽奖流程', '100213', 'big-market', 'com.kou.domain.strategy.service.rule.chain.impl.DefaultLogicChain', 'logic', '用户ID', 'userId', 'xiaokou', '2024-06-09 18:44:47', '2024-06-09 18:44:47');
INSERT INTO `monitor_data` VALUES (41, '129101', '大营销抽奖流程', '10031', 'big-market', 'com.kou.domain.strategy.service.raffle.DefaultRaffleStrategy', 'raffleLogicTree', '用户ID', 'userId', 'xiaokou', '2024-06-09 18:44:47', '2024-06-09 18:44:47');
INSERT INTO `monitor_data` VALUES (42, '129101', '大营销抽奖流程', '100312', 'big-market', 'com.kou.domain.strategy.service.rule.tree.impl.RuleStockLogicTreeNode', 'logic', '用户ID', 'userId', 'xiaokou', '2024-06-09 18:44:47', '2024-06-09 18:44:47');
INSERT INTO `monitor_data` VALUES (43, '129101', '大营销抽奖流程', '1004', 'big-market', 'com.kou.domain.award.service.AwardService', 'saveUserAwardRecord', '用户ID', 'userId', 'xiaokou', '2024-06-09 18:44:47', '2024-06-09 18:44:47');
INSERT INTO `monitor_data` VALUES (44, '129101', '大营销抽奖流程', '1001', 'big-market', 'com.kou.trigger.http.RaffleActivityController', 'draw', '用户ID', 'userId', 'xiaokou', '2024-06-10 08:16:55', '2024-06-10 08:16:55');
INSERT INTO `monitor_data` VALUES (45, '129101', '大营销抽奖流程', '10011', 'big-market', 'com.kou.domain.activity.service.partake.AbstractRaffleActivityPartake', 'createOrder', '用户ID', 'userId', 'xiaokou', '2024-06-10 08:16:55', '2024-06-10 08:16:55');
INSERT INTO `monitor_data` VALUES (46, '129101', '大营销抽奖流程', '10015', 'big-market', 'com.kou.domain.activity.service.partake.AbstractRaffleActivityPartake', 'createOrder', '用户ID', 'userId', 'xiaokou', '2024-06-10 08:16:55', '2024-06-10 08:16:55');
INSERT INTO `monitor_data` VALUES (47, '129101', '大营销抽奖流程', '1002', 'big-market', 'com.kou.domain.strategy.service.AbstractRaffleStrategy', 'performRaffle', '用户ID', 'userId', 'xiaokou', '2024-06-10 08:16:55', '2024-06-10 08:16:55');
INSERT INTO `monitor_data` VALUES (48, '129101', '大营销抽奖流程', '10021', 'big-market', 'com.kou.domain.strategy.service.raffle.DefaultRaffleStrategy', 'raffleLogicChain', '用户ID', 'userId', 'xiaokou', '2024-06-10 08:16:55', '2024-06-10 08:16:55');
INSERT INTO `monitor_data` VALUES (49, '129101', '大营销抽奖流程', '100213', 'big-market', 'com.kou.domain.strategy.service.rule.chain.impl.DefaultLogicChain', 'logic', '用户ID', 'userId', 'xiaokou', '2024-06-10 08:16:55', '2024-06-10 08:16:55');
INSERT INTO `monitor_data` VALUES (50, '129101', '大营销抽奖流程', '10031', 'big-market', 'com.kou.domain.strategy.service.raffle.DefaultRaffleStrategy', 'raffleLogicTree', '用户ID', 'userId', 'xiaokou', '2024-06-10 08:16:55', '2024-06-10 08:16:55');
INSERT INTO `monitor_data` VALUES (51, '129101', '大营销抽奖流程', '100312', 'big-market', 'com.kou.domain.strategy.service.rule.tree.impl.RuleStockLogicTreeNode', 'logic', '用户ID', 'userId', 'xiaokou', '2024-06-10 08:16:55', '2024-06-10 08:16:55');
INSERT INTO `monitor_data` VALUES (52, '129101', '大营销抽奖流程', '1004', 'big-market', 'com.kou.domain.award.service.AwardService', 'saveUserAwardRecord', '用户ID', 'userId', 'xiaokou', '2024-06-10 08:16:56', '2024-06-10 08:16:56');
INSERT INTO `monitor_data` VALUES (53, '129101', '大营销抽奖流程', '1001', 'big-market', 'com.kou.trigger.http.RaffleActivityController', 'draw', '用户ID', 'userId', 'xiaokou', '2024-06-10 09:35:30', '2024-06-10 09:35:30');
INSERT INTO `monitor_data` VALUES (54, '129101', '大营销抽奖流程', '10011', 'big-market', 'com.kou.domain.activity.service.partake.AbstractRaffleActivityPartake', 'createOrder', '用户ID', 'userId', 'xiaokou', '2024-06-10 09:35:30', '2024-06-10 09:35:30');
INSERT INTO `monitor_data` VALUES (55, '129101', '大营销抽奖流程', '10015', 'big-market', 'com.kou.domain.activity.service.partake.AbstractRaffleActivityPartake', 'createOrder', '用户ID', 'userId', 'xiaokou', '2024-06-10 09:35:30', '2024-06-10 09:35:30');
INSERT INTO `monitor_data` VALUES (56, '129101', '大营销抽奖流程', '1002', 'big-market', 'com.kou.domain.strategy.service.AbstractRaffleStrategy', 'performRaffle', '用户ID', 'userId', 'xiaokou', '2024-06-10 09:35:30', '2024-06-10 09:35:30');
INSERT INTO `monitor_data` VALUES (57, '129101', '大营销抽奖流程', '10021', 'big-market', 'com.kou.domain.strategy.service.raffle.DefaultRaffleStrategy', 'raffleLogicChain', '用户ID', 'userId', 'xiaokou', '2024-06-10 09:35:30', '2024-06-10 09:35:30');
INSERT INTO `monitor_data` VALUES (58, '129101', '大营销抽奖流程', '100212', 'big-market', 'com.kou.domain.strategy.service.rule.chain.impl.RuleWeightLogicChain', 'logic', '用户ID', 'userId', 'xiaokou', '2024-06-10 09:35:30', '2024-06-10 09:35:30');
INSERT INTO `monitor_data` VALUES (59, '129101', '大营销抽奖流程', '1004', 'big-market', 'com.kou.domain.award.service.AwardService', 'saveUserAwardRecord', '用户ID', 'userId', 'xiaokou', '2024-06-10 09:35:31', '2024-06-10 09:35:31');
INSERT INTO `monitor_data` VALUES (60, '129101', '大营销抽奖流程', '1001', 'big-market', 'com.kou.trigger.http.RaffleActivityController', 'draw', '用户ID', 'userId', 'xiaokou', '2024-06-10 09:36:23', '2024-06-10 09:36:23');
INSERT INTO `monitor_data` VALUES (61, '129101', '大营销抽奖流程', '10011', 'big-market', 'com.kou.domain.activity.service.partake.AbstractRaffleActivityPartake', 'createOrder', '用户ID', 'userId', 'xiaokou', '2024-06-10 09:36:23', '2024-06-10 09:36:23');
INSERT INTO `monitor_data` VALUES (62, '129101', '大营销抽奖流程', '10015', 'big-market', 'com.kou.domain.activity.service.partake.AbstractRaffleActivityPartake', 'createOrder', '用户ID', 'userId', 'xiaokou', '2024-06-10 09:36:24', '2024-06-10 09:36:24');
INSERT INTO `monitor_data` VALUES (63, '129101', '大营销抽奖流程', '1002', 'big-market', 'com.kou.domain.strategy.service.AbstractRaffleStrategy', 'performRaffle', '用户ID', 'userId', 'xiaokou', '2024-06-10 09:36:24', '2024-06-10 09:36:24');
INSERT INTO `monitor_data` VALUES (64, '129101', '大营销抽奖流程', '10021', 'big-market', 'com.kou.domain.strategy.service.raffle.DefaultRaffleStrategy', 'raffleLogicChain', '用户ID', 'userId', 'xiaokou', '2024-06-10 09:36:24', '2024-06-10 09:36:24');
INSERT INTO `monitor_data` VALUES (65, '129101', '大营销抽奖流程', '100212', 'big-market', 'com.kou.domain.strategy.service.rule.chain.impl.RuleWeightLogicChain', 'logic', '用户ID', 'userId', 'xiaokou', '2024-06-10 09:36:24', '2024-06-10 09:36:24');
INSERT INTO `monitor_data` VALUES (66, '129101', '大营销抽奖流程', '1004', 'big-market', 'com.kou.domain.award.service.AwardService', 'saveUserAwardRecord', '用户ID', 'userId', 'xiaokou', '2024-06-10 09:36:24', '2024-06-10 09:36:24');
INSERT INTO `monitor_data` VALUES (67, '129101', '大营销抽奖流程', '1001', 'big-market', 'com.kou.trigger.http.RaffleActivityController', 'draw', '用户ID', 'userId', 'xiaokou', '2024-06-10 09:36:24', '2024-06-10 09:36:24');
INSERT INTO `monitor_data` VALUES (68, '129101', '大营销抽奖流程', '10011', 'big-market', 'com.kou.domain.activity.service.partake.AbstractRaffleActivityPartake', 'createOrder', '用户ID', 'userId', 'xiaokou', '2024-06-10 09:36:24', '2024-06-10 09:36:24');
INSERT INTO `monitor_data` VALUES (69, '129101', '大营销抽奖流程', '10015', 'big-market', 'com.kou.domain.activity.service.partake.AbstractRaffleActivityPartake', 'createOrder', '用户ID', 'userId', 'xiaokou', '2024-06-10 09:36:24', '2024-06-10 09:36:24');
INSERT INTO `monitor_data` VALUES (70, '129101', '大营销抽奖流程', '1002', 'big-market', 'com.kou.domain.strategy.service.AbstractRaffleStrategy', 'performRaffle', '用户ID', 'userId', 'xiaokou', '2024-06-10 09:36:24', '2024-06-10 09:36:24');
INSERT INTO `monitor_data` VALUES (71, '129101', '大营销抽奖流程', '10021', 'big-market', 'com.kou.domain.strategy.service.raffle.DefaultRaffleStrategy', 'raffleLogicChain', '用户ID', 'userId', 'xiaokou', '2024-06-10 09:36:24', '2024-06-10 09:36:24');
INSERT INTO `monitor_data` VALUES (72, '129101', '大营销抽奖流程', '100212', 'big-market', 'com.kou.domain.strategy.service.rule.chain.impl.RuleWeightLogicChain', 'logic', '用户ID', 'userId', 'xiaokou', '2024-06-10 09:36:24', '2024-06-10 09:36:24');
INSERT INTO `monitor_data` VALUES (73, '129101', '大营销抽奖流程', '1004', 'big-market', 'com.kou.domain.award.service.AwardService', 'saveUserAwardRecord', '用户ID', 'userId', 'xiaokou', '2024-06-10 09:36:24', '2024-06-10 09:36:24');
INSERT INTO `monitor_data` VALUES (74, '129101', '大营销抽奖流程', '1001', 'big-market', 'com.kou.trigger.http.RaffleActivityController', 'draw', '用户ID', 'userId', 'xiaokou', '2024-06-10 09:36:24', '2024-06-10 09:36:24');
INSERT INTO `monitor_data` VALUES (75, '129101', '大营销抽奖流程', '10011', 'big-market', 'com.kou.domain.activity.service.partake.AbstractRaffleActivityPartake', 'createOrder', '用户ID', 'userId', 'xiaokou', '2024-06-10 09:36:24', '2024-06-10 09:36:24');
INSERT INTO `monitor_data` VALUES (76, '129101', '大营销抽奖流程', '10015', 'big-market', 'com.kou.domain.activity.service.partake.AbstractRaffleActivityPartake', 'createOrder', '用户ID', 'userId', 'xiaokou', '2024-06-10 09:36:24', '2024-06-10 09:36:24');
INSERT INTO `monitor_data` VALUES (77, '129101', '大营销抽奖流程', '1002', 'big-market', 'com.kou.domain.strategy.service.AbstractRaffleStrategy', 'performRaffle', '用户ID', 'userId', 'xiaokou', '2024-06-10 09:36:25', '2024-06-10 09:36:25');
INSERT INTO `monitor_data` VALUES (78, '129101', '大营销抽奖流程', '10021', 'big-market', 'com.kou.domain.strategy.service.raffle.DefaultRaffleStrategy', 'raffleLogicChain', '用户ID', 'userId', 'xiaokou', '2024-06-10 09:36:25', '2024-06-10 09:36:25');
INSERT INTO `monitor_data` VALUES (79, '129101', '大营销抽奖流程', '100212', 'big-market', 'com.kou.domain.strategy.service.rule.chain.impl.RuleWeightLogicChain', 'logic', '用户ID', 'userId', 'xiaokou', '2024-06-10 09:36:25', '2024-06-10 09:36:25');
INSERT INTO `monitor_data` VALUES (80, '129101', '大营销抽奖流程', '1004', 'big-market', 'com.kou.domain.award.service.AwardService', 'saveUserAwardRecord', '用户ID', 'userId', 'xiaokou', '2024-06-10 09:36:25', '2024-06-10 09:36:25');
INSERT INTO `monitor_data` VALUES (81, '129101', '大营销抽奖流程', '1001', 'big-market', 'com.kou.trigger.http.RaffleActivityController', 'draw', '用户ID', 'userId', 'xiaokou', '2024-06-10 09:36:25', '2024-06-10 09:36:25');
INSERT INTO `monitor_data` VALUES (82, '129101', '大营销抽奖流程', '10011', 'big-market', 'com.kou.domain.activity.service.partake.AbstractRaffleActivityPartake', 'createOrder', '用户ID', 'userId', 'xiaokou', '2024-06-10 09:36:25', '2024-06-10 09:36:25');
INSERT INTO `monitor_data` VALUES (83, '129101', '大营销抽奖流程', '10015', 'big-market', 'com.kou.domain.activity.service.partake.AbstractRaffleActivityPartake', 'createOrder', '用户ID', 'userId', 'xiaokou', '2024-06-10 09:36:25', '2024-06-10 09:36:25');
INSERT INTO `monitor_data` VALUES (84, '129101', '大营销抽奖流程', '1002', 'big-market', 'com.kou.domain.strategy.service.AbstractRaffleStrategy', 'performRaffle', '用户ID', 'userId', 'xiaokou', '2024-06-10 09:36:25', '2024-06-10 09:36:25');
INSERT INTO `monitor_data` VALUES (85, '129101', '大营销抽奖流程', '10021', 'big-market', 'com.kou.domain.strategy.service.raffle.DefaultRaffleStrategy', 'raffleLogicChain', '用户ID', 'userId', 'xiaokou', '2024-06-10 09:36:25', '2024-06-10 09:36:25');
INSERT INTO `monitor_data` VALUES (86, '129101', '大营销抽奖流程', '100212', 'big-market', 'com.kou.domain.strategy.service.rule.chain.impl.RuleWeightLogicChain', 'logic', '用户ID', 'userId', 'xiaokou', '2024-06-10 09:36:25', '2024-06-10 09:36:25');
INSERT INTO `monitor_data` VALUES (87, '129101', '大营销抽奖流程', '1004', 'big-market', 'com.kou.domain.award.service.AwardService', 'saveUserAwardRecord', '用户ID', 'userId', 'xiaokou', '2024-06-10 09:36:25', '2024-06-10 09:36:25');
INSERT INTO `monitor_data` VALUES (88, '129101', '大营销抽奖流程', '1001', 'big-market', 'com.kou.trigger.http.RaffleActivityController', 'draw', '用户ID', 'userId', 'xiaokou', '2024-06-10 09:36:25', '2024-06-10 09:36:25');
INSERT INTO `monitor_data` VALUES (89, '129101', '大营销抽奖流程', '10011', 'big-market', 'com.kou.domain.activity.service.partake.AbstractRaffleActivityPartake', 'createOrder', '用户ID', 'userId', 'xiaokou', '2024-06-10 09:36:25', '2024-06-10 09:36:25');
INSERT INTO `monitor_data` VALUES (90, '129101', '大营销抽奖流程', '10015', 'big-market', 'com.kou.domain.activity.service.partake.AbstractRaffleActivityPartake', 'createOrder', '用户ID', 'userId', 'xiaokou', '2024-06-10 09:36:25', '2024-06-10 09:36:25');
INSERT INTO `monitor_data` VALUES (91, '129101', '大营销抽奖流程', '1002', 'big-market', 'com.kou.domain.strategy.service.AbstractRaffleStrategy', 'performRaffle', '用户ID', 'userId', 'xiaokou', '2024-06-10 09:36:25', '2024-06-10 09:36:25');
INSERT INTO `monitor_data` VALUES (92, '129101', '大营销抽奖流程', '10021', 'big-market', 'com.kou.domain.strategy.service.raffle.DefaultRaffleStrategy', 'raffleLogicChain', '用户ID', 'userId', 'xiaokou', '2024-06-10 09:36:25', '2024-06-10 09:36:25');
INSERT INTO `monitor_data` VALUES (93, '129101', '大营销抽奖流程', '100212', 'big-market', 'com.kou.domain.strategy.service.rule.chain.impl.RuleWeightLogicChain', 'logic', '用户ID', 'userId', 'xiaokou', '2024-06-10 09:36:25', '2024-06-10 09:36:25');
INSERT INTO `monitor_data` VALUES (94, '129101', '大营销抽奖流程', '1004', 'big-market', 'com.kou.domain.award.service.AwardService', 'saveUserAwardRecord', '用户ID', 'userId', 'xiaokou', '2024-06-10 09:36:25', '2024-06-10 09:36:25');
INSERT INTO `monitor_data` VALUES (95, '129101', '大营销抽奖流程', '1001', 'big-market', 'com.kou.trigger.http.RaffleActivityController', 'draw', '用户ID', 'userId', 'xiaokou', '2024-06-10 09:36:25', '2024-06-10 09:36:25');
INSERT INTO `monitor_data` VALUES (96, '129101', '大营销抽奖流程', '10011', 'big-market', 'com.kou.domain.activity.service.partake.AbstractRaffleActivityPartake', 'createOrder', '用户ID', 'userId', 'xiaokou', '2024-06-10 09:36:25', '2024-06-10 09:36:25');
INSERT INTO `monitor_data` VALUES (97, '129101', '大营销抽奖流程', '10015', 'big-market', 'com.kou.domain.activity.service.partake.AbstractRaffleActivityPartake', 'createOrder', '用户ID', 'userId', 'xiaokou', '2024-06-10 09:36:25', '2024-06-10 09:36:25');
INSERT INTO `monitor_data` VALUES (98, '129101', '大营销抽奖流程', '1002', 'big-market', 'com.kou.domain.strategy.service.AbstractRaffleStrategy', 'performRaffle', '用户ID', 'userId', 'xiaokou', '2024-06-10 09:36:25', '2024-06-10 09:36:25');
INSERT INTO `monitor_data` VALUES (99, '129101', '大营销抽奖流程', '10021', 'big-market', 'com.kou.domain.strategy.service.raffle.DefaultRaffleStrategy', 'raffleLogicChain', '用户ID', 'userId', 'xiaokou', '2024-06-10 09:36:25', '2024-06-10 09:36:25');
INSERT INTO `monitor_data` VALUES (100, '129101', '大营销抽奖流程', '100212', 'big-market', 'com.kou.domain.strategy.service.rule.chain.impl.RuleWeightLogicChain', 'logic', '用户ID', 'userId', 'xiaokou', '2024-06-10 09:36:25', '2024-06-10 09:36:25');
INSERT INTO `monitor_data` VALUES (101, '129101', '大营销抽奖流程', '1004', 'big-market', 'com.kou.domain.award.service.AwardService', 'saveUserAwardRecord', '用户ID', 'userId', 'xiaokou', '2024-06-10 09:36:25', '2024-06-10 09:36:25');
INSERT INTO `monitor_data` VALUES (102, '129101', '大营销抽奖流程', '1001', 'big-market', 'com.kou.trigger.http.RaffleActivityController', 'draw', '用户ID', 'userId', 'xiaokou', '2024-06-10 09:36:25', '2024-06-10 09:36:25');
INSERT INTO `monitor_data` VALUES (103, '129101', '大营销抽奖流程', '10011', 'big-market', 'com.kou.domain.activity.service.partake.AbstractRaffleActivityPartake', 'createOrder', '用户ID', 'userId', 'xiaokou', '2024-06-10 09:36:25', '2024-06-10 09:36:25');
INSERT INTO `monitor_data` VALUES (104, '129101', '大营销抽奖流程', '10015', 'big-market', 'com.kou.domain.activity.service.partake.AbstractRaffleActivityPartake', 'createOrder', '用户ID', 'userId', 'xiaokou', '2024-06-10 09:36:25', '2024-06-10 09:36:25');
INSERT INTO `monitor_data` VALUES (105, '129101', '大营销抽奖流程', '1002', 'big-market', 'com.kou.domain.strategy.service.AbstractRaffleStrategy', 'performRaffle', '用户ID', 'userId', 'xiaokou', '2024-06-10 09:36:25', '2024-06-10 09:36:25');
INSERT INTO `monitor_data` VALUES (106, '129101', '大营销抽奖流程', '10021', 'big-market', 'com.kou.domain.strategy.service.raffle.DefaultRaffleStrategy', 'raffleLogicChain', '用户ID', 'userId', 'xiaokou', '2024-06-10 09:36:25', '2024-06-10 09:36:25');
INSERT INTO `monitor_data` VALUES (107, '129101', '大营销抽奖流程', '100212', 'big-market', 'com.kou.domain.strategy.service.rule.chain.impl.RuleWeightLogicChain', 'logic', '用户ID', 'userId', 'xiaokou', '2024-06-10 09:36:25', '2024-06-10 09:36:25');
INSERT INTO `monitor_data` VALUES (108, '129101', '大营销抽奖流程', '1004', 'big-market', 'com.kou.domain.award.service.AwardService', 'saveUserAwardRecord', '用户ID', 'userId', 'xiaokou', '2024-06-10 09:36:26', '2024-06-10 09:36:26');
INSERT INTO `monitor_data` VALUES (109, '129101', '大营销抽奖流程', '1001', 'big-market', 'com.kou.trigger.http.RaffleActivityController', 'draw', '用户ID', 'userId', 'xiaokou', '2024-06-10 09:36:26', '2024-06-10 09:36:26');
INSERT INTO `monitor_data` VALUES (110, '129101', '大营销抽奖流程', '10011', 'big-market', 'com.kou.domain.activity.service.partake.AbstractRaffleActivityPartake', 'createOrder', '用户ID', 'userId', 'xiaokou', '2024-06-10 09:36:26', '2024-06-10 09:36:26');
INSERT INTO `monitor_data` VALUES (111, '129101', '大营销抽奖流程', '10015', 'big-market', 'com.kou.domain.activity.service.partake.AbstractRaffleActivityPartake', 'createOrder', '用户ID', 'userId', 'xiaokou', '2024-06-10 09:36:26', '2024-06-10 09:36:26');
INSERT INTO `monitor_data` VALUES (112, '129101', '大营销抽奖流程', '1002', 'big-market', 'com.kou.domain.strategy.service.AbstractRaffleStrategy', 'performRaffle', '用户ID', 'userId', 'xiaokou', '2024-06-10 09:36:26', '2024-06-10 09:36:26');
INSERT INTO `monitor_data` VALUES (113, '129101', '大营销抽奖流程', '10021', 'big-market', 'com.kou.domain.strategy.service.raffle.DefaultRaffleStrategy', 'raffleLogicChain', '用户ID', 'userId', 'xiaokou', '2024-06-10 09:36:26', '2024-06-10 09:36:26');
INSERT INTO `monitor_data` VALUES (114, '129101', '大营销抽奖流程', '100212', 'big-market', 'com.kou.domain.strategy.service.rule.chain.impl.RuleWeightLogicChain', 'logic', '用户ID', 'userId', 'xiaokou', '2024-06-10 09:36:26', '2024-06-10 09:36:26');
INSERT INTO `monitor_data` VALUES (115, '129101', '大营销抽奖流程', '1004', 'big-market', 'com.kou.domain.award.service.AwardService', 'saveUserAwardRecord', '用户ID', 'userId', 'xiaokou', '2024-06-10 09:36:26', '2024-06-10 09:36:26');
INSERT INTO `monitor_data` VALUES (116, '129101', '大营销抽奖流程', '1001', 'big-market', 'com.kou.trigger.http.RaffleActivityController', 'draw', '用户ID', 'userId', 'xiaokou', '2024-06-10 09:36:26', '2024-06-10 09:36:26');
INSERT INTO `monitor_data` VALUES (117, '129101', '大营销抽奖流程', '10011', 'big-market', 'com.kou.domain.activity.service.partake.AbstractRaffleActivityPartake', 'createOrder', '用户ID', 'userId', 'xiaokou', '2024-06-10 09:36:26', '2024-06-10 09:36:26');
INSERT INTO `monitor_data` VALUES (118, '129101', '大营销抽奖流程', '10015', 'big-market', 'com.kou.domain.activity.service.partake.AbstractRaffleActivityPartake', 'createOrder', '用户ID', 'userId', 'xiaokou', '2024-06-10 09:36:26', '2024-06-10 09:36:26');
INSERT INTO `monitor_data` VALUES (119, '129101', '大营销抽奖流程', '1002', 'big-market', 'com.kou.domain.strategy.service.AbstractRaffleStrategy', 'performRaffle', '用户ID', 'userId', 'xiaokou', '2024-06-10 09:36:26', '2024-06-10 09:36:26');
INSERT INTO `monitor_data` VALUES (120, '129101', '大营销抽奖流程', '10021', 'big-market', 'com.kou.domain.strategy.service.raffle.DefaultRaffleStrategy', 'raffleLogicChain', '用户ID', 'userId', 'xiaokou', '2024-06-10 09:36:26', '2024-06-10 09:36:26');
INSERT INTO `monitor_data` VALUES (121, '129101', '大营销抽奖流程', '100212', 'big-market', 'com.kou.domain.strategy.service.rule.chain.impl.RuleWeightLogicChain', 'logic', '用户ID', 'userId', 'xiaokou', '2024-06-10 09:36:26', '2024-06-10 09:36:26');
INSERT INTO `monitor_data` VALUES (122, '129101', '大营销抽奖流程', '1004', 'big-market', 'com.kou.domain.award.service.AwardService', 'saveUserAwardRecord', '用户ID', 'userId', 'xiaokou', '2024-06-10 09:36:26', '2024-06-10 09:36:26');
INSERT INTO `monitor_data` VALUES (123, '129101', '大营销抽奖流程', '1001', 'big-market', 'com.kou.trigger.http.RaffleActivityController', 'draw', '用户ID', 'userId', 'xiaokou', '2024-06-10 09:36:26', '2024-06-10 09:36:26');
INSERT INTO `monitor_data` VALUES (124, '129101', '大营销抽奖流程', '10011', 'big-market', 'com.kou.domain.activity.service.partake.AbstractRaffleActivityPartake', 'createOrder', '用户ID', 'userId', 'xiaokou', '2024-06-10 09:36:26', '2024-06-10 09:36:26');
INSERT INTO `monitor_data` VALUES (125, '129101', '大营销抽奖流程', '10015', 'big-market', 'com.kou.domain.activity.service.partake.AbstractRaffleActivityPartake', 'createOrder', '用户ID', 'userId', 'xiaokou', '2024-06-10 09:36:26', '2024-06-10 09:36:26');
INSERT INTO `monitor_data` VALUES (126, '129101', '大营销抽奖流程', '1002', 'big-market', 'com.kou.domain.strategy.service.AbstractRaffleStrategy', 'performRaffle', '用户ID', 'userId', 'xiaokou', '2024-06-10 09:36:26', '2024-06-10 09:36:26');
INSERT INTO `monitor_data` VALUES (127, '129101', '大营销抽奖流程', '10021', 'big-market', 'com.kou.domain.strategy.service.raffle.DefaultRaffleStrategy', 'raffleLogicChain', '用户ID', 'userId', 'xiaokou', '2024-06-10 09:36:26', '2024-06-10 09:36:26');
INSERT INTO `monitor_data` VALUES (128, '129101', '大营销抽奖流程', '100212', 'big-market', 'com.kou.domain.strategy.service.rule.chain.impl.RuleWeightLogicChain', 'logic', '用户ID', 'userId', 'xiaokou', '2024-06-10 09:36:26', '2024-06-10 09:36:26');
INSERT INTO `monitor_data` VALUES (129, '129101', '大营销抽奖流程', '1004', 'big-market', 'com.kou.domain.award.service.AwardService', 'saveUserAwardRecord', '用户ID', 'userId', 'xiaokou', '2024-06-10 09:36:26', '2024-06-10 09:36:26');
INSERT INTO `monitor_data` VALUES (130, '129101', '大营销抽奖流程', '1001', 'big-market', 'com.kou.trigger.http.RaffleActivityController', 'draw', '用户ID', 'userId', 'xiaokou', '2024-06-15 20:02:16', '2024-06-15 20:02:16');
INSERT INTO `monitor_data` VALUES (131, '129101', '大营销抽奖流程', '10011', 'big-market', 'com.kou.domain.activity.service.partake.AbstractRaffleActivityPartake', 'createOrder', '用户ID', 'userId', 'xiaokou', '2024-06-15 20:02:16', '2024-06-15 20:02:16');
INSERT INTO `monitor_data` VALUES (132, '129101', '大营销抽奖流程', '10015', 'big-market', 'com.kou.domain.activity.service.partake.AbstractRaffleActivityPartake', 'createOrder', '用户ID', 'userId', 'xiaokou', '2024-06-15 20:02:16', '2024-06-15 20:02:16');
INSERT INTO `monitor_data` VALUES (133, '129101', '大营销抽奖流程', '1002', 'big-market', 'com.kou.domain.strategy.service.AbstractRaffleStrategy', 'performRaffle', '用户ID', 'userId', 'xiaokou', '2024-06-15 20:02:17', '2024-06-15 20:02:17');
INSERT INTO `monitor_data` VALUES (134, '129101', '大营销抽奖流程', '10021', 'big-market', 'com.kou.domain.strategy.service.raffle.DefaultRaffleStrategy', 'raffleLogicChain', '用户ID', 'userId', 'xiaokou', '2024-06-15 20:02:17', '2024-06-15 20:02:17');
INSERT INTO `monitor_data` VALUES (135, '129101', '大营销抽奖流程', '100212', 'big-market', 'com.kou.domain.strategy.service.rule.chain.impl.RuleWeightLogicChain', 'logic', '用户ID', 'userId', 'xiaokou', '2024-06-15 20:02:17', '2024-06-15 20:02:17');
INSERT INTO `monitor_data` VALUES (136, '129101', '大营销抽奖流程', '1004', 'big-market', 'com.kou.domain.award.service.AwardService', 'saveUserAwardRecord', '用户ID', 'userId', 'xiaokou', '2024-06-15 20:02:17', '2024-06-15 20:02:17');
INSERT INTO `monitor_data` VALUES (137, '129101', '大营销抽奖流程', '1001', 'big-market', 'com.kou.trigger.http.RaffleActivityController', 'draw', '用户ID', 'userId', 'xiaokou', '2024-06-15 20:19:36', '2024-06-15 20:19:36');
INSERT INTO `monitor_data` VALUES (138, '129101', '大营销抽奖流程', '10011', 'big-market', 'com.kou.domain.activity.service.partake.AbstractRaffleActivityPartake', 'createOrder', '用户ID', 'userId', 'xiaokou', '2024-06-15 20:19:36', '2024-06-15 20:19:36');
INSERT INTO `monitor_data` VALUES (139, '129101', '大营销抽奖流程', '10015', 'big-market', 'com.kou.domain.activity.service.partake.AbstractRaffleActivityPartake', 'createOrder', '用户ID', 'userId', 'xiaokou', '2024-06-15 20:19:36', '2024-06-15 20:19:36');
INSERT INTO `monitor_data` VALUES (140, '129101', '大营销抽奖流程', '1002', 'big-market', 'com.kou.domain.strategy.service.AbstractRaffleStrategy', 'performRaffle', '用户ID', 'userId', 'xiaokou', '2024-06-15 20:19:36', '2024-06-15 20:19:36');
INSERT INTO `monitor_data` VALUES (141, '129101', '大营销抽奖流程', '10021', 'big-market', 'com.kou.domain.strategy.service.raffle.DefaultRaffleStrategy', 'raffleLogicChain', '用户ID', 'userId', 'xiaokou', '2024-06-15 20:19:36', '2024-06-15 20:19:36');
INSERT INTO `monitor_data` VALUES (142, '129101', '大营销抽奖流程', '100212', 'big-market', 'com.kou.domain.strategy.service.rule.chain.impl.RuleWeightLogicChain', 'logic', '用户ID', 'userId', 'xiaokou', '2024-06-15 20:19:36', '2024-06-15 20:19:36');
INSERT INTO `monitor_data` VALUES (143, '129101', '大营销抽奖流程', '1004', 'big-market', 'com.kou.domain.award.service.AwardService', 'saveUserAwardRecord', '用户ID', 'userId', 'xiaokou', '2024-06-15 20:19:36', '2024-06-15 20:19:36');
INSERT INTO `monitor_data` VALUES (144, '129101', '大营销抽奖流程', '1001', 'big-market', 'com.kou.trigger.http.RaffleActivityController', 'draw', '用户ID', 'userId', 'xiaokou', '2024-06-15 20:19:36', '2024-06-15 20:19:36');
INSERT INTO `monitor_data` VALUES (145, '129101', '大营销抽奖流程', '10011', 'big-market', 'com.kou.domain.activity.service.partake.AbstractRaffleActivityPartake', 'createOrder', '用户ID', 'userId', 'xiaokou', '2024-06-15 20:19:36', '2024-06-15 20:19:36');
INSERT INTO `monitor_data` VALUES (146, '129101', '大营销抽奖流程', '10015', 'big-market', 'com.kou.domain.activity.service.partake.AbstractRaffleActivityPartake', 'createOrder', '用户ID', 'userId', 'xiaokou', '2024-06-15 20:19:36', '2024-06-15 20:19:36');
INSERT INTO `monitor_data` VALUES (147, '129101', '大营销抽奖流程', '1002', 'big-market', 'com.kou.domain.strategy.service.AbstractRaffleStrategy', 'performRaffle', '用户ID', 'userId', 'xiaokou', '2024-06-15 20:19:36', '2024-06-15 20:19:36');
INSERT INTO `monitor_data` VALUES (148, '129101', '大营销抽奖流程', '10021', 'big-market', 'com.kou.domain.strategy.service.raffle.DefaultRaffleStrategy', 'raffleLogicChain', '用户ID', 'userId', 'xiaokou', '2024-06-15 20:19:36', '2024-06-15 20:19:36');
INSERT INTO `monitor_data` VALUES (149, '129101', '大营销抽奖流程', '100212', 'big-market', 'com.kou.domain.strategy.service.rule.chain.impl.RuleWeightLogicChain', 'logic', '用户ID', 'userId', 'xiaokou', '2024-06-15 20:19:36', '2024-06-15 20:19:36');
INSERT INTO `monitor_data` VALUES (150, '129101', '大营销抽奖流程', '1004', 'big-market', 'com.kou.domain.award.service.AwardService', 'saveUserAwardRecord', '用户ID', 'userId', 'xiaokou', '2024-06-15 20:19:36', '2024-06-15 20:19:36');

-- ----------------------------
-- Table structure for monitor_data_map
-- ----------------------------
DROP TABLE IF EXISTS `monitor_data_map`;
CREATE TABLE `monitor_data_map`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `monitor_id` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '监控ID',
  `monitor_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '监控名称',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建日期',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新日期',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '监控数据地图配置' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of monitor_data_map
-- ----------------------------
INSERT INTO `monitor_data_map` VALUES (1, '129009', '测试监控流程', '2024-05-24 14:51:45', '2024-05-24 14:51:45');
INSERT INTO `monitor_data_map` VALUES (2, '129101', '大营销抽奖流程', '2024-06-09 16:11:49', '2024-06-09 16:11:49');

-- ----------------------------
-- Table structure for monitor_data_map_node
-- ----------------------------
DROP TABLE IF EXISTS `monitor_data_map_node`;
CREATE TABLE `monitor_data_map_node`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `monitor_id` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '监控ID',
  `monitor_node_id` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '节点ID',
  `monitor_node_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '节点名称',
  `gather_system_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '采集，系统名称',
  `gather_clazz_name` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '采集，类的名称',
  `gather_method_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '采集，方法名称',
  `loc` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '渲染节点坐标',
  `color` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '#2ECC40' COMMENT '节点颜色',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '监控数据地图节点配置' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of monitor_data_map_node
-- ----------------------------
INSERT INTO `monitor_data_map_node` VALUES (1, '129009', '1001', '用户下单', 'big-market', 'com.kou.monitor.test.ApiTest', 'test_log_00', '210 110', '#2ECC40', '2024-05-24 14:51:15', '2024-06-09 18:03:07');
INSERT INTO `monitor_data_map_node` VALUES (2, '129009', '1002', '支付完成', 'big-market', 'com.kou.monitor.test.ApiTest', 'test_log_01', '210 290', '#2ECC40', '2024-05-28 14:12:42', '2024-06-09 18:03:08');
INSERT INTO `monitor_data_map_node` VALUES (3, '129009', '1003', '发货完成', 'big-market', 'com.kou.monitor.test.ApiTest', 'test_log_02', '210 430', '#2ECC40', '2024-05-28 14:12:42', '2024-06-09 18:03:09');
INSERT INTO `monitor_data_map_node` VALUES (4, '129009', '1004', '发货失败', 'big-market', 'com.kou.monitor.test.ApiTest', 'test_log_03', '430 440', '#2ECC40', '2024-05-28 14:12:42', '2024-06-09 18:03:10');
INSERT INTO `monitor_data_map_node` VALUES (5, '129101', '1001', '开始抽奖啦(启动)', 'big-market', 'com.kou.trigger.http.RaffleActivityController', 'draw', '120 50', '#006400', '2024-06-09 16:15:23', '2024-06-09 18:08:51');
INSERT INTO `monitor_data_map_node` VALUES (7, '129101', '10011', '创建抽奖单(开始)', 'big-market', 'com.kou.domain.activity.service.partake.AbstractRaffleActivityPartake', 'createOrder', '120 180', '#006400', '2024-06-09 16:15:23', '2024-06-09 18:09:00');
INSERT INTO `monitor_data_map_node` VALUES (8, '129101', '10012', '活动未开始(状态)', 'big-market', 'com.kou.domain.activity.service.partake.AbstractRaffleActivityPartake', 'createOrder', '350 230', '#FF8C00', '2024-06-09 16:15:23', '2024-06-09 18:10:09');
INSERT INTO `monitor_data_map_node` VALUES (9, '129101', '10013', '活动未开始(时间)', 'big-market', 'com.kou.domain.activity.service.partake.AbstractRaffleActivityPartake', 'createOrder', '350 320', '#FF8C00', '2024-06-09 16:15:23', '2024-06-09 18:10:24');
INSERT INTO `monitor_data_map_node` VALUES (10, '129101', '10014', '订单未消费(存在)', 'big-market', 'com.kou.domain.activity.service.partake.AbstractRaffleActivityPartake', 'createOrder', '350 140', '#2E8B57', '2024-06-09 16:15:23', '2024-06-09 18:10:46');
INSERT INTO `monitor_data_map_node` VALUES (12, '129101', '10015', '创建抽奖单(完成)', 'big-market', 'com.kou.domain.activity.service.partake.AbstractRaffleActivityPartake', 'createOrder', '350 50', '#2E8B57', '2024-06-09 16:15:23', '2024-06-09 18:10:44');
INSERT INTO `monitor_data_map_node` VALUES (13, '129101', '1002', '抽奖策略表(计算)', 'big-market', 'com.kou.domain.strategy.service.AbstractRaffleStrategy', 'performRaffle', '770 50', '#FF1493', '2024-06-09 17:20:30', '2024-06-09 18:11:02');
INSERT INTO `monitor_data_map_node` VALUES (14, '129101', '10021', '责任链策略(计算)', 'big-market', 'com.kou.domain.strategy.service.raffle.DefaultRaffleStrategy', 'raffleLogicChain', '1230 50', '#0000FF', '2024-06-09 17:20:30', '2024-06-09 18:11:23');
INSERT INTO `monitor_data_map_node` VALUES (15, '129101', '100211', '黑名单策略(计算)', 'big-market', 'com.kou.domain.strategy.service.rule.chain.impl.BlackListLogicChain', 'logic', '1230 160', '#1E90FF', '2024-06-09 17:20:30', '2024-06-09 18:11:33');
INSERT INTO `monitor_data_map_node` VALUES (16, '129101', '100212', '权重值策略(计算)', 'big-market', 'com.kou.domain.strategy.service.rule.chain.impl.RuleWeightLogicChain', 'logic', '1230 260', '#1E90FF', '2024-06-09 17:20:30', '2024-06-09 18:11:34');
INSERT INTO `monitor_data_map_node` VALUES (17, '129101', '100213', '兜底的策略(计算)', 'big-market', 'com.kou.domain.strategy.service.rule.chain.impl.DefaultLogicChain', 'logic', '1230 360', '#1E90FF', '2024-06-09 17:20:30', '2024-06-09 18:11:35');
INSERT INTO `monitor_data_map_node` VALUES (18, '129101', '10031', '抽奖规则树(计算)', 'big-market', 'com.kou.domain.strategy.service.raffle.DefaultRaffleStrategy', 'raffleLogicTree', '770 260', '#000000', '2024-06-09 17:20:30', '2024-06-09 18:11:55');
INSERT INTO `monitor_data_map_node` VALUES (19, '129101', '100311', '次数锁判断(计算)', 'big-market', 'com.kou.domain.strategy.service.rule.tree.impl.RuleLockLogicTreeNode', 'logic', '1010 260', '#2F4F4F', '2024-06-09 17:20:30', '2024-06-09 18:12:14');
INSERT INTO `monitor_data_map_node` VALUES (20, '129101', '100312', '扣库存处理(计算)', 'big-market', 'com.kou.domain.strategy.service.rule.tree.impl.RuleStockLogicTreeNode', 'logic', '1010 160', '#2F4F4F', '2024-06-09 17:20:30', '2024-06-09 18:12:15');
INSERT INTO `monitor_data_map_node` VALUES (21, '129101', '100313', '兜底类奖品(计算)', 'big-market', 'com.kou.domain.strategy.service.rule.tree.impl.RuleLuckAwardLogicTreeNode', 'logic', '1010 360', '#2F4F4F', '2024-06-09 17:20:30', '2024-06-09 18:12:16');
INSERT INTO `monitor_data_map_node` VALUES (22, '129101', '1004', '中奖记录值(结果)', 'big-market', 'com.kou.domain.award.service.AwardService', 'saveUserAwardRecord', '120 340', '#006400', '2024-06-09 17:20:30', '2024-06-09 18:09:09');
INSERT INTO `monitor_data_map_node` VALUES (23, '129101', '10041', '异步发奖品(结果)', 'big-market', 'com.kou.trigger.listener.SendAwardCustomer', 'listener', '120 450', '#006400', '2024-06-09 17:20:30', '2024-06-09 18:09:19');
INSERT INTO `monitor_data_map_node` VALUES (24, '129101', '10042', '抽奖失败啦(结果)', 'big-market', 'com.kou.trigger.http.RaffleActivityController', 'draw', '350 450', '#B22222', '2024-06-09 17:20:30', '2024-06-09 18:09:33');

-- ----------------------------
-- Table structure for monitor_data_map_node_field
-- ----------------------------
DROP TABLE IF EXISTS `monitor_data_map_node_field`;
CREATE TABLE `monitor_data_map_node_field`  (
  `id` bigint(0) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `monitor_id` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '监控ID',
  `monitor_node_id` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '节点ID',
  `log_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '日志名称；执行抽奖开始 userId',
  `log_index` int(0) NOT NULL DEFAULT 0 COMMENT '解析顺序；第几个字段',
  `log_type` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'Object' COMMENT '字段类型；Object、String',
  `attribute_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '属性名称',
  `attribute_field` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '属性字段',
  `attribute_ognl` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '解析公式',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '监控数据地图节点字段配置' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of monitor_data_map_node_field
-- ----------------------------
INSERT INTO `monitor_data_map_node_field` VALUES (1, '129009', '1001', '', 3, 'Object', '用户ID', 'userId', 'userId', '2024-05-21 08:38:01', '2024-05-24 15:09:20');
INSERT INTO `monitor_data_map_node_field` VALUES (2, '129009', '1001', '', 3, 'Object', '订单ID', 'orderId', 'orderId', '2024-05-21 08:38:01', '2024-05-24 15:09:21');
INSERT INTO `monitor_data_map_node_field` VALUES (3, '129009', '1002', '', 3, 'Object', '用户ID', 'userId', 'userId', '2024-05-21 08:38:01', '2024-05-24 15:09:20');
INSERT INTO `monitor_data_map_node_field` VALUES (4, '129009', '1003', '', 3, 'Object', '用户ID', 'userId', 'userId', '2024-05-21 08:38:01', '2024-05-24 15:09:20');
INSERT INTO `monitor_data_map_node_field` VALUES (5, '129009', '1004', '活动抽奖开始', 3, 'Object', '用户ID', 'userId', 'userId', '2024-05-21 08:38:01', '2024-06-09 16:17:02');
INSERT INTO `monitor_data_map_node_field` VALUES (6, '129009', '1005', '活动抽奖开始', 3, 'Object', '用户ID', 'userId', 'userId', '2024-05-21 08:38:01', '2024-06-09 16:17:02');
INSERT INTO `monitor_data_map_node_field` VALUES (7, '129101', '1001', '活动抽奖开始', 1, 'String', '用户ID', 'userId', 'userId', '2024-06-09 16:26:18', '2024-06-09 16:26:18');
INSERT INTO `monitor_data_map_node_field` VALUES (8, '129101', '10011', '创建活动抽奖单开始', 1, 'String', '用户ID', 'userId', 'userId', '2024-06-09 16:26:18', '2024-06-09 16:26:18');
INSERT INTO `monitor_data_map_node_field` VALUES (9, '129101', '10012', '创建活动抽奖单失败，活动状态未开启', 1, 'String', '用户ID', 'userId', 'userId', '2024-06-09 16:26:18', '2024-06-09 16:29:45');
INSERT INTO `monitor_data_map_node_field` VALUES (10, '129101', '10013', '创建活动抽奖单失败，活动时间未开始', 1, 'String', '用户ID', 'userId', 'userId', '2024-06-09 16:26:18', '2024-06-09 16:30:17');
INSERT INTO `monitor_data_map_node_field` VALUES (11, '129101', '10014', '创建参与活动订单存在', 1, 'String', '用户ID', 'userId', 'userId', '2024-06-09 16:26:18', '2024-06-09 16:30:29');
INSERT INTO `monitor_data_map_node_field` VALUES (12, '129101', '10015', '创建活动抽奖单完成', 1, 'String', '用户ID', 'userId', 'userId', '2024-06-09 16:26:18', '2024-06-09 16:30:34');
INSERT INTO `monitor_data_map_node_field` VALUES (13, '129101', '1002', '抽奖策略计算', 1, 'String', '用户ID', 'userId', 'userId', '2024-06-09 16:26:18', '2024-06-09 17:32:37');
INSERT INTO `monitor_data_map_node_field` VALUES (14, '129101', '10021', '抽奖策略-责任链', 1, 'String', '用户ID', 'userId', 'userId', '2024-06-09 16:26:18', '2024-06-09 17:33:29');
INSERT INTO `monitor_data_map_node_field` VALUES (15, '129101', '100211', '抽奖责任链-黑名单接管', 1, 'String', '用户ID', 'userId', 'userId', '2024-06-09 16:26:18', '2024-06-09 17:52:15');
INSERT INTO `monitor_data_map_node_field` VALUES (16, '129101', '100212', '抽奖责任链-权重接管', 1, 'String', '用户ID', 'userId', 'userId', '2024-06-09 16:26:18', '2024-06-09 17:52:40');
INSERT INTO `monitor_data_map_node_field` VALUES (17, '129101', '100213', '抽奖责任链-默认处理', 1, 'String', '用户ID', 'userId', 'userId', '2024-06-09 16:26:18', '2024-06-09 17:34:18');
INSERT INTO `monitor_data_map_node_field` VALUES (18, '129101', '10031', '抽奖策略-规则树', 1, 'String', '用户ID', 'userId', 'userId', '2024-06-09 16:26:18', '2024-06-09 17:35:04');
INSERT INTO `monitor_data_map_node_field` VALUES (19, '129101', '100311', '规则过滤-次数锁', 1, 'String', '用户ID', 'userId', 'userId', '2024-06-09 16:26:18', '2024-06-09 17:35:13');
INSERT INTO `monitor_data_map_node_field` VALUES (20, '129101', '100312', '规则过滤-库存扣减', 1, 'String', '用户ID', 'userId', 'userId', '2024-06-09 16:26:18', '2024-06-09 17:35:20');
INSERT INTO `monitor_data_map_node_field` VALUES (21, '129101', '100313', '规则过滤-兜底奖品', 1, 'String', '用户ID', 'userId', 'userId', '2024-06-09 16:26:18', '2024-06-09 17:35:28');
INSERT INTO `monitor_data_map_node_field` VALUES (22, '129101', '1004', '中奖记录保存完成', 1, 'String', '用户ID', 'userId', 'userId', '2024-06-09 16:26:18', '2024-06-09 17:32:37');
INSERT INTO `monitor_data_map_node_field` VALUES (23, '129101', '10041', '监听用户奖品发送消息，发奖完成', 1, 'String', '用户ID', 'userId', 'userId', '2024-06-09 16:26:18', '2024-06-09 17:32:37');
INSERT INTO `monitor_data_map_node_field` VALUES (24, '129101', '10042', '活动抽奖失败', 1, 'String', '用户ID', 'userId', 'userId', '2024-06-09 16:26:18', '2024-06-09 17:32:37');

-- ----------------------------
-- Table structure for monitor_data_map_node_link
-- ----------------------------
DROP TABLE IF EXISTS `monitor_data_map_node_link`;
CREATE TABLE `monitor_data_map_node_link`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `monitor_id` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '监控ID',
  `from_monitor_node_id` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'from 监控ID',
  `to_monitor_node_id` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'to 监控ID',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 76 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '监控数据地图节点链路配置' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of monitor_data_map_node_link
-- ----------------------------
INSERT INTO `monitor_data_map_node_link` VALUES (1, '129009', '1001', '1002', '2024-05-28 14:14:24', '2024-05-28 14:14:24');
INSERT INTO `monitor_data_map_node_link` VALUES (2, '129009', '1002', '1003', '2024-05-28 14:14:24', '2024-05-28 14:14:24');
INSERT INTO `monitor_data_map_node_link` VALUES (3, '129009', '1002', '1004', '2024-05-28 14:14:24', '2024-05-28 14:14:24');
INSERT INTO `monitor_data_map_node_link` VALUES (58, '129101', '1001', '10011', '2024-06-09 18:41:29', '2024-06-09 18:41:29');
INSERT INTO `monitor_data_map_node_link` VALUES (59, '129101', '10011', '10012', '2024-06-09 18:41:29', '2024-06-09 18:41:29');
INSERT INTO `monitor_data_map_node_link` VALUES (60, '129101', '10011', '10013', '2024-06-09 18:41:29', '2024-06-09 18:41:29');
INSERT INTO `monitor_data_map_node_link` VALUES (61, '129101', '10011', '10014', '2024-06-09 18:41:29', '2024-06-09 18:41:29');
INSERT INTO `monitor_data_map_node_link` VALUES (62, '129101', '10011', '10015', '2024-06-09 18:41:29', '2024-06-09 18:41:29');
INSERT INTO `monitor_data_map_node_link` VALUES (63, '129101', '10015', '1002', '2024-06-09 18:41:29', '2024-06-09 18:41:29');
INSERT INTO `monitor_data_map_node_link` VALUES (64, '129101', '1002', '10021', '2024-06-09 18:41:29', '2024-06-09 18:41:29');
INSERT INTO `monitor_data_map_node_link` VALUES (65, '129101', '10021', '100211', '2024-06-09 18:41:29', '2024-06-09 18:41:29');
INSERT INTO `monitor_data_map_node_link` VALUES (66, '129101', '100211', '100212', '2024-06-09 18:41:29', '2024-06-09 18:41:29');
INSERT INTO `monitor_data_map_node_link` VALUES (67, '129101', '100212', '100213', '2024-06-09 18:41:29', '2024-06-09 18:41:29');
INSERT INTO `monitor_data_map_node_link` VALUES (68, '129101', '1002', '10031', '2024-06-09 18:41:29', '2024-06-09 18:41:29');
INSERT INTO `monitor_data_map_node_link` VALUES (69, '129101', '10031', '100311', '2024-06-09 18:41:29', '2024-06-09 18:41:29');
INSERT INTO `monitor_data_map_node_link` VALUES (70, '129101', '10031', '100312', '2024-06-09 18:41:29', '2024-06-09 18:41:29');
INSERT INTO `monitor_data_map_node_link` VALUES (71, '129101', '10031', '100313', '2024-06-09 18:41:29', '2024-06-09 18:41:29');
INSERT INTO `monitor_data_map_node_link` VALUES (72, '129101', '10011', '1004', '2024-06-09 18:41:29', '2024-06-09 18:41:29');
INSERT INTO `monitor_data_map_node_link` VALUES (73, '129101', '1004', '10041', '2024-06-09 18:41:29', '2024-06-09 18:41:29');
INSERT INTO `monitor_data_map_node_link` VALUES (74, '129101', '1004', '10042', '2024-06-09 18:41:29', '2024-06-09 18:41:29');
INSERT INTO `monitor_data_map_node_link` VALUES (75, '129101', '10014', '1002', '2024-06-09 18:41:29', '2024-06-09 18:41:29');

SET FOREIGN_KEY_CHECKS = 1;
