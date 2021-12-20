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

 Date: 21/12/2021 00:48:11
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `author` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `typeid` int DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  `updatetime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `tags` varchar(255) DEFAULT NULL,
  `contentid` int NOT NULL,
  `delete` int DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of article
-- ----------------------------
BEGIN;
INSERT INTO `article` VALUES (87, '8700', '', 1, '2021-08-21 01:50:51', '2021-08-24 08:35:40', '[\"87\",\"870\"]', 87, 1);
INSERT INTO `article` VALUES (88, '880', '', 3, '2021-08-21 02:33:49', '2021-08-24 08:35:41', '[\"8888\"]', 89, 1);
INSERT INTO `article` VALUES (89, '999777', '', 1, '2021-08-21 04:06:42', '2021-08-24 08:35:43', '[\"99\",\"999\"]', 90, 1);
INSERT INTO `article` VALUES (90, '123', '', 8, '2021-08-25 20:39:16', '2021-08-26 09:59:55', '[]', 91, 0);
INSERT INTO `article` VALUES (91, '123123', '', 8, '2021-08-25 20:39:31', '2021-08-26 09:59:56', '[]', 92, 0);
INSERT INTO `article` VALUES (92, '111', '', 11, '2021-08-25 20:39:54', '2021-08-26 10:00:03', '[]', 93, 0);
INSERT INTO `article` VALUES (93, '123', '', 11, '2021-08-25 20:41:53', '2021-08-26 10:00:01', '[\"11\"]', 94, 0);
INSERT INTO `article` VALUES (94, '5555', '', 8, '2021-08-25 20:42:04', '2021-08-26 09:59:58', '[\"2222\"]', 95, 0);
INSERT INTO `article` VALUES (95, '1231231313123123123123', '', 8, '2021-08-26 09:59:46', NULL, '[]', 96, 0);
INSERT INTO `article` VALUES (96, '123123', '', 2, '2021-08-26 15:39:35', NULL, '[]', 97, 0);
INSERT INTO `article` VALUES (97, '11131233123123123123', '', 2, '2021-08-26 15:39:44', NULL, '[]', 98, 0);
INSERT INTO `article` VALUES (98, '112', '', 1, '2021-08-31 16:14:54', NULL, '[]', 99, 0);
INSERT INTO `article` VALUES (99, '113', '', 3, '2021-08-31 16:15:01', NULL, '[]', 100, 0);
INSERT INTO `article` VALUES (100, '114', '', 3, '2021-08-31 16:15:13', NULL, '[\"111\"]', 104, 0);
INSERT INTO `article` VALUES (101, '115', '', 3, '2021-08-31 16:15:19', NULL, '[]', 105, 0);
INSERT INTO `article` VALUES (102, '116', '', 3, '2021-08-31 16:15:34', NULL, '[]', 107, 0);
INSERT INTO `article` VALUES (103, '117', '', 2, '2021-08-31 16:15:41', NULL, '[]', 108, 0);
INSERT INTO `article` VALUES (104, '118', '', 3, '2021-08-31 16:15:53', NULL, '[]', 110, 0);
INSERT INTO `article` VALUES (105, '119', '', 1, '2021-08-31 16:19:49', NULL, '[]', 112, 0);
INSERT INTO `article` VALUES (106, '120', '', 3, '2021-08-31 16:20:01', NULL, '[]', 114, 0);
INSERT INTO `article` VALUES (107, '1222', '', 2, '2021-08-31 16:36:36', NULL, '[]', 123, 0);
INSERT INTO `article` VALUES (108, 'aaa', '', 2, '2021-12-21 00:30:24', NULL, '[]', 124, 0);
COMMIT;

-- ----------------------------
-- Table structure for articleattr
-- ----------------------------
DROP TABLE IF EXISTS `articleattr`;
CREATE TABLE `articleattr` (
  `id` int NOT NULL,
  `articletype` varchar(255) DEFAULT NULL,
  `articletag` varchar(255) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  `updatetime` datetime DEFAULT NULL,
  `deletetime` datetime DEFAULT NULL,
  `keywords` varchar(255) DEFAULT NULL,
  `articleprop` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of articleattr
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for articlebody
-- ----------------------------
DROP TABLE IF EXISTS `articlebody`;
CREATE TABLE `articlebody` (
  `aid` int NOT NULL AUTO_INCREMENT,
  `body` mediumtext,
  PRIMARY KEY (`aid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of articlebody
-- ----------------------------
BEGIN;
INSERT INTO `articlebody` VALUES (68, '<p><br></p><p class=\"ql-align-justify\">        要求抓好政策落实，针对经济运行新情况加强跨周期调节；审议通过“十四五”就业促进规划，全面强化就业优先政策，推动就业扩容提质。8月16日的国务院常务会定了这两件大事。会上，李克强总理作出了哪些部署？</p><p class=\"ql-align-justify\">要求抓好政策落实 针对经济运行新情况加强跨周期调节</p><p class=\"ql-align-justify\">会议指出，7月中下旬以来，我国多地发生极端天气、造成严重洪涝灾害，多省多点出现新冠肺炎疫情，大宗商品价格高位波动，国际经济形势错综复杂。各地区各部门要认真贯彻落实党中央、国务院部署，有效应对新挑战，加强跨周期调节，保持经济运行在合理区间。</p><p class=\"ql-align-justify\">1.扎实做好遏制疫情和防汛救灾、恢复重建工作。各地要严格落实责任和措施，毫不松懈抓好疫情防控，完善常态化疫情防控机制，特别要守住关键环节的关口。进一步加强洪涝等灾害预警和抢险应对。加大支持力度，推动受灾地区加快恢复重建。抓紧抓好秋粮补种改种、水毁农田和设施修复、城市防洪排涝设施完善等。</p><p class=\"ql-align-justify\">2.突出做好保就业工作。促进市场化社会化就业，加强高校毕业生、农民工等重点群体和困难群众就业帮扶，通过稳定就业保障群众收入和生活。</p><p class=\"ql-align-justify\">3.着力为市场主体纾困解难。落实好既定的减税降费举措，遏制乱收费。引导金融机构运用好降准资金等，加强对中小微企业的金融服务。</p><p class=\"ql-align-justify\">4.&nbsp;做好市场保供稳价工作。完善并落实重要原材料价格上涨应对方案，合理增加国内生产，科学组织储备投放，强化重点商品市场联动监管。持续实施生活物资保障机制，保证市场供应充裕。</p><p class=\"ql-align-justify\">5.&nbsp;做好受灾群众安置和基本生活保障，北方地区要提前做好保障受灾群众安全温暖过冬的工作。</p><p class=\"ql-align-justify\">会议要求，各地区各部门要密切跟踪经济走势变化，优化政策组合。促进消费稳定恢复增长，用好地方政府专项债带动扩大有效投资，以更有效的开放举措稳定外贸外资，加强政策协调和解读，增强市场主体信心，保持经济平稳运行。</p><p class=\"ql-align-justify\">审议通过“十四五”就业促进规划 全面强化就业优先政策推动就业扩容提质</p><p class=\"ql-align-justify\">会议指出，“十四五”时期我国城镇就业压力依然较大，要继续把就业摆在经济社会发展和宏观政策优先位置，强化政府责任，坚持市场主导，推动实现更加充分更高质量就业。</p><p class=\"ql-align-justify\">1.强化财政、货币等政策支持就业的导向，促进吸纳就业能力强的劳动密集型行业发展，推动服务业线上线下融合发展，多渠道促进灵活就业。</p><p class=\"ql-align-justify\">2.强化创业带动就业，放大就业倍增效应。深化“放管服”改革，破除束缚创业的壁垒，加强创业支持，保护企业家精神，激发劳动者创业积极性。</p><p class=\"ql-align-justify\">3.推进新产业新业态新商业模式健康发展，增加新的就业岗位。</p><p class=\"ql-align-justify\">4.&nbsp;完善机制和政策，做好高校毕业生、农民工、退役军人和脱贫人口等就业服务。努力消除就业歧视，加强灵活就业人员和大龄、妇女劳动者等权益保护。</p><p class=\"ql-align-justify\">5.&nbsp;面向市场需要加强职业技能培训，提升劳动者技能和安全生产素质。</p><p class=\"ql-align-justify\">栏目主编：秦红</p><p class=\"ql-align-justify\">本文作者：中国政府网</p><p class=\"ql-align-justify\">文字编辑：李林蔚</p><p class=\"ql-align-justify\">题图来源：图虫</p><p class=\"ql-align-justify\">图片编辑：徐佳敏</p><p>123</p>');
INSERT INTO `articlebody` VALUES (69, '<p>111123123123</p>');
INSERT INTO `articlebody` VALUES (70, '<p>111123123123</p><p>asdasd</p><p>a</p><p>sda</p><p>dsadsads</p><p><br></p>');
INSERT INTO `articlebody` VALUES (71, '<p>111123123123</p><p>asdasd</p><p>a</p><p>sda</p><p>dsadsads</p><p><br></p>');
INSERT INTO `articlebody` VALUES (72, '<p>111123123123</p><p>asdasd</p><p>a</p><p>sda</p><p>dsadsads</p><p><br></p>');
INSERT INTO `articlebody` VALUES (73, '<p>999</p>');
INSERT INTO `articlebody` VALUES (74, '<p>222222</p>');
INSERT INTO `articlebody` VALUES (75, '<p>888</p>');
INSERT INTO `articlebody` VALUES (76, '<p>888</p>');
INSERT INTO `articlebody` VALUES (86, '111');
INSERT INTO `articlebody` VALUES (87, '<p>8877700</p>');
INSERT INTO `articlebody` VALUES (88, '<p>88888</p>');
INSERT INTO `articlebody` VALUES (89, '<p>000058</p>');
INSERT INTO `articlebody` VALUES (90, '<p>9999999777</p>');
INSERT INTO `articlebody` VALUES (91, '<p>123</p>');
INSERT INTO `articlebody` VALUES (92, '<p>123123</p>');
INSERT INTO `articlebody` VALUES (93, '<p>12312313</p>');
INSERT INTO `articlebody` VALUES (94, '<p>123131</p>');
INSERT INTO `articlebody` VALUES (95, '<p>555</p>');
INSERT INTO `articlebody` VALUES (96, '<p>111112312313</p>');
INSERT INTO `articlebody` VALUES (97, '<p>3333</p>');
INSERT INTO `articlebody` VALUES (98, '<p>123123</p>');
INSERT INTO `articlebody` VALUES (99, '<p>123123123</p>');
INSERT INTO `articlebody` VALUES (100, '<p>1123123</p>');
INSERT INTO `articlebody` VALUES (101, '<p>123412341</p>');
INSERT INTO `articlebody` VALUES (102, '<p>123412341</p>');
INSERT INTO `articlebody` VALUES (103, '<p>123412341</p>');
INSERT INTO `articlebody` VALUES (104, '<p>123412341</p>');
INSERT INTO `articlebody` VALUES (105, '<p>1234134</p>');
INSERT INTO `articlebody` VALUES (106, '<p>134143</p>');
INSERT INTO `articlebody` VALUES (107, '<p>134143</p>');
INSERT INTO `articlebody` VALUES (108, '<p>12431234</p>');
INSERT INTO `articlebody` VALUES (109, '<p>3452345</p>');
INSERT INTO `articlebody` VALUES (110, '<p>3452345</p>');
INSERT INTO `articlebody` VALUES (111, '<p><br></p>');
INSERT INTO `articlebody` VALUES (112, '<p>123123123123</p>');
INSERT INTO `articlebody` VALUES (113, '<p>123132123</p>');
INSERT INTO `articlebody` VALUES (114, '<p>123132123</p>');
INSERT INTO `articlebody` VALUES (115, '<p><br></p>');
INSERT INTO `articlebody` VALUES (116, '<p><br></p>');
INSERT INTO `articlebody` VALUES (117, '<p><br></p>');
INSERT INTO `articlebody` VALUES (118, '<p><br></p>');
INSERT INTO `articlebody` VALUES (119, '<p><br></p>');
INSERT INTO `articlebody` VALUES (120, '<p><br></p>');
INSERT INTO `articlebody` VALUES (121, '<p><br></p>');
INSERT INTO `articlebody` VALUES (122, '<p><br></p>');
INSERT INTO `articlebody` VALUES (123, '<p><br></p>');
INSERT INTO `articlebody` VALUES (124, '<p>fffffff</p>');
COMMIT;

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
  `title` varchar(255) DEFAULT NULL,
  `desc` varchar(255) DEFAULT NULL,
  `keywords` varchar(255) DEFAULT NULL,
  `copyright` varchar(255) DEFAULT NULL,
  `icp` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `updatetime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
-- Table structure for tbl_content
-- ----------------------------
DROP TABLE IF EXISTS `tbl_content`;
CREATE TABLE `tbl_content` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category` tinyint NOT NULL COMMENT '类别',
  `users_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '标题',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '内容id',
  `create_time` datetime NOT NULL COMMENT '添加时间',
  `deleted` int DEFAULT '0',
  `browse` int DEFAULT '0' COMMENT '浏览数',
  `flag` int DEFAULT '0' COMMENT '置顶 推荐 特荐  0是正常',
  `flag_time` datetime DEFAULT NULL COMMENT 'flag有效期',
  `tag` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '标签',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '地点',
  `like` int DEFAULT '0' COMMENT '点赞',
  `favorite` int DEFAULT '0' COMMENT '收藏',
  `share` int DEFAULT NULL COMMENT '分享',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of tbl_content
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for tbl_content_detail
-- ----------------------------
DROP TABLE IF EXISTS `tbl_content_detail`;
CREATE TABLE `tbl_content_detail` (
  `cid` int NOT NULL AUTO_INCREMENT,
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '内容id',
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of tbl_content_detail
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
  `show` char(1) DEFAULT NULL,
  `typename` varchar(20) NOT NULL,
  `aliasname` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `typesort` int DEFAULT NULL,
  `updatetime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
  `userid` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `password` varchar(255) DEFAULT NULL COMMENT '密码',
  `realname` varchar(255) DEFAULT NULL COMMENT '姓名',
  `phone` varchar(255) DEFAULT NULL COMMENT '手机号',
  `email` varchar(255) DEFAULT NULL,
  `logintime` datetime DEFAULT NULL COMMENT '登陆时间',
  `registetime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '注册时间',
  `loginip` varchar(20) DEFAULT NULL COMMENT '登录IP',
  `updatetime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `delete` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
  `nav` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of userinfo
-- ----------------------------
BEGIN;
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
