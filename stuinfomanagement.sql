/*
 Navicat Premium Data Transfer

 Source Server         : database
 Source Server Type    : MySQL
 Source Server Version : 80019
 Source Host           : localhost:3306
 Source Schema         : stuinfomanagement

 Target Server Type    : MySQL
 Target Server Version : 80019
 File Encoding         : 65001

 Date: 15/06/2020 09:22:45
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course`  (
  `cs_no` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '课程编号',
  `cs_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '课程名称',
  `cs_number` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '选修人数',
  `cs_credit` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '课程学分',
  `cs_teacher` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '授课老师工号',
  PRIMARY KEY (`cs_no`) USING BTREE,
  INDEX `cs_teacher`(`cs_teacher`) USING BTREE,
  CONSTRAINT `course_ibfk_1` FOREIGN KEY (`cs_teacher`) REFERENCES `teacher` (`th_no`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES ('001', '操作系统', '62', '4', '005');
INSERT INTO `course` VALUES ('002', '数据结构', '62', '5', '002');
INSERT INTO `course` VALUES ('003', 'JavaEE', '62', '6', '003');
INSERT INTO `course` VALUES ('1', '数据结构', '62', '4', '001');
INSERT INTO `course` VALUES ('2', '2', '2', '2', '002');

-- ----------------------------
-- Table structure for dormitory
-- ----------------------------
DROP TABLE IF EXISTS `dormitory`;
CREATE TABLE `dormitory`  (
  `dorm_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '宿舍号',
  `dorm_number` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '宿舍人数',
  `dorm_monitor` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '宿舍长学号',
  PRIMARY KEY (`dorm_id`) USING BTREE,
  INDEX `dorm_id`(`dorm_id`) USING BTREE,
  INDEX `dorm_monitor`(`dorm_monitor`) USING BTREE,
  INDEX `dorm_number`(`dorm_number`) USING BTREE,
  CONSTRAINT `dormitory_ibfk_1` FOREIGN KEY (`dorm_monitor`) REFERENCES `student` (`su_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dormitory
-- ----------------------------
INSERT INTO `dormitory` VALUES ('1415', '6人间', '171210222');
INSERT INTO `dormitory` VALUES ('5410', '8人间', '171210239');
INSERT INTO `dormitory` VALUES ('5411', '8人间', '171210111');
INSERT INTO `dormitory` VALUES ('5412', '8人间', '171210140');
INSERT INTO `dormitory` VALUES ('5413', '8人间', '171210135');
INSERT INTO `dormitory` VALUES ('5420', '8人间', '171210240');
INSERT INTO `dormitory` VALUES ('5421', '6人间', '171210209');

-- ----------------------------
-- Table structure for manager
-- ----------------------------
DROP TABLE IF EXISTS `manager`;
CREATE TABLE `manager`  (
  `ad_id` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '管理员账号',
  `ad_password` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '管理员密码',
  `ad_phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '管理员电话',
  `ad_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ad_email` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`ad_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of manager
-- ----------------------------
INSERT INTO `manager` VALUES ('171210238', 'xxyxxy', '13213807661', '吴莹', 'xiaxinyong@163.com');
INSERT INTO `manager` VALUES ('171210239', 'xxy', '13213807661', '夏新勇', 'xiaxinyong@163.com');

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `su_id` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '学生学号',
  `su_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '学生姓名',
  `su_sex` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '学生性别',
  `su_dm` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '学生宿舍',
  `su_class` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '学生班级',
  `su_email` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '学生邮箱',
  `su_phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '学生电话',
  `su_pic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学生照片',
  PRIMARY KEY (`su_id`) USING BTREE,
  INDEX `student_ibfk_1`(`su_dm`) USING BTREE,
  CONSTRAINT `student_ibfk_1` FOREIGN KEY (`su_dm`) REFERENCES `dormitory` (`dorm_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('171210111', '王二', '男', '5410', '17级计科1班', '111@163.com', '123456', 'a892520a-0263-4057-b196-cee1158c5ca8_171210111.jpg');
INSERT INTO `student` VALUES ('171210135', '小王', '男', '5413', '17级计科1班', '222@163.com', '123456', 'd47bed94-8e8f-4ccf-844a-7b51a80885cd_171210135.jpg');
INSERT INTO `student` VALUES ('171210139', '张三', '男', '5410', '17级计科1班', 'xiaxinyong@163.com', '13101768723', '68381fb0-2f2c-4d50-97e6-d408e659a405_171210139.jpg');
INSERT INTO `student` VALUES ('171210140', '小吴', '男', '5410', '17级计科2班', '777@163.com', '123456', NULL);
INSERT INTO `student` VALUES ('171210209', '小丽', '女', '1415', '17级计科1班', '666@163.com', '1233456', NULL);
INSERT INTO `student` VALUES ('171210222', '小刘', '女', '1415', '17级计科2班', '333@163.com', '123456', NULL);
INSERT INTO `student` VALUES ('171210239', '夏新勇', '男', '5410', '17级计科2班', 'xiaxinyong@163.com', '13213807661', NULL);
INSERT INTO `student` VALUES ('171210240', '吴莹', '男', '5410', '17级计科2班', 'xiaxinyong@163.com', '13213807661', NULL);
INSERT INTO `student` VALUES ('171210241', '夏新成', '男', '5420', '17级计科2班', 'xiaxincheng@163.com', '13213807661', NULL);

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher`  (
  `th_no` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '教师工号',
  `th_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '教师姓名',
  `th_sex` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '教师性别',
  `th_address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '教师地址',
  `th_phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '教师电话',
  `th_tittle` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '教师职称',
  `th_email` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`th_no`) USING BTREE,
  INDEX `th_no`(`th_no`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES ('001', '李老师', '男', '河南省平顶山市', '13101768723', '讲师', '123456@126.com');
INSERT INTO `teacher` VALUES ('002', '王老师', '男', '河南省平顶山市', '13101768723', '讲师', '123456@126.com');
INSERT INTO `teacher` VALUES ('003', '张老师', '男', '河南省平顶山市', '13101768723', '副教授', '123456@126.com');
INSERT INTO `teacher` VALUES ('004', '夏老师', '男', '河南省，信阳市', '13213807661', '教授', 'xiaxinyong@163.com');
INSERT INTO `teacher` VALUES ('005', '夏老师', '女', '河南省，信阳市', '13213807661', '教授', 'xiaxinyong@163.com');
INSERT INTO `teacher` VALUES ('006', '徐老师', '女', '河南省平顶山市', '1234567890', '讲师', '123@qq.com');
INSERT INTO `teacher` VALUES ('1', '1', '1', '1', '1', '1', '1');
INSERT INTO `teacher` VALUES ('2', '2', '2', '2', '2', '2', '2');

SET FOREIGN_KEY_CHECKS = 1;
