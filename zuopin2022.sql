/*
 Navicat Premium Data Transfer

 Source Server         : root
 Source Server Type    : MySQL
 Source Server Version : 50553
 Source Host           : localhost:3306
 Source Schema         : zuopin2022

 Target Server Type    : MySQL
 Target Server Version : 50553
 File Encoding         : 65001

 Date: 17/05/2022 14:34:16
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for loginfo
-- ----------------------------
DROP TABLE IF EXISTS `loginfo`;
CREATE TABLE `loginfo`  (
  `logid` int(11) NOT NULL AUTO_INCREMENT,
  `userid` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `logintime` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`logid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 94 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of loginfo
-- ----------------------------
INSERT INTO `loginfo` VALUES (1, '1', '2015-11-18 18:11:06');
INSERT INTO `loginfo` VALUES (37, '1', '2017-10-14 11:39:27');
INSERT INTO `loginfo` VALUES (38, '1', '2017-10-14 14:30:54');
INSERT INTO `loginfo` VALUES (39, '1', '2017-10-14 15:00:07');
INSERT INTO `loginfo` VALUES (40, '1', '2018-10-27 09:32:58');
INSERT INTO `loginfo` VALUES (41, '1', '2018-10-27 09:59:23');
INSERT INTO `loginfo` VALUES (42, '1', '2018-10-27 10:15:16');
INSERT INTO `loginfo` VALUES (43, '1', '2018-10-27 10:17:27');
INSERT INTO `loginfo` VALUES (44, '1', '2018-10-27 10:21:08');
INSERT INTO `loginfo` VALUES (45, '1', '2018-10-27 10:27:48');
INSERT INTO `loginfo` VALUES (46, '1', '2018-10-27 10:31:05');
INSERT INTO `loginfo` VALUES (47, '1', '2018-10-27 10:40:43');
INSERT INTO `loginfo` VALUES (48, '1', '2018-10-27 11:03:23');
INSERT INTO `loginfo` VALUES (49, '1', '2018-10-27 11:13:17');
INSERT INTO `loginfo` VALUES (50, '1', '2018-10-27 11:33:43');
INSERT INTO `loginfo` VALUES (51, '1', '2018-10-27 11:48:54');
INSERT INTO `loginfo` VALUES (52, '1', '2018-10-27 14:43:03');
INSERT INTO `loginfo` VALUES (53, '1', '2018-10-27 15:03:30');
INSERT INTO `loginfo` VALUES (54, '1', '2018-10-27 15:08:55');
INSERT INTO `loginfo` VALUES (55, '1', '2018-10-27 15:12:31');
INSERT INTO `loginfo` VALUES (56, '1', '2018-10-27 15:21:31');
INSERT INTO `loginfo` VALUES (57, '1', '2018-10-27 15:22:44');
INSERT INTO `loginfo` VALUES (58, '1', '2018-10-27 15:26:06');
INSERT INTO `loginfo` VALUES (59, '1', '2018-10-27 15:32:30');
INSERT INTO `loginfo` VALUES (60, '1', '2018-10-27 15:36:44');
INSERT INTO `loginfo` VALUES (61, '1', '2018-10-27 15:52:02');
INSERT INTO `loginfo` VALUES (62, '1', '2018-10-27 16:06:50');
INSERT INTO `loginfo` VALUES (63, '1', '2018-10-27 16:09:22');
INSERT INTO `loginfo` VALUES (64, '1', '2018-10-27 16:09:31');
INSERT INTO `loginfo` VALUES (65, '1', '2018-10-27 16:12:58');
INSERT INTO `loginfo` VALUES (66, '1', '2018-10-27 16:19:36');
INSERT INTO `loginfo` VALUES (67, '1', '2018-10-27 16:24:19');
INSERT INTO `loginfo` VALUES (68, '1', '2018-10-27 16:30:12');
INSERT INTO `loginfo` VALUES (69, '1', '2018-10-27 16:30:27');
INSERT INTO `loginfo` VALUES (70, '1', '2018-10-27 16:39:00');
INSERT INTO `loginfo` VALUES (71, '1', '2018-10-27 16:39:09');
INSERT INTO `loginfo` VALUES (72, '1', '2018-10-27 16:44:47');
INSERT INTO `loginfo` VALUES (73, '1', '2018-10-27 16:47:34');
INSERT INTO `loginfo` VALUES (74, '1', '2018-10-27 18:53:53');
INSERT INTO `loginfo` VALUES (75, '1', '2018-10-27 18:54:12');
INSERT INTO `loginfo` VALUES (76, '1', '2018-10-27 19:01:15');
INSERT INTO `loginfo` VALUES (77, '1', '2018-10-27 19:05:21');
INSERT INTO `loginfo` VALUES (78, '1', '2018-10-27 19:06:17');
INSERT INTO `loginfo` VALUES (79, '1', '2018-10-27 19:12:36');
INSERT INTO `loginfo` VALUES (80, '1', '2018-10-27 19:19:13');
INSERT INTO `loginfo` VALUES (81, '1', '2018-10-27 19:20:26');
INSERT INTO `loginfo` VALUES (82, '1', '2018-10-27 19:21:49');
INSERT INTO `loginfo` VALUES (83, '1', '2018-10-27 19:25:19');
INSERT INTO `loginfo` VALUES (84, '1', '2018-10-27 19:32:32');
INSERT INTO `loginfo` VALUES (85, '1', '2018-10-27 19:35:12');
INSERT INTO `loginfo` VALUES (86, '1', '2018-10-27 19:42:36');
INSERT INTO `loginfo` VALUES (87, '1', '2018-10-27 19:44:48');
INSERT INTO `loginfo` VALUES (88, '1', '2018-10-27 19:57:46');
INSERT INTO `loginfo` VALUES (89, '1', '2018-10-27 20:33:33');
INSERT INTO `loginfo` VALUES (90, '1', '2018-10-27 20:34:14');
INSERT INTO `loginfo` VALUES (91, '1', '2018-10-27 20:39:23');
INSERT INTO `loginfo` VALUES (92, '1', '2018-10-27 20:40:07');
INSERT INTO `loginfo` VALUES (93, '1', '2018-10-27 20:40:17');

-- ----------------------------
-- Table structure for member
-- ----------------------------
DROP TABLE IF EXISTS `member`;
CREATE TABLE `member`  (
  `member_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '专业编号',
  `member_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '专业名',
  PRIMARY KEY (`member_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of member
-- ----------------------------
INSERT INTO `member` VALUES ('01', '张三');
INSERT INTO `member` VALUES ('02', '李四');
INSERT INTO `member` VALUES ('03', '王五');
INSERT INTO `member` VALUES ('04', '马六');
INSERT INTO `member` VALUES ('05', '侯七');
INSERT INTO `member` VALUES ('06', '杨八');

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message`  (
  `message_id` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '编号',
  `message_tit` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '留言主题',
  `messagekind_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '留言分类编号',
  `message_content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '内容',
  `message_date` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '时间',
  `message_reply` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '回复信息',
  PRIMARY KEY (`message_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES ('1010', '主题1', '10', '内容1', '2022年5月15日10:36:16', '回复1');
INSERT INTO `message` VALUES ('1011', '主题2', '10', '内容2', '2022年5月15日08:17:41', '回复2');
INSERT INTO `message` VALUES ('1012', '主题3', '11', '内容3', '2022年5月15日08:17:48', '回复3');
INSERT INTO `message` VALUES ('1013', '主题4', '12', '内容4', '2022年5月15日08:18:00', '回复4');
INSERT INTO `message` VALUES ('1014', '主题5', '10', '内容5', '2022年5月15日08:18:10', '回复5');
INSERT INTO `message` VALUES ('1015', '主题6', '10', '内容6', '2022年5月15日08:18:16', '回复6');
INSERT INTO `message` VALUES ('1016', '主题7', '10', '内容7', '2022年5月15日08:18:20', '回复7');
INSERT INTO `message` VALUES ('1017', '主题8', '11', '内容8', '2022年5月15日08:18:24', '回复8');
INSERT INTO `message` VALUES ('1018', '主题9', '12', '内容9', '2022年5月15日08:18:28', '回复9');
INSERT INTO `message` VALUES ('1019', '主题10', '10', '内容10', '2022年5月15日08:18:37', '回复10');
INSERT INTO `message` VALUES ('1020', '主题11', '12', '内容11', '2022年5月15日08:18:40', '回复1122');
INSERT INTO `message` VALUES ('qqq', 'qqq', '10', 'qqq', 'qq', 'qqq');

-- ----------------------------
-- Table structure for messagekind
-- ----------------------------
DROP TABLE IF EXISTS `messagekind`;
CREATE TABLE `messagekind`  (
  `messagekind_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分类编号',
  `messagekind_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分类名',
  `messagekind_remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '附加说明',
  `member_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审核人编号',
  PRIMARY KEY (`messagekind_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of messagekind
-- ----------------------------
INSERT INTO `messagekind` VALUES ('10', '系统留言', '分类说明', '01');
INSERT INTO `messagekind` VALUES ('11', '活动留言', '分类说明', '01');
INSERT INTO `messagekind` VALUES ('12', '日常留言', '分类说明', '02');

-- ----------------------------
-- Table structure for role_module
-- ----------------------------
DROP TABLE IF EXISTS `role_module`;
CREATE TABLE `role_module`  (
  `role_id` int(11) NOT NULL DEFAULT 0,
  `module_id` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`role_id`, `module_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of role_module
-- ----------------------------
INSERT INTO `role_module` VALUES (1, 1);
INSERT INTO `role_module` VALUES (1, 2);
INSERT INTO `role_module` VALUES (1, 3);
INSERT INTO `role_module` VALUES (1, 9);
INSERT INTO `role_module` VALUES (1, 10);
INSERT INTO `role_module` VALUES (1, 13);
INSERT INTO `role_module` VALUES (1, 14);
INSERT INTO `role_module` VALUES (1, 15);
INSERT INTO `role_module` VALUES (1, 16);
INSERT INTO `role_module` VALUES (1, 17);
INSERT INTO `role_module` VALUES (1, 18);
INSERT INTO `role_module` VALUES (1, 19);
INSERT INTO `role_module` VALUES (1, 20);
INSERT INTO `role_module` VALUES (1, 21);
INSERT INTO `role_module` VALUES (1, 23);
INSERT INTO `role_module` VALUES (1, 24);
INSERT INTO `role_module` VALUES (1, 25);
INSERT INTO `role_module` VALUES (1, 26);
INSERT INTO `role_module` VALUES (1, 27);
INSERT INTO `role_module` VALUES (1, 28);
INSERT INTO `role_module` VALUES (1, 29);
INSERT INTO `role_module` VALUES (1, 30);
INSERT INTO `role_module` VALUES (1, 31);
INSERT INTO `role_module` VALUES (2, 1);
INSERT INTO `role_module` VALUES (2, 3);
INSERT INTO `role_module` VALUES (2, 13);
INSERT INTO `role_module` VALUES (2, 14);
INSERT INTO `role_module` VALUES (2, 15);
INSERT INTO `role_module` VALUES (2, 20);
INSERT INTO `role_module` VALUES (2, 21);
INSERT INTO `role_module` VALUES (3, 1);
INSERT INTO `role_module` VALUES (3, 2);
INSERT INTO `role_module` VALUES (3, 3);
INSERT INTO `role_module` VALUES (3, 8);
INSERT INTO `role_module` VALUES (3, 10);
INSERT INTO `role_module` VALUES (5, 1);
INSERT INTO `role_module` VALUES (5, 2);
INSERT INTO `role_module` VALUES (5, 3);
INSERT INTO `role_module` VALUES (5, 4);
INSERT INTO `role_module` VALUES (5, 8);
INSERT INTO `role_module` VALUES (8, 1);
INSERT INTO `role_module` VALUES (8, 17);

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `oper_module` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作模块',
  `oper_method` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作了哪个方法',
  `oper_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作类型，例如查询删除等',
  `oper_desc` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作描述',
  `req_method` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求方法',
  `oper_param` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求参数',
  `oper_ip` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求IP',
  `oper_uri` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求地址',
  `oper_user` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作人',
  `create_time` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 40 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (1, '部门管理', 'com.laoxu.java.authman.controller.SysDeptController.add', '修改', '修改部门', 'POST', 'SysDept(id=null, pid=1, pids=null, deptName=销售部, deptCode=sales, pname=沙逛鱼科技, createTime=null, createUser=null, updateTime=null, updateUser=null)', '0:0:0:0:0:0:0:1', '/authman/sysDept/save', 'admin', '2021-04-13 23:38:09');
INSERT INTO `sys_oper_log` VALUES (2, '部门管理', 'com.laoxu.java.authman.controller.SysDeptController.remove', '删除', '删除部门', 'POST', '{id:8}\n', '0:0:0:0:0:0:0:1', '/authman/sysDept/remove', 'admin', '2021-04-13 23:38:29');
INSERT INTO `sys_oper_log` VALUES (3, '部门管理', 'com.laoxu.java.authman.controller.SysDeptController.add', '修改', '修改部门', 'POST', 'SysDept(id=null, pid=1, pids=null, deptName=销售部, deptCode=sales, pname=沙逛鱼科技, createTime=null, createUser=null, updateTime=null, updateUser=null)', '0:0:0:0:0:0:0:1', '/authman/sysDept/save', 'admin', '2021-04-13 23:39:43');
INSERT INTO `sys_oper_log` VALUES (4, '部门管理', 'com.laoxu.java.authman.controller.SysDeptController.remove', '删除', '删除部门', 'POST', '{id:9}\n', '0:0:0:0:0:0:0:1', '/authman/sysDept/remove', 'admin', '2021-04-13 23:39:46');
INSERT INTO `sys_oper_log` VALUES (5, '部门管理', 'com.laoxu.java.authman.controller.SysDeptController.add', '修改', '修改部门', 'POST', 'SysDept(id=null, pid=1, pids=null, deptName=销售部, deptCode=sales, pname=沙逛鱼科技, createTime=null, createUser=null, updateTime=null, updateUser=null)', '0:0:0:0:0:0:0:1', '/authman/sysDept/save', 'admin', '2021-04-13 23:40:05');
INSERT INTO `sys_oper_log` VALUES (6, '部门管理', 'com.laoxu.java.authman.controller.SysDeptController.add', '修改', '修改部门', 'POST', 'SysDept(id=null, pid=1, pids=null, deptName=aa, deptCode=aa, pname=沙逛鱼科技, createTime=null, createUser=null, updateTime=null, updateUser=null)', '0:0:0:0:0:0:0:1', '/authman/sysDept/save', 'admin', '2021-04-13 23:40:34');
INSERT INTO `sys_oper_log` VALUES (7, '部门管理', 'com.laoxu.java.authman.controller.SysDeptController.add', '修改', '修改部门', 'POST', 'SysDept(id=null, pid=1, pids=null, deptName=bb, deptCode=bb, pname=沙逛鱼科技, createTime=null, createUser=null, updateTime=null, updateUser=null)', '0:0:0:0:0:0:0:1', '/authman/sysDept/save', 'admin', '2021-04-13 23:41:05');
INSERT INTO `sys_oper_log` VALUES (8, '部门管理', 'com.laoxu.java.authman.controller.SysDeptController.add', '修改', '修改部门', 'POST', 'SysDept(id=null, pid=1, pids=null, deptName=cc, deptCode=cc, pname=沙逛鱼科技, createTime=null, createUser=null, updateTime=null, updateUser=null)', '0:0:0:0:0:0:0:1', '/authman/sysDept/save', 'admin', '2021-04-13 23:41:26');
INSERT INTO `sys_oper_log` VALUES (9, '部门管理', 'com.laoxu.java.authman.controller.SysDeptController.add', '修改', '修改部门', 'POST', 'SysDept(id=null, pid=1, pids=null, deptName=dd, deptCode=dd, pname=沙逛鱼科技, createTime=null, createUser=null, updateTime=null, updateUser=null)', '0:0:0:0:0:0:0:1', '/authman/sysDept/save', 'admin', '2021-04-13 23:41:48');
INSERT INTO `sys_oper_log` VALUES (10, '部门管理', 'com.laoxu.java.authman.controller.SysDeptController.add', '修改', '修改部门', 'POST', 'SysDept(id=null, pid=1, pids=null, deptName=ee, deptCode=ee, pname=沙逛鱼科技, createTime=null, createUser=null, updateTime=null, updateUser=null)', '0:0:0:0:0:0:0:1', '/authman/sysDept/save', 'admin', '2021-04-13 23:42:09');
INSERT INTO `sys_oper_log` VALUES (11, '部门管理', 'com.laoxu.java.authman.controller.SysDeptController.remove', '删除', '删除部门', 'POST', '{id:12}\n', '0:0:0:0:0:0:0:1', '/authman/sysDept/remove', 'admin', '2021-04-13 23:44:02');
INSERT INTO `sys_oper_log` VALUES (12, '部门管理', 'com.laoxu.java.authman.controller.SysDeptController.remove', '删除', '删除部门', 'POST', '{id:13}\n', '0:0:0:0:0:0:0:1', '/authman/sysDept/remove', 'admin', '2021-04-13 23:44:03');
INSERT INTO `sys_oper_log` VALUES (13, '部门管理', 'com.laoxu.java.authman.controller.SysDeptController.remove', '删除', '删除部门', 'POST', '{id:14}\n', '0:0:0:0:0:0:0:1', '/authman/sysDept/remove', 'admin', '2021-04-13 23:44:05');
INSERT INTO `sys_oper_log` VALUES (14, '部门管理', 'com.laoxu.java.authman.controller.SysDeptController.remove', '删除', '删除部门', 'POST', '{id:15}\n', '0:0:0:0:0:0:0:1', '/authman/sysDept/remove', 'admin', '2021-04-13 23:44:08');
INSERT INTO `sys_oper_log` VALUES (15, '部门管理', 'com.laoxu.java.authman.controller.SysDeptController.add', '修改', '修改部门', 'POST', 'SysDept(id=null, pid=null, pids=null, deptName=bb, deptCode=bb, pname=沙逛鱼科技, createTime=null, createUser=null, updateTime=null, updateUser=null)', '0:0:0:0:0:0:0:1', '/authman/sysDept/save', 'admin', '2021-04-13 23:44:14');
INSERT INTO `sys_oper_log` VALUES (16, '部门管理', 'com.laoxu.java.authman.controller.SysDeptController.add', '修改', '修改部门', 'POST', 'SysDept(id=null, pid=1, pids=null, deptName=cc, deptCode=cc, pname=沙逛鱼科技, createTime=null, createUser=null, updateTime=null, updateUser=null)', '0:0:0:0:0:0:0:1', '/authman/sysDept/save', 'admin', '2021-04-13 23:47:43');
INSERT INTO `sys_oper_log` VALUES (17, '部门管理', 'com.laoxu.java.authman.controller.SysDeptController.add', '修改', '修改部门', 'POST', 'SysDept(id=null, pid=1, pids=null, deptName=dd, deptCode=dd, pname=沙逛鱼科技, createTime=null, createUser=null, updateTime=null, updateUser=null)', '0:0:0:0:0:0:0:1', '/authman/sysDept/save', 'admin', '2021-04-13 23:48:19');
INSERT INTO `sys_oper_log` VALUES (18, '部门管理', 'com.laoxu.java.authman.controller.SysDeptController.add', '修改', '修改部门', 'POST', 'SysDept(id=null, pid=1, pids=null, deptName=ee, deptCode=ee, pname=沙逛鱼科技, createTime=null, createUser=null, updateTime=null, updateUser=null)', '0:0:0:0:0:0:0:1', '/authman/sysDept/save', 'admin', '2021-04-13 23:48:52');
INSERT INTO `sys_oper_log` VALUES (19, '部门管理', 'com.laoxu.java.authman.controller.SysDeptController.remove', '删除', '删除部门', 'POST', '{id:18}\n', '0:0:0:0:0:0:0:1', '/authman/sysDept/remove', 'admin', '2021-04-13 23:49:00');
INSERT INTO `sys_oper_log` VALUES (20, '部门管理', 'com.laoxu.java.authman.controller.SysDeptController.remove', '删除', '删除部门', 'POST', '{id:17}\n', '0:0:0:0:0:0:0:1', '/authman/sysDept/remove', 'admin', '2021-04-13 23:49:02');
INSERT INTO `sys_oper_log` VALUES (21, '部门管理', 'com.laoxu.java.authman.controller.SysDeptController.remove', '删除', '删除部门', 'POST', '{id:16}\n', '0:0:0:0:0:0:0:1', '/authman/sysDept/remove', 'admin', '2021-04-13 23:49:04');
INSERT INTO `sys_oper_log` VALUES (22, '部门管理', 'com.laoxu.java.authman.controller.SysDeptController.remove', '删除', '删除部门', 'POST', '{id:11}\n', '0:0:0:0:0:0:0:1', '/authman/sysDept/remove', 'admin', '2021-04-13 23:49:06');
INSERT INTO `sys_oper_log` VALUES (23, '部门管理', 'com.laoxu.java.authman.controller.SysDeptController.add', '修改', '修改部门', 'POST', 'SysDept(id=null, pid=1, pids=null, deptName=aa, deptCode=aa, pname=沙逛鱼科技, createTime=null, createUser=null, updateTime=null, updateUser=null)', '0:0:0:0:0:0:0:1', '/authman/sysDept/save', 'admin', '2021-04-13 23:49:24');
INSERT INTO `sys_oper_log` VALUES (24, '部门管理', 'com.laoxu.java.authman.controller.SysDeptController.add', '修改', '修改部门', 'POST', 'SysDept(id=null, pid=1, pids=null, deptName=bb, deptCode=bb, pname=沙逛鱼科技, createTime=null, createUser=null, updateTime=null, updateUser=null)', '0:0:0:0:0:0:0:1', '/authman/sysDept/save', 'admin', '2021-04-13 23:49:48');
INSERT INTO `sys_oper_log` VALUES (25, '部门管理', 'com.laoxu.java.authman.controller.SysDeptController.add', '修改', '修改部门', 'POST', 'SysDept(id=null, pid=1, pids=null, deptName=cc, deptCode=cc, pname=沙逛鱼科技, createTime=null, createUser=null, updateTime=null, updateUser=null)', '0:0:0:0:0:0:0:1', '/authman/sysDept/save', 'admin', '2021-04-13 23:49:59');
INSERT INTO `sys_oper_log` VALUES (26, '部门管理', 'com.laoxu.java.authman.controller.SysDeptController.remove', '删除', '删除部门', 'POST', '{id:20}\n', '0:0:0:0:0:0:0:1', '/authman/sysDept/remove', 'admin', '2021-04-13 23:50:04');
INSERT INTO `sys_oper_log` VALUES (27, '部门管理', 'com.laoxu.java.authman.controller.SysDeptController.remove', '删除', '删除部门', 'POST', '{id:21}\n', '0:0:0:0:0:0:0:1', '/authman/sysDept/remove', 'admin', '2021-04-13 23:50:06');
INSERT INTO `sys_oper_log` VALUES (28, '部门管理', 'com.laoxu.java.authman.controller.SysDeptController.remove', '删除', '删除部门', 'POST', '{id:19}\n', '0:0:0:0:0:0:0:1', '/authman/sysDept/remove', 'admin', '2021-04-13 23:50:08');
INSERT INTO `sys_oper_log` VALUES (29, '部门管理', 'com.laoxu.java.authman.controller.SysDeptController.add', '修改', '修改部门', 'POST', 'SysDept(id=null, pid=1, pids=null, deptName=aa, deptCode=aa, pname=沙逛鱼科技, createTime=null, createUser=null, updateTime=null, updateUser=null)', '0:0:0:0:0:0:0:1', '/authman/sysDept/save', 'admin', '2021-04-13 23:50:23');
INSERT INTO `sys_oper_log` VALUES (30, '部门管理', 'com.laoxu.java.authman.controller.SysDeptController.remove', '删除', '删除部门', 'POST', '{id:22}\n', '0:0:0:0:0:0:0:1', '/authman/sysDept/remove', 'admin', '2021-04-13 23:50:27');
INSERT INTO `sys_oper_log` VALUES (31, '部门管理', 'com.laoxu.java.authman.controller.SysDeptController.remove', '删除', '删除部门', 'POST', '{id:10}\n', '0:0:0:0:0:0:0:1', '/authman/sysDept/remove', 'admin', '2021-04-13 23:51:05');
INSERT INTO `sys_oper_log` VALUES (32, '部门管理', 'com.laoxu.java.authman.controller.SysDeptController.add', '修改', '修改部门', 'POST', 'SysDept(id=null, pid=1, pids=null, deptName=销售部, deptCode=sales, pname=沙逛鱼科技, createTime=null, createUser=null, updateTime=null, updateUser=null)', '0:0:0:0:0:0:0:1', '/authman/sysDept/save', 'admin', '2021-04-13 23:51:16');
INSERT INTO `sys_oper_log` VALUES (33, '部门管理', 'com.laoxu.java.authman.controller.SysDeptController.add', '修改', '修改部门', 'POST', 'SysDept(id=null, pid=1, pids=null, deptName=cc, deptCode=cc, pname=沙逛鱼科技, createTime=null, createUser=null, updateTime=null, updateUser=null)', '0:0:0:0:0:0:0:1', '/authman/sysDept/save', 'admin', '2021-04-13 23:51:45');
INSERT INTO `sys_oper_log` VALUES (34, '部门管理', 'com.laoxu.java.authman.controller.SysDeptController.add', '修改', '修改部门', 'POST', 'SysDept(id=null, pid=1, pids=null, deptName=aa, deptCode=aa, pname=沙逛鱼科技, createTime=null, createUser=null, updateTime=null, updateUser=null)', '0:0:0:0:0:0:0:1', '/authman/sysDept/save', 'admin', '2021-04-13 23:52:00');
INSERT INTO `sys_oper_log` VALUES (35, '部门管理', 'com.laoxu.java.authman.controller.SysDeptController.remove', '删除', '删除部门', 'POST', '{id:25}\n', '0:0:0:0:0:0:0:1', '/authman/sysDept/remove', 'admin', '2021-04-13 23:53:17');
INSERT INTO `sys_oper_log` VALUES (36, '部门管理', 'com.laoxu.java.authman.controller.SysDeptController.remove', '删除', '删除部门', 'POST', '{id:24}\n', '0:0:0:0:0:0:0:1', '/authman/sysDept/remove', 'admin', '2021-04-13 23:53:18');
INSERT INTO `sys_oper_log` VALUES (37, '部门管理', 'com.laoxu.java.authman.controller.SysDeptController.add', '修改', '修改部门', 'POST', 'SysDept(id=null, pid=1, pids=null, deptName=aa, deptCode=aa, pname=沙逛鱼科技, createTime=null, createUser=null, updateTime=null, updateUser=null)', '0:0:0:0:0:0:0:1', '/authman/sysDept/save', 'admin', '2021-04-13 23:53:23');
INSERT INTO `sys_oper_log` VALUES (38, '部门管理', 'com.laoxu.java.authman.controller.SysDeptController.remove', '删除', '删除部门', 'POST', '{id:23}\n', '0:0:0:0:0:0:0:1', '/authman/sysDept/remove', 'admin', '2021-04-13 23:53:28');
INSERT INTO `sys_oper_log` VALUES (39, '部门管理', 'com.laoxu.java.authman.controller.SysDeptController.add', '修改', '修改部门', 'POST', 'SysDept(id=null, pid=1, pids=null, deptName=销售部, deptCode=sales, pname=沙逛鱼科技, createTime=null, createUser=null, updateTime=null, updateUser=null)', '0:0:0:0:0:0:0:1', '/authman/sysDept/save', 'admin', '2021-04-13 23:53:48');

-- ----------------------------
-- Table structure for t_module
-- ----------------------------
DROP TABLE IF EXISTS `t_module`;
CREATE TABLE `t_module`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pId` int(11) NULL DEFAULT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `url` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `target` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `perms` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `type` tinyint(2) NULL DEFAULT NULL COMMENT '类型   0：目录   1：菜单   2：按钮',
  `order_num` int(3) NULL DEFAULT 0 COMMENT '排序',
  `icon` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图标',
  `status` tinyint(2) NULL DEFAULT 1 COMMENT '状态：1有效；0删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_module
-- ----------------------------
INSERT INTO `t_module` VALUES (1, 0, '会员管理', '#', 'menuFrame', NULL, 0, 2, NULL, 1);
INSERT INTO `t_module` VALUES (2, 0, '权限管理', '#', 'menuFrame', '', 0, 1, NULL, 1);
INSERT INTO `t_module` VALUES (3, 1, '显示会员', 'admin/member/list.jsp', 'menuFrame', NULL, 1, 2, NULL, 1);
INSERT INTO `t_module` VALUES (9, 2, '菜单管理', 'system/module/toList', 'menuFrame', '', 0, 1, NULL, 1);
INSERT INTO `t_module` VALUES (10, 2, '角色管理Ztree', 'system/role/list', 'menuFrame', '', 1, 1, NULL, 1);
INSERT INTO `t_module` VALUES (13, 0, '系统管理', '#', 'menuFrame', '', 0, 6, NULL, 1);
INSERT INTO `t_module` VALUES (14, 13, '修改密码', 'system/user/toUpdatePassword', 'menuFrame', '', 1, 6, NULL, 1);
INSERT INTO `t_module` VALUES (15, 13, '退出登录', 'system/user/logout', '_blank', '', 1, 6, NULL, 1);
INSERT INTO `t_module` VALUES (16, 0, '留言分类管理', '#', 'menuFrame', NULL, 0, 3, NULL, 1);
INSERT INTO `t_module` VALUES (17, 16, '显示留言分类', 'admin/messageKind/list', 'menuFrame', '', 1, 3, NULL, 1);
INSERT INTO `t_module` VALUES (18, 2, '角色管理checkbox', 'system/role2/list', 'menuFrame', '', 1, 1, NULL, 1);
INSERT INTO `t_module` VALUES (19, 2, '用户管理', 'system/user/list', 'menuFrame', '', 1, 1, NULL, 1);
INSERT INTO `t_module` VALUES (20, 0, '留言管理', '#', 'menuFrame', 'message:page', 0, 4, NULL, 1);
INSERT INTO `t_module` VALUES (21, 20, '显示留言', 'admin/message/listByPage', 'menuFrame', 'message:list', 1, 4, NULL, 1);
INSERT INTO `t_module` VALUES (23, 0, '日志管理', '#', 'menuFrame', NULL, 0, 5, NULL, 1);
INSERT INTO `t_module` VALUES (24, 23, '显示日志', 'system/loginfo/listByPage', 'menuFrame', '', 1, 5, NULL, 1);
INSERT INTO `t_module` VALUES (25, 20, '添加留言', 'admin/message/toAdd', 'menuFrame', 'message:add', 2, 0, NULL, 1);
INSERT INTO `t_module` VALUES (26, 20, '更新留言', 'admin/message/toUpdate', 'menuFrame', 'message:update', 2, 0, NULL, 1);
INSERT INTO `t_module` VALUES (27, 20, '删除留言', 'admin/message/deleteBatch', 'menuFrame', 'message:delete', 2, 0, NULL, 1);
INSERT INTO `t_module` VALUES (28, 20, '导入数据', 'admin/message/toUpload', 'menuFrame', 'message:import', 2, 0, NULL, 1);
INSERT INTO `t_module` VALUES (29, 16, '条形图', 'admin/messagekind/bar.jsp', 'menuFrame', 'messagekind:bar', 1, 3, NULL, 1);
INSERT INTO `t_module` VALUES (30, 16, '饼图', 'admin/messagekind/pie.jsp', 'menuFrame', 'messagekind:pie', 1, 3, NULL, 1);
INSERT INTO `t_module` VALUES (31, 16, '折线图', 'admin/messagekind/line.jsp', 'menuFrame', 'messagekind:line', 1, 3, NULL, 1);

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role`  (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES (1, 'admin');
INSERT INTO `t_role` VALUES (2, 'user');
INSERT INTO `t_role` VALUES (3, '总监');
INSERT INTO `t_role` VALUES (5, 'tttttt1111');
INSERT INTO `t_role` VALUES (8, 'q');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user`  (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `username` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `salt` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES (1, 'admin', 'ef310052eb31a55544defe9ade1fdd28', 'wbR%)IS$');
INSERT INTO `t_user` VALUES (2, 'lb', 'c0e15afcf23ff7d3ae3b8f86f29fccd5', '$qMzd3LQ');

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = gbk COLLATE = gbk_chinese_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES (1, 1);
INSERT INTO `user_role` VALUES (2, 2);

SET FOREIGN_KEY_CHECKS = 1;
