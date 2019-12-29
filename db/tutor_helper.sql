/*
 Navicat Premium Data Transfer

 Source Server         : root
 Source Server Type    : MySQL
 Source Server Version : 50727
 Source Host           : localhost:3306
 Source Schema         : tutor_helper

 Target Server Type    : MySQL
 Target Server Version : 50727
 File Encoding         : 65001

 Date: 15/11/2019 22:55:26
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for attendance
-- ----------------------------
DROP TABLE IF EXISTS `attendance`;
CREATE TABLE `attendance` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `attendance_name` varchar(255) DEFAULT NULL COMMENT '签到项目名称',
  `attendance_type` varchar(255) DEFAULT NULL COMMENT '签到类型',
  `attendance_time` varchar(255) DEFAULT NULL COMMENT '签到时间',
  `attendance_address` varchar(255) DEFAULT NULL COMMENT '签到地点',
  `attendance_manager` varchar(255) DEFAULT NULL COMMENT '管理者',
  `attendance_state` varchar(255) DEFAULT NULL COMMENT '状态',
  `create_time` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `del` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of attendance
-- ----------------------------
BEGIN;
INSERT INTO `attendance` VALUES (1, NULL, NULL, NULL, NULL, NULL, NULL, '1573057167', NULL, 'delete');
INSERT INTO `attendance` VALUES (2, 'dsadsadsad', NULL, NULL, NULL, NULL, NULL, '1573224513', NULL, 'normal');
COMMIT;

-- ----------------------------
-- Table structure for attendance_record
-- ----------------------------
DROP TABLE IF EXISTS `attendance_record`;
CREATE TABLE `attendance_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `attendance_id` int(11) DEFAULT NULL COMMENT '签到项目ID',
  `user_id` int(11) DEFAULT NULL COMMENT '签到者id',
  `state` varchar(255) DEFAULT NULL COMMENT '状态',
  `attendance_record_time` varchar(255) DEFAULT NULL COMMENT '签到时间',
  `attendance_record_address` varchar(255) DEFAULT NULL COMMENT '签到地点',
  `create_time` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `del` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of attendance_record
-- ----------------------------
BEGIN;
INSERT INTO `attendance_record` VALUES (1, 2, 7, '已签到', NULL, NULL, '1573360055', NULL, 'normal');
COMMIT;

-- ----------------------------
-- Table structure for base_cert
-- ----------------------------
DROP TABLE IF EXISTS `base_cert`;
CREATE TABLE `base_cert` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `cert_name` varchar(255) DEFAULT NULL COMMENT '证书名称',
  `cert_describe` varchar(255) DEFAULT NULL COMMENT '证书描述',
  `cert_type` varchar(255) DEFAULT NULL COMMENT '证书类型',
  `cert_logo` varchar(255) DEFAULT NULL COMMENT '证书logo',
  `cert_lssuer` varchar(255) DEFAULT NULL COMMENT '证书机构',
  `create_time` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `del` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for base_class
-- ----------------------------
DROP TABLE IF EXISTS `base_class`;
CREATE TABLE `base_class` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `school_id` int(11) DEFAULT NULL COMMENT '学校id',
  `college_id` int(11) DEFAULT NULL COMMENT '学院id',
  `class_name` varchar(255) DEFAULT NULL COMMENT '班级名称',
  `class_regis_time` varchar(255) DEFAULT NULL COMMENT '注册时间',
  `class_stu_num` varchar(255) DEFAULT NULL COMMENT '学生数量',
  `create_time` varchar(255) DEFAULT NULL COMMENT '创建时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `del` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of base_class
-- ----------------------------
BEGIN;
INSERT INTO `base_class` VALUES (1, NULL, NULL, NULL, NULL, NULL, '1573045704', NULL, 'delete');
INSERT INTO `base_class` VALUES (2, 11, 2, 'dasds 啊', '的撒打算', '放大放大', '1573219537', '放大时', 'normal');
COMMIT;

-- ----------------------------
-- Table structure for base_college
-- ----------------------------
DROP TABLE IF EXISTS `base_college`;
CREATE TABLE `base_college` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `school_id` int(11) DEFAULT NULL COMMENT '学校id',
  `college_name` varchar(255) DEFAULT NULL COMMENT '学院名称',
  `college_describe` varchar(255) DEFAULT NULL COMMENT '学院描述',
  `college_logo` varchar(255) DEFAULT NULL COMMENT '学院logo',
  `college_stu_num` varchar(255) DEFAULT NULL COMMENT '学院人数',
  `college_regis_time` varchar(255) DEFAULT NULL COMMENT '注册时间',
  `create_time` varchar(255) DEFAULT NULL COMMENT '创建时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `del` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of base_college
-- ----------------------------
BEGIN;
INSERT INTO `base_college` VALUES (1, NULL, NULL, NULL, NULL, NULL, NULL, '1572970487', NULL, 'delete');
INSERT INTO `base_college` VALUES (2, 11, '计算机学院', NULL, NULL, NULL, NULL, '1573144426', NULL, 'normal');
COMMIT;

-- ----------------------------
-- Table structure for base_commodity
-- ----------------------------
DROP TABLE IF EXISTS `base_commodity`;
CREATE TABLE `base_commodity` (
  `commodity_id` int(11) NOT NULL,
  `commodity_name` varchar(255) DEFAULT NULL,
  `commodity_price` varchar(255) DEFAULT NULL,
  `commodity_img` varchar(255) DEFAULT NULL,
  `commodity_old_price` varchar(255) DEFAULT NULL,
  `commodity_describe` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `commodity_provider` varchar(255) DEFAULT NULL,
  `commodity_produce_time` varchar(255) DEFAULT NULL,
  `commodity_validity` varchar(255) DEFAULT NULL,
  `create_time` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `del` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`commodity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for base_course
-- ----------------------------
DROP TABLE IF EXISTS `base_course`;
CREATE TABLE `base_course` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `course_name` varchar(255) DEFAULT NULL COMMENT '课程名称',
  `course_lecturer` varchar(255) DEFAULT NULL COMMENT '讲师',
  `course_type` varchar(255) DEFAULT NULL COMMENT '课程类型',
  `course_state` varchar(255) DEFAULT NULL COMMENT '课程状态',
  `course_stu_num` int(11) DEFAULT NULL COMMENT '学生人数',
  `course_address` varchar(255) DEFAULT NULL COMMENT '上课地点',
  `course_abstract` varchar(255) DEFAULT NULL COMMENT '简介',
  `course_detail` varchar(255) DEFAULT NULL COMMENT '详细',
  `course_time` varchar(255) DEFAULT NULL COMMENT '上课时间',
  `create_time` varchar(255) DEFAULT NULL COMMENT '创建时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `del` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of base_course
-- ----------------------------
BEGIN;
INSERT INTO `base_course` VALUES (1, '3232', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1573224240', NULL, 'delete');
COMMIT;

-- ----------------------------
-- Table structure for base_enterprise
-- ----------------------------
DROP TABLE IF EXISTS `base_enterprise`;
CREATE TABLE `base_enterprise` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '企业ID',
  `enterprise_name` varchar(255) DEFAULT NULL COMMENT '企业名称',
  `enterprise_describe` varchar(255) DEFAULT NULL COMMENT '企业描述',
  `enterprise_logo` varchar(255) DEFAULT NULL COMMENT '企业logo',
  `type` varchar(255) DEFAULT NULL COMMENT '企业类型',
  `enterprise_people_num` varchar(255) DEFAULT NULL COMMENT '企业人数',
  `enterprise_regis_time` varchar(255) DEFAULT NULL COMMENT '企业注册时间',
  `create_time` varchar(255) DEFAULT NULL COMMENT '创建时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `del` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of base_menu
-- ----------------------------
BEGIN;
INSERT INTO `base_menu` VALUES (1, '系统设置', '1', '0', NULL, '', 999, '', '4', '', '', 'normal');
INSERT INTO `base_menu` VALUES (3, '子菜单一', '2', '1', NULL, '../', 111, 'fa-pie-chart', '1', NULL, NULL, 'normal');
INSERT INTO `base_menu` VALUES (5, '菜单设置', '2', '1', NULL, '../pages/manager/system/menu.html', 1, NULL, '4', NULL, NULL, 'normal');
INSERT INTO `base_menu` VALUES (33, '学生成绩', '1', '1', NULL, NULL, 3, NULL, '1', NULL, NULL, 'normal');
INSERT INTO `base_menu` VALUES (34, '心里测试', '1', '1', NULL, NULL, 1, NULL, '1', NULL, NULL, 'normal');
INSERT INTO `base_menu` VALUES (35, '科研管理', '1', '1', NULL, NULL, 1, NULL, '1', NULL, NULL, 'normal');
INSERT INTO `base_menu` VALUES (36, '新闻推荐', '1', '1', NULL, NULL, 1, NULL, '1', NULL, NULL, 'normal');
INSERT INTO `base_menu` VALUES (37, '考勤管理', '1', '1', NULL, NULL, 1, NULL, '1', NULL, NULL, 'normal');
INSERT INTO `base_menu` VALUES (38, '家园互动', '1', '1', NULL, NULL, 1, NULL, '1', NULL, NULL, 'normal');
INSERT INTO `base_menu` VALUES (39, '奖学金', '1', '1', NULL, NULL, 1, NULL, '1', NULL, NULL, 'normal');
INSERT INTO `base_menu` VALUES (40, '考研管理', '1', '1', NULL, NULL, 1, NULL, '1', NULL, NULL, 'normal');
INSERT INTO `base_menu` VALUES (41, '早读管理', '1', '1', NULL, NULL, 1, NULL, '1', NULL, NULL, 'normal');
INSERT INTO `base_menu` VALUES (43, '学校管理', '1', '1', NULL, NULL, 1, NULL, '4', NULL, NULL, 'normal');
INSERT INTO `base_menu` VALUES (45, '学校列表', '2', '43', NULL, '../pages/manager/base_school/list.html', 1, NULL, '4', NULL, NULL, 'normal');
INSERT INTO `base_menu` VALUES (46, '学院管理', '2', '43', NULL, '../pages/manager/base_college/list.html', 1, NULL, '4', NULL, NULL, 'normal');
INSERT INTO `base_menu` VALUES (47, '班级管理', '2', '43', NULL, '../pages/manager/base_class/list.html', 1, NULL, '4', NULL, NULL, 'normal');
INSERT INTO `base_menu` VALUES (48, '奖学金管理', '1', '1', NULL, NULL, 1, NULL, '4', NULL, NULL, 'normal');
INSERT INTO `base_menu` VALUES (49, '心理测试', '1', '1', NULL, NULL, 1, NULL, '4', NULL, NULL, 'normal');
INSERT INTO `base_menu` VALUES (50, '考研管理', '1', '1', NULL, NULL, 1, NULL, '4', NULL, NULL, 'normal');
INSERT INTO `base_menu` VALUES (51, '早读管理', '1', '1', NULL, NULL, 1, NULL, '4', NULL, NULL, 'normal');
INSERT INTO `base_menu` VALUES (52, '用户管理', '1', '1', NULL, NULL, 1, NULL, '4', NULL, NULL, 'normal');
INSERT INTO `base_menu` VALUES (53, '课程管理', '1', '1', NULL, NULL, 1, NULL, '4', NULL, NULL, 'normal');
INSERT INTO `base_menu` VALUES (54, '签到管理', '1', '1', NULL, NULL, 1, NULL, '4', NULL, NULL, 'normal');
INSERT INTO `base_menu` VALUES (55, '数据字典', '1', '1', NULL, NULL, 1, NULL, '4', NULL, NULL, 'normal');
INSERT INTO `base_menu` VALUES (56, '奖学金项目', '2', '48', NULL, '../pages/manager/scholarship/list.html', 1, NULL, '4', NULL, NULL, 'normal');
INSERT INTO `base_menu` VALUES (57, '奖学金分配', '2', '48', NULL, '../pages/manager/scholarship_distribution/list.html', 1, NULL, '4', NULL, NULL, 'normal');
INSERT INTO `base_menu` VALUES (58, '奖学金申请', '2', '48', NULL, '../pages/manager/scholarship_apply_record/list.html', 1, NULL, '4', NULL, NULL, 'normal');
INSERT INTO `base_menu` VALUES (59, '科研管理', '1', '1', NULL, NULL, 1, NULL, '4', NULL, NULL, 'normal');
INSERT INTO `base_menu` VALUES (60, '测试项目', '2', '49', NULL, '../pages/manager/psy_test_subject/list.html', 1, NULL, '4', NULL, NULL, 'normal');
INSERT INTO `base_menu` VALUES (61, '测试试题', '2', '49', NULL, '../pages/manager/psy_test_item/list.html', 1, NULL, '4', NULL, NULL, 'normal');
INSERT INTO `base_menu` VALUES (62, '参考回答', '2', '49', NULL, '../pages/manager/psy_test_answer_consult/list.html', 1, NULL, '4', NULL, NULL, 'normal');
INSERT INTO `base_menu` VALUES (63, '预置答案', '2', '49', NULL, '../pages/manager/psy_test_answer/list.html', 1, NULL, '4', NULL, NULL, 'normal');
INSERT INTO `base_menu` VALUES (64, '作答记录', '2', '49', NULL, '../pages/manager/psy_test_answer_record/list.html', 1, NULL, '4', NULL, NULL, 'normal');
INSERT INTO `base_menu` VALUES (65, '早读记录', '2', '51', NULL, '../pages/manager/early_reading/list.html', 1, NULL, '4', NULL, NULL, 'normal');
INSERT INTO `base_menu` VALUES (66, '用户列表', '2', '52', NULL, '../pages/manager/base_user/list.html', 1, NULL, '4', NULL, NULL, 'normal');
INSERT INTO `base_menu` VALUES (67, '用户类型', '2', '52', NULL, '../pages/manager/base_user_type/list.html', 1, NULL, '4', NULL, NULL, 'normal');
INSERT INTO `base_menu` VALUES (68, '基础类型字典', '2', '55', NULL, '../pages/manager/base_type/list.html', 1, NULL, '4', NULL, NULL, 'normal');
INSERT INTO `base_menu` VALUES (69, '基础状态字典', '2', '55', NULL, '../pages/manager/base_state/list.html', 1, NULL, '4', NULL, NULL, 'normal');
INSERT INTO `base_menu` VALUES (70, '功能模块字典', '2', '55', NULL, '../pages/manager/base_module/list.html', 1, NULL, '4', NULL, NULL, 'normal');
INSERT INTO `base_menu` VALUES (71, '成绩管理', '2', '53', NULL, '../pages/manager/base_score/list.html', 1, NULL, '4', NULL, NULL, 'normal');
INSERT INTO `base_menu` VALUES (72, '课程管理', '2', '53', NULL, '../pages/manager/base_course/list.html', 1, NULL, '4', NULL, NULL, 'normal');
INSERT INTO `base_menu` VALUES (73, '邮件管理', '2', '52', NULL, '../pages/manager/base_message/list.html', 1, NULL, '4', NULL, NULL, 'normal');
INSERT INTO `base_menu` VALUES (74, '考研项目', '2', '50', NULL, '../pages/manager/postgraduate_exam/list.html', 1, NULL, '4', NULL, NULL, 'normal');
INSERT INTO `base_menu` VALUES (75, '考研预报名', '2', '50', NULL, '../pages/manager/postgraduate_exam_enroll/list.html', 1, NULL, '4', NULL, NULL, 'normal');
INSERT INTO `base_menu` VALUES (76, '签到项目', '2', '54', NULL, '../pages/manager/attendance/list.html', 1, NULL, '4', NULL, NULL, 'normal');
INSERT INTO `base_menu` VALUES (77, '签到记录', '2', '54', NULL, '../pages/manager/attendance_record/list.html', 1, NULL, '4', NULL, NULL, 'normal');
INSERT INTO `base_menu` VALUES (78, '科研项目管理', '2', '59', NULL, '../pages/manager/scient_subject/list.html', 1, NULL, '4', NULL, NULL, 'normal');
INSERT INTO `base_menu` VALUES (79, '成绩查询', '2', '33', NULL, '../pages/student/base_score/list.html', 1, NULL, '1', NULL, NULL, 'normal');
INSERT INTO `base_menu` VALUES (80, '课程查询', '2', '33', NULL, '../pages/student/base_course/list.html', 1, NULL, '1', NULL, NULL, 'normal');
INSERT INTO `base_menu` VALUES (81, '题目列表', '2', '34', NULL, '../pages/student/psy_test/list.html', 1, NULL, '1', NULL, NULL, 'normal');
INSERT INTO `base_menu` VALUES (82, '我的测试', '2', '34', NULL, NULL, 1, NULL, '1', NULL, NULL, 'normal');
INSERT INTO `base_menu` VALUES (83, '项目列表', '2', '35', NULL, '../pages/student/scient_subject/list.html', 1, NULL, '1', NULL, NULL, 'normal');
INSERT INTO `base_menu` VALUES (84, '热门推荐', '2', '36', NULL, '../pages/student/new/list.html', 1, NULL, '1', NULL, NULL, 'normal');
INSERT INTO `base_menu` VALUES (85, '我的考勤', '2', '37', NULL, '../pages/student/attendance_record/list.html', 1, NULL, '1', NULL, NULL, 'normal');
INSERT INTO `base_menu` VALUES (86, '奖学金列表', '2', '39', NULL, '../pages/student/scholarship/list.html', 1, NULL, '1', NULL, NULL, 'normal');
INSERT INTO `base_menu` VALUES (87, '我的申请', '2', '39', NULL, '../pages/student/scholarship_apply_record/list.html', 1, NULL, '1', NULL, NULL, 'normal');
INSERT INTO `base_menu` VALUES (88, '考研项目', '2', '40', NULL, '../pages/student/postgraduate_exam/list.html', 1, NULL, '1', NULL, NULL, 'normal');
INSERT INTO `base_menu` VALUES (89, '我的报名', '2', '40', NULL, '../pages/student/postgraduate_exam_enroll/list.html', 1, NULL, '1', NULL, NULL, 'normal');
INSERT INTO `base_menu` VALUES (90, '早读列表', '2', '41', NULL, '../pages/student/early_reading/list.html', 1, NULL, '1', NULL, NULL, 'normal');
INSERT INTO `base_menu` VALUES (91, '新闻管理', '1', '1', NULL, NULL, 2, NULL, '4', NULL, NULL, 'normal');
INSERT INTO `base_menu` VALUES (92, '新闻列表', '2', '91', NULL, '../pages/manager/base_new/list.html', 2, NULL, '4', NULL, NULL, 'normal');
INSERT INTO `base_menu` VALUES (93, '科研管理', '1', '1', NULL, NULL, 1, NULL, '2', NULL, NULL, 'normal');
INSERT INTO `base_menu` VALUES (94, '学习资讯', '1', '1', NULL, NULL, 1, NULL, '2', NULL, NULL, 'normal');
INSERT INTO `base_menu` VALUES (95, '考研信息', '1', '1', NULL, NULL, 1, NULL, '2', NULL, NULL, 'normal');
INSERT INTO `base_menu` VALUES (96, '学生管理', '1', '1', NULL, NULL, 1, NULL, '2', NULL, NULL, 'normal');
INSERT INTO `base_menu` VALUES (97, '科研项目发布', '2', '93', NULL, NULL, 1, NULL, '2', NULL, NULL, 'normal');
INSERT INTO `base_menu` VALUES (98, '学习资讯发布', '2', '93', NULL, NULL, 1, NULL, '2', NULL, NULL, 'delete');
INSERT INTO `base_menu` VALUES (99, '学习资讯发布', '2', '94', NULL, NULL, 1, NULL, '2', NULL, NULL, 'normal');
INSERT INTO `base_menu` VALUES (100, '考研信息发布', '2', '94', NULL, NULL, 1, NULL, '2', NULL, NULL, 'normal');
INSERT INTO `base_menu` VALUES (101, '学生管理', '2', '96', NULL, NULL, 1, NULL, '2', NULL, NULL, 'normal');
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
-- Table structure for base_new
-- ----------------------------
DROP TABLE IF EXISTS `base_new`;
CREATE TABLE `base_new` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `abstract` varchar(255) DEFAULT NULL COMMENT '简要',
  `detail` varchar(255) DEFAULT NULL COMMENT '介绍',
  `content` varchar(255) DEFAULT NULL COMMENT '正文',
  `img` varchar(255) DEFAULT NULL COMMENT '图片',
  `link` varchar(255) DEFAULT NULL COMMENT '外部链接',
  `create_time` varchar(255) DEFAULT NULL COMMENT '创建时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `del` varchar(255) DEFAULT NULL COMMENT '删除状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of base_new
-- ----------------------------
BEGIN;
INSERT INTO `base_new` VALUES (1, NULL, NULL, NULL, NULL, NULL, NULL, '1573401566', NULL, 'delete');
COMMIT;

-- ----------------------------
-- Table structure for base_school
-- ----------------------------
DROP TABLE IF EXISTS `base_school`;
CREATE TABLE `base_school` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `school_name` varchar(255) DEFAULT NULL COMMENT '学校名称',
  `school_describe` varchar(255) DEFAULT NULL COMMENT '描述',
  `school_address` varchar(255) DEFAULT NULL COMMENT '学校地址',
  `school_slogan` varchar(255) DEFAULT NULL COMMENT '校训',
  `school_logo` varchar(255) DEFAULT NULL COMMENT 'logo',
  `school_stu_num` varchar(255) DEFAULT NULL COMMENT '学生数量',
  `school_regis_time` varchar(255) DEFAULT NULL COMMENT '注册时间',
  `create_time` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `del` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of base_school
-- ----------------------------
BEGIN;
INSERT INTO `base_school` VALUES (1, 'dsads', '描述', '地址', '校训', 'logo\'', NULL, '123', NULL, NULL, 'delete');
INSERT INTO `base_school` VALUES (2, '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'delete');
INSERT INTO `base_school` VALUES (3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1572186766', NULL, 'delete');
INSERT INTO `base_school` VALUES (4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1572186779', NULL, 'delete');
INSERT INTO `base_school` VALUES (5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1572186784', NULL, 'delete');
INSERT INTO `base_school` VALUES (6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1572186788', NULL, 'delete');
INSERT INTO `base_school` VALUES (7, '学校名称', '描述', 'xiaozhi', 'xiaozun', NULL, NULL, NULL, '1572186857', NULL, 'delete');
INSERT INTO `base_school` VALUES (8, '学校名称', '描述', '校址', '校训', NULL, NULL, '10/30/2019', '1572187068', NULL, 'delete');
INSERT INTO `base_school` VALUES (9, 'fdasf', 'dasdf', 'dsadsa', 'dsad', NULL, NULL, '10/29/2019', '1572187095', NULL, 'delete');
INSERT INTO `base_school` VALUES (10, 'dsad', NULL, NULL, NULL, NULL, NULL, NULL, '1572188526', NULL, 'delete');
INSERT INTO `base_school` VALUES (11, '广东海洋大学', '描述', '校址', '校训', 'logo', NULL, '10/31/2019', '1572188747', NULL, 'normal');
INSERT INTO `base_school` VALUES (12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1572189176', NULL, 'delete');
INSERT INTO `base_school` VALUES (13, 'asdsad', 'fdafd', NULL, NULL, NULL, NULL, NULL, '1573144446', NULL, 'normal');
COMMIT;

-- ----------------------------
-- Table structure for base_score
-- ----------------------------
DROP TABLE IF EXISTS `base_score`;
CREATE TABLE `base_score` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `course_id` varchar(255) DEFAULT NULL COMMENT '课程id',
  `course_name` varchar(255) DEFAULT NULL COMMENT '课程名称',
  `student_id` varchar(255) DEFAULT NULL COMMENT '学生id',
  `teacher_id` varchar(255) DEFAULT NULL COMMENT '教师id',
  `score_value` double(255,0) DEFAULT NULL COMMENT '分数',
  `gpa` double(255,0) DEFAULT NULL COMMENT '绩点',
  `create_time` varchar(255) DEFAULT NULL COMMENT '创建时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `del` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of base_score
-- ----------------------------
BEGIN;
INSERT INTO `base_score` VALUES (1, '1', NULL, '7', '7', NULL, NULL, '1573224245', NULL, 'delete');
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
-- Table structure for base_type
-- ----------------------------
DROP TABLE IF EXISTS `base_type`;
CREATE TABLE `base_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `module_id` varchar(255) DEFAULT NULL COMMENT 'moduleid',
  `type` varchar(255) DEFAULT NULL COMMENT '类型',
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
  `create_time` varchar(255) DEFAULT NULL COMMENT '创建时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `del` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of base_user
-- ----------------------------
BEGIN;
INSERT INTO `base_user` VALUES (7, '456', '456', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '学生', NULL, NULL, '1572004895', NULL, 'normal');
INSERT INTO `base_user` VALUES (8, 'admin', 'admin', '系统管理员', '134126', 'email', '联系地址', 'wchat', 'qq', '26', '', 'hello', '地区', '4', '系统管理员', NULL, NULL, NULL, NULL, 'normal');
INSERT INTO `base_user` VALUES (9, '123', '123', '周先生', '电话', 'email', '地址', '13413739238923', 'qq号', '21', NULL, '签名', '广东', '1', '学生', NULL, NULL, '1572147442', NULL, 'normal');
INSERT INTO `base_user` VALUES (12, '789', '789', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '学生', NULL, NULL, '1572150642', NULL, 'normal');
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of base_user_type
-- ----------------------------
BEGIN;
INSERT INTO `base_user_type` VALUES (1, '1', NULL, '学生', NULL, NULL, 'normal');
INSERT INTO `base_user_type` VALUES (2, '2', NULL, '教师', NULL, NULL, 'normal');
INSERT INTO `base_user_type` VALUES (3, '3', NULL, '管理员', NULL, NULL, 'normal');
INSERT INTO `base_user_type` VALUES (4, '4', NULL, '系统管理员', NULL, NULL, 'normal');
COMMIT;

-- ----------------------------
-- Table structure for early_reading
-- ----------------------------
DROP TABLE IF EXISTS `early_reading`;
CREATE TABLE `early_reading` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `reading_name` varchar(255) DEFAULT NULL COMMENT '早读名称',
  `reading_time` varchar(255) DEFAULT NULL COMMENT '早读时间',
  `reading_address` varchar(255) DEFAULT NULL COMMENT '早读地点',
  `reading_abstract` varchar(255) DEFAULT NULL COMMENT '简介',
  `reading_type` varchar(255) DEFAULT NULL COMMENT '类型',
  `reading_class` varchar(255) DEFAULT NULL COMMENT '早读班级',
  `reading_state` varchar(255) DEFAULT NULL COMMENT '状态',
  `create_time` varchar(255) DEFAULT NULL COMMENT '创建时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `del` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for postgraduate_exam
-- ----------------------------
DROP TABLE IF EXISTS `postgraduate_exam`;
CREATE TABLE `postgraduate_exam` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `exam_name` varchar(255) DEFAULT NULL COMMENT '预报名名称',
  `exam_type` varchar(255) DEFAULT NULL COMMENT '考研类型',
  `exam_college` varchar(255) DEFAULT NULL COMMENT '招生院校',
  `exam_state` varchar(255) DEFAULT NULL COMMENT '状态',
  `exam_address` varchar(255) DEFAULT NULL COMMENT '地址',
  `exam_time` varchar(255) DEFAULT NULL COMMENT '考试时间',
  `exam_abstract` varchar(255) DEFAULT NULL COMMENT '简介',
  `exam_detail` varchar(255) DEFAULT NULL COMMENT '详细',
  `exam_img` varchar(255) DEFAULT NULL COMMENT '介绍图',
  `exam_publisher` varchar(255) DEFAULT NULL COMMENT '发布者',
  `create_time` varchar(255) DEFAULT NULL COMMENT '创建时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `del` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of postgraduate_exam
-- ----------------------------
BEGIN;
INSERT INTO `postgraduate_exam` VALUES (1, 'dsadsad', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1573222572', NULL, 'normal');
COMMIT;

-- ----------------------------
-- Table structure for postgraduate_exam_enroll
-- ----------------------------
DROP TABLE IF EXISTS `postgraduate_exam_enroll`;
CREATE TABLE `postgraduate_exam_enroll` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `postgraduate_exam_id` int(11) DEFAULT NULL COMMENT '考研项目ID',
  `realname` varchar(255) DEFAULT NULL COMMENT '真实姓名',
  `identify` varchar(255) DEFAULT NULL COMMENT '身份',
  `sno` varchar(255) DEFAULT NULL COMMENT '学号',
  `college_target` varchar(255) DEFAULT NULL COMMENT '目标院校',
  `major_target` varchar(255) DEFAULT NULL COMMENT '主修方向',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `del` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for psy_test_answer
-- ----------------------------
DROP TABLE IF EXISTS `psy_test_answer`;
CREATE TABLE `psy_test_answer` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `subject_id` int(11) DEFAULT NULL COMMENT '测试项目ID',
  `item_id` int(11) DEFAULT NULL COMMENT '题目id',
  `answer` varchar(255) DEFAULT NULL COMMENT '回答',
  `create_time` varchar(255) DEFAULT NULL COMMENT '创建时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `del` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for psy_test_answer_consult
-- ----------------------------
DROP TABLE IF EXISTS `psy_test_answer_consult`;
CREATE TABLE `psy_test_answer_consult` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `subject_id` int(11) DEFAULT NULL COMMENT '测试项目id',
  `subject_score_min` varchar(255) DEFAULT NULL COMMENT '最小值',
  `subject_score_max` varchar(255) DEFAULT NULL COMMENT '最大值',
  `describe` varchar(255) DEFAULT NULL COMMENT '描述',
  `create_time` varchar(255) DEFAULT NULL COMMENT '创建时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `del` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for psy_test_answer_record
-- ----------------------------
DROP TABLE IF EXISTS `psy_test_answer_record`;
CREATE TABLE `psy_test_answer_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `subject_id` int(11) DEFAULT NULL COMMENT '测试项目id',
  `state` varchar(255) DEFAULT NULL COMMENT '状态',
  `describe` varchar(255) DEFAULT NULL COMMENT '描述',
  `create_time` varchar(255) DEFAULT NULL COMMENT '创建时间',
  `remark` varchar(255) DEFAULT NULL,
  `del` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for psy_test_item
-- ----------------------------
DROP TABLE IF EXISTS `psy_test_item`;
CREATE TABLE `psy_test_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `subject_id` int(11) DEFAULT NULL COMMENT '测试项目id',
  `item_index` int(11) DEFAULT NULL COMMENT '排序号',
  `item_title` varchar(255) DEFAULT NULL COMMENT '标题',
  `item_option` varchar(255) DEFAULT NULL COMMENT '选项',
  `item_type` varchar(255) DEFAULT NULL COMMENT '类型',
  `create_time` varchar(255) DEFAULT NULL COMMENT '创建时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `del` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of psy_test_item
-- ----------------------------
BEGIN;
INSERT INTO `psy_test_item` VALUES (1, 1, NULL, '123', NULL, NULL, '1573221868', NULL, 'normal');
COMMIT;

-- ----------------------------
-- Table structure for psy_test_subject
-- ----------------------------
DROP TABLE IF EXISTS `psy_test_subject`;
CREATE TABLE `psy_test_subject` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `subject_title` varchar(255) DEFAULT NULL COMMENT '标题',
  `subject_abstract` varchar(255) DEFAULT NULL COMMENT '简介',
  `subject_detail` varchar(255) DEFAULT NULL COMMENT '详细',
  `subject_suit` varchar(255) DEFAULT NULL COMMENT '适用人群',
  `subject_publisher` varchar(255) DEFAULT NULL COMMENT '发布者',
  `create_time` varchar(255) DEFAULT NULL COMMENT '创建时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `del` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of psy_test_subject
-- ----------------------------
BEGIN;
INSERT INTO `psy_test_subject` VALUES (1, '标题', '详细', NULL, NULL, NULL, '1573221571', NULL, 'normal');
INSERT INTO `psy_test_subject` VALUES (2, '2323', '的撒的撒的', NULL, NULL, NULL, NULL, NULL, 'normal');
COMMIT;

-- ----------------------------
-- Table structure for scholarship
-- ----------------------------
DROP TABLE IF EXISTS `scholarship`;
CREATE TABLE `scholarship` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `scholarship_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '奖学金名称',
  `scholarship_abstract` varchar(255) DEFAULT NULL COMMENT '简介',
  `scholarship_detail` varchar(255) DEFAULT NULL COMMENT '详细',
  `scholarship_filter` varchar(255) DEFAULT NULL COMMENT '条件',
  `scholarship_money` varchar(255) DEFAULT NULL COMMENT '金额',
  `scholarship_level` varchar(255) DEFAULT NULL COMMENT '等级',
  `scholarship_number` varchar(255) DEFAULT NULL COMMENT '排序号',
  `create_time` varchar(255) DEFAULT NULL COMMENT '创建时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `del` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of scholarship
-- ----------------------------
BEGIN;
INSERT INTO `scholarship` VALUES (1, 'dsad', 'dsad', NULL, NULL, NULL, NULL, NULL, '1573054575', NULL, 'delete');
INSERT INTO `scholarship` VALUES (2, '323fdasfdasds大洒店', NULL, NULL, NULL, NULL, NULL, NULL, '1573220098', NULL, 'normal');
COMMIT;

-- ----------------------------
-- Table structure for scholarship_apply_record
-- ----------------------------
DROP TABLE IF EXISTS `scholarship_apply_record`;
CREATE TABLE `scholarship_apply_record` (
  `id` int(255) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `scholarship_id` int(11) DEFAULT NULL COMMENT '奖学金id',
  `distribution_name` varchar(255) DEFAULT NULL COMMENT '描述',
  `user_id` varchar(255) DEFAULT NULL COMMENT '申请人id',
  `apply_state` int(11) DEFAULT NULL COMMENT '申请状态',
  `gpa` varchar(255) DEFAULT NULL COMMENT '绩点',
  `score_report_img` varchar(255) DEFAULT NULL COMMENT '成绩单',
  `apply_describe` varchar(255) DEFAULT NULL COMMENT '申请理由',
  `create_time` varchar(255) DEFAULT NULL COMMENT '创建时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `del` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of scholarship_apply_record
-- ----------------------------
BEGIN;
INSERT INTO `scholarship_apply_record` VALUES (1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1573054794', NULL, 'delete');
INSERT INTO `scholarship_apply_record` VALUES (2, 2, 'dsadsa', '9', NULL, NULL, NULL, NULL, '1573364303', NULL, 'normal');
COMMIT;

-- ----------------------------
-- Table structure for scholarship_distribution
-- ----------------------------
DROP TABLE IF EXISTS `scholarship_distribution`;
CREATE TABLE `scholarship_distribution` (
  `id` int(255) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `scholarship_id` int(11) DEFAULT NULL COMMENT '奖学金id',
  `distribution_name` varchar(255) DEFAULT NULL COMMENT '分配名称',
  `school_id` int(11) DEFAULT NULL COMMENT '学校id',
  `college_id` varchar(255) DEFAULT NULL COMMENT '学院id',
  `class_id` varchar(255) DEFAULT NULL COMMENT '班级id',
  `number` int(11) DEFAULT NULL COMMENT '数量',
  `create_time` varchar(255) DEFAULT NULL COMMENT '创建时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `del` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of scholarship_distribution
-- ----------------------------
BEGIN;
INSERT INTO `scholarship_distribution` VALUES (1, NULL, NULL, NULL, NULL, NULL, NULL, '1573054773', NULL, 'delete');
COMMIT;

-- ----------------------------
-- Table structure for scient_subject
-- ----------------------------
DROP TABLE IF EXISTS `scient_subject`;
CREATE TABLE `scient_subject` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `scient_subject_name` varchar(255) DEFAULT NULL COMMENT '科研项目名称',
  `scient_subject_publisher` varchar(255) DEFAULT NULL COMMENT '发布者',
  `scient_subject_member` varchar(255) DEFAULT NULL COMMENT '成员',
  `scient_subject_abstract` varchar(255) DEFAULT NULL COMMENT '简介',
  `scient_subject_detail` varchar(255) DEFAULT NULL COMMENT '详细',
  `scient_subject_img` varchar(255) DEFAULT NULL COMMENT '图片',
  `scient_subject_state` varchar(255) DEFAULT NULL COMMENT '状态',
  `scient_subject_file` varchar(255) DEFAULT NULL COMMENT '文件附件',
  `scient_subject_platform` varchar(255) DEFAULT NULL COMMENT '科研平台',
  `create_time` varchar(255) DEFAULT NULL COMMENT '创建时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `del` varchar(255) DEFAULT NULL COMMENT '删除状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of scient_subject
-- ----------------------------
BEGIN;
INSERT INTO `scient_subject` VALUES (1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1573057158', NULL, 'delete');
INSERT INTO `scient_subject` VALUES (2, '科研名称', '发布者', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1573312216', NULL, 'normal');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
