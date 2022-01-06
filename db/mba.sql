/*
 Navicat Premium Data Transfer

 Source Server         : local
 Source Server Type    : MySQL
 Source Server Version : 80027
 Source Host           : localhost:3306
 Source Schema         : mba

 Target Server Type    : MySQL
 Target Server Version : 80027
 File Encoding         : 65001

 Date: 24/12/2021 16:55:33
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for banner
-- ----------------------------
DROP TABLE IF EXISTS `banner`;
CREATE TABLE `banner`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题id',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '内容id',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '跳转的链接地址',
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '0打开对应内容 1打开链接',
  `img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'banner图片id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of banner
-- ----------------------------

-- ----------------------------
-- Table structure for basicinfo
-- ----------------------------
DROP TABLE IF EXISTS `basicinfo`;
CREATE TABLE `basicinfo`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `keywords` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `copyright` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `icp` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `updatetime` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of basicinfo
-- ----------------------------
INSERT INTO `basicinfo` VALUES (1, '网站名称', '网站信息描述', '关键词1,关键词2', '版权所有', '备案123号', '否', '2021-12-24 11:10:07');

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of roles
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_admin
-- ----------------------------
DROP TABLE IF EXISTS `tbl_admin`;
CREATE TABLE `tbl_admin`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户账号',
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码 md5加密',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `mobile` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `status` tinyint(1) NOT NULL COMMENT '0禁用  1启用 9删除',
  `sex` int(0) NULL DEFAULT NULL COMMENT '0女1男9其他',
  `birth` date NULL DEFAULT NULL,
  `wechat` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信号',
  `reg_time` int(0) UNSIGNED NOT NULL DEFAULT 0 COMMENT '注册时间',
  `last_login_time` int(0) UNSIGNED NOT NULL DEFAULT 0 COMMENT '最后登录时间',
  `update_time` int(0) UNSIGNED NULL DEFAULT 0 COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_admin
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_article
-- ----------------------------
DROP TABLE IF EXISTS `tbl_article`;
CREATE TABLE `tbl_article`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `type` tinyint(0) NOT NULL COMMENT '类别',
  `author` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `article_id` int(0) NOT NULL COMMENT '内容id',
  `create_time` datetime(0) NOT NULL COMMENT '添加时间',
  `deleted` int(0) NULL DEFAULT 0,
  `browse` int(0) NULL DEFAULT 0 COMMENT '浏览数',
  `flag` int(0) NULL DEFAULT 0 COMMENT '置顶 推荐 特荐  0是正常',
  `flag_time` datetime(0) NULL DEFAULT NULL COMMENT 'flag有效期',
  `tags` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标签',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地点',
  `like` int(0) NULL DEFAULT 0 COMMENT '点赞',
  `favorite` int(0) NULL DEFAULT 0 COMMENT '收藏',
  `share` int(0) NULL DEFAULT NULL COMMENT '分享',
  `update_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_article
-- ----------------------------
INSERT INTO `tbl_article` VALUES (1, 0, '1', '文章标题内容', 1, '2021-12-21 23:24:38', 0, 21, 1, NULL, 'null', NULL, 0, 0, 90, NULL);
INSERT INTO `tbl_article` VALUES (2, 1, '2', '热热特人特让人听123', 2, '2021-12-21 23:27:30', 0, 0, 0, NULL, 'null', NULL, 0, 0, NULL, NULL);
INSERT INTO `tbl_article` VALUES (4, 8, '2', '这里是nearing', 6, '2021-12-23 01:12:17', 0, 0, 0, NULL, '[\"555\",\"222\"]', NULL, 0, 0, NULL, NULL);
INSERT INTO `tbl_article` VALUES (5, 1, '', '文章5', 7, '2021-12-24 11:17:16', 0, 0, 0, NULL, '[]', NULL, 0, 0, NULL, NULL);
INSERT INTO `tbl_article` VALUES (6, 11, '', '文章666666', 8, '2021-12-24 11:17:27', 0, 0, 0, NULL, '[]', NULL, 0, 0, NULL, NULL);
INSERT INTO `tbl_article` VALUES (7, 8, '', '7777', 10, '2021-12-24 11:17:41', 0, 0, 0, NULL, '[]', NULL, 0, 0, NULL, NULL);
INSERT INTO `tbl_article` VALUES (8, 3, '', '999', 11, '2021-12-24 11:19:03', 0, 0, 0, NULL, '[]', NULL, 0, 0, NULL, NULL);
INSERT INTO `tbl_article` VALUES (9, 8, '', '文章标题9999999', 17, '2021-12-24 11:31:43', 0, 0, 0, NULL, '[]', NULL, 0, 0, NULL, NULL);
INSERT INTO `tbl_article` VALUES (11, 11, '', '元气森林发放了', 19, '2021-12-24 14:41:18', 0, 0, 0, NULL, '[\"2\",\"3\"]', NULL, 0, 0, NULL, NULL);
INSERT INTO `tbl_article` VALUES (12, 1, '', '志愿者报名活动开始了', 20, '2021-12-24 14:43:41', 0, 0, 0, NULL, '[]', NULL, 0, 0, NULL, NULL);
INSERT INTO `tbl_article` VALUES (13, 32, '', '11231231313123', 21, '2021-12-24 16:47:25', 0, 0, 0, NULL, '[\"11\"]', NULL, 0, 0, NULL, NULL);
INSERT INTO `tbl_article` VALUES (14, 31, '', '99999999', 22, '2021-12-24 16:48:30', 0, 0, 0, NULL, '[]', NULL, 0, 0, NULL, NULL);

-- ----------------------------
-- Table structure for tbl_article_detail
-- ----------------------------
DROP TABLE IF EXISTS `tbl_article_detail`;
CREATE TABLE `tbl_article_detail`  (
  `aid` int(0) NOT NULL AUTO_INCREMENT,
  `body` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '内容id',
  PRIMARY KEY (`aid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_article_detail
-- ----------------------------
INSERT INTO `tbl_article_detail` VALUES (1, '<p>收到罚单</p><p>史蒂夫阿福</p><p>水电费水电费</p><p>水电费舒服</p>');
INSERT INTO `tbl_article_detail` VALUES (2, '<p>很健康呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃反</p><p>反复复反反复复反反复复eer</p>');
INSERT INTO `tbl_article_detail` VALUES (3, '<p>3333333333</p>');
INSERT INTO `tbl_article_detail` VALUES (4, '<p>3333333333</p>');
INSERT INTO `tbl_article_detail` VALUES (5, '<p>这里是5的相关内容信息</p>');
INSERT INTO `tbl_article_detail` VALUES (6, '<p>66666667</p>');
INSERT INTO `tbl_article_detail` VALUES (7, '<p>这里是文章5</p>');
INSERT INTO `tbl_article_detail` VALUES (8, '<p>6666666</p>');
INSERT INTO `tbl_article_detail` VALUES (9, '<p>7777</p>');
INSERT INTO `tbl_article_detail` VALUES (10, '<p>7777</p>');
INSERT INTO `tbl_article_detail` VALUES (11, '<p>999</p>');
INSERT INTO `tbl_article_detail` VALUES (12, '<p><br></p>');
INSERT INTO `tbl_article_detail` VALUES (13, '<p><br></p>');
INSERT INTO `tbl_article_detail` VALUES (14, '<p><br></p>');
INSERT INTO `tbl_article_detail` VALUES (15, '<p><br></p>');
INSERT INTO `tbl_article_detail` VALUES (16, '<p><br></p>');
INSERT INTO `tbl_article_detail` VALUES (17, '<p>this is content</p>');
INSERT INTO `tbl_article_detail` VALUES (18, '<p>12313123</p>');
INSERT INTO `tbl_article_detail` VALUES (19, '<p>竟然发放了元气森林</p>');
INSERT INTO `tbl_article_detail` VALUES (20, '<p>234</p><p>2</p><p>34</p><p>24</p><p>24</p><p>2</p><p>42</p><p>4234234</p><p>234</p><p>2</p><p>34</p><p>234</p><p>234234</p><p><br></p><p>234</p><p>234</p><p>234</p><p><br></p>');
INSERT INTO `tbl_article_detail` VALUES (21, '<p>asdfasfdasfdasdfasfasdfsdf</p>');
INSERT INTO `tbl_article_detail` VALUES (22, '<p>889999</p>');

-- ----------------------------
-- Table structure for tbl_category
-- ----------------------------
DROP TABLE IF EXISTS `tbl_category`;
CREATE TABLE `tbl_category`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名字',
  `pid` int(0) NULL DEFAULT NULL COMMENT '父级id',
  `sort` int(0) NULL DEFAULT NULL COMMENT '排序',
  `hide` int(0) NULL DEFAULT 0 COMMENT '是否隐藏 0显示 1隐藏',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '跳转url',
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图标',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `user_id` int(0) NULL DEFAULT NULL COMMENT '创建人',
  `deleted` int(0) NULL DEFAULT NULL COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_category
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_comment
-- ----------------------------
DROP TABLE IF EXISTS `tbl_comment`;
CREATE TABLE `tbl_comment`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `sid` int(0) NULL DEFAULT NULL COMMENT '子评论id',
  `users_id` int(0) NULL DEFAULT NULL COMMENT '用户id',
  `cid` int(0) NULL DEFAULT NULL COMMENT '帖子id',
  `add_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评论时间',
  `text` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '文字内容',
  `img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片内容',
  `deleted` int(0) NULL DEFAULT 0 COMMENT '是否删除',
  `like` int(0) NULL DEFAULT NULL COMMENT '点赞',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_comment
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_major
-- ----------------------------
DROP TABLE IF EXISTS `tbl_major`;
CREATE TABLE `tbl_major`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `major` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sort` int(0) NULL DEFAULT NULL COMMENT '排序',
  `deleted` int(0) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_major
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_types
-- ----------------------------
DROP TABLE IF EXISTS `tbl_types`;
CREATE TABLE `tbl_types`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `show` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `typename` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `aliasname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `typesort` int(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `create_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_types
-- ----------------------------
INSERT INTO `tbl_types` VALUES (1, '1', '通知公告', 'notice1', 1, '2021-12-24 15:17:09', '0000-00-00 00:00:00');
INSERT INTO `tbl_types` VALUES (31, '1', '学习园地', 'study', 2, NULL, NULL);
INSERT INTO `tbl_types` VALUES (32, '1', '123', '3', 3, NULL, '2021-12-03 19:00:00');
INSERT INTO `tbl_types` VALUES (33, '2', '323', '2', 4, '2021-12-24 16:41:30', '2021-12-24 16:41:30');
INSERT INTO `tbl_types` VALUES (34, '2', '22', '23', 5, NULL, '2021-12-24 16:41:21');

-- ----------------------------
-- Table structure for tbl_user
-- ----------------------------
DROP TABLE IF EXISTS `tbl_user`;
CREATE TABLE `tbl_user`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `headimgurl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信头像 ',
  `nickname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信昵称',
  `openid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'openid',
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `status` int(0) NULL DEFAULT 1 COMMENT '状态 1是正常 2是冻结',
  `reg_time` datetime(0) NOT NULL COMMENT '注册时间',
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '二维码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_user
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_user_detail
-- ----------------------------
DROP TABLE IF EXISTS `tbl_user_detail`;
CREATE TABLE `tbl_user_detail`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '实名',
  `aliasname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '别名',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `name_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  `school` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学校',
  `major` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '专业',
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标签',
  `status` int(0) NULL DEFAULT 1 COMMENT '状态 1是正常 2是冻结',
  `upper_id` int(0) NULL DEFAULT NULL COMMENT '上级用户id',
  `down_id` int(0) NULL DEFAULT NULL COMMENT '介绍用户',
  `grade` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '年级',
  `position` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职位',
  `company` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公司',
  `industry` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '行业',
  `brief` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '简介',
  `reg_time` datetime(0) NOT NULL COMMENT '注册时间',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  `photo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '个人照片',
  `birthday` date NULL DEFAULT NULL COMMENT '生日',
  `emouthion` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '情感状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_user_detail
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `userid` char(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `realname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `logintime` datetime(0) NULL DEFAULT NULL COMMENT '登陆时间',
  `registetime` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '注册时间',
  `loginip` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登录IP',
  `updatetime` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `delete` int(0) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'liliang', NULL, '李亮', '18000009098', NULL, NULL, '2021-08-24 08:36:52', NULL, '2021-08-24 08:36:52', 0);
INSERT INTO `user` VALUES (2, 'lizheng', NULL, '李政', '19800000000', NULL, NULL, '2021-08-24 08:36:55', NULL, '2021-08-24 08:36:55', 0);
INSERT INTO `user` VALUES (10, '22222222222', NULL, '66', '66666666', '66', NULL, '2021-08-24 08:40:32', NULL, '2021-08-24 08:40:32', 1);
INSERT INTO `user` VALUES (11, '111', NULL, '111', '111', '111', NULL, '2021-08-24 08:46:53', NULL, '2021-08-24 08:46:53', 1);
INSERT INTO `user` VALUES (12, '222', NULL, '222', '22', '22', NULL, '2021-08-24 08:46:50', NULL, '2021-08-24 08:46:50', 1);
INSERT INTO `user` VALUES (13, '333', NULL, '33', '33', '33', NULL, '2021-08-24 08:44:49', NULL, '2021-08-24 08:44:49', 1);
INSERT INTO `user` VALUES (14, '44', NULL, '44', '44', '44', NULL, '2021-08-24 08:46:07', NULL, '2021-08-24 08:46:07', 1);
INSERT INTO `user` VALUES (15, '111', NULL, '11', '11', '11', NULL, '2021-08-24 11:02:36', NULL, '2021-08-24 11:02:36', 1);

-- ----------------------------
-- Table structure for userinfo
-- ----------------------------
DROP TABLE IF EXISTS `userinfo`;
CREATE TABLE `userinfo`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nav` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of userinfo
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
