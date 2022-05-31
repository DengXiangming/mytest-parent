/*
 Navicat Premium Data Transfer

 Source Server         : mytxy
 Source Server Type    : MySQL
 Source Server Version : 80029
 Source Host           : mytxy:3316
 Source Schema         : seata_order

 Target Server Type    : MySQL
 Target Server Version : 80029
 File Encoding         : 65001

 Date: 24/05/2022 15:26:38
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tab_order
-- ----------------------------
DROP TABLE IF EXISTS `tab_order`;
CREATE TABLE `tab_order` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint DEFAULT NULL COMMENT '用户id',
  `product_id` bigint DEFAULT NULL COMMENT '产品id',
  `count` int DEFAULT NULL COMMENT '数量',
  `money` decimal(11,0) DEFAULT NULL COMMENT '金额',
  `status` int DEFAULT NULL COMMENT '订单状态：0：创建中；1：已完成',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of tab_order
-- ----------------------------
BEGIN;
INSERT INTO `tab_order` (`id`, `user_id`, `product_id`, `count`, `money`, `status`) VALUES (2, 1, 1, NULL, 88, NULL);
INSERT INTO `tab_order` (`id`, `user_id`, `product_id`, `count`, `money`, `status`) VALUES (3, 1, 1, NULL, 88, NULL);
INSERT INTO `tab_order` (`id`, `user_id`, `product_id`, `count`, `money`, `status`) VALUES (4, 1, 2, NULL, 88, NULL);
COMMIT;

-- ----------------------------
-- Table structure for undo_log
-- ----------------------------
DROP TABLE IF EXISTS `undo_log`;
CREATE TABLE `undo_log` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `branch_id` bigint NOT NULL,
  `xid` varchar(100) NOT NULL,
  `context` varchar(128) NOT NULL,
  `rollback_info` longblob NOT NULL,
  `log_status` int NOT NULL,
  `log_created` datetime NOT NULL,
  `log_modified` datetime NOT NULL,
  `ext` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ux_undo_log` (`xid`,`branch_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of undo_log
-- ----------------------------
BEGIN;
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
