/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80034 (8.0.34)
 Source Host           : localhost:3306
 Source Schema         : leadnews_article

 Target Server Type    : MySQL
 Target Server Version : 80034 (8.0.34)
 File Encoding         : 65001

 Date: 05/03/2024 21:36:56
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for ap_article
-- ----------------------------
DROP TABLE IF EXISTS `ap_article`;
CREATE TABLE `ap_article`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '标题',
  `author_id` int UNSIGNED NULL DEFAULT NULL COMMENT '文章作者的ID',
  `author_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '作者昵称',
  `channel_id` int UNSIGNED NULL DEFAULT NULL COMMENT '文章所属频道ID',
  `channel_name` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '频道名称',
  `layout` tinyint UNSIGNED NULL DEFAULT NULL COMMENT '文章布局\r\n            0 无图文章\r\n            1 单图文章\r\n            2 多图文章',
  `flag` tinyint UNSIGNED NULL DEFAULT NULL COMMENT '文章标记\r\n            0 普通文章\r\n            1 热点文章\r\n            2 置顶文章\r\n            3 精品文章\r\n            4 大V 文章',
  `images` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '文章图片\r\n            多张逗号分隔',
  `labels` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '文章标签最多3个 逗号分隔',
  `likes` int UNSIGNED NULL DEFAULT NULL COMMENT '点赞数量',
  `collection` int UNSIGNED NULL DEFAULT NULL COMMENT '收藏数量',
  `comment` int UNSIGNED NULL DEFAULT NULL COMMENT '评论数量',
  `views` int UNSIGNED NULL DEFAULT NULL COMMENT '阅读数量',
  `province_id` int UNSIGNED NULL DEFAULT NULL COMMENT '省市',
  `city_id` int UNSIGNED NULL DEFAULT NULL COMMENT '市区',
  `county_id` int UNSIGNED NULL DEFAULT NULL COMMENT '区县',
  `created_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `publish_time` datetime NULL DEFAULT NULL COMMENT '发布时间',
  `sync_status` tinyint(1) NULL DEFAULT 0 COMMENT '同步状态',
  `origin` tinyint UNSIGNED NULL DEFAULT 0 COMMENT '来源',
  `static_url` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1754147632898510851 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '文章信息表，存储已发布的文章' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ap_article
-- ----------------------------
INSERT INTO `ap_article` VALUES (1302862387124125698, '什么是Java语言', 4, 'admin', 1, 'java', 1, NULL, 'group1/M00/00/00/wKjIgl9V2CqAZe18AAOoOOsvWPc041.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-09-07 14:52:54', '2020-09-07 14:56:18', 0, 0, NULL);
INSERT INTO `ap_article` VALUES (1302864436297482242, 'Java语言跨平台原理', 4, 'admin', 1, 'java', 1, NULL, 'group1/M00/00/00/wKjIgl9V2n6AArZsAAGMmaPdt7w502.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-09-07 15:01:02', '2020-09-07 15:01:02', 0, 0, NULL);
INSERT INTO `ap_article` VALUES (1302864730402078722, '我是一个测试标题', 4, 'admin', 1, 'java', 1, NULL, 'group1/M00/00/00/wKjIgl892wqAANwOAAJW8oQUlAc087.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-09-07 15:02:12', '2020-09-07 15:02:12', 0, 0, NULL);
INSERT INTO `ap_article` VALUES (1302865008438296577, '过山车故障20名游客倒挂空中', 4, 'admin', 1, 'java', 3, NULL, 'group1/M00/00/00/wKjIgl892wqAANwOAAJW8oQUlAc087.jpg,group1/M00/00/00/wKjIgl892xmAG_yjAAB6OkkuJd4819.jpg,group1/M00/00/00/wKjIgl892wKAZLhtAASZUi49De0836.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-09-07 15:03:19', '2020-09-07 15:03:19', 0, 0, NULL);
INSERT INTO `ap_article` VALUES (1302865306489733122, '武汉高校开学典礼万人歌唱祖国', 4, 'admin', 1, 'java', 3, NULL, 'group1/M00/00/00/wKjIgl892vuAXr_MAASCMYD0yzc919.jpg,group1/M00/00/00/wKjIgl892xGANV6qAABzWOH8KDY775.jpg,group1/M00/00/00/wKjIgl892wqAANwOAAJW8oQUlAc087.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-09-07 15:04:30', '2020-09-07 15:04:30', 0, 0, NULL);
INSERT INTO `ap_article` VALUES (1302865474094120961, '天降铁球砸死女婴整栋楼被判赔', 4, 'admin', 1, 'java', 1, NULL, 'group1/M00/00/00/wKjIgl892tyAFc60AAMUNUuOKPA619.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-09-07 15:05:10', '2020-09-07 15:05:10', 0, 0, NULL);
INSERT INTO `ap_article` VALUES (1302977178887004162, '央视曝光境外医疗豪华旅游套路', 4, 'admin', 1, 'java', 0, NULL, 'group1/M00/00/00/wKjIgl892wqAANwOAAJW8oQUlAc087.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-09-07 22:29:02', '2020-09-07 22:29:02', 0, 0, NULL);
INSERT INTO `ap_article` VALUES (1302977458215067649, '10多名陌生人合力托举悬窗女童', 4, 'admin', 1, 'java', 1, NULL, 'group1/M00/00/00/wKjIgl892vOASiunAAGzs3UZ1Cg252.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-09-07 22:30:09', '2020-09-07 22:30:09', 0, 0, NULL);
INSERT INTO `ap_article` VALUES (1302977558807060482, '杨澜回应一秒变脸', 4, 'admin', 1, 'java', 1, NULL, 'group1/M00/00/00/wKjIgl892wKAZLhtAASZUi49De0836.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-09-07 22:30:33', '2020-09-07 22:30:33', 0, 0, NULL);
INSERT INTO `ap_article` VALUES (1302977754114826241, '黄龄工作室发视频回应', 4, 'admin', 4, 'Python', 1, NULL, 'group1/M00/00/00/wKjIgl892vuAXr_MAASCMYD0yzc919.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-09-07 22:31:19', '2020-09-07 22:31:19', 0, 0, NULL);
INSERT INTO `ap_article` VALUES (1302977754114826242, '黄龄工作室发视频回应', 4, 'admin', 4, 'Python', 1, NULL, 'group1/M00/00/00/wKjIgl892vuAXr_MAASCMYD0yzc919.jpg', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-09-07 22:31:19', '2020-09-07 22:31:19', 0, 0, NULL);
INSERT INTO `ap_article` VALUES (1302977754114826243, '黄龄工作室发视频回应', 4, 'admin', 4, 'Python', 1, NULL, 'group1/M00/00/00/wKjIgl892vuAXr_MAASCMYD0yzc919.jpg', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-09-07 22:31:19', '2020-09-07 22:31:19', 0, 0, NULL);
INSERT INTO `ap_article` VALUES (1303156149041758210, '全国抗击新冠肺炎疫情表彰大会', 4, 'admin', 1, 'java', 1, NULL, 'group1/M00/00/00/wKjIgl9W6iOAD2doAAFY4E1K7-g384.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-09-08 10:20:12', '2020-09-08 10:20:12', 0, 0, NULL);
INSERT INTO `ap_article` VALUES (1383827787629252610, 'Kafka文件的存储机制', 4, 'admin', 1, 'java', 1, NULL, 'http://192.168.200.130:9000/leadnews/2021/4/20210418/4a498d9cf3614570ac0cb2da3e51c164.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-19 01:00:29', '2021-04-19 00:20:17', 0, 0, NULL);
INSERT INTO `ap_article` VALUES (1383827888816836609, '为什么项目经理不喜欢重构？', 4, 'admin', 1, 'java', 1, NULL, 'http://192.168.200.130:9000/leadnews/2021/4/20210418/4a498d9cf3614570ac0cb2da3e51c164.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-19 01:00:54', '2021-04-19 00:19:09', 0, 0, NULL);
INSERT INTO `ap_article` VALUES (1383827911810011137, 'Base64编解码原理', 4, 'admin', 1, 'java', 1, NULL, 'http://192.168.200.130:9000/leadnews/2021/4/20210418/b44c65376f12498e873223d9d6fdf523.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-19 01:00:59', '2021-04-19 00:17:42', 0, 0, NULL);
INSERT INTO `ap_article` VALUES (1383827952326987778, '工作线程数是不是设置的越大越好', 4, 'admin', 1, 'java', 1, NULL, 'http://192.168.200.130:9000/leadnews/2021/4/20210418/a3f0bc438c244f788f2df474ed8ecdc1.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-19 01:01:09', '2021-04-19 00:16:52', 0, 0, NULL);
INSERT INTO `ap_article` VALUES (1383827976310018049, '小白如何辨别其真与伪&好与坏？', 4, 'admin', 1, 'java', 1, NULL, 'http://192.168.200.130:9000/leadnews/2021/4/20210418/1818283261e3401892e1383c1bd00596.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-19 01:01:14', '2021-04-19 00:14:58', 0, 0, 'http://192.168.47.128:9000/leadnews/2024/01/17/1383827976310018049.html');
INSERT INTO `ap_article` VALUES (1383827995813531650, '学IT，为什么要学项目课程？', 4, 'admin', 1, 'java', 3, NULL, 'http://192.168.200.130:9000/leadnews/2021/4/20210418/7d0911a41a3745efa8509a87f234813c.jpg,http://192.168.200.130:9000/leadnews/2021/4/20210418/c7c3d36d25504cf6aecdcd5710261773.jpg,http://192.168.200.130:9000/leadnews/2021/4/20210418/e8113ad756a64ea6808f91130a6cd934.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-19 01:01:19', '2021-04-19 00:10:48', 0, 0, NULL);
INSERT INTO `ap_article` VALUES (1383828014629179393, '“真”项目课程对找工作有什么帮助？', 4, 'admin', 1, 'java', 1, NULL, 'http://192.168.200.130:9000/leadnews/2021/4/20210418/7d0911a41a3745efa8509a87f234813c.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-19 01:01:24', '2021-04-19 00:08:05', 0, 0, NULL);
INSERT INTO `ap_article` VALUES (1750040847895891970, '黑马头条项目背景22222222222222', NULL, NULL, NULL, NULL, 1, NULL, 'http://192.168.200.130:9000/leadnews/2021/04/26/5ddbdb5c68094ce393b08a47860da275.jpg', '黑马头条', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2028-03-14 19:35:49', 0, 0, NULL);
INSERT INTO `ap_article` VALUES (1750392006837932033, '测试文章1', 1102, 'admin', 1, 'java', 1, NULL, 'http://192.168.47.128:9000/leadnews/2024/01/18/c392229f9095455b90bf6013db8ac873.jpg', 'java', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-01-25 13:35:49', '2024-01-18 23:39:07', 0, 0, NULL);
INSERT INTO `ap_article` VALUES (1750488579609595906, '测试文章2', 1102, 'admin', 2, 'Mysql', 1, NULL, 'http://192.168.47.128:9000/leadnews/2024/01/18/a89595d836da43eea5fa55fe0d04311b.jpg', '七二', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-01-25 19:59:31', '2024-01-25 12:00:00', 0, 0, NULL);
INSERT INTO `ap_article` VALUES (1750489156334784513, '测试文章2', 1102, 'admin', 2, 'Mysql', 1, NULL, 'http://192.168.47.128:9000/leadnews/2024/01/18/a89595d836da43eea5fa55fe0d04311b.jpg', '七二', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-01-25 20:01:26', '2024-01-25 12:00:00', 0, 0, NULL);
INSERT INTO `ap_article` VALUES (1750489643180232705, '测试文章2', 1102, 'admin', 2, 'Mysql', 1, NULL, 'http://192.168.47.128:9000/leadnews/2024/01/18/a89595d836da43eea5fa55fe0d04311b.jpg', '七二', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-01-25 20:03:45', '2024-01-25 12:00:00', 0, 0, NULL);
INSERT INTO `ap_article` VALUES (1750501476230369281, '测试文章3', 1102, 'admin', 6, '大数据', 1, NULL, 'http://192.168.47.128:9000/leadnews/2024/01/18/eef6b8a50181422288779905aeb8a14a.jpeg', '大数据', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-01-25 20:50:49', '2024-01-25 20:50:47', 0, 0, NULL);
INSERT INTO `ap_article` VALUES (1754147632898510850, '第五天测试文章', 1102, 'admin', 2, 'Mysql', 0, NULL, NULL, '1324', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-02-04 22:19:21', '2024-02-04 22:19:15', 0, 0, NULL);

-- ----------------------------
-- Table structure for ap_article_config
-- ----------------------------
DROP TABLE IF EXISTS `ap_article_config`;
CREATE TABLE `ap_article_config`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `article_id` bigint UNSIGNED NULL DEFAULT NULL COMMENT '文章ID',
  `is_comment` tinyint UNSIGNED NULL DEFAULT NULL COMMENT '是否可评论',
  `is_forward` tinyint UNSIGNED NULL DEFAULT NULL COMMENT '是否转发',
  `is_down` tinyint UNSIGNED NULL DEFAULT NULL COMMENT '是否下架',
  `is_delete` tinyint UNSIGNED NULL DEFAULT NULL COMMENT '是否已删除',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_article_id`(`article_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1754147632898510852 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = 'APP已发布文章配置表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ap_article_config
-- ----------------------------
INSERT INTO `ap_article_config` VALUES (1302862387933626369, 1302862387124125698, 1, 1, 0, 0);
INSERT INTO `ap_article_config` VALUES (1302864437425750018, 1302864436297482242, 1, 1, 0, 0);
INSERT INTO `ap_article_config` VALUES (1302864731203190785, 1302864730402078722, 1, 1, 0, 0);
INSERT INTO `ap_article_config` VALUES (1302865009533009922, 1302865008438296577, 1, 1, 0, 0);
INSERT INTO `ap_article_config` VALUES (1302865307408285697, 1302865306489733122, 1, 1, 0, 0);
INSERT INTO `ap_article_config` VALUES (1302865475297886209, 1302865474094120961, 1, 1, 0, 0);
INSERT INTO `ap_article_config` VALUES (1302977180199821313, 1302977178887004162, 1, 1, 0, 0);
INSERT INTO `ap_article_config` VALUES (1302977459322363905, 1302977458215067649, 1, 1, 0, 0);
INSERT INTO `ap_article_config` VALUES (1302977559788527618, 1302977558807060482, 1, 1, 0, 0);
INSERT INTO `ap_article_config` VALUES (1302977754882383873, 1302977754114826241, 1, 1, 0, 0);
INSERT INTO `ap_article_config` VALUES (1302977754882383874, 1302977754114826242, 1, 1, 0, 0);
INSERT INTO `ap_article_config` VALUES (1302977754882383875, 1302977754114826243, 1, 1, 0, 0);
INSERT INTO `ap_article_config` VALUES (1303156149909979137, 1303156149041758210, 1, 1, 0, 0);
INSERT INTO `ap_article_config` VALUES (1383827787704750082, 1383827787629252610, 1, 1, 0, 0);
INSERT INTO `ap_article_config` VALUES (1383827888829419522, 1383827888816836609, 1, 1, 0, 0);
INSERT INTO `ap_article_config` VALUES (1383827911822594049, 1383827911810011137, 1, 1, 0, 0);
INSERT INTO `ap_article_config` VALUES (1383827952326987779, 1383827952326987778, 1, 1, 0, 0);
INSERT INTO `ap_article_config` VALUES (1383827976322600962, 1383827976310018049, 1, 1, 0, 0);
INSERT INTO `ap_article_config` VALUES (1383827995821920257, 1383827995813531650, 1, 1, 0, 0);
INSERT INTO `ap_article_config` VALUES (1383828014645956609, 1383828014629179393, 1, 1, 0, 0);
INSERT INTO `ap_article_config` VALUES (1750040847895891971, 1750040847895891970, 1, 1, 0, 0);
INSERT INTO `ap_article_config` VALUES (1750392006879875073, 1750392006837932033, 1, 1, 0, 0);
INSERT INTO `ap_article_config` VALUES (1750488579668316161, 1750488579609595906, 1, 1, 0, 0);
INSERT INTO `ap_article_config` VALUES (1750489156334784514, 1750489156334784513, 1, 1, 0, 0);
INSERT INTO `ap_article_config` VALUES (1750489643180232706, 1750489643180232705, 1, 1, 0, 0);
INSERT INTO `ap_article_config` VALUES (1750501476263923714, 1750501476230369281, 1, 1, 0, 0);
INSERT INTO `ap_article_config` VALUES (1754147632898510851, 1754147632898510850, 1, 1, 0, 0);

-- ----------------------------
-- Table structure for ap_article_content
-- ----------------------------
DROP TABLE IF EXISTS `ap_article_content`;
CREATE TABLE `ap_article_content`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `article_id` bigint UNSIGNED NULL DEFAULT NULL COMMENT '文章ID',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '文章内容',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_article_id`(`article_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1754147632898510853 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = 'APP已发布文章内容表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ap_article_content
-- ----------------------------
INSERT INTO `ap_article_content` VALUES (1302862388957036545, 1302862387124125698, '[{\"type\":\"text\",\"value\":\"Java语言是美国Sun公司（Stanford University Network），在1995年推出的高级的编程语言。所谓编程语言，是计算机的语言，人们可以使用编程语言对计算机下达命令，让计算机完成人们需要的功能。\\n\\n2009年，Sun公司被甲骨文公司收购，所以我们现在访问oracle官网即可：https://www.oracle.com\\nJava语言共同创始人之一：詹姆斯·高斯林 （James Gosling），被称为“Java之父”\\n\"},{\"type\":\"image\",\"value\":\"http://192.168.200.130/group1/M00/00/00/wKjIgl9V2CqAZe18AAOoOOsvWPc041.png\"},{\"type\":\"text\",\"value\":\"Java语言发展历史\\n\\n- 1995年Sun公司推出Java语言\\n- 1996年发布Java 1.0版本\\n- 1997年发布Java 1.1版本\\n- 1998年发布Java 1.2版本\\n- 2000年发布Java 1.3版本\\n- 2002年发布Java 1.4版本\\n- 2004年发布Java 5.0版本\\n- 2006年发布Java 6.0版本\\n- 2009年Oracle甲骨文公司收购Sun公司\\n- 2011年发布Java 7.0版本\\n- 2014年发布Java 8.0版本\\n- 2017年9月发布Java 9.0版本\\n- 2018年3月发布Java 10.0版本\\n- 2018年9月发布Java 11.0版本\\n\"},{\"type\":\"text\",\"value\":\"Java 语言的三个版本\\n\\n- JavaSE：标准版，用于桌面应用的开发，是其他两个版本的基础。\\n  - 学习JavaSE的目的, 是为了就业班要学习的JavaEE打基础.\\n\"},{\"type\":\"image\",\"value\":\"http://192.168.200.130/group1/M00/00/00/wKjIgl9V2F6AdQxAAAGyaOdp4gk784.png\"},{\"type\":\"text\",\"value\":\"- JavaEE：企业版，用于Web方向的网站开发\\n  - 网站：网页 + 后台服务器\\n\\nJava语言主要应用在互联网程序的开发领域。常见的互联网程序比如天猫、京东、物流系统、网银系统等，以及服务器后台处理大数据的存储、查询、数据挖掘等也有很多应用。\\n\"}]');
INSERT INTO `ap_article_content` VALUES (1302864438885367810, 1302864436297482242, '[{\"type\":\"text\",\"value\":\"Java虚拟机——JVM\\n\\n- JVM（Java Virtual Machine ）：Java虚拟机，简称JVM，是运行所有Java程序的假想计算机，是Java程序的运行环境，是Java 最具吸引力的特性之一。我们编写的Java代码，都运行在JVM 之上。\\n- 跨平台：任何软件的运行，都必须要运行在操作系统之上，而我们用Java编写的软件可以运行在任何的操作系统上，这个特性称为Java语言的跨平台特性。该特性是由JVM实现的，我们编写的程序运行在JVM上，而JVM运行在操作系统上。\\n\"},{\"type\":\"image\",\"value\":\"http://192.168.200.130/group1/M00/00/00/wKjIgl9V2n6AArZsAAGMmaPdt7w502.png\"},{\"type\":\"text\",\"value\":\"如图所示，Java的虚拟机本身不具备跨平台功能的，每个操作系统下都有不同版本的虚拟机。\\n\\n问题1: Java 是如何实现跨平台的呢？\\n\\n- 答：因为在不同操作系统中都安装了对应版本的 JVM 虚拟机\\n- 注意: Java程序想要运行, 必须依赖于JVM虚拟机.\\n\\n问题2: JVM 本身是否允许跨平台呢？\\n\\n- 答：不允许，允许跨平台的是 Java 程序，而不是虚拟机。\\n\"}]');
INSERT INTO `ap_article_content` VALUES (1302864732679585794, 1302864730402078722, '[{\"type\":\"text\",\"value\":\"这些都是测试这些都是测试这些都是测试这些都是测试这些都是测试这些都是测试\"},{\"type\":\"image\",\"value\":\"http://192.168.200.130/group1/M00/00/00/wKjIgl892wqAANwOAAJW8oQUlAc087.jpg\"},{\"type\":\"text\",\"value\":\"这些都是测试这些都是测试这些都是测试这些都是测试\"}]');
INSERT INTO `ap_article_content` VALUES (1302865011026182145, 1302865008438296577, '[{\"type\":\"text\",\"value\":\"过山车故障20名游客倒挂空中过山车故障20名游客倒挂空中过山车故障20名游客倒挂空中过山车故障20名游客倒挂空中过山车故障20名游客倒挂空中过山车故障20名游客倒挂空中过山车故障20名游客倒挂空中过山车故障20名游客倒挂空中过山车故障20名游客倒挂空中过山车故障20名游客倒挂空中\"},{\"type\":\"image\",\"value\":\"http://192.168.200.130/group1/M00/00/00/wKjIgl892uyAR12rAADi7UxPXeM267.jpg\"},{\"type\":\"text\",\"value\":\"过山车故障20名游客倒挂空中过山车故障20名游客倒挂空中过山车故障20名游客倒挂空中过山车故障20名游客倒挂空中过山车故障20名游客倒挂空中过山车故障20名游客倒挂空中过山车故障20名游客倒挂空中\"},{\"type\":\"text\",\"value\":\"请在这里输入正文\"}]');
INSERT INTO `ap_article_content` VALUES (1302865308704325633, 1302865306489733122, '[{\"type\":\"text\",\"value\":\"武汉高校开学典礼万人歌唱祖国武汉高校开学典礼万人歌唱祖国武汉高校开学典礼万人歌唱祖国武汉高校开学典礼万人歌唱祖国武汉高校开学典礼万人歌唱祖国武汉高校开学典礼万人歌唱祖国武汉高校开学典礼万人歌唱祖国武汉高校开学典礼万人歌唱祖国武汉高校开学典礼万人歌唱祖国武汉高校开学典礼万人歌唱祖国武汉高校开学典礼万人歌唱祖国武汉高校开学典礼万人歌唱祖国武汉高校开学典礼万人歌唱祖国武汉高校开学典礼万人歌唱祖国武汉高校开学典礼万人歌唱祖国武汉高校开学典礼万人歌唱祖国武汉高校开学典礼万人歌唱祖国武汉高校开学典礼万人歌唱祖国武汉高校开学典礼万人歌唱祖国武汉高校开学典礼万人歌唱祖国武汉高校开学典礼万人歌唱祖国武汉高校开学典礼万人歌唱祖国\"},{\"type\":\"image\",\"value\":\"http://192.168.200.130/group1/M00/00/00/wKjIgl892vuAXr_MAASCMYD0yzc919.jpg\"},{\"type\":\"text\",\"value\":\"武汉高校开学典礼万人歌唱祖国武汉高校开学典礼万人歌唱祖国武汉高校开学典礼万人歌唱祖国武汉高校开学典礼万人歌唱祖国武汉高校开学典礼万人歌唱祖国武汉高校开学典礼万人歌唱祖国武汉高校开学典礼万人歌唱祖国武汉高校开学典礼万人歌唱祖国武汉高校开学典礼万人歌唱祖国武汉高校开学典礼万人歌唱祖国武汉高校开学典礼万人歌唱祖国武汉高校开学典礼万人歌唱祖国武汉高校开学典礼万人歌唱祖国武汉高校开学典礼万人歌唱祖国武汉高校开学典礼万人歌唱祖国v\"}]');
INSERT INTO `ap_article_content` VALUES (1302865476799447041, 1302865474094120961, '[{\"type\":\"text\",\"value\":\"天降铁球砸死女婴整栋楼被判赔天降铁球砸死女婴整栋楼被判赔天降铁球砸死女婴整栋楼被判赔天降铁球砸死女婴整栋楼被判赔天降铁球砸死女婴整栋楼被判赔天降铁球砸死女婴整栋楼被判赔天降铁球砸死女婴整栋楼被判赔天降铁球砸死女婴整栋楼被判赔天降铁球砸死女婴整栋楼被判赔天降铁球砸死女婴整栋楼被判赔天降铁球砸死女婴整栋楼被判赔天降铁球砸死女婴整栋楼被判赔天降铁球砸死女婴整栋楼被判赔天降铁球砸死女婴整栋楼被判赔天降铁球砸死女婴整栋楼被判赔天降铁球砸死女婴整栋楼被判赔天降铁球砸死女婴整栋楼被判赔天降铁球砸死女婴整栋楼被判赔天降铁球砸死女婴整栋楼被判赔天降铁球砸死女婴整栋楼被判赔天降铁球砸死女婴整栋楼被判赔天降铁球砸死女婴整栋楼被判赔天降铁球砸死女婴整栋楼被判赔天降铁球砸死女婴整栋楼被判赔天降铁球砸死女婴整栋楼被判赔天降铁球砸死女婴整栋楼被判赔天降铁球砸死女婴整栋楼被判赔天降铁球砸死女婴整栋楼被判赔天降铁球砸死女婴整栋楼被判赔\"},{\"type\":\"image\",\"value\":\"http://192.168.200.130/group1/M00/00/00/wKjIgl892tyAFc60AAMUNUuOKPA619.jpg\"},{\"type\":\"text\",\"value\":\"天降铁球砸死女婴整栋楼被判赔天降铁球砸死女婴整栋楼被判赔天降铁球砸死女婴整栋楼被判赔天降铁球砸死女婴整栋楼被判赔天降铁球砸死女婴整栋楼被判赔天降铁球砸死女婴整栋楼被判赔天降铁球砸死女婴整栋楼被判赔天降铁球砸死女婴整栋楼被判赔天降铁球砸死女婴整栋楼被判赔天降铁球砸死女婴整栋楼被判赔vv\"},{\"type\":\"text\",\"value\":\"请在这里输入正文\"}]');
INSERT INTO `ap_article_content` VALUES (1302977181835599873, 1302977178887004162, '[{\"type\":\"text\",\"value\":\"央视曝光境外医疗豪华旅游套路央视曝光境外医疗豪华旅游套路央视曝光境外医疗豪华旅游套路央视曝光境外医疗豪华旅游套路央视曝光境外医疗豪华旅游套路央视曝光境外医疗豪华旅游套路央视曝光境外医疗豪华旅游套路央视曝光境外医疗豪华旅游套路央视曝光境外医疗豪华旅游套路央视曝光境外医疗豪华旅游套路央视曝光境外医疗豪华旅游套路央视曝光境外医疗豪华旅游套路\"},{\"type\":\"image\",\"value\":\"http://192.168.200.130/group1/M00/00/00/wKjIgl892wqAANwOAAJW8oQUlAc087.jpg\"}]');
INSERT INTO `ap_article_content` VALUES (1302977460907810818, 1302977458215067649, '[{\"type\":\"text\",\"value\":\"510多名陌生人合力托举悬窗女童10多名陌生人合力托举悬窗女童10多名陌生人合力托举悬窗女童10多名陌生人合力托举悬窗女童10多名陌生人合力托举悬窗女童10多名陌生人合力托举悬窗女童10多名陌生人合力托举悬窗女童10多名陌生人合力托举悬窗女童10多名陌生人合力托举悬窗女童10多名陌生人合力托举悬窗女童10多名陌生人合力托举悬窗女童10多名陌生人合力托举悬窗女童10多名陌生人合力托举悬窗女童10多名陌生人合力托举悬窗女童10多名陌生人合力托举悬窗女童10多名陌生人合力托举悬窗女童10多名陌生人合力托举悬窗女童10多名陌生人合力托举悬窗女童10多名陌生人合力托举悬窗女童10多名陌生人合力托举悬窗女童10多名陌生人合力托举悬窗女童10多名陌生人合力托举悬窗女童10多名陌生人合力托举悬窗女童10多名陌生人合力托举悬窗女童10多名陌生人合力托举悬窗女童10多名陌生人合力托举悬窗女童10多名陌生人合力托举悬窗女童10多名陌生人合力托举悬窗女童10多名陌生人合力托举悬窗女童10多名陌生人合力托举悬窗女童10多名陌生人合力托举悬窗女童10多名陌生人合力托举悬窗女童10多名陌生人合力托举悬窗女童10多名陌生人合力托举悬窗女童10多名陌生人合力托举悬窗女童10多名陌生人合力托举悬窗女童10多名陌生人合力托举悬窗女童10多名陌生人合力托举悬窗女童10多名陌生人合力托举悬窗女童\"},{\"type\":\"image\",\"value\":\"http://192.168.200.130/group1/M00/00/00/wKjIgl892vOASiunAAGzs3UZ1Cg252.jpg\"},{\"type\":\"image\",\"value\":\"http://192.168.200.130/group1/M00/00/00/wKjIgl892uyAR12rAADi7UxPXeM267.jpg\"},{\"type\":\"text\",\"value\":\"10多名陌生人合力托举悬窗女童10多名陌生人合力托举悬窗女童10多名陌生人合力托举悬窗女童10多名陌生人合力托举悬窗女童10多名陌生人合力托举悬窗女童10多名陌生人合力托举悬窗女童10多名陌生人合力托举悬窗女童10多名陌生人合力托举悬窗女童10多名陌生人合力托举悬窗女童10多名陌生人合力托举悬窗女童10多名陌生人合力托举悬窗女童10多名陌生人合力托举悬窗女童10多名陌生人合力托举悬窗女童10多名陌生人合力托举悬窗女童10多名陌生人合力托举悬窗女童10多名陌生人合力托举悬窗女童10多名陌生人合力托举悬窗女童10多名陌生人合力托举悬窗女童10多名陌生人合力托举悬窗女童10多名陌生人合力托举悬窗女童10多名陌生人合力托举悬窗女童10多名陌生人合力托举悬窗女童v\"},{\"type\":\"text\",\"value\":\"请10多名陌生人合力托举悬窗女童10多名陌生人合力托举悬窗女童10多名陌生人合力托举悬窗女童10多名陌生人合力托举悬窗女童10多名陌生人合力托举悬窗女童10多名陌生人合力托举悬窗女童v\"}]');
INSERT INTO `ap_article_content` VALUES (1302977561034235906, 1302977558807060482, '[{\"type\":\"text\",\"value\":\"杨澜回应一秒变脸杨澜回应一秒变脸杨澜回应一秒变脸杨澜回应一秒变脸杨澜回应一秒变脸杨澜回应一秒变脸\"},{\"type\":\"image\",\"value\":\"http://192.168.200.130/group1/M00/00/00/wKjIgl892wKAZLhtAASZUi49De0836.jpg\"},{\"type\":\"text\",\"value\":\"杨澜回应一秒变脸杨澜回应一秒变脸杨澜回应一秒变脸杨澜回应一秒变脸杨澜回应一秒变脸杨澜回应一秒变脸杨澜回应一秒变脸杨澜回应一秒变脸\"},{\"type\":\"text\",\"value\":\"请在这里输入正文\"}]');
INSERT INTO `ap_article_content` VALUES (1302977755742216193, 1302977754114826241, '[{\"type\":\"text\",\"value\":\"3黄龄工作室发视频回应黄龄工作室发视频回应黄龄工作室发视频回应黄龄工作室发视频回应黄龄工作室发视频回应黄龄工作室发视频回应黄龄工作室发视频回应黄龄工作室发视频回应黄龄工作室发视频回应黄龄工作室发视频回应黄龄工作室发视频回应黄龄工作室发视频回应黄龄工作室发视频回应黄龄工作室发视频回应黄龄工作室发视频回应\"},{\"type\":\"image\",\"value\":\"http://192.168.200.130/group1/M00/00/00/wKjIgl892vuAXr_MAASCMYD0yzc919.jpg\"},{\"type\":\"text\",\"value\":\"请在这里输入正文黄龄工作室发视频回应黄龄工作室发视频回应黄龄工作室发视频回应黄龄工作室发视频回应黄龄工作室发视频回应黄龄工作室发视频回应黄龄工作室发视频回应黄龄工作室发视频回应黄龄工作室发视频回应黄龄工作室发视频回应黄龄工作室发视频回应黄龄工作室发视频回应\"}]');
INSERT INTO `ap_article_content` VALUES (1303156151151493121, 1303156149041758210, '[{\"type\":\"image\",\"value\":\"http://192.168.200.130/group1/M00/00/00/wKjIgl9W6iOAD2doAAFY4E1K7-g384.png\"},{\"type\":\"text\",\"value\":\"全国抗击新冠肺炎疫情表彰大会开始15家“文化会客厅”展现产业发展的集群效应全球疫情简报:印度新冠确诊病例超420万 升至全球第二中方提出《全球数据安全倡议》\"}]');
INSERT INTO `ap_article_content` VALUES (1383827787742498817, 1383827787629252610, '[{\"type\":\"text\",\"value\":\"Kafka文件的存储机制Kafka文件的存储机制Kafka文件的存储机制Kafka文件的存储机制Kafka文件的存储机制Kafka文件的存储机制Kafka文件的存储机制Kafka文件的存储机制Kafka文件的存储机制Kafka文件的存储机制\"},{\"type\":\"image\",\"value\":\"http://192.168.200.130:9000/leadnews/2021/4/20210418/4a498d9cf3614570ac0cb2da3e51c164.jpg\"},{\"type\":\"text\",\"value\":\"请在这里输入正文\"}]');
INSERT INTO `ap_article_content` VALUES (1383827888833613826, 1383827888816836609, '[{\"type\":\"text\",\"value\":\"经常听到开发人员抱怨 ，“这么烂的代码，我来重构一下！”，“这代码怎么能这么写呢？谁来重构一下？”，“这儿有个坏味道，重构吧！”\\n\\n作为一名项目经理，每次听到“重构”两个字，既想给追求卓越代码的开发人员点个赞，同时又会感觉非常紧张，为什么又要重构？马上就要上线了，怎么还要改？是不是应该阻止开发人员做重构？\\n\\n重构几乎是开发人员最喜欢的一项实践了，可项目经理们却充满了顾虑，那么为什么项目经理不喜欢重构呢？\\n\\n老功能被破坏\\n不止一次遇到这样的场景，某一天一个老功能突然被破坏了，项目经理们感到奇怪，产品这块儿的功能已经很稳定了，也没有在这部分开发什么新功能，为什么突然出问题了呢？\"},{\"type\":\"image\",\"value\":\"http://192.168.200.130:9000/leadnews/2021/4/20210418/e8113ad756a64ea6808f91130a6cd934.jpg\"},{\"type\":\"image\",\"value\":\"http://192.168.200.130:9000/leadnews/2021/4/20210418/4a498d9cf3614570ac0cb2da3e51c164.jpg\"},{\"type\":\"text\",\"value\":\"请在这里输入正文\"}]');
INSERT INTO `ap_article_content` VALUES (1383827911826788353, 1383827911810011137, '[{\"type\":\"text\",\"value\":\"我在面试过程中，问过很多高级java工程师，是否了解Base64？部分人回答了解，部分人直接回答不了解。而说了解的那部分人却回答不上来它的原理。\\n\\nBase64 的由来\\nBase64是网络上最常见的用于传输8Bit字节代码的编码方式之一，大家可以查看RFC2045～RFC2049，上面有MIME的详细规范。它是一种基于用64个可打印字符来表示二进制数据的表示方法。它通常用作存储、传输一些二进制数据编码方法！也是MIME（多用途互联网邮件扩展，主要用作电子邮件标准）中一种可打印字符表示二进制数据的常见编码方法！它其实只是定义用可打印字符传输内容一种方法，并不会产生新的字符集！\\n\\n传统的邮件只支持可见字符的传送，像ASCII码的控制字符就 不能通过邮件传送。这样用途就受到了很大的限制，比如图片二进制流的每个字节不可能全部是可见字符，所以就传送不了。最好的方法就是在不改变传统协议的情 况下，做一种扩展方案来支持二进制文件的传送。把不可打印的字符也能用可打印字符来表示，问题就解决了。Base64编码应运而生，Base64就是一种 基于64个可打印字符来表示二进制数据的表示方法。\"},{\"type\":\"image\",\"value\":\"http://192.168.200.130:9000/leadnews/2021/4/20210418/b44c65376f12498e873223d9d6fdf523.jpg\"},{\"type\":\"text\",\"value\":\"请在这里输入正文\"}]');
INSERT INTO `ap_article_content` VALUES (1383827952335376385, 1383827952326987778, '[{\"type\":\"text\",\"value\":\"根据经验来看，jdk api 一般推荐的线程数为CPU核数的2倍。但是有些书籍要求可以设置为CPU核数的8倍，也有的业务设置为CPU核数的32倍。\\n“工作线程数”的设置依据是什么，到底设置为多少能够最大化CPU性能，是本文要讨论的问题。\\n\\n工作线程数是不是设置的越大越好\\n显然不是的。使用java.lang.Thread类或者java.lang.Runnable接口编写代码来定义、实例化和启动新线程。\\n一个Thread类实例只是一个对象，像Java中的任何其他对象一样，具有变量和方法，生死于堆上。\\nJava中，每个线程都有一个调用栈，即使不在程序中创建任何新的线程，线程也在后台运行着。\\n一个Java应用总是从main()方法开始运行，main()方法运行在一个线程内，它被称为主线程。\\n一旦创建一个新的线程，就产生一个新的调用栈。\"},{\"type\":\"image\",\"value\":\"http://192.168.200.130:9000/leadnews/2021/4/20210418/a3f0bc438c244f788f2df474ed8ecdc1.jpg\"}]');
INSERT INTO `ap_article_content` VALUES (1383827976322600963, 1383827976310018049, '[{\"type\":\"text\",\"value\":\"通过上篇《IT培训就业艰难，行业乱象频发，如何破解就业难题?》一文，相信大家已初步了解“项目课程”对程序员能否就业且高薪就业的重要性。\\n\\n　　因此，小白在选择IT培训机构时，关注的重点就在于所学“项目课程”能否真正帮你增加就业筹码。当然，前提必须是学到“真”项目。\"},{\"type\":\"image\",\"value\":\"http://192.168.200.130:9000/leadnews/2021/4/20210418/1818283261e3401892e1383c1bd00596.jpg\"}]');
INSERT INTO `ap_article_content` VALUES (1383827995834503170, 1383827995813531650, '[{\"type\":\"text\",\"value\":\"在选择IT培训机构时，你应该有注意到，很多机构都将“项目课程”作为培训中的重点。那么，为什么要学习项目课程?为什么项目课程才是IT培训课程的核心?\\n\\n　　1\\n\\n　　在这个靠“技术经验说话”的IT行业里，假如你是一个计算机或IT相关专业毕业生，在没有实际项目开发经验的情况下，“找到第一份全职工作”可能是你职业生涯中遇到的最大挑战。\\n\\n　　为什么说找第一份工作很难?\\n\\n　　主要在于：实际企业中用到的软件开发知识和在学校所学的知识是完全不同的。假设你已经在学校和同学做过周期长达2-3个月的项目，但真正工作中的团队协作与你在学校中经历的协作也有很多不同。\"},{\"type\":\"image\",\"value\":\"http://192.168.200.130:9000/leadnews/2021/4/20210418/e8113ad756a64ea6808f91130a6cd934.jpg\"},{\"type\":\"text\",\"value\":\"在实际团队中，每一位成员彼此团结一致，为项目的交付而努力，这也意味着你必须要理解好在项目中负责的那部分任务，在规定时间交付还需确保你负责的功能，在所有环境中都能很好地发挥作用，而不仅仅是你的本地机器。\\n\\n　　这需要你对项目中的每一行代码严谨要求。学校练习的项目中，对bug的容忍度很大，而在实际工作中是绝对不能容忍的。项目中的任何一个环节都涉及公司利益，任何一个bug都可能影响公司的收入及形象。\"},{\"type\":\"image\",\"value\":\"http://192.168.200.130:9000/leadnews/2021/4/20210418/c7c3d36d25504cf6aecdcd5710261773.jpg\"}]');
INSERT INTO `ap_article_content` VALUES (1383828014650150914, 1383828014629179393, '[{\"type\":\"text\",\"value\":\"找工作，企业重点问的是项目经验，更是HR筛选的“第一门槛”，直接决定了你是否有机会进入面试环节。\\n\\n　　项目经验更是评定“个人能力/技能”真实性的“证据”，反映了求职者某个方面的实际动手能力、对某个领域或某种技能的掌握程度。\"},{\"type\":\"image\",\"value\":\"http://192.168.200.130:9000/leadnews/2021/4/20210418/7d0911a41a3745efa8509a87f234813c.jpg\"},{\"type\":\"text\",\"value\":\"很多经过培训期望快速上岗的程序员，靠着培训机构“辅导”顺利经过面试官对于“项目经验”的考核上岗后，在面对“有限时间”“复杂业务”“新项目需求”等多项标签加持的工作任务，却往往不知从何下手或开发进度极其缓慢。最终结果就是：熬不过试用期。\\n\\n　　从而也引发了企业对于“培训出身程序员”的“有色眼光”。你甚至也一度怀疑“IT培训班出来的人真的不行吗?”\"}]');
INSERT INTO `ap_article_content` VALUES (1750040847967195137, 1750040847895891970, '22222222222222222黑马头条项目背景,黑马头条项目背景,黑马头条项目背景,黑马头条项目背景，黑马头条项目背景');
INSERT INTO `ap_article_content` VALUES (1750392006879875074, 1750392006837932033, '[{\"type\":\"text\",\"value\":\"测试内容\\n\"},{\"type\":\"image\",\"value\":\"http://192.168.47.128:9000/leadnews/2024/01/18/eef6b8a50181422288779905aeb8a14a.jpeg\"},{\"type\":\"image\",\"value\":\"http://192.168.47.128:9000/leadnews/2024/01/18/a89595d836da43eea5fa55fe0d04311b.jpg\"},{\"type\":\"text\",\"value\":\"请在这里输入正文\"}]');
INSERT INTO `ap_article_content` VALUES (1750488579668316162, 1750488579609595906, '[{\"type\":\"text\",\"value\":\"12342134\"},{\"type\":\"image\",\"value\":\"http://192.168.47.128:9000/leadnews/2024/01/18/a89595d836da43eea5fa55fe0d04311b.jpg\"},{\"type\":\"text\",\"value\":\"请在这里输入正文\"}]');
INSERT INTO `ap_article_content` VALUES (1750489156334784515, 1750489156334784513, '[{\"type\":\"text\",\"value\":\"12342134\"},{\"type\":\"image\",\"value\":\"http://192.168.47.128:9000/leadnews/2024/01/18/a89595d836da43eea5fa55fe0d04311b.jpg\"},{\"type\":\"text\",\"value\":\"请在这里输入正文\"}]');
INSERT INTO `ap_article_content` VALUES (1750489643180232707, 1750489643180232705, '[{\"type\":\"text\",\"value\":\"12342134\"},{\"type\":\"image\",\"value\":\"http://192.168.47.128:9000/leadnews/2024/01/18/a89595d836da43eea5fa55fe0d04311b.jpg\"},{\"type\":\"text\",\"value\":\"请在这里输入正文\"}]');
INSERT INTO `ap_article_content` VALUES (1750501476331032577, 1750501476230369281, '[{\"type\":\"image\",\"value\":\"http://192.168.47.128:9000/leadnews/2024/01/18/c392229f9095455b90bf6013db8ac873.jpg\"},{\"type\":\"text\",\"value\":\"请在这里输入正文\"}]');
INSERT INTO `ap_article_content` VALUES (1754147632898510852, 1754147632898510850, '[{\"type\":\"text\",\"value\":\"第五天测试文章，这里是正文\\n\"},{\"type\":\"text\",\"value\":\"请在这里输入正文\"}]');

-- ----------------------------
-- Table structure for ap_author
-- ----------------------------
DROP TABLE IF EXISTS `ap_author`;
CREATE TABLE `ap_author`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '作者名称',
  `type` tinyint UNSIGNED NULL DEFAULT NULL COMMENT '0 爬取数据\r\n            1 签约合作商\r\n            2 平台自媒体人\r\n            ',
  `user_id` int UNSIGNED NULL DEFAULT NULL COMMENT '社交账号ID',
  `created_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `wm_user_id` int UNSIGNED NULL DEFAULT NULL COMMENT '自媒体账号',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_type_name`(`type` ASC, `name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = 'APP文章作者信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ap_author
-- ----------------------------
INSERT INTO `ap_author` VALUES (1, 'zhangsan', 2, 1, '2020-03-19 23:43:54', NULL);
INSERT INTO `ap_author` VALUES (2, 'lisi', 2, 2, '2020-03-19 23:47:44', NULL);
INSERT INTO `ap_author` VALUES (3, 'wangwu', 2, 3, '2020-03-19 23:50:09', NULL);
INSERT INTO `ap_author` VALUES (4, 'admin', 2, 4, '2020-03-30 16:36:41', NULL);

-- ----------------------------
-- Table structure for ap_collection
-- ----------------------------
DROP TABLE IF EXISTS `ap_collection`;
CREATE TABLE `ap_collection`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `entry_id` int UNSIGNED NULL DEFAULT NULL COMMENT '实体ID',
  `article_id` bigint UNSIGNED NULL DEFAULT NULL COMMENT '文章ID',
  `type` tinyint UNSIGNED NULL DEFAULT NULL COMMENT '点赞内容类型\r\n            0文章\r\n            1动态',
  `collection_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `published_time` datetime NULL DEFAULT NULL COMMENT '发布时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_user_type`(`entry_id` ASC, `article_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = 'APP收藏信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ap_collection
-- ----------------------------
INSERT INTO `ap_collection` VALUES (1, 1, 1303156149041758210, 0, '2020-04-07 23:46:47', '2020-04-07 23:46:50');

-- ----------------------------
-- Table structure for undo_log
-- ----------------------------
DROP TABLE IF EXISTS `undo_log`;
CREATE TABLE `undo_log`  (
  `branch_id` bigint NOT NULL COMMENT 'branch transaction id',
  `xid` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'global transaction id',
  `context` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'undo_log context,such as serialization',
  `rollback_info` longblob NOT NULL COMMENT 'rollback info',
  `log_status` int NOT NULL COMMENT '0:normal status,1:defense status',
  `log_created` datetime(6) NOT NULL COMMENT 'create datetime',
  `log_modified` datetime(6) NOT NULL COMMENT 'modify datetime',
  UNIQUE INDEX `ux_undo_log`(`xid` ASC, `branch_id` ASC) USING BTREE,
  INDEX `ix_log_created`(`log_created` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'AT transaction mode undo table' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of undo_log
-- ----------------------------

-- ----------------------------
-- Table structure for wm_channel
-- ----------------------------
DROP TABLE IF EXISTS `wm_channel`;
CREATE TABLE `wm_channel`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '频道名称',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '频道描述',
  `is_default` tinyint UNSIGNED NULL DEFAULT NULL COMMENT '是否默认频道',
  `status` tinyint UNSIGNED NULL DEFAULT NULL,
  `ord` tinyint UNSIGNED NULL DEFAULT NULL COMMENT '默认排序',
  `created_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '频道信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of wm_channel
-- ----------------------------
INSERT INTO `wm_channel` VALUES (1, 'java', '后端框架', 1, 1, 1, '2021-04-18 12:25:30');
INSERT INTO `wm_channel` VALUES (2, 'Mysql', '轻量级数据库', 1, 1, 4, '2021-04-18 10:55:41');
INSERT INTO `wm_channel` VALUES (3, 'Vue', '阿里前端框架', 1, 1, 5, '2021-04-18 10:55:41');
INSERT INTO `wm_channel` VALUES (4, 'Python', '未来的语言', 1, 1, 6, '2021-04-18 10:55:41');
INSERT INTO `wm_channel` VALUES (5, 'Weex', '向未来致敬', 1, 1, 7, '2021-04-18 10:55:41');
INSERT INTO `wm_channel` VALUES (6, '大数据', '不会，则不要说自己是搞互联网的', 1, 1, 10, '2021-04-18 10:55:41');
INSERT INTO `wm_channel` VALUES (7, '其他', '其他', 1, 1, 12, '2021-04-18 10:55:41');

-- ----------------------------
-- Table structure for wm_fans_statistics
-- ----------------------------
DROP TABLE IF EXISTS `wm_fans_statistics`;
CREATE TABLE `wm_fans_statistics`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int UNSIGNED NULL DEFAULT NULL COMMENT '主账号ID',
  `article` int UNSIGNED NULL DEFAULT NULL COMMENT '子账号ID',
  `read_count` int UNSIGNED NULL DEFAULT NULL,
  `comment` int UNSIGNED NULL DEFAULT NULL,
  `follow` int UNSIGNED NULL DEFAULT NULL,
  `collection` int UNSIGNED NULL DEFAULT NULL,
  `forward` int UNSIGNED NULL DEFAULT NULL,
  `likes` int UNSIGNED NULL DEFAULT NULL,
  `unlikes` int UNSIGNED NULL DEFAULT NULL,
  `unfollow` int UNSIGNED NULL DEFAULT NULL,
  `burst` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_time` date NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_user_id_time`(`user_id` ASC, `created_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '自媒体粉丝数据统计表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of wm_fans_statistics
-- ----------------------------

-- ----------------------------
-- Table structure for wm_material
-- ----------------------------
DROP TABLE IF EXISTS `wm_material`;
CREATE TABLE `wm_material`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int UNSIGNED NULL DEFAULT NULL COMMENT '自媒体用户ID',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '图片地址',
  `type` tinyint UNSIGNED NULL DEFAULT NULL COMMENT '素材类型\r\n            0 图片\r\n            1 视频',
  `is_collection` tinyint(1) NULL DEFAULT NULL COMMENT '是否收藏',
  `created_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 72 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '自媒体图文素材信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of wm_material
-- ----------------------------
INSERT INTO `wm_material` VALUES (67, 1102, 'http://192.168.200.130:9000/leadnews/2021/04/26/a73f5b60c0d84c32bfe175055aaaac40.jpg', 0, 0, '2021-04-26 00:14:01');
INSERT INTO `wm_material` VALUES (68, 1102, 'http://192.168.200.130:9000/leadnews/2021/04/26/d4f6ef4c0c0546e69f70bd3178a8c140.jpg', 0, 0, '2021-04-26 00:18:20');
INSERT INTO `wm_material` VALUES (69, 1102, 'http://192.168.200.130:9000/leadnews/2021/04/26/5ddbdb5c68094ce393b08a47860da275.jpg', 0, 0, '2021-04-26 00:18:27');
INSERT INTO `wm_material` VALUES (70, 1102, 'http://192.168.200.130:9000/leadnews/2021/04/26/9f8a93931ab646c0a754475e0c4b0a98.jpg', 0, 0, '2021-04-26 00:18:34');
INSERT INTO `wm_material` VALUES (71, 1102, 'http://192.168.200.130:9000/leadnews/2021/04/26/ef3cbe458db249f7bd6fb4339e593e55.jpg', 0, 0, '2021-04-26 00:18:39');

-- ----------------------------
-- Table structure for wm_news
-- ----------------------------
DROP TABLE IF EXISTS `wm_news`;
CREATE TABLE `wm_news`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int UNSIGNED NULL DEFAULT NULL COMMENT '自媒体用户ID',
  `title` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '标题',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '图文内容',
  `type` tinyint UNSIGNED NULL DEFAULT NULL COMMENT '文章布局\r\n            0 无图文章\r\n            1 单图文章\r\n            3 多图文章',
  `channel_id` int UNSIGNED NULL DEFAULT NULL COMMENT '图文频道ID',
  `labels` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `submited_time` datetime NULL DEFAULT NULL COMMENT '提交时间',
  `status` tinyint UNSIGNED NULL DEFAULT NULL COMMENT '当前状态\r\n            0 草稿\r\n            1 提交（待审核）\r\n            2 审核失败\r\n            3 人工审核\r\n            4 人工审核通过\r\n            8 审核通过（待发布）\r\n            9 已发布',
  `publish_time` datetime NULL DEFAULT NULL COMMENT '定时发布时间，不定时则为空',
  `reason` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '拒绝理由',
  `article_id` bigint UNSIGNED NULL DEFAULT NULL COMMENT '发布库文章ID',
  `images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '//图片用逗号分隔',
  `enable` tinyint UNSIGNED NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6232 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '自媒体图文内容信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of wm_news
-- ----------------------------
INSERT INTO `wm_news` VALUES (6225, 1102, '“真”项目课程对找工作有什么帮助？', '[{\"type\":\"text\",\"value\":\"找工作，企业重点问的是项目经验，更是HR筛选的“第一门槛”，直接决定了你是否有机会进入面试环节。\\n\\n　　项目经验更是评定“个人能力/技能”真实性的“证据”，反映了求职者某个方面的实际动手能力、对某个领域或某种技能的掌握程度。\"},{\"type\":\"image\",\"value\":\"http://192.168.200.130:9000/leadnews/2021/4/20210418/7d0911a41a3745efa8509a87f234813c.jpg\"},{\"type\":\"text\",\"value\":\"很多经过培训期望快速上岗的程序员，靠着培训机构“辅导”顺利经过面试官对于“项目经验”的考核上岗后，在面对“有限时间”“复杂业务”“新项目需求”等多项标签加持的工作任务，却往往不知从何下手或开发进度极其缓慢。最终结果就是：熬不过试用期。\\n\\n　　从而也引发了企业对于“培训出身程序员”的“有色眼光”。你甚至也一度怀疑“IT培训班出来的人真的不行吗?”\"}]', 1, 1, '项目课程', '2021-04-19 00:08:10', '2021-04-19 00:08:10', 9, '2021-04-19 00:08:05', '审核成功', 1383828014629179393, 'http://192.168.200.130:9000/leadnews/2021/4/20210418/7d0911a41a3745efa8509a87f234813c.jpg', 1);
INSERT INTO `wm_news` VALUES (6226, 1102, '学IT，为什么要学项目课程？', '[{\"type\":\"text\",\"value\":\"在选择IT培训机构时，你应该有注意到，很多机构都将“项目课程”作为培训中的重点。那么，为什么要学习项目课程?为什么项目课程才是IT培训课程的核心?\\n\\n　　1\\n\\n　　在这个靠“技术经验说话”的IT行业里，假如你是一个计算机或IT相关专业毕业生，在没有实际项目开发经验的情况下，“找到第一份全职工作”可能是你职业生涯中遇到的最大挑战。\\n\\n　　为什么说找第一份工作很难?\\n\\n　　主要在于：实际企业中用到的软件开发知识和在学校所学的知识是完全不同的。假设你已经在学校和同学做过周期长达2-3个月的项目，但真正工作中的团队协作与你在学校中经历的协作也有很多不同。\"},{\"type\":\"image\",\"value\":\"http://192.168.200.130:9000/leadnews/2021/4/20210418/e8113ad756a64ea6808f91130a6cd934.jpg\"},{\"type\":\"text\",\"value\":\"在实际团队中，每一位成员彼此团结一致，为项目的交付而努力，这也意味着你必须要理解好在项目中负责的那部分任务，在规定时间交付还需确保你负责的功能，在所有环境中都能很好地发挥作用，而不仅仅是你的本地机器。\\n\\n　　这需要你对项目中的每一行代码严谨要求。学校练习的项目中，对bug的容忍度很大，而在实际工作中是绝对不能容忍的。项目中的任何一个环节都涉及公司利益，任何一个bug都可能影响公司的收入及形象。\"},{\"type\":\"image\",\"value\":\"http://192.168.200.130:9000/leadnews/2021/4/20210418/c7c3d36d25504cf6aecdcd5710261773.jpg\"}]', 3, 1, '项目课程', '2021-04-19 00:13:58', '2021-04-19 00:13:58', 9, '2021-04-19 00:10:48', '审核成功', 1383827995813531650, 'http://192.168.200.130:9000/leadnews/2021/4/20210418/7d0911a41a3745efa8509a87f234813c.jpg,http://192.168.200.130:9000/leadnews/2021/4/20210418/c7c3d36d25504cf6aecdcd5710261773.jpg,http://192.168.200.130:9000/leadnews/2021/4/20210418/e8113ad756a64ea6808f91130a6cd934.jpg', 1);
INSERT INTO `wm_news` VALUES (6227, 1102, '小白如何辨别其真与伪&好与坏？', '[{\"type\":\"text\",\"value\":\"通过上篇《IT培训就业艰难，行业乱象频发，如何破解就业难题?》一文，相信大家已初步了解“项目课程”对程序员能否就业且高薪就业的重要性。\\n\\n　　因此，小白在选择IT培训机构时，关注的重点就在于所学“项目课程”能否真正帮你增加就业筹码。当然，前提必须是学到“真”项目。\"},{\"type\":\"image\",\"value\":\"http://192.168.200.130:9000/leadnews/2021/4/20210418/1818283261e3401892e1383c1bd00596.jpg\"}]', 1, 1, '小白', '2021-04-19 00:15:05', '2021-04-19 00:15:05', 9, '2021-04-19 00:14:58', '审核成功', 1383827976310018049, 'http://192.168.200.130:9000/leadnews/2021/4/20210418/1818283261e3401892e1383c1bd00596.jpg', 1);
INSERT INTO `wm_news` VALUES (6228, 1102, '工作线程数是不是设置的越大越好', '[{\"type\":\"text\",\"value\":\"根据经验来看，jdk api 一般推荐的线程数为CPU核数的2倍。但是有些书籍要求可以设置为CPU核数的8倍，也有的业务设置为CPU核数的32倍。\\n“工作线程数”的设置依据是什么，到底设置为多少能够最大化CPU性能，是本文要讨论的问题。\\n\\n工作线程数是不是设置的越大越好\\n显然不是的。使用java.lang.Thread类或者java.lang.Runnable接口编写代码来定义、实例化和启动新线程。\\n一个Thread类实例只是一个对象，像Java中的任何其他对象一样，具有变量和方法，生死于堆上。\\nJava中，每个线程都有一个调用栈，即使不在程序中创建任何新的线程，线程也在后台运行着。\\n一个Java应用总是从main()方法开始运行，main()方法运行在一个线程内，它被称为主线程。\\n一旦创建一个新的线程，就产生一个新的调用栈。\"},{\"type\":\"image\",\"value\":\"http://192.168.200.130:9000/leadnews/2021/4/20210418/a3f0bc438c244f788f2df474ed8ecdc1.jpg\"}]', 1, 1, '11', '2021-04-19 00:16:57', '2021-04-19 00:16:57', 9, '2021-04-19 00:16:52', '审核成功', 1383827952326987778, 'http://192.168.200.130:9000/leadnews/2021/4/20210418/a3f0bc438c244f788f2df474ed8ecdc1.jpg', 1);
INSERT INTO `wm_news` VALUES (6229, 1102, 'Base64编解码原理', '[{\"type\":\"text\",\"value\":\"我在面试过程中，问过很多高级java工程师，是否了解Base64？部分人回答了解，部分人直接回答不了解。而说了解的那部分人却回答不上来它的原理。\\n\\nBase64 的由来\\nBase64是网络上最常见的用于传输8Bit字节代码的编码方式之一，大家可以查看RFC2045～RFC2049，上面有MIME的详细规范。它是一种基于用64个可打印字符来表示二进制数据的表示方法。它通常用作存储、传输一些二进制数据编码方法！也是MIME（多用途互联网邮件扩展，主要用作电子邮件标准）中一种可打印字符表示二进制数据的常见编码方法！它其实只是定义用可打印字符传输内容一种方法，并不会产生新的字符集！\\n\\n传统的邮件只支持可见字符的传送，像ASCII码的控制字符就 不能通过邮件传送。这样用途就受到了很大的限制，比如图片二进制流的每个字节不可能全部是可见字符，所以就传送不了。最好的方法就是在不改变传统协议的情 况下，做一种扩展方案来支持二进制文件的传送。把不可打印的字符也能用可打印字符来表示，问题就解决了。Base64编码应运而生，Base64就是一种 基于64个可打印字符来表示二进制数据的表示方法。\"},{\"type\":\"image\",\"value\":\"http://192.168.200.130:9000/leadnews/2021/4/20210418/b44c65376f12498e873223d9d6fdf523.jpg\"},{\"type\":\"text\",\"value\":\"请在这里输入正文\"}]', 1, 1, '11', '2021-04-19 00:17:44', '2021-04-19 00:17:44', 9, '2021-04-19 00:17:42', '审核成功', 1383827911810011137, 'http://192.168.200.130:9000/leadnews/2021/4/20210418/b44c65376f12498e873223d9d6fdf523.jpg', 1);
INSERT INTO `wm_news` VALUES (6230, 1102, '为什么项目经理不喜欢重构？', '[{\"type\":\"text\",\"value\":\"经常听到开发人员抱怨 ，“这么烂的代码，我来重构一下！”，“这代码怎么能这么写呢？谁来重构一下？”，“这儿有个坏味道，重构吧！”\\n\\n作为一名项目经理，每次听到“重构”两个字，既想给追求卓越代码的开发人员点个赞，同时又会感觉非常紧张，为什么又要重构？马上就要上线了，怎么还要改？是不是应该阻止开发人员做重构？\\n\\n重构几乎是开发人员最喜欢的一项实践了，可项目经理们却充满了顾虑，那么为什么项目经理不喜欢重构呢？\\n\\n老功能被破坏\\n不止一次遇到这样的场景，某一天一个老功能突然被破坏了，项目经理们感到奇怪，产品这块儿的功能已经很稳定了，也没有在这部分开发什么新功能，为什么突然出问题了呢？\"},{\"type\":\"image\",\"value\":\"http://192.168.200.130:9000/leadnews/2021/4/20210418/e8113ad756a64ea6808f91130a6cd934.jpg\"},{\"type\":\"image\",\"value\":\"http://192.168.200.130:9000/leadnews/2021/4/20210418/4a498d9cf3614570ac0cb2da3e51c164.jpg\"},{\"type\":\"text\",\"value\":\"请在这里输入正文\"}]', 1, 1, '11', '2021-04-19 00:19:23', '2021-04-19 00:19:23', 9, '2021-04-19 00:19:09', '审核成功', 1383827888816836609, 'http://192.168.200.130:9000/leadnews/2021/4/20210418/4a498d9cf3614570ac0cb2da3e51c164.jpg', 1);
INSERT INTO `wm_news` VALUES (6231, 1102, 'Kafka文件的存储机制', '[{\"type\":\"text\",\"value\":\"Kafka文件的存储机制Kafka文件的存储机制Kafka文件的存储机制Kafka文件的存储机制Kafka文件的存储机制Kafka文件的存储机制Kafka文件的存储机制Kafka文件的存储机制Kafka文件的存储机制Kafka文件的存储机制\"},{\"type\":\"image\",\"value\":\"http://192.168.200.130:9000/leadnews/2021/4/20210418/4a498d9cf3614570ac0cb2da3e51c164.jpg\"},{\"type\":\"text\",\"value\":\"请在这里输入正文\"}]', 1, 1, '11', '2021-04-19 00:58:47', '2021-04-19 00:58:47', 9, '2021-04-19 00:20:17', '审核成功', 1383827787629252610, 'http://192.168.200.130:9000/leadnews/2021/4/20210418/4a498d9cf3614570ac0cb2da3e51c164.jpg', 1);

-- ----------------------------
-- Table structure for wm_news_material
-- ----------------------------
DROP TABLE IF EXISTS `wm_news_material`;
CREATE TABLE `wm_news_material`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `material_id` int UNSIGNED NULL DEFAULT NULL COMMENT '素材ID',
  `news_id` int UNSIGNED NULL DEFAULT NULL COMMENT '图文ID',
  `type` tinyint UNSIGNED NULL DEFAULT NULL COMMENT '引用类型\r\n            0 内容引用\r\n            1 主图引用',
  `ord` tinyint UNSIGNED NULL DEFAULT NULL COMMENT '引用排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 281 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '自媒体图文引用素材信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of wm_news_material
-- ----------------------------
INSERT INTO `wm_news_material` VALUES (255, 61, 6232, 0, 0);
INSERT INTO `wm_news_material` VALUES (256, 61, 6232, 1, 0);
INSERT INTO `wm_news_material` VALUES (263, 61, 6231, 0, 0);
INSERT INTO `wm_news_material` VALUES (264, 61, 6231, 1, 0);
INSERT INTO `wm_news_material` VALUES (265, 57, 6230, 0, 0);
INSERT INTO `wm_news_material` VALUES (266, 61, 6230, 0, 1);
INSERT INTO `wm_news_material` VALUES (267, 61, 6230, 1, 0);
INSERT INTO `wm_news_material` VALUES (268, 58, 6229, 0, 0);
INSERT INTO `wm_news_material` VALUES (269, 58, 6229, 1, 0);
INSERT INTO `wm_news_material` VALUES (270, 62, 6228, 0, 0);
INSERT INTO `wm_news_material` VALUES (271, 62, 6228, 1, 0);
INSERT INTO `wm_news_material` VALUES (272, 66, 6227, 0, 0);
INSERT INTO `wm_news_material` VALUES (273, 66, 6227, 1, 0);
INSERT INTO `wm_news_material` VALUES (274, 57, 6226, 0, 0);
INSERT INTO `wm_news_material` VALUES (275, 64, 6226, 0, 1);
INSERT INTO `wm_news_material` VALUES (276, 65, 6226, 1, 0);
INSERT INTO `wm_news_material` VALUES (277, 64, 6226, 1, 1);
INSERT INTO `wm_news_material` VALUES (278, 57, 6226, 1, 2);
INSERT INTO `wm_news_material` VALUES (279, 65, 6225, 0, 0);
INSERT INTO `wm_news_material` VALUES (280, 65, 6225, 1, 0);

-- ----------------------------
-- Table structure for wm_news_statistics
-- ----------------------------
DROP TABLE IF EXISTS `wm_news_statistics`;
CREATE TABLE `wm_news_statistics`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int UNSIGNED NULL DEFAULT NULL COMMENT '主账号ID',
  `article` int UNSIGNED NULL DEFAULT NULL COMMENT '子账号ID',
  `read_count` int UNSIGNED NULL DEFAULT NULL COMMENT '阅读量',
  `comment` int UNSIGNED NULL DEFAULT NULL COMMENT '评论量',
  `follow` int UNSIGNED NULL DEFAULT NULL COMMENT '关注量',
  `collection` int UNSIGNED NULL DEFAULT NULL COMMENT '收藏量',
  `forward` int UNSIGNED NULL DEFAULT NULL COMMENT '转发量',
  `likes` int UNSIGNED NULL DEFAULT NULL COMMENT '点赞量',
  `unlikes` int UNSIGNED NULL DEFAULT NULL COMMENT '不喜欢',
  `unfollow` int UNSIGNED NULL DEFAULT NULL COMMENT '取消关注量',
  `burst` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_time` date NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_user_id_time`(`user_id` ASC, `created_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '自媒体图文数据统计表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of wm_news_statistics
-- ----------------------------

-- ----------------------------
-- Table structure for wm_user
-- ----------------------------
DROP TABLE IF EXISTS `wm_user`;
CREATE TABLE `wm_user`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `ap_user_id` int NULL DEFAULT NULL,
  `ap_author_id` int NULL DEFAULT NULL,
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '登录用户名',
  `password` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '登录密码',
  `salt` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '盐',
  `nickname` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '昵称',
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '头像',
  `location` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '归属地',
  `phone` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '手机号',
  `status` tinyint UNSIGNED NULL DEFAULT NULL COMMENT '状态\r\n            0 暂时不可用\r\n            1 永久不可用\r\n            9 正常可用',
  `email` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '邮箱',
  `type` tinyint UNSIGNED NULL DEFAULT NULL COMMENT '账号类型\r\n            0 个人 \r\n            1 企业\r\n            2 子账号',
  `score` tinyint UNSIGNED NULL DEFAULT NULL COMMENT '运营评分',
  `login_time` datetime NULL DEFAULT NULL COMMENT '最后一次登录时间',
  `created_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1120 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '自媒体用户信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of wm_user
-- ----------------------------
INSERT INTO `wm_user` VALUES (1100, NULL, NULL, 'zhangsan', 'ab8c7c1e66a164ab6891b927550ea39a', 'abc', '小张', NULL, NULL, '13588996789', 1, NULL, NULL, NULL, '2020-02-17 23:51:15', '2020-02-17 23:51:18');
INSERT INTO `wm_user` VALUES (1101, NULL, NULL, 'lisi', 'a6ecab0c246bbc87926e0fba442cc014', 'def', '小李', NULL, NULL, '13234567656', 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `wm_user` VALUES (1102, NULL, NULL, 'admin', 'a66abb5684c45962d887564f08346e8d', '123456', '管理', NULL, NULL, '13234567657', 1, NULL, NULL, NULL, NULL, '2020-03-14 09:35:13');
INSERT INTO `wm_user` VALUES (1118, NULL, NULL, 'lisi1', '123', '123', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `wm_user` VALUES (1119, NULL, NULL, 'shaseng', '1234', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
