/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80026
 Source Host           : localhost:3306
 Source Schema         : mba

 Target Server Type    : MySQL
 Target Server Version : 80026
 File Encoding         : 65001

 Date: 23/12/2021 01:28:01
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for banner
-- ----------------------------
DROP TABLE IF EXISTS `banner`;
CREATE TABLE `banner` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(255) DEFAULT NULL COMMENT '标题id',
  `content` varchar(255) DEFAULT NULL COMMENT '内容id',
  `url` varchar(255) DEFAULT NULL COMMENT '跳转的链接地址',
  `type` varchar(255) DEFAULT NULL COMMENT '0打开对应内容 1打开链接',
  `img` varchar(255) DEFAULT NULL COMMENT 'banner图片id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of banner
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for basicinfo
-- ----------------------------
DROP TABLE IF EXISTS `basicinfo`;
CREATE TABLE `basicinfo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `keywords` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `copyright` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `icp` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `updatetime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of basicinfo
-- ----------------------------
BEGIN;
INSERT INTO `basicinfo` VALUES (1, '网站名称', '网站信息1231313912398138198318391839018231231313', '1关键词1231231313123', '版权', '备案123131313', '否', '2021-08-19 19:44:55');
COMMIT;

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of roles
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for tbl_admin
-- ----------------------------
DROP TABLE IF EXISTS `tbl_admin`;
CREATE TABLE `tbl_admin` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户账号',
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码 md5加密',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '姓名',
  `mobile` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '手机号',
  `status` tinyint(1) NOT NULL COMMENT '0禁用  1启用 9删除',
  `sex` int DEFAULT NULL COMMENT '0女1男9其他',
  `birth` date DEFAULT NULL,
  `wechat` varchar(255) DEFAULT NULL COMMENT '微信号',
  `reg_time` int unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `last_login_time` int unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `update_time` int unsigned DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of tbl_admin
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for tbl_article
-- ----------------------------
DROP TABLE IF EXISTS `tbl_article`;
CREATE TABLE `tbl_article` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` tinyint NOT NULL COMMENT '类别',
  `author` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '标题',
  `article_id` int NOT NULL COMMENT '内容id',
  `create_time` datetime NOT NULL COMMENT '添加时间',
  `deleted` int DEFAULT '0',
  `browse` int DEFAULT '0' COMMENT '浏览数',
  `flag` int DEFAULT '0' COMMENT '置顶 推荐 特荐  0是正常',
  `flag_time` datetime DEFAULT NULL COMMENT 'flag有效期',
  `tags` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '标签',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '地点',
  `like` int DEFAULT '0' COMMENT '点赞',
  `favorite` int DEFAULT '0' COMMENT '收藏',
  `share` int DEFAULT NULL COMMENT '分享',
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of tbl_article
-- ----------------------------
BEGIN;
INSERT INTO `tbl_article` VALUES (1, 0, '1', '文章标题内容', 1, '2021-12-21 23:24:38', 0, 21, 1, NULL, 'null', NULL, 0, 0, 90, NULL);
INSERT INTO `tbl_article` VALUES (2, 1, '2', '热热特人特让人听123', 2, '2021-12-21 23:27:30', 0, 0, 0, NULL, 'null', NULL, 0, 0, NULL, NULL);
INSERT INTO `tbl_article` VALUES (3, 3, '1', '5555', 5, '2021-12-23 01:11:08', 0, 0, 0, NULL, '[]', NULL, 0, 0, NULL, NULL);
INSERT INTO `tbl_article` VALUES (4, 8, '2', '666', 6, '2021-12-23 01:12:17', 0, 0, 0, NULL, '[\"555\"]', NULL, 0, 0, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for tbl_article_detail
-- ----------------------------
DROP TABLE IF EXISTS `tbl_article_detail`;
CREATE TABLE `tbl_article_detail` (
  `aid` int NOT NULL AUTO_INCREMENT,
  `body` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '内容id',
  PRIMARY KEY (`aid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of tbl_article_detail
-- ----------------------------
BEGIN;
INSERT INTO `tbl_article_detail` VALUES (1, '<p>收到罚单</p><p>史蒂夫阿福</p><p>水电费水电费</p><p>水电费舒服</p>');
INSERT INTO `tbl_article_detail` VALUES (2, '<p>很健康呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃反</p><p>反复复反反复复反反复复eer</p>');
INSERT INTO `tbl_article_detail` VALUES (3, '<p>3333333333</p>');
INSERT INTO `tbl_article_detail` VALUES (4, '<p>3333333333</p>');
INSERT INTO `tbl_article_detail` VALUES (5, '<p>55555</p>');
INSERT INTO `tbl_article_detail` VALUES (6, '<p>66666667</p>');
COMMIT;

-- ----------------------------
-- Table structure for tbl_category
-- ----------------------------
DROP TABLE IF EXISTS `tbl_category`;
CREATE TABLE `tbl_category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名字',
  `pid` int DEFAULT NULL COMMENT '父级id',
  `sort` int DEFAULT NULL COMMENT '排序',
  `hide` int DEFAULT '0' COMMENT '是否隐藏 0显示 1隐藏',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '跳转url',
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '图标',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `user_id` int DEFAULT NULL COMMENT '创建人',
  `deleted` int DEFAULT NULL COMMENT '是否删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of tbl_category
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for tbl_comment
-- ----------------------------
DROP TABLE IF EXISTS `tbl_comment`;
CREATE TABLE `tbl_comment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sid` int DEFAULT NULL COMMENT '子评论id',
  `users_id` int DEFAULT NULL COMMENT '用户id',
  `cid` int DEFAULT NULL COMMENT '帖子id',
  `add_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '评论时间',
  `text` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '文字内容',
  `img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '图片内容',
  `deleted` int DEFAULT '0' COMMENT '是否删除',
  `like` int DEFAULT NULL COMMENT '点赞',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of tbl_comment
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for tbl_major
-- ----------------------------
DROP TABLE IF EXISTS `tbl_major`;
CREATE TABLE `tbl_major` (
  `id` int NOT NULL AUTO_INCREMENT,
  `major` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `sort` int DEFAULT NULL COMMENT '排序',
  `deleted` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of tbl_major
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for tbl_user
-- ----------------------------
DROP TABLE IF EXISTS `tbl_user`;
CREATE TABLE `tbl_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `headimgurl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '微信头像 ',
  `nickname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '微信昵称',
  `openid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'openid',
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '手机号',
  `status` int DEFAULT '1' COMMENT '状态 1是正常 2是冻结',
  `reg_time` datetime NOT NULL COMMENT '注册时间',
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '二维码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of tbl_user
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for tbl_user_detail
-- ----------------------------
DROP TABLE IF EXISTS `tbl_user_detail`;
CREATE TABLE `tbl_user_detail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '实名',
  `aliasname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '别名',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '手机号',
  `name_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '头像',
  `school` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '学校',
  `major` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '专业',
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '标签',
  `status` int DEFAULT '1' COMMENT '状态 1是正常 2是冻结',
  `upper_id` int DEFAULT NULL COMMENT '上级用户id',
  `down_id` int DEFAULT NULL COMMENT '介绍用户',
  `grade` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '年级',
  `position` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '职位',
  `company` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '公司',
  `industry` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '行业',
  `brief` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '简介',
  `reg_time` datetime NOT NULL COMMENT '注册时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `photo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '个人照片',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `emouthion` varchar(255) DEFAULT NULL COMMENT '情感状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of tbl_user_detail
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for types
-- ----------------------------
DROP TABLE IF EXISTS `types`;
CREATE TABLE `types` (
  `id` int NOT NULL AUTO_INCREMENT,
  `show` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `typename` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `aliasname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `typesort` int DEFAULT NULL,
  `updatetime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of types
-- ----------------------------
BEGIN;
INSERT INTO `types` VALUES (1, '1', 'HTML', 'html', 1, '2021-08-21 16:52:56');
INSERT INTO `types` VALUES (2, '1', 'CSS', 'css', 2, '2021-08-21 16:53:00');
INSERT INTO `types` VALUES (3, '1', 'JS', 'js', 3, '2021-08-21 16:53:04');
INSERT INTO `types` VALUES (5, '2', 'Node', 'node', 81, '2021-08-21 16:53:08');
INSERT INTO `types` VALUES (8, '1', 'Ts', 'ts', 7, '2021-08-21 16:53:11');
INSERT INTO `types` VALUES (11, '1', 'Vue', 'vue', 4, '2021-08-21 16:53:14');
INSERT INTO `types` VALUES (12, '2', 'react', 'react', 5, '2021-08-21 16:53:18');
INSERT INTO `types` VALUES (13, '1', 'gggg', 'aa', 81, '2021-08-21 19:22:23');
INSERT INTO `types` VALUES (14, '1', '555', '22', 9, NULL);
INSERT INTO `types` VALUES (15, '1', '1111', '1', 10, NULL);
COMMIT;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `userid` char(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '密码',
  `realname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '姓名',
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '手机号',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `logintime` datetime DEFAULT NULL COMMENT '登陆时间',
  `registetime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '注册时间',
  `loginip` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '登录IP',
  `updatetime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `delete` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of user
-- ----------------------------
BEGIN;
INSERT INTO `user` VALUES (1, 'liliang', NULL, '李亮', '18000009098', NULL, NULL, '2021-08-24 08:36:52', NULL, '2021-08-24 08:36:52', 0);
INSERT INTO `user` VALUES (2, 'lizheng', NULL, '李政', '19800000000', NULL, NULL, '2021-08-24 08:36:55', NULL, '2021-08-24 08:36:55', 0);
INSERT INTO `user` VALUES (10, '22222222222', NULL, '66', '66666666', '66', NULL, '2021-08-24 08:40:32', NULL, '2021-08-24 08:40:32', 1);
INSERT INTO `user` VALUES (11, '111', NULL, '111', '111', '111', NULL, '2021-08-24 08:46:53', NULL, '2021-08-24 08:46:53', 1);
INSERT INTO `user` VALUES (12, '222', NULL, '222', '22', '22', NULL, '2021-08-24 08:46:50', NULL, '2021-08-24 08:46:50', 1);
INSERT INTO `user` VALUES (13, '333', NULL, '33', '33', '33', NULL, '2021-08-24 08:44:49', NULL, '2021-08-24 08:44:49', 1);
INSERT INTO `user` VALUES (14, '44', NULL, '44', '44', '44', NULL, '2021-08-24 08:46:07', NULL, '2021-08-24 08:46:07', 1);
INSERT INTO `user` VALUES (15, '111', NULL, '11', '11', '11', NULL, '2021-08-24 11:02:36', NULL, '2021-08-24 11:02:36', 1);
COMMIT;

-- ----------------------------
-- Table structure for userinfo
-- ----------------------------
DROP TABLE IF EXISTS `userinfo`;
CREATE TABLE `userinfo` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nav` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of userinfo
-- ----------------------------
BEGIN;
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
