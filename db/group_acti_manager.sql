/*
 Navicat Premium Data Transfer

 Source Server         : administrator
 Source Server Type    : MySQL
 Source Server Version : 50727
 Source Host           : localhost:3306
 Source Schema         : group_acti_manager

 Target Server Type    : MySQL
 Target Server Version : 50727
 File Encoding         : 65001

 Date: 02/02/2020 22:35:44
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for activity
-- ----------------------------
DROP TABLE IF EXISTS `activity`;
CREATE TABLE `activity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL COMMENT '活动标题',
  `start_time` varchar(255) DEFAULT NULL COMMENT '开始时间',
  `end_time` varchar(255) DEFAULT NULL COMMENT '结束时间',
  `creator` varchar(255) DEFAULT NULL COMMENT '创建者',
  `programme_main` varchar(255) DEFAULT NULL COMMENT '主要方案',
  `programme_spare` varchar(255) DEFAULT NULL COMMENT '备用方案',
  `address` varchar(255) DEFAULT NULL COMMENT '活动地址',
  `create_time` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `del` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of activity
-- ----------------------------
BEGIN;
INSERT INTO `activity` VALUES (31, 'shijianceshi', '2018-10-17 10:17', '2019-10-17 10:17', '16', NULL, NULL, 'didian', '1579794611', NULL, 'normal');
INSERT INTO `activity` VALUES (32, '标题', '2018-10-17 10:17', '2019-10-17 10:17', '16', '机会', '方案二', '广东省广州市', '1579794827', NULL, 'normal');
COMMIT;

-- ----------------------------
-- Table structure for activity_bill
-- ----------------------------
DROP TABLE IF EXISTS `activity_bill`;
CREATE TABLE `activity_bill` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` varchar(255) DEFAULT NULL COMMENT '活动id',
  `detail` varchar(255) DEFAULT NULL COMMENT '金额说明',
  `bill` varchar(255) DEFAULT NULL COMMENT '金额',
  `create_time` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `del` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of activity_bill
-- ----------------------------
BEGIN;
INSERT INTO `activity_bill` VALUES (1, '8', 'jind', '200', '1577287993', NULL, 'delete');
INSERT INTO `activity_bill` VALUES (2, '8', 'fdsfd', '3333', '1577288180', NULL, 'delete');
INSERT INTO `activity_bill` VALUES (3, '8', 'zhangdan', '3000', '1577289203', NULL, 'normal');
INSERT INTO `activity_bill` VALUES (4, '8', '我也是', '金额', '1577289972', NULL, 'normal');
COMMIT;

-- ----------------------------
-- Table structure for activity_member
-- ----------------------------
DROP TABLE IF EXISTS `activity_member`;
CREATE TABLE `activity_member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` varchar(255) DEFAULT NULL COMMENT '活动id',
  `user_id` varchar(255) DEFAULT NULL COMMENT '用户id',
  `role` varchar(255) DEFAULT NULL COMMENT '角色',
  `is_watch` varchar(255) DEFAULT NULL COMMENT '是否已看',
  `create_time` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `del` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of activity_member
-- ----------------------------
BEGIN;
INSERT INTO `activity_member` VALUES (1, '30', '16', NULL, NULL, '1579767565', NULL, 'normal');
INSERT INTO `activity_member` VALUES (2, '30', '17', NULL, NULL, '1579767565', NULL, 'normal');
INSERT INTO `activity_member` VALUES (3, '31', '16', NULL, 'true', '1579794612', NULL, 'normal');
INSERT INTO `activity_member` VALUES (4, '31', '17', NULL, NULL, '1579794612', NULL, 'normal');
INSERT INTO `activity_member` VALUES (5, '32', '17', NULL, NULL, '1579794827', NULL, 'normal');
INSERT INTO `activity_member` VALUES (6, '32', '16', NULL, 'true', '1579794827', NULL, 'normal');
INSERT INTO `activity_member` VALUES (7, '33', '17', NULL, NULL, '1579794933', NULL, 'normal');
INSERT INTO `activity_member` VALUES (8, '33', '16', NULL, NULL, '1579794933', NULL, 'normal');
COMMIT;

-- ----------------------------
-- Table structure for activity_progress
-- ----------------------------
DROP TABLE IF EXISTS `activity_progress`;
CREATE TABLE `activity_progress` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` varchar(255) DEFAULT NULL COMMENT '活动id',
  `progress` varchar(255) DEFAULT NULL COMMENT '进度说明',
  `complete_time` varchar(255) DEFAULT NULL COMMENT '完成时间',
  `create_time` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `del` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of activity_progress
-- ----------------------------
BEGIN;
INSERT INTO `activity_progress` VALUES (1, '8', 'dsad', 'asddsa', '1577286975', NULL, 'delete');
INSERT INTO `activity_progress` VALUES (2, '8', 'fffffff', '2222', '1577287232', NULL, 'delete');
INSERT INTO `activity_progress` VALUES (3, '8', 'huo', 'dsads', '1577287328', NULL, 'delete');
INSERT INTO `activity_progress` VALUES (4, '8', '物资准备完毕', '2019年', '1577287392', NULL, 'normal');
INSERT INTO `activity_progress` VALUES (5, '11', '1', '12', '1578815470', NULL, 'normal');
INSERT INTO `activity_progress` VALUES (6, '10', '大家都叫撒', '的撒的撒', '1580026874', NULL, 'delete');
COMMIT;

-- ----------------------------
-- Table structure for activity_votes
-- ----------------------------
DROP TABLE IF EXISTS `activity_votes`;
CREATE TABLE `activity_votes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` varchar(255) DEFAULT NULL COMMENT '活动id',
  `vote_id` varchar(255) DEFAULT NULL COMMENT '投票id',
  `create_time` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `del` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of activity_votes
-- ----------------------------
BEGIN;
INSERT INTO `activity_votes` VALUES (3, '8', '7', NULL, NULL, 'delete');
INSERT INTO `activity_votes` VALUES (4, '8', '8', NULL, NULL, 'delete');
INSERT INTO `activity_votes` VALUES (5, '8', '7', '1577284318', NULL, 'delete');
INSERT INTO `activity_votes` VALUES (6, '8', '8', '1577284318', NULL, 'delete');
INSERT INTO `activity_votes` VALUES (7, '8', '7', '1577285320', NULL, 'delete');
INSERT INTO `activity_votes` VALUES (8, '8', '7', '1577285344', NULL, 'delete');
INSERT INTO `activity_votes` VALUES (9, '8', '8', '1577285344', NULL, 'delete');
INSERT INTO `activity_votes` VALUES (10, '8', '8', '1577285522', NULL, 'delete');
INSERT INTO `activity_votes` VALUES (11, '8', '8', '1577285532', NULL, 'delete');
INSERT INTO `activity_votes` VALUES (12, '8', '7', '1577286001', NULL, 'normal');
INSERT INTO `activity_votes` VALUES (13, '8', '8', '1577286001', NULL, 'delete');
COMMIT;

-- ----------------------------
-- Table structure for base_menu
-- ----------------------------
DROP TABLE IF EXISTS `base_menu`;
CREATE TABLE `base_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '菜单id',
  `menu_name` varchar(255) DEFAULT NULL COMMENT '菜单名称',
  `menu_level` varchar(255) DEFAULT NULL COMMENT '菜单等级',
  `menu_parent` varchar(255) DEFAULT NULL COMMENT '父菜单',
  `menu_sub_size` int(11) DEFAULT NULL COMMENT '子菜单数量',
  `menu_url` varchar(255) DEFAULT NULL COMMENT '页面URL',
  `menu_index` int(255) DEFAULT NULL COMMENT '排序号',
  `menu_icon` varchar(255) DEFAULT NULL COMMENT 'icon',
  `user_type` varchar(255) DEFAULT NULL COMMENT '用户类型',
  `create_time` varchar(255) DEFAULT NULL COMMENT '创建时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `del` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=120 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of base_menu
-- ----------------------------
BEGIN;
INSERT INTO `base_menu` VALUES (1, '系统设置', '1', '0', NULL, '', 999, '', '4', '', '', 'delete');
INSERT INTO `base_menu` VALUES (5, '菜单设置', '2', '1', NULL, '../pages/manager/system/menu.html', 1, NULL, '4', NULL, NULL, 'delete');
INSERT INTO `base_menu` VALUES (103, '活动模块', '1', '1', NULL, NULL, 1, NULL, '4', NULL, NULL, 'normal');
INSERT INTO `base_menu` VALUES (104, '投票模块', '1', '1', NULL, NULL, 1, NULL, '4', NULL, NULL, 'normal');
INSERT INTO `base_menu` VALUES (105, '用户模块', '1', '1', NULL, NULL, 1, NULL, '4', NULL, NULL, 'normal');
INSERT INTO `base_menu` VALUES (106, '用户列表', '2', '105', NULL, '../pages/manager/base_user/list.html', 1, NULL, '4', NULL, NULL, 'normal');
INSERT INTO `base_menu` VALUES (107, '用户类型列表', '2', '105', NULL, '../pages/manager/base_user_type/list.html', 1, NULL, '4', NULL, NULL, 'normal');
INSERT INTO `base_menu` VALUES (108, '用户通讯录列表', '2', '105', NULL, '../pages/manager/contact/list.html', 1, NULL, '4', NULL, NULL, 'normal');
INSERT INTO `base_menu` VALUES (109, '活动列表', '2', '103', NULL, '../pages/manager/activity/list.html', 1, NULL, '4', NULL, NULL, 'normal');
INSERT INTO `base_menu` VALUES (110, '活动账单列表', '2', '103', NULL, '../pages/manager/activity_bill/list.html', 1, NULL, '4', NULL, NULL, 'normal');
INSERT INTO `base_menu` VALUES (111, '活动投票列表', '2', '103', NULL, '../pages/manager/activity_votes/list.html', 1, NULL, '4', NULL, NULL, 'normal');
INSERT INTO `base_menu` VALUES (112, '活动成员列表', '2', '103', NULL, '../pages/manager/activity_member/list.html', 1, NULL, '4', NULL, NULL, 'normal');
INSERT INTO `base_menu` VALUES (113, '活动进度列表', '2', '103', NULL, '../pages/manager/activity_progress/list.html', 1, NULL, '4', NULL, NULL, 'normal');
INSERT INTO `base_menu` VALUES (114, '投票项目列表', '2', '104', NULL, '../pages/manager/vote/list.html', 1, NULL, '4', NULL, NULL, 'normal');
INSERT INTO `base_menu` VALUES (115, '投票人员列表', '2', '104', NULL, '../pages/manager/vote_member/list.html', 1, NULL, '4', NULL, NULL, 'normal');
INSERT INTO `base_menu` VALUES (116, '投票选项列表', '2', '104', NULL, '../pages/manager/vote_item/list.html', 1, NULL, '4', NULL, NULL, 'normal');
INSERT INTO `base_menu` VALUES (117, '评论模块', '1', '1', NULL, NULL, 1, NULL, '4', NULL, NULL, 'normal');
INSERT INTO `base_menu` VALUES (118, '活动评论', '2', '117', NULL, '../pages/manager/comment_activity/list.html', 1, NULL, '4', NULL, NULL, 'normal');
INSERT INTO `base_menu` VALUES (119, '投票评论', '2', '117', NULL, '../pages/manager/comment_vote/list.html', 1, NULL, '4', NULL, NULL, 'normal');
COMMIT;

-- ----------------------------
-- Table structure for base_message
-- ----------------------------
DROP TABLE IF EXISTS `base_message`;
CREATE TABLE `base_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `sender` varchar(255) DEFAULT NULL COMMENT '发送者id',
  `getter` varchar(255) DEFAULT NULL COMMENT '接受者id',
  `message` varchar(255) DEFAULT NULL COMMENT '信息内容',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `send_time` varchar(255) DEFAULT NULL COMMENT '发送时间',
  `send_state` varchar(255) DEFAULT NULL COMMENT '发送状态',
  `create_time` varchar(255) DEFAULT NULL COMMENT '创建时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `del` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for base_module
-- ----------------------------
DROP TABLE IF EXISTS `base_module`;
CREATE TABLE `base_module` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `module_title` varchar(255) DEFAULT NULL COMMENT '功能模块标题',
  `module_name` varchar(255) DEFAULT NULL COMMENT '功能模块名称',
  `module_index` varchar(255) DEFAULT NULL COMMENT '功能模块排序号',
  `create_time` varchar(255) DEFAULT NULL COMMENT '功能模块创建时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '功能模块备注',
  `del` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of base_module
-- ----------------------------
BEGIN;
INSERT INTO `base_module` VALUES (1, NULL, 'module1', NULL, '1573224661', NULL, 'normal');
INSERT INTO `base_module` VALUES (2, NULL, NULL, NULL, '1573401476', NULL, 'normal');
INSERT INTO `base_module` VALUES (3, NULL, NULL, NULL, '1573401482', NULL, 'normal');
INSERT INTO `base_module` VALUES (4, NULL, NULL, NULL, '1573401496', NULL, 'normal');
INSERT INTO `base_module` VALUES (5, NULL, NULL, NULL, '1573401513', NULL, 'normal');
COMMIT;

-- ----------------------------
-- Table structure for base_state
-- ----------------------------
DROP TABLE IF EXISTS `base_state`;
CREATE TABLE `base_state` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `module_id` varchar(255) DEFAULT NULL COMMENT 'moduleid',
  `state` varchar(255) DEFAULT NULL COMMENT '状态',
  `describe` varchar(255) DEFAULT NULL COMMENT '描述',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `create_time` varchar(255) DEFAULT NULL COMMENT '创建时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `del` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for base_user
-- ----------------------------
DROP TABLE IF EXISTS `base_user`;
CREATE TABLE `base_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(255) DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) DEFAULT NULL COMMENT '密码',
  `realname` varchar(255) DEFAULT NULL COMMENT '真实名称',
  `phone` varchar(255) DEFAULT NULL COMMENT '电话',
  `email` varchar(255) DEFAULT NULL COMMENT 'email',
  `address` varchar(255) DEFAULT NULL COMMENT '地址',
  `wechat` varchar(255) DEFAULT NULL COMMENT 'wechat',
  `qq` varchar(255) DEFAULT NULL COMMENT 'qq',
  `age` varchar(255) DEFAULT NULL COMMENT 'age',
  `avatar` varchar(255) DEFAULT NULL COMMENT '头像',
  `slogan` varchar(255) DEFAULT NULL COMMENT '签名',
  `region` varchar(255) DEFAULT NULL COMMENT '地区',
  `type` varchar(255) DEFAULT NULL COMMENT '用户类型',
  `type_describe` varchar(255) DEFAULT NULL COMMENT '用户类型描述',
  `state` varchar(255) DEFAULT NULL COMMENT '状态',
  `identity` varchar(255) DEFAULT NULL COMMENT '身份',
  `openid` varchar(255) DEFAULT NULL COMMENT '微信openid',
  `nickName` varchar(255) DEFAULT NULL COMMENT '微信用户名',
  `avatarUrl` varchar(255) DEFAULT NULL COMMENT '微信用户头像',
  `create_time` varchar(255) DEFAULT NULL COMMENT '创建时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `del` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of base_user
-- ----------------------------
BEGIN;
INSERT INTO `base_user` VALUES (8, 'admin', 'admin', '系统管理员', '134126', 'email', '联系地址', 'wchat', 'qq', '26', '', 'hello', '地区', '4', '系统管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'normal');
INSERT INTO `base_user` VALUES (16, NULL, NULL, NULL, '12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'oWOld5TKbusw9J6uJjiWPkjXPL_E', '周镇健', 'https://wx.qlogo.cn/mmopen/vi_32/4icVyibZoGvQPwBv6wspLAibl2eZrn7wzEg9GXCOX7e3Js9NNUDISxuq76a5NdsoEg9vURfaicHIj3WGdv4WiaCCS4Q/132', '1577030934', NULL, 'normal');
INSERT INTO `base_user` VALUES (17, NULL, NULL, NULL, '87069806', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'oWOld5b6WqOSpcIdmSExKwMNIcDM', '老周Nice', 'https://wx.qlogo.cn/mmopen/vi_32/tMzQKCOxhNRjpAWh2pgGq9sPx2pvBPticW8NFDu46FwIl2hg4qlYibzduerCo8YEA0ugC8fzKKITMbAJjhGtaJzA/132', '1577274225', NULL, 'normal');
INSERT INTO `base_user` VALUES (18, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'oWOld5SMVnqo-72XSkjnxS_AsL-E', NULL, NULL, '1578815330', NULL, 'normal');
COMMIT;

-- ----------------------------
-- Table structure for base_user_type
-- ----------------------------
DROP TABLE IF EXISTS `base_user_type`;
CREATE TABLE `base_user_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `type` varchar(255) DEFAULT NULL COMMENT '类型',
  `describe` varchar(255) DEFAULT NULL COMMENT '描述',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `create_time` varchar(255) DEFAULT NULL COMMENT '创建时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `del` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of base_user_type
-- ----------------------------
BEGIN;
INSERT INTO `base_user_type` VALUES (3, '3', NULL, '管理员', NULL, NULL, 'normal');
INSERT INTO `base_user_type` VALUES (4, '4', NULL, '系统管理员', NULL, NULL, 'normal');
INSERT INTO `base_user_type` VALUES (5, NULL, NULL, NULL, '1577018770', NULL, 'delete');
COMMIT;

-- ----------------------------
-- Table structure for comment_activity
-- ----------------------------
DROP TABLE IF EXISTS `comment_activity`;
CREATE TABLE `comment_activity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` varchar(255) DEFAULT NULL COMMENT '活动id',
  `user_id` varchar(255) DEFAULT NULL COMMENT '用户id',
  `comment` varchar(255) DEFAULT NULL COMMENT '评论内容',
  `like_member` varchar(255) DEFAULT NULL COMMENT '点赞用户',
  `create_time` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `del` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment_activity
-- ----------------------------
BEGIN;
INSERT INTO `comment_activity` VALUES (2, '8', '16', 'pinglu n', NULL, '1577289212', NULL, 'normal');
INSERT INTO `comment_activity` VALUES (3, '8', '16', 'fdsfds', NULL, '1577289681', NULL, 'normal');
INSERT INTO `comment_activity` VALUES (4, '8', '16', '卧槽', NULL, '1577289953', NULL, 'normal');
INSERT INTO `comment_activity` VALUES (5, '9', '16', '这是啥子', NULL, '1577290022', NULL, 'normal');
INSERT INTO `comment_activity` VALUES (6, 'undefined', '16', '好几回', NULL, '1577373998', NULL, 'normal');
INSERT INTO `comment_activity` VALUES (7, 'undefined', '16', '开机键', NULL, '1577374072', NULL, 'normal');
INSERT INTO `comment_activity` VALUES (8, 'undefined', '16', '?', NULL, '1577374227', NULL, 'normal');
INSERT INTO `comment_activity` VALUES (9, 'undefined', '16', 'kjkn', NULL, '1577374292', NULL, 'normal');
INSERT INTO `comment_activity` VALUES (10, 'undefined', '16', '?', NULL, '1577374387', NULL, 'normal');
COMMIT;

-- ----------------------------
-- Table structure for comment_vote
-- ----------------------------
DROP TABLE IF EXISTS `comment_vote`;
CREATE TABLE `comment_vote` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vote_id` varchar(255) DEFAULT NULL COMMENT '活动id',
  `user_id` varchar(255) DEFAULT NULL COMMENT '用户id',
  `comment` varchar(255) DEFAULT NULL COMMENT '评论内容',
  `like_member` varchar(255) DEFAULT NULL COMMENT '点赞用户',
  `create_time` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `del` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment_vote
-- ----------------------------
BEGIN;
INSERT INTO `comment_vote` VALUES (1, '6', '16', 'nknkn', NULL, '1577374426', NULL, 'normal');
INSERT INTO `comment_vote` VALUES (2, '6', '16', '??', NULL, '1577375268', NULL, 'normal');
INSERT INTO `comment_vote` VALUES (3, '6', '16', '？？', NULL, '1577375325', NULL, 'normal');
INSERT INTO `comment_vote` VALUES (4, '7', '16', '？？', NULL, '1577375485', NULL, 'normal');
INSERT INTO `comment_vote` VALUES (5, '7', '16', '？？', NULL, '1577453464', NULL, 'normal');
INSERT INTO `comment_vote` VALUES (6, '16', '16', 'shenme', NULL, '1577621776', NULL, 'normal');
INSERT INTO `comment_vote` VALUES (7, '7', '16', '女孩', NULL, '1578815219', NULL, 'normal');
COMMIT;

-- ----------------------------
-- Table structure for contact
-- ----------------------------
DROP TABLE IF EXISTS `contact`;
CREATE TABLE `contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner_id` varchar(255) DEFAULT NULL COMMENT '拥有者id',
  `user_id` varchar(255) DEFAULT NULL COMMENT '通讯录用户id',
  `create_time` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `del` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of contact
-- ----------------------------
BEGIN;
INSERT INTO `contact` VALUES (1, '16', '16', '1577018741', NULL, 'delete');
INSERT INTO `contact` VALUES (2, '12', '16', NULL, NULL, 'delete');
INSERT INTO `contact` VALUES (3, '16', '16', NULL, NULL, 'delete');
INSERT INTO `contact` VALUES (4, '16', '16', NULL, NULL, 'delete');
INSERT INTO `contact` VALUES (5, '16', '16', NULL, NULL, 'delete');
INSERT INTO `contact` VALUES (6, '16', '17', '1580565181', NULL, 'normal');
COMMIT;

-- ----------------------------
-- Table structure for vote
-- ----------------------------
DROP TABLE IF EXISTS `vote`;
CREATE TABLE `vote` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `creator` varchar(255) DEFAULT NULL COMMENT '创建者',
  `title` varchar(255) DEFAULT NULL COMMENT '活动标题',
  `start_time` varchar(255) DEFAULT NULL COMMENT '开始时间',
  `end_time` varchar(255) DEFAULT NULL COMMENT '结束时间',
  `detail` varchar(255) DEFAULT NULL COMMENT '详细描述',
  `create_time` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `del` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of vote
-- ----------------------------
BEGIN;
INSERT INTO `vote` VALUES (16, '16', 'ceshi item', '2020-2-10 10:17', '2020-2-1 1:34', 'dsadas', '1577621260', NULL, 'normal');
COMMIT;

-- ----------------------------
-- Table structure for vote_item
-- ----------------------------
DROP TABLE IF EXISTS `vote_item`;
CREATE TABLE `vote_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vote_id` varchar(255) DEFAULT NULL COMMENT '投票id',
  `detail` varchar(255) DEFAULT NULL COMMENT '其他说明',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `create_time` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `del` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of vote_item
-- ----------------------------
BEGIN;
INSERT INTO `vote_item` VALUES (1, '16', NULL, 'dsadas', '1577621260', NULL, 'normal');
INSERT INTO `vote_item` VALUES (2, '16', NULL, 'fadsfadf', '1577621260', NULL, 'normal');
COMMIT;

-- ----------------------------
-- Table structure for vote_member
-- ----------------------------
DROP TABLE IF EXISTS `vote_member`;
CREATE TABLE `vote_member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vote_id` varchar(255) DEFAULT NULL COMMENT '活动id',
  `user_id` varchar(255) DEFAULT NULL COMMENT '用户id',
  `vote_item_id` varchar(255) DEFAULT NULL,
  `vote_item` varchar(255) DEFAULT NULL COMMENT '投票选项',
  `create_time` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `del` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of vote_member
-- ----------------------------
BEGIN;
INSERT INTO `vote_member` VALUES (1, '16', '16', '1', 'dsadas', '1577621260', NULL, 'normal');
INSERT INTO `vote_member` VALUES (2, '16', '17', '1', 'dsadasd', '1577621260', '', 'delete');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
