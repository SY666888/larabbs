/*
 Navicat Premium Data Transfer

 Source Server         : homestead
 Source Server Type    : MySQL
 Source Server Version : 80023
 Source Host           : 127.0.0.1:33060
 Source Schema         : larabbs

 Target Server Type    : MySQL
 Target Server Version : 80023
 File Encoding         : 65001

 Date: 29/10/2021 18:52:17
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for categories
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '名称',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '描述',
  `post_count` int(0) NOT NULL DEFAULT 0 COMMENT '帖子数',
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of categories
-- ----------------------------
INSERT INTO `categories` VALUES (1, '分享', '分享创造，分享发现', 0, NULL, NULL);
INSERT INTO `categories` VALUES (2, '教程', '开发技巧、推荐扩展包等', 0, NULL, NULL);
INSERT INTO `categories` VALUES (3, '问答', '请保持友善，互帮互助', 0, NULL, NULL);
INSERT INTO `categories` VALUES (4, '公告', '站点公告', 0, NULL, NULL);

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (1, '2014_10_12_000000_create_users_table', 1);
INSERT INTO `migrations` VALUES (2, '2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO `migrations` VALUES (3, '2021_10_29_151140_add_avatar_and_introduction_to_users_table', 2);
INSERT INTO `migrations` VALUES (4, '2021_10_29_174946_create_categories_table', 3);
INSERT INTO `migrations` VALUES (6, '2021_10_29_180937_seed_categories_data', 4);

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets`  (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  INDEX `password_resets_email_index`(`email`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp(0) NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `introduction` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_email_unique`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'admin', 'zsysem@163.com', '2021-10-29 14:10:33', '$2y$10$mAwVZzQ3nA2431jv0rWdAeEkO0hmqQYE0iEr3bVrEFexUHo35NGZa', 'dUHXxn5m5V9kN1nqU0dVSVKyGbP9QmYuEC95gSVgHHqdkyTs9IWldBGLf9jl', '2021-10-28 18:24:27', '2021-10-29 17:08:49', 'http://larabbs.test/uploads/images/avatars/202110/29/1_1635498529_QpEP31WrVR.png', '专注于各种煲类的研究与创新，主营肉蟹煲、虾煲、鸡爪煲等特色煲类。精心配比的香料、秘制的酱汁融入高汤，与蟹、鸡爪等食材相互碰撞，成就了金胖哥俩肉蟹煲的专属味道');
INSERT INTO `users` VALUES (2, '李四', '142141@qq.com', '2021-10-29 14:04:32', '$2y$10$Mx2RRiS.LnM0yeAJ5W25ae69TMdVn0TvtK4XZsSQGn06w8ulIkJAO', 'MgtwD5v5m9F91MYslcznPiXGUUOy9ByLX4c7qlsF1I2WTRWGXafXv8ikz5ye', '2021-10-28 18:46:48', '2021-10-29 14:04:32', NULL, NULL);
INSERT INTO `users` VALUES (3, '王五', 'wangwu@163.com', '2021-10-29 12:05:07', '$2y$10$XQkRc4BWZzBiGWlsPFhk3uHlGTPgwoMyhk3rLL2nNosAFiekxMbVa', 'R6FwdzT12Ng1g9JT2Yase7YJbec6ychAxCJBd1wqjaiJOChfWTdrwaUkvmlj', '2021-10-29 11:27:04', '2021-10-29 12:05:07', NULL, NULL);
INSERT INTO `users` VALUES (4, '卡里卢', '1421411321@qq.com', '2021-10-29 12:00:20', '$2y$10$cR2VAfJ3HyqxIwLNIYhkyelIE8fysr2QI1V/4c6s5e3xlhEkhtSZ.', 'EfeVUiuw7c6Ac9dTGJBgSwkI7MBsB1AaYBIlNNjxH4bHtpecJ4WsFoeVz8iP', '2021-10-29 11:35:32', '2021-10-29 12:00:20', NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
