-- MySQL dump 10.13  Distrib 8.0.16, for linux-glibc2.12 (x86_64)
--
-- Host: localhost    Database: smart_haxxj_com
-- ------------------------------------------------------
-- Server version	8.0.16

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `smart_admin`
--

DROP TABLE IF EXISTS `smart_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `smart_admin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '用户名',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '昵称',
  `password` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '密码',
  `salt` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '密码盐',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '头像',
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '电子邮箱',
  `loginfailure` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '失败次数',
  `logintime` int(10) DEFAULT NULL COMMENT '登录时间',
  `loginip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '登录IP',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `token` varchar(59) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'Session标识',
  `status` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'normal' COMMENT '状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='管理员表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smart_admin`
--

LOCK TABLES `smart_admin` WRITE;
/*!40000 ALTER TABLE `smart_admin` DISABLE KEYS */;
INSERT INTO `smart_admin` VALUES (1,'admin','Admin','b35720a9ca24e6aa1b2f87218c6acb31','6a4f25','/uploads/20210413/489af80e5c10bebbe303f58cf14f5529.jpg','admin@admin.com',0,1622444984,'127.0.0.1',1491635035,1622444984,'5e31d3a0-6b7b-4adb-9620-6bfc13db1bee','normal'),(2,'1001','企业管理员','5be24d43dcb65f13ac668715d16a255d','8DWZ30','/uploads/20210413/961bed67300fefec24cb5b65b2343cb6.jpg','1001@qq.com',0,1622037501,'127.0.0.1',1618242691,1622037501,'a5f0c0a3-7b5a-4488-ad85-6523b60ff954','normal');
/*!40000 ALTER TABLE `smart_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smart_admin_log`
--

DROP TABLE IF EXISTS `smart_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `smart_admin_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `admin_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '管理员ID',
  `username` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '管理员名字',
  `url` varchar(1500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '操作页面',
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '日志标题',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '内容',
  `ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'IP',
  `useragent` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'User-Agent',
  `createtime` int(10) DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`),
  KEY `name` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=303 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='管理员日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smart_admin_log`
--

LOCK TABLES `smart_admin_log` WRITE;
/*!40000 ALTER TABLE `smart_admin_log` DISABLE KEYS */;
INSERT INTO `smart_admin_log` VALUES (1,1,'admin','/eKrnmBMykb.php/index/login?url=%2FeKrnmBMykb.php','登录','{\"url\":\"\\/eKrnmBMykb.php\",\"__token__\":\"***\",\"username\":\"admin\",\"password\":\"***\",\"captcha\":\"bmud\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1617973645),(2,1,'admin','/eKrnmBMykb.php/user/rule/edit/ids/6?dialog=1','会员管理 / 会员规则 / 编辑','{\"dialog\":\"1\",\"__token__\":\"***\",\"row\":{\"ismenu\":\"0\",\"pid\":\"3\",\"name\":\"index\\/user\\/register\",\"title\":\"Register\",\"remark\":\"\",\"weigh\":\"7\",\"status\":\"hidden\"},\"ids\":\"6\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1617974190),(3,1,'admin','/eKrnmBMykb.php/addon/install','插件管理','{\"name\":\"command\",\"force\":\"0\",\"uid\":\"25581\",\"token\":\"***\",\"version\":\"1.0.6\",\"faversion\":\"1.2.0.20210401_beta\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1617980544),(4,1,'admin','/eKrnmBMykb.php/addon/install','插件管理','{\"name\":\"vote\",\"force\":\"0\",\"uid\":\"25581\",\"token\":\"***\",\"version\":\"1.1.0\",\"faversion\":\"1.2.0.20210401_beta\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1617980569),(5,1,'admin','/eKrnmBMykb.php/addon/install','插件管理','{\"name\":\"wechat\",\"force\":\"0\",\"uid\":\"25581\",\"token\":\"***\",\"version\":\"1.2.0\",\"faversion\":\"1.2.0.20210401_beta\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1617980594),(6,1,'admin','/eKrnmBMykb.php/addon/install','插件管理','{\"name\":\"third\",\"force\":\"0\",\"uid\":\"25581\",\"token\":\"***\",\"version\":\"1.2.2\",\"faversion\":\"1.2.0.20210401_beta\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1617980601),(7,1,'admin','/eKrnmBMykb.php/addon/install','插件管理','{\"name\":\"geetest\",\"force\":\"0\",\"uid\":\"25581\",\"token\":\"***\",\"version\":\"1.0.1\",\"faversion\":\"1.2.0.20210401_beta\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1617980704),(8,1,'admin','/eKrnmBMykb.php/index/login','登录','{\"__token__\":\"***\",\"username\":\"admin\",\"password\":\"***\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1618145075),(9,1,'admin','/eKrnmBMykb.php/user/user/edit/ids/1?dialog=1','会员管理 / 会员管理 / 编辑','{\"dialog\":\"1\",\"__token__\":\"***\",\"row\":{\"id\":\"1\",\"group_id\":\"1\",\"username\":\"admin\",\"nickname\":\"admin\",\"password\":\"***\",\"email\":\"admin@163.com\",\"mobile\":\"13888888888\",\"avatar\":\"\",\"level\":\"0\",\"gender\":\"0\",\"birthday\":\"2017-04-08\",\"bio\":\"\",\"money\":\"0.00\",\"score\":\"0\",\"successions\":\"1\",\"maxsuccessions\":\"1\",\"prevtime\":\"2017-04-08 15:03:55\",\"logintime\":\"2017-04-08 15:03:55\",\"loginip\":\"127.0.0.1\",\"loginfailure\":\"0\",\"joinip\":\"127.0.0.1\",\"jointime\":\"2017-04-08 15:03:55\",\"status\":\"normal\"},\"ids\":\"1\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1618145153),(10,1,'admin','/eKrnmBMykb.php/ajax/upload','','[]','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1618145901),(11,1,'admin','/eKrnmBMykb.php/ajax/upload','','[]','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1618146071),(12,1,'admin','/eKrnmBMykb.php/vote/subject/check_element_available','投票管理 / 投票项目管理','{\"name\":\"row[diyname]\",\"value\":\"电梯维修费用方案投票\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1618146125),(13,1,'admin','/eKrnmBMykb.php/vote/subject/get_template_list','投票管理 / 投票项目管理','{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"name\",\"searchField\":[\"name\"],\"name\":\"\",\"type\":\"subject\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1618146129),(14,1,'admin','/eKrnmBMykb.php/vote/subject/get_template_list','投票管理 / 投票项目管理','{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"name\",\"searchField\":[\"name\"],\"name\":\"\",\"type\":\"player\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1618146131),(15,1,'admin','/eKrnmBMykb.php/vote/subject/get_template_list','投票管理 / 投票项目管理','{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"name\",\"searchField\":[\"name\"],\"name\":\"\",\"type\":\"rank\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1618146132),(16,1,'admin','/eKrnmBMykb.php/vote/subject/get_template_list','投票管理 / 投票项目管理','{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"name\",\"searchField\":[\"name\"],\"name\":\"\",\"type\":\"apply\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1618146133),(17,1,'admin','/eKrnmBMykb.php/vote/subject/add?dialog=1','投票管理 / 投票项目管理 / 添加','{\"dialog\":\"1\",\"row\":{\"title\":\"关于五号楼一单元一号电梯维修方案的投票\",\"user_id\":\"\",\"image\":\"\\/uploads\\/20210411\\/21985bd56c746e1df1274c3e520039bc.jpg\",\"keywords\":\"电梯维修\",\"description\":\"需要更换吊装钢丝\",\"intro\":\"目前电梯已经过免费维保期，电梯吊装钢丝绳磨损严重，为安全起见，需要更换钢丝绳，目前更换方案已经，关于费用出处有两个方案供业主选择，即由一单元62户业主单独承担，或申请公共维修基金维修更换。\",\"content\":\"目前电梯已经过免费维保期，电梯吊装钢丝绳磨损严重，为安全起见，需要更换钢丝绳，目前更换方案已经，关于费用出处有两个方案供业主选择，即由一单元62户业主单独承担，或申请公共维修基金维修更换。\",\"banner\":\"\\/uploads\\/20210411\\/ac8d5e112adfdebfa1a20f7c1978ede3.jpg\",\"maxvoteplayers\":\"1\",\"pervoteplayers\":\"1\",\"maxvotenums\":\"1\",\"pervotenums\":\"1\",\"maxvotelimit\":\"1\",\"pervotelimit\":\"1\",\"maxcatevotenums\":\"1\",\"percatevotenums\":\"1\",\"maxcatevoteplayers\":\"1\",\"pagesize\":\"0\",\"limitarea\":\"\",\"needlogin\":\"1\",\"onlywechat\":\"1\",\"diyname\":\"电梯维修费用方案投票\",\"playername\":\"方案\",\"subjecttpl\":\"subject.html\",\"playertpl\":\"player.html\",\"ranktpl\":\"rank.html\",\"applytpl\":\"apply.html\",\"isapply\":\"0\",\"iscomment\":\"1\",\"begintime\":\"2021-04-11 20:56:15\",\"endtime\":\"2021-05-18 20:56:15\",\"status\":\"normal\"}}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1618146151),(18,1,'admin','/eKrnmBMykb.php/vote/category/add/subject_id/1?dialog=1','投票管理 / 项目分类管理 / 添加','{\"dialog\":\"1\",\"row\":{\"subject_id\":\"1\",\"name\":\"维修类\",\"image\":\"\",\"status\":\"normal\"},\"subject_id\":\"1\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1618146185),(19,1,'admin','/eKrnmBMykb.php/vote/category/add/subject_id/1?dialog=1','投票管理 / 项目分类管理 / 添加','{\"dialog\":\"1\",\"row\":{\"subject_id\":\"1\",\"name\":\"民生类\",\"image\":\"\",\"status\":\"normal\"},\"subject_id\":\"1\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1618146197),(20,1,'admin','/eKrnmBMykb.php/ajax/upload','','[]','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1618146365),(21,1,'admin','/eKrnmBMykb.php/vote/player/add/subject_id/1?dialog=1','投票管理 / 投票选手管理 / 添加','{\"dialog\":\"1\",\"row\":{\"subject_id\":\"1\",\"category_id\":\"1\",\"user_id\":\"\",\"nickname\":\"A方案\",\"intro\":\"一单元业主承担\",\"content\":\"相关费用由一单元62户业主承担\",\"image\":\"\\/uploads\\/20210411\\/acfe2a6af3faf001821ef7a02c3b4bcf.jpg\",\"bgcolor\":\"\",\"banner\":\"\",\"votes\":\"0\",\"views\":\"0\",\"comments\":\"0\",\"votetime\":\"2021-04-11 21:03:23\",\"status\":\"normal\"},\"subject_id\":\"1\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1618146374),(22,1,'admin','/eKrnmBMykb.php/ajax/upload','','[]','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1618146406),(23,1,'admin','/eKrnmBMykb.php/vote/player/add/subject_id/1?dialog=1','投票管理 / 投票选手管理 / 添加','{\"dialog\":\"1\",\"row\":{\"subject_id\":\"1\",\"category_id\":\"1\",\"user_id\":\"0\",\"nickname\":\"B方案\",\"intro\":\"申请公众维修基金用于维修\",\"content\":\"申请公众维修基金用于维修\",\"image\":\"\\/uploads\\/20210411\\/b498dab6d5a9df523c56fbdaaaa75e69.jpg\",\"bgcolor\":\"\",\"banner\":\"\",\"votes\":\"0\",\"views\":\"0\",\"comments\":\"0\",\"votetime\":\"2021-04-11 21:06:16\",\"status\":\"normal\"},\"subject_id\":\"1\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1618146410),(24,1,'admin','/eKrnmBMykb.php/vote/subject/get_template_list','投票管理 / 投票项目管理','{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"subject.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"subject.html\",\"searchField\":[\"name\"],\"type\":\"subject\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1618146497),(25,1,'admin','/eKrnmBMykb.php/vote/subject/get_template_list','投票管理 / 投票项目管理','{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"player.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"player.html\",\"searchField\":[\"name\"],\"type\":\"player\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1618146497),(26,1,'admin','/eKrnmBMykb.php/vote/subject/get_template_list','投票管理 / 投票项目管理','{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"rank.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"rank.html\",\"searchField\":[\"name\"],\"type\":\"rank\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1618146497),(27,1,'admin','/eKrnmBMykb.php/vote/subject/get_template_list','投票管理 / 投票项目管理','{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"apply.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"apply.html\",\"searchField\":[\"name\"],\"type\":\"apply\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1618146497),(28,1,'admin','/eKrnmBMykb.php/vote/subject/check_element_available','投票管理 / 投票项目管理','{\"id\":\"1\",\"name\":\"row[diyname]\",\"value\":\"电梯维修费用方案投票\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1618146502),(29,1,'admin','/eKrnmBMykb.php/vote/subject/edit/ids/1?dialog=1','投票管理 / 投票项目管理 / 编辑','{\"dialog\":\"1\",\"row\":{\"title\":\"关于五号楼一单元一号电梯维修方案的投票\",\"user_id\":\"0\",\"image\":\"\\/uploads\\/20210411\\/21985bd56c746e1df1274c3e520039bc.jpg\",\"keywords\":\"电梯维修\",\"description\":\"需要更换吊装钢丝\",\"intro\":\"目前电梯已经过免费维保期，电梯吊装钢丝绳磨损严重，为安全起见，需要更换钢丝绳，目前更换方案已经，关于费用出处有两个方案供业主选择，即由一单元62户业主单独承担，或申请公共维修基金维修更换。\",\"content\":\"目前电梯已经过免费维保期，电梯吊装钢丝绳磨损严重，为安全起见，需要更换钢丝绳，目前更换方案已经，关于费用出处有两个方案供业主选择，即由一单元62户业主单独承担，或申请公共维修基金维修更换。\",\"banner\":\"\\/uploads\\/20210411\\/ac8d5e112adfdebfa1a20f7c1978ede3.jpg\",\"maxvoteplayers\":\"1\",\"pervoteplayers\":\"1\",\"maxvotenums\":\"1\",\"pervotenums\":\"1\",\"maxvotelimit\":\"1\",\"pervotelimit\":\"1\",\"maxcatevotenums\":\"1\",\"percatevotenums\":\"1\",\"maxcatevoteplayers\":\"1\",\"pagesize\":\"0\",\"limitarea\":\"\",\"needlogin\":\"1\",\"onlywechat\":\"0\",\"diyname\":\"电梯维修费用方案投票\",\"playername\":\"方案\",\"subjecttpl\":\"subject.html\",\"playertpl\":\"player.html\",\"ranktpl\":\"rank.html\",\"applytpl\":\"apply.html\",\"isapply\":\"0\",\"iscomment\":\"1\",\"begintime\":\"2021-04-11 20:56:15\",\"endtime\":\"2021-05-18 20:56:15\",\"memo\":\"\",\"status\":\"normal\"},\"ids\":\"1\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1618146502),(30,1,'admin','/eKrnmBMykb.php/vote/comment/edit/ids/1?dialog=1','投票管理 / 投票评论管理 / 编辑','{\"dialog\":\"1\",\"row\":{\"subject_id\":\"1\",\"player_id\":\"1\",\"user_id\":\"1\",\"nickname\":\"\",\"content\":\"还可以这么搞吗？\",\"ip\":\"127.0.0.1\",\"status\":\"normal\"},\"ids\":\"1\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1618147568),(31,1,'admin','/eKrnmBMykb.php/vote/player/edit/subject_id/0/ids/2?dialog=1','投票管理 / 投票选手管理 / 编辑','{\"dialog\":\"1\",\"row\":{\"subject_id\":\"1\",\"category_id\":\"1\",\"user_id\":\"0\",\"number\":\"2\",\"nickname\":\"B方案（公共维修基金）\",\"intro\":\"申请公众维修基金用于维修\",\"content\":\"申请公众维修基金用于维修\",\"image\":\"\\/uploads\\/20210411\\/b498dab6d5a9df523c56fbdaaaa75e69.jpg\",\"bgcolor\":\"\",\"banner\":\"\",\"votes\":\"0\",\"views\":\"1\",\"comments\":\"0\",\"votetime\":\"2021-04-11 21:06:16\",\"memo\":\"\",\"status\":\"normal\"},\"subject_id\":\"0\",\"ids\":\"2\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1618149995),(32,1,'admin','/eKrnmBMykb.php/vote/player/edit/subject_id/0/ids/1?dialog=1','投票管理 / 投票选手管理 / 编辑','{\"dialog\":\"1\",\"row\":{\"subject_id\":\"1\",\"category_id\":\"1\",\"user_id\":\"0\",\"number\":\"1\",\"nickname\":\"A方案（自筹资金）\",\"intro\":\"一单元业主承担\",\"content\":\"相关费用由一单元62户业主承担\",\"image\":\"\\/uploads\\/20210411\\/acfe2a6af3faf001821ef7a02c3b4bcf.jpg\",\"bgcolor\":\"\",\"banner\":\"\",\"votes\":\"1\",\"views\":\"5\",\"comments\":\"1\",\"votetime\":\"2021-04-11 21:08:31\",\"memo\":\"\",\"status\":\"normal\"},\"subject_id\":\"0\",\"ids\":\"1\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1618150011),(33,1,'admin','/eKrnmBMykb.php/index/login','登录','{\"__token__\":\"***\",\"username\":\"admin\",\"password\":\"***\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1618150059),(34,1,'admin','/eKrnmBMykb.php/auth/rule/edit/ids/99?dialog=1','权限管理 / 菜单规则 / 编辑','{\"dialog\":\"1\",\"__token__\":\"***\",\"row\":{\"ismenu\":\"1\",\"pid\":\"92\",\"name\":\"vote\\/player\",\"title\":\"投票选项（手）管理\",\"url\":\"\",\"icon\":\"fa fa-users\",\"weigh\":\"0\",\"condition\":\"\",\"menutype\":\"addtabs\",\"extend\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"99\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1618150635),(35,1,'admin','/eKrnmBMykb.php/auth/rule/edit/ids/99?dialog=1','权限管理 / 菜单规则 / 编辑','{\"dialog\":\"1\",\"__token__\":\"***\",\"row\":{\"ismenu\":\"1\",\"pid\":\"92\",\"name\":\"vote\\/player\",\"title\":\"投票选手(项)管理\",\"url\":\"\",\"icon\":\"fa fa-users\",\"weigh\":\"0\",\"condition\":\"\",\"menutype\":\"addtabs\",\"extend\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"99\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1618150682),(36,1,'admin','/eKrnmBMykb.php/ajax/upload','','[]','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1618150884),(37,1,'admin','/eKrnmBMykb.php/vote/subject/get_template_list','投票管理 / 投票项目管理','{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"name\",\"searchField\":[\"name\"],\"name\":\"\",\"type\":\"subject\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1618150978),(38,1,'admin','/eKrnmBMykb.php/vote/subject/get_template_list','投票管理 / 投票项目管理','{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"name\",\"searchField\":[\"name\"],\"name\":\"\",\"type\":\"player\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1618150979),(39,1,'admin','/eKrnmBMykb.php/vote/subject/get_template_list','投票管理 / 投票项目管理','{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"name\",\"searchField\":[\"name\"],\"name\":\"\",\"type\":\"rank\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1618150980),(40,1,'admin','/eKrnmBMykb.php/vote/subject/get_template_list','投票管理 / 投票项目管理','{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"name\",\"searchField\":[\"name\"],\"name\":\"\",\"type\":\"apply\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1618150983),(41,1,'admin','/eKrnmBMykb.php/vote/subject/check_element_available','投票管理 / 投票项目管理','{\"name\":\"row[diyname]\",\"value\":\"最美物业人评选\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1618151008),(42,1,'admin','/eKrnmBMykb.php/vote/subject/add?dialog=1','投票管理 / 投票项目管理 / 添加','{\"dialog\":\"1\",\"row\":{\"title\":\"最美物业服务人员评选活动\",\"user_id\":\"\",\"image\":\"\\/uploads\\/20210411\\/98403e953a4b62dfe2d78a2ff9951987.jpg\",\"keywords\":\"最美物业评选\",\"description\":\"最美物业服务人员评选活动\",\"intro\":\"2021年度沤鸿物业服务人员综合评选活动，请业主参与，评选出您身边最美物业人。\",\"content\":\"2021年度沤鸿物业服务人员综合评选活动，请业主参与，评选出您身边最美物业人。\",\"banner\":\"\",\"maxvoteplayers\":\"10\",\"pervoteplayers\":\"2\",\"maxvotenums\":\"0\",\"pervotenums\":\"5\",\"maxvotelimit\":\"0\",\"pervotelimit\":\"0\",\"maxcatevotenums\":\"0\",\"percatevotenums\":\"0\",\"maxcatevoteplayers\":\"0\",\"pagesize\":\"0\",\"limitarea\":\"\",\"needlogin\":\"0\",\"onlywechat\":\"0\",\"diyname\":\"最美物业人评选\",\"playername\":\"选手\",\"subjecttpl\":\"subject.html\",\"playertpl\":\"player.html\",\"ranktpl\":\"rank.html\",\"applytpl\":\"apply.html\",\"isapply\":\"1\",\"iscomment\":\"1\",\"begintime\":\"2021-04-11 22:20:12\",\"endtime\":\"2021-05-31 22:20:12\",\"status\":\"normal\"}}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1618151008),(43,1,'admin','/eKrnmBMykb.php/vote/subject/get_template_list','投票管理 / 投票项目管理','{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"subject.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"subject.html\",\"searchField\":[\"name\"],\"type\":\"subject\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1618151031),(44,1,'admin','/eKrnmBMykb.php/vote/subject/get_template_list','投票管理 / 投票项目管理','{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"player.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"player.html\",\"searchField\":[\"name\"],\"type\":\"player\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1618151031),(45,1,'admin','/eKrnmBMykb.php/vote/subject/get_template_list','投票管理 / 投票项目管理','{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"rank.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"rank.html\",\"searchField\":[\"name\"],\"type\":\"rank\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1618151031),(46,1,'admin','/eKrnmBMykb.php/vote/subject/get_template_list','投票管理 / 投票项目管理','{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"apply.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"apply.html\",\"searchField\":[\"name\"],\"type\":\"apply\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1618151031),(47,1,'admin','/eKrnmBMykb.php/vote/subject/get_template_list','投票管理 / 投票项目管理','{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"subject.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"subject.html\",\"searchField\":[\"name\"],\"type\":\"subject\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1618151038),(48,1,'admin','/eKrnmBMykb.php/vote/subject/get_template_list','投票管理 / 投票项目管理','{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"player.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"player.html\",\"searchField\":[\"name\"],\"type\":\"player\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1618151038),(49,1,'admin','/eKrnmBMykb.php/vote/subject/get_template_list','投票管理 / 投票项目管理','{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"rank.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"rank.html\",\"searchField\":[\"name\"],\"type\":\"rank\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1618151038),(50,1,'admin','/eKrnmBMykb.php/vote/subject/get_template_list','投票管理 / 投票项目管理','{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"apply.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"apply.html\",\"searchField\":[\"name\"],\"type\":\"apply\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1618151038),(51,1,'admin','/eKrnmBMykb.php/ajax/upload','','[]','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1618151048),(52,1,'admin','/eKrnmBMykb.php/vote/subject/check_element_available','投票管理 / 投票项目管理','{\"id\":\"2\",\"name\":\"row[diyname]\",\"value\":\"最美物业人评选\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1618151050),(53,1,'admin','/eKrnmBMykb.php/vote/subject/edit/ids/2?dialog=1','投票管理 / 投票项目管理 / 编辑','{\"dialog\":\"1\",\"row\":{\"title\":\"最美物业服务人员评选活动\",\"user_id\":\"0\",\"image\":\"\\/uploads\\/20210411\\/98403e953a4b62dfe2d78a2ff9951987.jpg\",\"keywords\":\"最美物业评选\",\"description\":\"最美物业服务人员评选活动\",\"intro\":\"2021年度沤鸿物业服务人员综合评选活动，请业主参与，评选出您身边最美物业人。\",\"content\":\"2021年度沤鸿物业服务人员综合评选活动，请业主参与，评选出您身边最美物业人。\",\"banner\":\"\\/uploads\\/20210411\\/ac8d5e112adfdebfa1a20f7c1978ede3.jpg\",\"maxvoteplayers\":\"10\",\"pervoteplayers\":\"2\",\"maxvotenums\":\"0\",\"pervotenums\":\"5\",\"maxvotelimit\":\"0\",\"pervotelimit\":\"0\",\"maxcatevotenums\":\"0\",\"percatevotenums\":\"0\",\"maxcatevoteplayers\":\"0\",\"pagesize\":\"0\",\"limitarea\":\"\",\"needlogin\":\"0\",\"onlywechat\":\"0\",\"diyname\":\"最美物业人评选\",\"playername\":\"选手\",\"subjecttpl\":\"subject.html\",\"playertpl\":\"player.html\",\"ranktpl\":\"rank.html\",\"applytpl\":\"apply.html\",\"isapply\":\"1\",\"iscomment\":\"1\",\"begintime\":\"2021-04-11 22:20:12\",\"endtime\":\"2021-05-31 22:20:12\",\"memo\":\"\",\"status\":\"normal\"},\"ids\":\"2\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1618151050),(54,1,'admin','/eKrnmBMykb.php/vote/player/edit/subject_id/2/ids/3?dialog=1','投票管理 / 投票选手(项)管理 / 编辑','{\"dialog\":\"1\",\"row\":{\"subject_id\":\"2\",\"category_id\":\"0\",\"user_id\":\"1\",\"number\":\"1\",\"nickname\":\"吴俊雷\",\"intro\":\"吴俊雷任沤鸿物业管理部经理，工作兢兢业业，任劳任怨。对待业主为人和气，主动为业主排忧解难。\",\"content\":\"吴俊雷任沤鸿物业管理部经理，工作兢兢业业，任劳任怨。对待业主为人和气，主动为业主排忧解难。\",\"image\":\"\\/uploads\\/20210411\\/45b791433ba99f3b36c389c7db184ae8.jpg\",\"bgcolor\":\"\",\"banner\":\"\",\"votes\":\"0\",\"views\":\"1\",\"comments\":\"0\",\"votetime\":\"\",\"memo\":\"\",\"status\":\"normal\"},\"subject_id\":\"2\",\"ids\":\"3\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1618151213),(55,1,'admin','/eKrnmBMykb.php/index/login','登录','{\"__token__\":\"***\",\"username\":\"admin\",\"password\":\"***\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1618237194),(56,1,'admin','/eKrnmBMykb.php/ajax/upload','','[]','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1618237275),(57,1,'admin','/eKrnmBMykb.php/user/user/edit/ids/1?dialog=1','会员管理 / 会员管理 / 编辑','{\"dialog\":\"1\",\"__token__\":\"***\",\"row\":{\"id\":\"1\",\"group_id\":\"1\",\"username\":\"admin\",\"nickname\":\"admin\",\"password\":\"***\",\"email\":\"admin@163.com\",\"mobile\":\"13888888888\",\"avatar\":\"\\/uploads\\/20210412\\/45b791433ba99f3b36c389c7db184ae8.jpg\",\"level\":\"0\",\"gender\":\"0\",\"birthday\":\"2017-04-08\",\"bio\":\"\",\"money\":\"0.00\",\"score\":\"0\",\"successions\":\"1\",\"maxsuccessions\":\"1\",\"prevtime\":\"2021-04-11 21:07:45\",\"logintime\":\"2021-04-11 22:51:10\",\"loginip\":\"192.168.0.101\",\"loginfailure\":\"0\",\"joinip\":\"127.0.0.1\",\"jointime\":\"2017-04-08 15:03:55\",\"status\":\"normal\"},\"ids\":\"1\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1618237277),(58,1,'admin','/eKrnmBMykb.php/user/user/add?dialog=1','会员管理 / 会员管理 / 添加','{\"dialog\":\"1\",\"__token__\":\"***\",\"row\":{\"username\":\"user\",\"nickname\":\"小吴\",\"password\":\"***\",\"email\":\"\",\"mobile\":\"15358691188\",\"avatar\":\"\\/uploads\\/20210411\\/98403e953a4b62dfe2d78a2ff9951987.jpg\",\"level\":\"1\",\"gender\":\"1\",\"birthday\":\"2021-04-12\",\"bio\":\"这个家伙很懒，什么都没留下\",\"money\":\"0\",\"score\":\"0\",\"successions\":\"0\",\"maxsuccessions\":\"0\",\"prevtime\":\"2021-04-12 22:24:56\",\"logintime\":\"2021-04-12 22:24:57\",\"loginip\":\"127.0.0.1\",\"loginfailure\":\"0\",\"joinip\":\"127.0.0.1\",\"jointime\":\"2021-04-12 22:25:15\",\"status\":\"normal\"}}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1618237518),(59,1,'admin','/eKrnmBMykb.php/user/user/edit/ids/2?dialog=1','会员管理 / 会员管理 / 编辑','{\"dialog\":\"1\",\"__token__\":\"***\",\"row\":{\"id\":\"2\",\"group_id\":\"1\",\"username\":\"user\",\"nickname\":\"小吴\",\"password\":\"***\",\"email\":\"\",\"mobile\":\"15358691188\",\"avatar\":\"\\/uploads\\/20210411\\/98403e953a4b62dfe2d78a2ff9951987.jpg\",\"level\":\"1\",\"gender\":\"1\",\"birthday\":\"2021-04-12\",\"bio\":\"这个家伙很懒，什么都没留下\",\"money\":\"0.00\",\"score\":\"0\",\"successions\":\"0\",\"maxsuccessions\":\"0\",\"prevtime\":\"2021-04-12 22:24:56\",\"logintime\":\"2021-04-12 22:24:57\",\"loginip\":\"127.0.0.1\",\"loginfailure\":\"0\",\"joinip\":\"127.0.0.1\",\"jointime\":\"2021-04-12 22:25:15\",\"status\":\"normal\"},\"ids\":\"2\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1618237567),(60,1,'admin','/eKrnmBMykb.php/user/user/edit/ids/2?dialog=1','会员管理 / 会员管理 / 编辑','{\"dialog\":\"1\",\"__token__\":\"***\",\"row\":{\"id\":\"2\",\"group_id\":\"1\",\"username\":\"user\",\"nickname\":\"小吴\",\"password\":\"***\",\"email\":\"999@qq.com\",\"mobile\":\"15358691188\",\"avatar\":\"\\/uploads\\/20210411\\/98403e953a4b62dfe2d78a2ff9951987.jpg\",\"level\":\"1\",\"gender\":\"1\",\"birthday\":\"2021-04-12\",\"bio\":\"这个家伙很懒，什么都没留下\",\"money\":\"0.00\",\"score\":\"0\",\"successions\":\"0\",\"maxsuccessions\":\"0\",\"prevtime\":\"2021-04-12 22:24:56\",\"logintime\":\"2021-04-12 22:24:57\",\"loginip\":\"127.0.0.1\",\"loginfailure\":\"0\",\"joinip\":\"127.0.0.1\",\"jointime\":\"2021-04-12 22:25:15\",\"status\":\"normal\"},\"ids\":\"2\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1618237581),(61,1,'admin','/eKrnmBMykb.php/user/user/add?dialog=1','会员管理 / 会员管理 / 添加','{\"dialog\":\"1\",\"__token__\":\"***\",\"row\":{\"username\":\"person\",\"nickname\":\"个人\",\"password\":\"***\",\"email\":\"123@qq.com\",\"mobile\":\"13801409049\",\"avatar\":\"\\/uploads\\/20210411\\/acfe2a6af3faf001821ef7a02c3b4bcf.jpg\",\"level\":\"0\",\"gender\":\"1\",\"birthday\":\"2021-04-12\",\"bio\":\"南丁格尔的誓言\",\"money\":\"0\",\"score\":\"0\",\"successions\":\"0\",\"maxsuccessions\":\"0\",\"prevtime\":\"2021-04-12 22:44:00\",\"logintime\":\"2021-04-12 22:44:01\",\"loginip\":\"127.0.0.1\",\"loginfailure\":\"0\",\"joinip\":\"1\",\"jointime\":\"2021-04-12 22:44:11\",\"status\":\"normal\"}}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1618238896),(62,1,'admin','/eKrnmBMykb.php/user/user/add?dialog=1','会员管理 / 会员管理 / 添加','{\"dialog\":\"1\",\"__token__\":\"***\",\"row\":{\"username\":\"person\",\"nickname\":\"个人\",\"password\":\"***\",\"email\":\"123@qq.com\",\"mobile\":\"13801409049\",\"avatar\":\"\\/uploads\\/20210411\\/acfe2a6af3faf001821ef7a02c3b4bcf.jpg\",\"level\":\"0\",\"gender\":\"1\",\"birthday\":\"2021-04-12\",\"bio\":\"南丁格尔的誓言\",\"money\":\"0\",\"score\":\"0\",\"successions\":\"0\",\"maxsuccessions\":\"0\",\"prevtime\":\"2021-04-12 22:44:00\",\"logintime\":\"2021-04-12 22:44:01\",\"loginip\":\"127.0.0.1\",\"loginfailure\":\"0\",\"joinip\":\"1\",\"jointime\":\"2021-04-12 22:44:11\",\"status\":\"normal\"}}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1618238982),(63,1,'admin','/eKrnmBMykb.php/user/user/add?dialog=1','会员管理 / 会员管理 / 添加','{\"dialog\":\"1\",\"__token__\":\"***\",\"row\":{\"username\":\"person\",\"nickname\":\"个人\",\"password\":\"***\",\"email\":\"123@qq.com\",\"mobile\":\"13801409049\",\"avatar\":\"\\/uploads\\/20210411\\/acfe2a6af3faf001821ef7a02c3b4bcf.jpg\",\"level\":\"0\",\"gender\":\"1\",\"birthday\":\"2021-04-12\",\"bio\":\"南丁格尔的誓言\",\"money\":\"0\",\"score\":\"0\",\"successions\":\"0\",\"maxsuccessions\":\"0\",\"prevtime\":\"2021-04-12 22:44:00\",\"logintime\":\"2021-04-12 22:44:01\",\"loginip\":\"127.0.0.1\",\"loginfailure\":\"0\",\"joinip\":\"1\",\"jointime\":\"2021-04-12 22:44:11\",\"status\":\"normal\"}}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1618239000),(64,1,'admin','/eKrnmBMykb.php/user/user/add?dialog=1','会员管理 / 会员管理 / 添加','{\"dialog\":\"1\",\"__token__\":\"***\",\"row\":{\"username\":\"person\",\"nickname\":\"个人\",\"password\":\"***\",\"email\":\"123@qq.com\",\"mobile\":\"13801409049\",\"avatar\":\"\\/uploads\\/20210411\\/acfe2a6af3faf001821ef7a02c3b4bcf.jpg\",\"level\":\"0\",\"gender\":\"1\",\"birthday\":\"2021-04-12\",\"bio\":\"南丁格尔的誓言\",\"money\":\"0\",\"score\":\"0\",\"successions\":\"0\",\"maxsuccessions\":\"0\",\"prevtime\":\"2021-04-12 22:44:00\",\"logintime\":\"2021-04-12 22:44:01\",\"loginip\":\"127.0.0.1\",\"loginfailure\":\"0\",\"joinip\":\"1\",\"jointime\":\"2021-04-12 22:44:11\",\"status\":\"normal\"}}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1618239146),(65,1,'admin','/eKrnmBMykb.php/user/user/edit/ids/6?dialog=1','会员管理 / 会员管理 / 编辑','{\"dialog\":\"1\",\"__token__\":\"***\",\"row\":{\"id\":\"6\",\"group_id\":\"1\",\"username\":\"person\",\"nickname\":\"个人\",\"password\":\"***\",\"email\":\"123@qq.com\",\"mobile\":\"13801409049\",\"avatar\":\"\\/assets\\/img\\/avatar.png\",\"level\":\"0\",\"gender\":\"1\",\"birthday\":\"2021-04-12\",\"bio\":\"南丁格尔的誓言\",\"money\":\"0.00\",\"score\":\"0\",\"successions\":\"0\",\"maxsuccessions\":\"0\",\"prevtime\":\"2021-04-12 22:44:01\",\"logintime\":\"2021-04-12 22:52:59\",\"loginip\":\"127.0.0.1\",\"loginfailure\":\"0\",\"joinip\":\"1\",\"jointime\":\"2021-04-12 22:44:11\",\"status\":\"normal\"},\"ids\":\"6\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1618239576),(66,1,'admin','/eKrnmBMykb.php/user/group/edit/ids/1?dialog=1','会员管理 / 会员分组 / 编辑','{\"dialog\":\"1\",\"__token__\":\"***\",\"row\":{\"rules\":\"11,10,9,7,5,4,2,3,1\",\"name\":\"默认组\",\"status\":\"normal\"},\"ids\":\"1\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1618239595),(67,1,'admin','/eKrnmBMykb.php/auth/rule/edit/ids/66?dialog=1','权限管理 / 菜单规则 / 编辑','{\"dialog\":\"1\",\"__token__\":\"***\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"user\",\"title\":\"业主管理\",\"url\":\"\",\"icon\":\"fa fa-list\",\"weigh\":\"0\",\"condition\":\"\",\"menutype\":\"addtabs\",\"extend\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"66\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1618239635),(68,1,'admin','/eKrnmBMykb.php/auth/rule/edit/ids/67?dialog=1','权限管理 / 菜单规则 / 编辑','{\"dialog\":\"1\",\"__token__\":\"***\",\"row\":{\"ismenu\":\"1\",\"pid\":\"66\",\"name\":\"user\\/user\",\"title\":\"业主信息\",\"url\":\"\",\"icon\":\"fa fa-user\",\"weigh\":\"0\",\"condition\":\"\",\"menutype\":\"addtabs\",\"extend\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"67\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1618239649),(69,1,'admin','/eKrnmBMykb.php/auth/rule/edit/ids/73?dialog=1','权限管理 / 菜单规则 / 编辑','{\"dialog\":\"1\",\"__token__\":\"***\",\"row\":{\"ismenu\":\"1\",\"pid\":\"66\",\"name\":\"user\\/group\",\"title\":\"业主分组\",\"url\":\"\",\"icon\":\"fa fa-users\",\"weigh\":\"0\",\"condition\":\"\",\"menutype\":\"addtabs\",\"extend\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"73\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1618239660),(70,1,'admin','/eKrnmBMykb.php/auth/rule/edit/ids/79?dialog=1','权限管理 / 菜单规则 / 编辑','{\"dialog\":\"1\",\"__token__\":\"***\",\"row\":{\"ismenu\":\"1\",\"pid\":\"66\",\"name\":\"user\\/rule\",\"title\":\"业主规则\",\"url\":\"\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"0\",\"condition\":\"\",\"menutype\":\"addtabs\",\"extend\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"79\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1618239670),(71,1,'admin','/eKrnmBMykb.php/user/user/edit/ids/6?dialog=1','业主管理 / 业主信息 / 编辑','{\"dialog\":\"1\",\"__token__\":\"***\",\"row\":{\"id\":\"6\",\"group_id\":\"1\",\"username\":\"person\",\"nickname\":\"个人\",\"password\":\"***\",\"buildingno\":\"五号楼二单元307\",\"parikingno\":\"无\",\"email\":\"123@qq.com\",\"mobile\":\"13801409049\",\"avatar\":\"\\/assets\\/img\\/avatar.png\",\"level\":\"0\",\"gender\":\"1\",\"birthday\":\"2021-04-12\",\"bio\":\"南丁格尔的誓言\",\"money\":\"0.00\",\"score\":\"0\",\"successions\":\"0\",\"maxsuccessions\":\"0\",\"prevtime\":\"2021-04-12 22:44:01\",\"logintime\":\"2021-04-12 22:52:59\",\"loginip\":\"127.0.0.1\",\"loginfailure\":\"0\",\"joinip\":\"1\",\"jointime\":\"2021-04-12 22:44:11\",\"status\":\"normal\"},\"ids\":\"6\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1618241749),(72,1,'admin','/eKrnmBMykb.php/user/user/edit/ids/6?dialog=1','业主管理 / 业主信息 / 编辑','{\"dialog\":\"1\",\"__token__\":\"***\",\"row\":{\"id\":\"6\",\"group_id\":\"1\",\"username\":\"person\",\"nickname\":\"个人\",\"password\":\"***\",\"buildingno\":\"五号楼二单元307\",\"parikingno\":\"无\",\"email\":\"123@qq.com\",\"mobile\":\"13801409049\",\"avatar\":\"\\/assets\\/img\\/avatar.png\",\"level\":\"0\",\"gender\":\"1\",\"birthday\":\"2021-04-12\",\"bio\":\"南丁格尔的誓言\",\"money\":\"0.00\",\"score\":\"0\",\"successions\":\"0\",\"maxsuccessions\":\"0\",\"prevtime\":\"2021-04-12 22:44:01\",\"logintime\":\"2021-04-12 22:52:59\",\"loginip\":\"127.0.0.1\",\"loginfailure\":\"0\",\"joinip\":\"1\",\"jointime\":\"2021-04-12 22:44:11\",\"status\":\"normal\"},\"ids\":\"6\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1618241756),(73,1,'admin','/eKrnmBMykb.php/user/user/edit/ids/1?dialog=1','业主管理 / 业主信息 / 编辑','{\"dialog\":\"1\",\"__token__\":\"***\",\"row\":{\"id\":\"1\",\"group_id\":\"1\",\"username\":\"admin\",\"nickname\":\"admin\",\"password\":\"***\",\"buildingno\":\"五幢二单元306室\",\"parikingno\":\"三区2010\",\"email\":\"admin@163.com\",\"mobile\":\"13888888888\",\"avatar\":\"\\/uploads\\/20210412\\/45b791433ba99f3b36c389c7db184ae8.jpg\",\"level\":\"0\",\"gender\":\"0\",\"birthday\":\"2017-04-08\",\"bio\":\"\",\"money\":\"0.00\",\"score\":\"0\",\"successions\":\"1\",\"maxsuccessions\":\"1\",\"prevtime\":\"2021-04-11 21:07:45\",\"logintime\":\"2021-04-11 22:51:10\",\"loginip\":\"192.168.0.101\",\"loginfailure\":\"0\",\"joinip\":\"127.0.0.1\",\"jointime\":\"2017-04-08 15:03:55\",\"status\":\"normal\"},\"ids\":\"1\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1618241766),(74,1,'admin','/eKrnmBMykb.php/user/user/edit/ids/6?dialog=1','业主管理 / 业主信息 / 编辑','{\"dialog\":\"1\",\"__token__\":\"***\",\"row\":{\"id\":\"6\",\"group_id\":\"1\",\"username\":\"person\",\"nickname\":\"个人\",\"password\":\"***\",\"buildingno\":\"五号楼二单元307\",\"parkingno\":\"无\",\"email\":\"123@qq.com\",\"mobile\":\"13801409049\",\"avatar\":\"\\/assets\\/img\\/avatar.png\",\"level\":\"0\",\"gender\":\"1\",\"birthday\":\"2021-04-12\",\"bio\":\"南丁格尔的誓言\",\"money\":\"0.00\",\"score\":\"0\",\"successions\":\"0\",\"maxsuccessions\":\"0\",\"prevtime\":\"2021-04-12 22:44:01\",\"logintime\":\"2021-04-12 22:52:59\",\"loginip\":\"127.0.0.1\",\"loginfailure\":\"0\",\"joinip\":\"1\",\"jointime\":\"2021-04-12 22:44:11\",\"status\":\"normal\"},\"ids\":\"6\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1618241799),(75,1,'admin','/eKrnmBMykb.php/user/user/edit/ids/2?dialog=1','业主管理 / 业主信息 / 编辑','{\"dialog\":\"1\",\"__token__\":\"***\",\"row\":{\"id\":\"2\",\"group_id\":\"1\",\"username\":\"user\",\"nickname\":\"小吴\",\"password\":\"***\",\"buildingno\":\"\",\"parkingno\":\"\",\"email\":\"999@qq.com\",\"mobile\":\"15358691188\",\"avatar\":\"\\/uploads\\/20210411\\/98403e953a4b62dfe2d78a2ff9951987.jpg\",\"level\":\"1\",\"gender\":\"1\",\"birthday\":\"2021-04-12\",\"bio\":\"这个家伙很懒，什么都没留下12346\",\"money\":\"0.00\",\"score\":\"0\",\"successions\":\"0\",\"maxsuccessions\":\"0\",\"prevtime\":\"2021-04-12 22:24:57\",\"logintime\":\"2021-04-12 22:34:40\",\"loginip\":\"127.0.0.1\",\"loginfailure\":\"0\",\"joinip\":\"127.0.0.1\",\"jointime\":\"2021-04-12 22:25:15\",\"status\":\"normal\"},\"ids\":\"2\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1618241806),(76,1,'admin','/eKrnmBMykb.php/auth/rule/edit/ids/67?dialog=1','权限管理 / 菜单规则 / 编辑','{\"dialog\":\"1\",\"__token__\":\"***\",\"row\":{\"ismenu\":\"1\",\"pid\":\"66\",\"name\":\"user\\/user\",\"title\":\"业主信息\",\"url\":\"\",\"icon\":\"fa fa-user\",\"weigh\":\"0\",\"condition\":\"\",\"menutype\":\"addtabs\",\"extend\":\"\",\"remark\":\"管理业主信息\",\"status\":\"normal\"},\"ids\":\"67\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1618241853),(77,1,'admin','/eKrnmBMykb.php/user/user/del','业主管理 / 业主信息 / 删除','{\"action\":\"del\",\"ids\":\"6,2,1\",\"params\":\"\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1618241905),(78,1,'admin','/eKrnmBMykb.php/user/user/del','业主管理 / 业主信息 / 删除','{\"action\":\"del\",\"ids\":\"6\",\"params\":\"\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1618241909),(79,1,'admin','/eKrnmBMykb.php/user/user/del','业主管理 / 业主信息 / 删除','{\"action\":\"del\",\"ids\":\"2\",\"params\":\"\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1618241912),(80,1,'admin','/eKrnmBMykb.php/ajax/upload','','[]','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1618242013),(81,1,'admin','/eKrnmBMykb.php/user/user/add?dialog=1','业主管理 / 业主信息 / 添加','{\"dialog\":\"1\",\"__token__\":\"***\",\"row\":{\"username\":\"admin\",\"nickname\":\"业主\",\"password\":\"***\",\"buildingno\":\"星雨华府5号楼306室\",\"parikingno\":\"无\",\"email\":\"999@qq.com\",\"mobile\":\"13801409049\",\"avatar\":\"\\/uploads\\/20210412\\/45b791433ba99f3b36c389c7db184ae8.jpg\",\"level\":\"0\",\"gender\":\"1\",\"birthday\":\"2021-04-12\",\"bio\":\"无\",\"money\":\"0\",\"score\":\"0\",\"successions\":\"0\",\"maxsuccessions\":\"0\",\"prevtime\":\"2021-04-12 23:40:31\",\"logintime\":\"0202-04-12 23:40:31\",\"loginip\":\"127\",\"loginfailure\":\"0\",\"joinip\":\"0\",\"jointime\":\"2021-04-12 23:40:42\",\"status\":\"normal\"}}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1618242043),(82,1,'admin','/eKrnmBMykb.php/user/user/add?dialog=1','业主管理 / 业主信息 / 添加','{\"dialog\":\"1\",\"__token__\":\"***\",\"row\":{\"username\":\"admin\",\"nickname\":\"业主\",\"password\":\"***\",\"buildingno\":\"星雨华府5号楼306室\",\"parikingno\":\"无\",\"email\":\"999@qq.com\",\"mobile\":\"13801409049\",\"avatar\":\"\\/uploads\\/20210412\\/45b791433ba99f3b36c389c7db184ae8.jpg\",\"level\":\"0\",\"gender\":\"1\",\"birthday\":\"2021-04-12\",\"bio\":\"无\",\"money\":\"0\",\"score\":\"0\",\"successions\":\"0\",\"maxsuccessions\":\"0\",\"prevtime\":\"2021-04-12 23:40:31\",\"logintime\":\"0202-04-12 23:40:31\",\"loginip\":\"127\",\"loginfailure\":\"0\",\"joinip\":\"0\",\"jointime\":\"2021-04-12 23:40:42\",\"status\":\"normal\"}}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1618242066),(83,1,'admin','/eKrnmBMykb.php/user/user/add?dialog=1','业主管理 / 业主信息 / 添加','{\"dialog\":\"1\",\"__token__\":\"***\",\"row\":{\"username\":\"admin\",\"nickname\":\"业主\",\"password\":\"***\",\"buildingno\":\"星雨华府5号楼306室\",\"parikingno\":\"无\",\"email\":\"999@qq.com\",\"mobile\":\"13801409049\",\"avatar\":\"\\/uploads\\/20210412\\/45b791433ba99f3b36c389c7db184ae8.jpg\",\"level\":\"0\",\"gender\":\"1\",\"birthday\":\"2021-04-12\",\"bio\":\"无\",\"money\":\"0\",\"score\":\"0\",\"successions\":\"0\",\"maxsuccessions\":\"0\",\"prevtime\":\"2021-04-12 23:40:31\",\"logintime\":\"0202-04-12 23:40:31\",\"loginip\":\"127\",\"loginfailure\":\"0\",\"joinip\":\"0\",\"jointime\":\"2021-04-12 23:40:42\",\"status\":\"normal\"}}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1618242105),(84,1,'admin','/eKrnmBMykb.php/user/user/add?dialog=1','业主管理 / 业主信息 / 添加','{\"dialog\":\"1\",\"__token__\":\"***\",\"row\":{\"username\":\"admin\",\"nickname\":\"业主\",\"password\":\"***\",\"buildingno\":\"星雨华府5号楼306室\",\"parikingno\":\"无\",\"email\":\"999@qq.com\",\"mobile\":\"13801409049\",\"avatar\":\"\\/uploads\\/20210412\\/45b791433ba99f3b36c389c7db184ae8.jpg\",\"level\":\"0\",\"gender\":\"1\",\"birthday\":\"2021-04-12\",\"bio\":\"无\",\"money\":\"0\",\"score\":\"0\",\"successions\":\"0\",\"maxsuccessions\":\"0\",\"prevtime\":\"2021-04-12 23:40:31\",\"logintime\":\"0202-04-12 23:40:31\",\"loginip\":\"127\",\"loginfailure\":\"0\",\"joinip\":\"0\",\"jointime\":\"2021-04-12 23:40:42\",\"status\":\"normal\"}}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1618242158),(85,1,'admin','/eKrnmBMykb.php/user/user/add?dialog=1','业主管理 / 业主信息 / 添加','{\"dialog\":\"1\",\"__token__\":\"***\",\"row\":{\"username\":\"admin\",\"nickname\":\"业主\",\"password\":\"***\",\"buildingno\":\"星雨华府5号楼306\",\"parkingno\":\"无\",\"email\":\"99@qq.com\",\"mobile\":\"13801409049\",\"avatar\":\"\\/uploads\\/20210412\\/45b791433ba99f3b36c389c7db184ae8.jpg\",\"level\":\"0\",\"gender\":\"1\",\"birthday\":\"2021-04-12\",\"bio\":\"这家伙太懒，只留下冒着热气的大便\",\"money\":\"0\",\"score\":\"0\",\"successions\":\"0\",\"maxsuccessions\":\"0\",\"prevtime\":\"2021-04-12 23:44:00\",\"logintime\":\"2021-04-12 23:44:01\",\"loginip\":\"0\",\"loginfailure\":\"0\",\"joinip\":\"0\",\"jointime\":\"2021-04-12 23:44:05\",\"status\":\"normal\"}}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1618242247),(86,1,'admin','/eKrnmBMykb.php/user/user/edit/ids/7?dialog=1','业主管理 / 业主信息 / 编辑','{\"dialog\":\"1\",\"__token__\":\"***\",\"row\":{\"id\":\"7\",\"username\":\"admin\",\"nickname\":\"业主\",\"password\":\"***\",\"buildingno\":\"星雨华府5号楼306\",\"parkingno\":\"无\",\"email\":\"99@qq.com\",\"mobile\":\"13801409049\",\"avatar\":\"\\/assets\\/img\\/avatar.png\",\"gender\":\"1\",\"birthday\":\"2021-04-12\",\"bio\":\"这家伙太懒，只留下冒着热气的大便\",\"status\":\"normal\"},\"ids\":\"7\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1618242550),(87,1,'admin','/eKrnmBMykb.php/auth/group/del','权限管理 / 角色组 / 删除','{\"action\":\"del\",\"ids\":\"4\",\"params\":\"\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1618242596),(88,1,'admin','/eKrnmBMykb.php/auth/group/del','权限管理 / 角色组 / 删除','{\"action\":\"del\",\"ids\":\"5\",\"params\":\"\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1618242597),(89,1,'admin','/eKrnmBMykb.php/auth/group/del','权限管理 / 角色组 / 删除','{\"action\":\"del\",\"ids\":\"3\",\"params\":\"\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1618242599),(90,1,'admin','/eKrnmBMykb.php/auth/group/del','权限管理 / 角色组 / 删除','{\"action\":\"del\",\"ids\":\"2\",\"params\":\"\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1618242602),(91,1,'admin','/eKrnmBMykb.php/auth/group/roletree','权限管理 / 角色组','{\"pid\":\"1\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1618242603),(92,1,'admin','/eKrnmBMykb.php/auth/group/add?dialog=1','权限管理 / 角色组 / 添加','{\"dialog\":\"1\",\"__token__\":\"***\",\"row\":{\"rules\":\"1,8,9,10,11,13,14,15,16,17,29,30,31,32,33,34,40,41,42,43,44,45,46,47,48,49,50,67,68,69,70,71,72,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,151,152,153,154,155,156,157,158,159,160,161,162,163,164,2,5,66\",\"pid\":\"1\",\"name\":\"企业管理员\",\"status\":\"normal\"}}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1618242661),(93,1,'admin','/eKrnmBMykb.php/auth/admin/add?dialog=1','权限管理 / 管理员管理 / 添加','{\"dialog\":\"1\",\"__token__\":\"***\",\"group\":[\"6\"],\"row\":{\"username\":\"1001\",\"email\":\"1001@qq.com\",\"nickname\":\"企业管理员\",\"password\":\"***\",\"status\":\"normal\"}}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1618242691),(94,2,'1001','/eKrnmBMykb.php/index/login','登录','{\"__token__\":\"***\",\"username\":\"1001\",\"password\":\"***\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1618242699),(95,2,'1001','/eKrnmBMykb.php/ajax/upload','','[]','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1618242732),(96,2,'1001','/eKrnmBMykb.php/user/user/edit/ids/7?dialog=1','业主管理 / 业主信息 / 编辑','{\"dialog\":\"1\",\"__token__\":\"***\",\"row\":{\"id\":\"7\",\"username\":\"admin\",\"nickname\":\"业主\",\"password\":\"***\",\"buildingno\":\"星雨华府5号楼306\",\"parkingno\":\"无\",\"email\":\"99@qq.com\",\"mobile\":\"13801409049\",\"avatar\":\"\\/uploads\\/20210412\\/45b791433ba99f3b36c389c7db184ae8.jpg\",\"gender\":\"1\",\"birthday\":\"2021-04-12\",\"bio\":\"这家伙太懒，只留下冒着热气的大便\",\"status\":\"normal\"},\"ids\":\"7\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1618242733),(97,2,'1001','/eKrnmBMykb.php/vote/subject/get_template_list','投票管理 / 投票项目管理','{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"subject.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"subject.html\",\"searchField\":[\"name\"],\"type\":\"subject\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1618242771),(98,2,'1001','/eKrnmBMykb.php/vote/subject/get_template_list','投票管理 / 投票项目管理','{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"player.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"player.html\",\"searchField\":[\"name\"],\"type\":\"player\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1618242771),(99,2,'1001','/eKrnmBMykb.php/vote/subject/get_template_list','投票管理 / 投票项目管理','{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"rank.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"rank.html\",\"searchField\":[\"name\"],\"type\":\"rank\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1618242771),(100,2,'1001','/eKrnmBMykb.php/vote/subject/get_template_list','投票管理 / 投票项目管理','{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"apply.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"apply.html\",\"searchField\":[\"name\"],\"type\":\"apply\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1618242771),(101,2,'1001','/eKrnmBMykb.php/index/login','登录','{\"__token__\":\"***\",\"username\":\"1001\",\"password\":\"***\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1618276802),(102,2,'1001','/eKrnmBMykb.php/ajax/upload','','[]','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1618299764),(103,2,'1001','/eKrnmBMykb.php/general.profile/update','常规管理 / 个人资料 / 更新个人信息','{\"__token__\":\"***\",\"row\":{\"avatar\":\"\\/uploads\\/20210413\\/961bed67300fefec24cb5b65b2343cb6.jpg\",\"email\":\"1001@qq.com\",\"nickname\":\"企业管理员\",\"password\":\"***\"}}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1618299768),(104,1,'admin','/eKrnmBMykb.php/index/login','登录','{\"__token__\":\"***\",\"username\":\"admin\",\"password\":\"***\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1618299774),(105,1,'admin','/eKrnmBMykb.php/command/get_field_list','在线命令管理','{\"table\":\"smart_admin\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1618299779),(106,1,'admin','/eKrnmBMykb.php/command/get_field_list','在线命令管理','{\"table\":\"smart_question_type\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1618299785),(107,1,'admin','/eKrnmBMykb.php/command/command/action/command','在线命令管理','{\"commandtype\":\"crud\",\"isrelation\":\"0\",\"local\":\"1\",\"delete\":\"0\",\"force\":\"0\",\"table\":\"smart_question_type\",\"controller\":\"question\\/type\",\"model\":\"\",\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"action\":\"command\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1618299797),(108,1,'admin','/eKrnmBMykb.php/command/command/action/execute','在线命令管理','{\"commandtype\":\"crud\",\"isrelation\":\"0\",\"local\":\"1\",\"delete\":\"0\",\"force\":\"0\",\"table\":\"smart_question_type\",\"controller\":\"question\\/type\",\"model\":\"\",\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"action\":\"execute\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1618299799),(109,1,'admin','/eKrnmBMykb.php/command/get_controller_list','在线命令管理','{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1618299802),(110,1,'admin','/eKrnmBMykb.php/command/get_controller_list','在线命令管理','{\"q_word\":[\"\"],\"pageNumber\":\"2\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1618299805),(111,1,'admin','/eKrnmBMykb.php/command/get_controller_list','在线命令管理','{\"q_word\":[\"\"],\"pageNumber\":\"2\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1618299808),(112,1,'admin','/eKrnmBMykb.php/command/command/action/command','在线命令管理','{\"commandtype\":\"menu\",\"allcontroller\":\"0\",\"delete\":\"0\",\"force\":\"0\",\"controllerfile_text\":\"\",\"controllerfile\":\"question\\/Type.php\",\"action\":\"command\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1618299811),(113,1,'admin','/eKrnmBMykb.php/command/command/action/execute','在线命令管理','{\"commandtype\":\"menu\",\"allcontroller\":\"0\",\"delete\":\"0\",\"force\":\"0\",\"controllerfile_text\":\"\",\"controllerfile\":\"question\\/Type.php\",\"action\":\"execute\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1618299812),(114,1,'admin','/eKrnmBMykb.php/auth/rule/edit/ids/66?dialog=1','权限管理 / 菜单规则 / 编辑','{\"dialog\":\"1\",\"__token__\":\"***\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"user\",\"title\":\"业主管理\",\"url\":\"\",\"icon\":\"fa fa-list\",\"weigh\":\"98\",\"condition\":\"\",\"menutype\":\"addtabs\",\"extend\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"66\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1618299870),(115,1,'admin','/eKrnmBMykb.php/auth/rule/edit/ids/66?dialog=1','权限管理 / 菜单规则 / 编辑','{\"dialog\":\"1\",\"__token__\":\"***\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"user\",\"title\":\"业主管理\",\"url\":\"\",\"icon\":\"fa fa-list\",\"weigh\":\"142\",\"condition\":\"\",\"menutype\":\"addtabs\",\"extend\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"66\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1618299894),(116,1,'admin','/eKrnmBMykb.php/auth/rule/edit/ids/165?dialog=1','权限管理 / 菜单规则 / 编辑','{\"dialog\":\"1\",\"__token__\":\"***\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"question\",\"title\":\"问题反馈\",\"url\":\"\",\"icon\":\"fa fa-list\",\"weigh\":\"141\",\"condition\":\"\",\"menutype\":\"addtabs\",\"extend\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"165\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1618299916),(117,1,'admin','/eKrnmBMykb.php/auth/rule/edit/ids/166?dialog=1','权限管理 / 菜单规则 / 编辑','{\"dialog\":\"1\",\"__token__\":\"***\",\"row\":{\"ismenu\":\"1\",\"pid\":\"165\",\"name\":\"question\\/type\",\"title\":\"问题分类\",\"url\":\"\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"0\",\"condition\":\"\",\"menutype\":\"addtabs\",\"extend\":\"\",\"remark\":\"设置反馈问题的类别，方便后台分类处理和统计\",\"status\":\"normal\"},\"ids\":\"166\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1618299959),(118,1,'admin','/eKrnmBMykb.php/auth/rule/edit/ids/166?dialog=1','权限管理 / 菜单规则 / 编辑','{\"dialog\":\"1\",\"__token__\":\"***\",\"row\":{\"ismenu\":\"1\",\"pid\":\"165\",\"name\":\"question\\/type\",\"title\":\"问题分类\",\"url\":\"\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"0\",\"condition\":\"\",\"menutype\":\"addtabs\",\"extend\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"166\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1618299961),(119,1,'admin','/eKrnmBMykb.php/auth/rule/edit/ids/166?dialog=1','权限管理 / 菜单规则 / 编辑','{\"dialog\":\"1\",\"__token__\":\"***\",\"row\":{\"ismenu\":\"1\",\"pid\":\"165\",\"name\":\"question\\/type\",\"title\":\"问题分类\",\"url\":\"\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"0\",\"condition\":\"\",\"menutype\":\"addtabs\",\"extend\":\"\",\"remark\":\"设置反馈问题的类别，方便后台分类处理和统计\",\"status\":\"normal\"},\"ids\":\"166\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1618299981),(120,1,'admin','/eKrnmBMykb.php/question/type/add?dialog=1','问题反馈 / 问题分类 / 添加','{\"dialog\":\"1\",\"row\":{\"question_type\":\"物业类\"}}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1618300134),(121,1,'admin','/eKrnmBMykb.php/question/type/add?dialog=1','问题反馈 / 问题分类 / 添加','{\"dialog\":\"1\",\"row\":{\"question_type\":\"民生类\"}}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1618300139),(122,1,'admin','/eKrnmBMykb.php/question/type/add?dialog=1','问题反馈 / 问题分类 / 添加','{\"dialog\":\"1\",\"row\":{\"question_type\":\"邻里类\"}}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1618300146),(123,1,'admin','/eKrnmBMykb.php/question/type/add?dialog=1','问题反馈 / 问题分类 / 添加','{\"dialog\":\"1\",\"row\":{\"question_type\":\"收费类\"}}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1618300154),(124,1,'admin','/eKrnmBMykb.php/ajax/upload','','[]','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1618301273),(125,1,'admin','/eKrnmBMykb.php/general.profile/update','常规管理 / 个人资料 / 更新个人信息','{\"__token__\":\"***\",\"row\":{\"avatar\":\"\\/uploads\\/20210413\\/489af80e5c10bebbe303f58cf14f5529.jpg\",\"email\":\"admin@admin.com\",\"nickname\":\"Admin\",\"password\":\"***\"}}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1618301274),(126,1,'admin','/eKrnmBMykb.php/command/get_field_list','在线命令管理','{\"table\":\"smart_admin\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1618301278),(127,1,'admin','/eKrnmBMykb.php/command/get_field_list','在线命令管理','{\"table\":\"smart_question_info\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1618301282),(128,1,'admin','/eKrnmBMykb.php/command/command/action/command','在线命令管理','{\"commandtype\":\"crud\",\"isrelation\":\"0\",\"local\":\"1\",\"delete\":\"0\",\"force\":\"0\",\"table\":\"smart_question_info\",\"controller\":\"\",\"model\":\"\",\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"question_type\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"question_content\",\"headingfilterfield\":\"question_status\",\"action\":\"command\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1618301334),(129,1,'admin','/eKrnmBMykb.php/command/command/action/command','在线命令管理','{\"commandtype\":\"crud\",\"isrelation\":\"0\",\"local\":\"1\",\"delete\":\"0\",\"force\":\"0\",\"table\":\"smart_question_info\",\"controller\":\"question\\/questioninfo\",\"model\":\"\",\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"question_type\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"question_content\",\"headingfilterfield\":\"question_status\",\"action\":\"command\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1618301349),(130,1,'admin','/eKrnmBMykb.php/command/command/action/execute','在线命令管理','{\"commandtype\":\"crud\",\"isrelation\":\"0\",\"local\":\"1\",\"delete\":\"0\",\"force\":\"0\",\"table\":\"smart_question_info\",\"controller\":\"question\\/questioninfo\",\"model\":\"\",\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"question_type\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"question_content\",\"headingfilterfield\":\"question_status\",\"action\":\"execute\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1618301351),(131,1,'admin','/eKrnmBMykb.php/command/get_controller_list','在线命令管理','{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1618301367),(132,1,'admin','/eKrnmBMykb.php/command/get_controller_list','在线命令管理','{\"q_word\":[\"\"],\"pageNumber\":\"2\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1618301369),(133,1,'admin','/eKrnmBMykb.php/command/get_controller_list','在线命令管理','{\"q_word\":[\"\"],\"pageNumber\":\"2\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1618301372),(134,1,'admin','/eKrnmBMykb.php/command/command/action/command','在线命令管理','{\"commandtype\":\"menu\",\"allcontroller\":\"0\",\"delete\":\"0\",\"force\":\"0\",\"controllerfile_text\":\"\",\"controllerfile\":\"question\\/Questioninfo.php\",\"action\":\"command\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1618301374),(135,1,'admin','/eKrnmBMykb.php/command/command/action/execute','在线命令管理','{\"commandtype\":\"menu\",\"allcontroller\":\"0\",\"delete\":\"0\",\"force\":\"0\",\"controllerfile_text\":\"\",\"controllerfile\":\"question\\/Questioninfo.php\",\"action\":\"execute\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1618301376),(136,1,'admin','/eKrnmBMykb.php/ajax/upload','','[]','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1618301400),(137,1,'admin','/eKrnmBMykb.php/ajax/upload','','[]','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1618301404),(138,1,'admin','/eKrnmBMykb.php/auth/rule/edit/ids/92?dialog=1','权限管理 / 菜单规则 / 编辑','{\"dialog\":\"1\",\"__token__\":\"***\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"vote\",\"title\":\"投票管理\",\"url\":\"\",\"icon\":\"fa fa-bar-chart\",\"weigh\":\"140\",\"condition\":\"\",\"menutype\":\"addtabs\",\"extend\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"92\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1618302087),(139,1,'admin','/eKrnmBMykb.php/auth/rule/edit/ids/134?dialog=1','权限管理 / 菜单规则 / 编辑','{\"dialog\":\"1\",\"__token__\":\"***\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"wechat\",\"title\":\"微信管理\",\"url\":\"\",\"icon\":\"fa fa-wechat\",\"weigh\":\"139\",\"condition\":\"\",\"menutype\":\"addtabs\",\"extend\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"134\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1618302104),(140,1,'admin','/eKrnmBMykb.php/auth/group/roletree','权限管理 / 角色组','{\"id\":\"6\",\"pid\":\"1\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1618302150),(141,1,'admin','/eKrnmBMykb.php/auth/group/edit/ids/6?dialog=1','权限管理 / 角色组 / 编辑','{\"dialog\":\"1\",\"__token__\":\"***\",\"row\":{\"rules\":\"1,8,9,10,11,13,14,15,16,17,29,30,31,32,33,34,40,41,42,43,44,45,46,47,48,49,50,67,68,69,70,71,72,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,151,152,153,154,155,156,157,158,159,160,161,162,163,164,166,167,168,169,170,171,172,175,177,2,5,66,165,173\",\"pid\":\"1\",\"name\":\"企业管理员\",\"status\":\"normal\"},\"ids\":\"6\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1618302197),(142,2,'1001','/eKrnmBMykb.php/index/login','登录','{\"__token__\":\"***\",\"username\":\"1001\",\"password\":\"***\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1618302231),(143,1,'admin','/eKrnmBMykb.php/index/login','登录','{\"__token__\":\"***\",\"username\":\"admin\",\"password\":\"***\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1618302450),(144,1,'admin','/eKrnmBMykb.php/command/get_field_list','在线命令管理','{\"table\":\"smart_admin\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1618302455),(145,1,'admin','/eKrnmBMykb.php/addon/install','插件管理','{\"name\":\"loginbgindex\",\"force\":\"0\",\"uid\":\"25581\",\"token\":\"***\",\"version\":\"1.0.0\",\"faversion\":\"1.2.0.20210401_beta\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1618302730),(146,2,'1001','/eKrnmBMykb.php/index/login','登录','{\"__token__\":\"***\",\"username\":\"1001\",\"password\":\"***\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1618323222),(147,2,'1001','/eKrnmBMykb.php/vote/subject/get_template_list','投票管理 / 投票项目管理','{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"subject.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"subject.html\",\"searchField\":[\"name\"],\"type\":\"subject\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1618323327),(148,2,'1001','/eKrnmBMykb.php/vote/subject/get_template_list','投票管理 / 投票项目管理','{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"player.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"player.html\",\"searchField\":[\"name\"],\"type\":\"player\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1618323327),(149,2,'1001','/eKrnmBMykb.php/vote/subject/get_template_list','投票管理 / 投票项目管理','{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"rank.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"rank.html\",\"searchField\":[\"name\"],\"type\":\"rank\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1618323327),(150,2,'1001','/eKrnmBMykb.php/vote/subject/get_template_list','投票管理 / 投票项目管理','{\"searchTable\":\"tbl\",\"searchKey\":\"name\",\"searchValue\":\"apply.html\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"name\",\"keyValue\":\"apply.html\",\"searchField\":[\"name\"],\"type\":\"apply\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1618323327),(151,2,'1001','/eKrnmBMykb.php/vote/subject/check_element_available','投票管理 / 投票项目管理','{\"id\":\"2\",\"name\":\"row[diyname]\",\"value\":\"最美物业人评选\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1618323335),(152,2,'1001','/eKrnmBMykb.php/vote/subject/edit/ids/2?dialog=1','投票管理 / 投票项目管理 / 编辑','{\"dialog\":\"1\",\"row\":{\"title\":\"最美物业服务人员评选活动\",\"user_id\":\"0\",\"image\":\"\\/uploads\\/20210411\\/98403e953a4b62dfe2d78a2ff9951987.jpg\",\"keywords\":\"最美物业评选\",\"description\":\"最美物业服务人员评选活动\",\"intro\":\"2021年度沤鸿物业服务人员综合评选活动，请业主参与，评选出您身边最美物业人。\",\"content\":\"2021年度沤鸿物业服务人员综合评选活动，请业主参与，评选出您身边最美物业人。\",\"banner\":\"\\/uploads\\/20210411\\/ac8d5e112adfdebfa1a20f7c1978ede3.jpg\",\"maxvoteplayers\":\"10\",\"pervoteplayers\":\"2\",\"maxvotenums\":\"0\",\"pervotenums\":\"5\",\"maxvotelimit\":\"0\",\"pervotelimit\":\"0\",\"maxcatevotenums\":\"0\",\"percatevotenums\":\"0\",\"maxcatevoteplayers\":\"0\",\"pagesize\":\"0\",\"limitarea\":\"\",\"needlogin\":\"0\",\"onlywechat\":\"0\",\"diyname\":\"最美物业人评选\",\"playername\":\"选手\",\"subjecttpl\":\"subject.html\",\"playertpl\":\"player.html\",\"ranktpl\":\"rank.html\",\"applytpl\":\"apply.html\",\"isapply\":\"0\",\"iscomment\":\"1\",\"begintime\":\"2021-04-11 22:20:12\",\"endtime\":\"2021-05-31 22:20:12\",\"memo\":\"\",\"status\":\"normal\"},\"ids\":\"2\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1618323335),(153,2,'1001','/eKrnmBMykb.php/vote/comment/edit/ids/3?dialog=1','投票管理 / 投票评论管理 / 编辑','{\"dialog\":\"1\",\"row\":{\"subject_id\":\"2\",\"player_id\":\"3\",\"user_id\":\"7\",\"nickname\":\"\",\"content\":\"123456\",\"ip\":\"127.0.0.1\",\"status\":\"normal\"},\"ids\":\"3\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1618323381),(154,1,'admin','/eKrnmBMykb.php/index/login','登录','{\"__token__\":\"***\",\"username\":\"admin\",\"password\":\"***\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1618324503),(155,1,'admin','/eKrnmBMykb.php/ajax/upload','','[]','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1618324685),(156,1,'admin','/eKrnmBMykb.php/question/questioninfo/add?dialog=1','问题反馈 / 反馈问题 / 添加','{\"dialog\":\"1\",\"row\":{\"question_title\":\"安全通道内杂特问题的反映\",\"question_content\":\"五号楼应急通道内，多个楼层堆放各种杂物，严重影响消防安全\",\"question_user_id\":\"admin\",\"question_user_tel\":\"12345678901\",\"question_type\":\"物业类\",\"question_datetime\":\"2021-04-13 22:37:31\",\"question_files\":\"\\/uploads\\/20210413\\/ffbdabe1c2b351d6cdc0da2fe8b6d71b.jpg\",\"question_operaotr\":\"\",\"question_operate_option\":\"\",\"question_status\":\"0\"}}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1618324690),(157,1,'admin','/eKrnmBMykb.php/question/questioninfo/add?dialog=1','问题反馈 / 反馈问题 / 添加','{\"dialog\":\"1\",\"row\":{\"question_title\":\"安全通道内杂特问题的反映\",\"question_content\":\"五号楼应急通道内，多个楼层堆放各种杂物，严重影响消防安全\",\"question_user_id\":\"admin\",\"question_user_tel\":\"12345678901\",\"question_type\":\"物业类\",\"question_datetime\":\"2021-04-13 22:37:31\",\"question_files\":\"\\/uploads\\/20210413\\/ffbdabe1c2b351d6cdc0da2fe8b6d71b.jpg\",\"question_operaotr\":\"\",\"question_operate_option\":\"\",\"question_status\":\"0\"}}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1618324712),(158,1,'admin','/eKrnmBMykb.php/question/questioninfo/add?dialog=1','问题反馈 / 反馈问题 / 添加','{\"dialog\":\"1\",\"row\":{\"question_title\":\"安全通道内杂特问题的反映\",\"question_content\":\"五号楼应急通道内，多个楼层堆放各种杂物，严重影响消防安全\",\"question_user_id\":\"1\",\"question_user_tel\":\"12345678901\",\"question_type\":\"物业类\",\"question_datetime\":\"2021-04-13 22:37:31\",\"question_files\":\"\\/uploads\\/20210413\\/ffbdabe1c2b351d6cdc0da2fe8b6d71b.jpg\",\"question_operaotr\":\"\",\"question_operate_option\":\"\",\"question_status\":\"0\"}}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1618324726),(159,1,'admin','/eKrnmBMykb.php/index/login','登录','{\"__token__\":\"***\",\"username\":\"admin\",\"password\":\"***\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1618409823),(160,1,'admin','/eKrnmBMykb.php/index/login','登录','{\"__token__\":\"***\",\"username\":\"admin\",\"password\":\"***\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1618502085),(161,1,'admin','/eKrnmBMykb.php/index/login','登录','{\"__token__\":\"***\",\"username\":\"admin\",\"password\":\"***\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1618531156),(162,1,'admin','/eKrnmBMykb.php/vote/subject/del','投票管理 / 投票项目管理 / 删除','{\"action\":\"del\",\"ids\":\"5\",\"params\":\"\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1618531190),(163,1,'admin','/eKrnmBMykb.php/vote/subject/del','投票管理 / 投票项目管理 / 删除','{\"action\":\"del\",\"ids\":\"4\",\"params\":\"\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1618531192),(164,1,'admin','/eKrnmBMykb.php/vote/subject/del','投票管理 / 投票项目管理 / 删除','{\"action\":\"del\",\"ids\":\"3\",\"params\":\"\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1618531195),(165,1,'admin','/eKrnmBMykb.php/question/questioninfo/edit/ids/20?dialog=1','问题反馈 / 反馈问题 / 编辑','{\"dialog\":\"1\",\"row\":{\"question_title\":\"status\",\"question_content\":\"status\",\"question_user_id\":\"7\",\"question_user_tel\":\"143456\",\"question_type\":\"民生类\",\"question_datetime\":\"2021-04-16 08:09:43\",\"question_files\":\"\\/uploads\\/20210416\\/961bed67300fefec24cb5b65b2343cb6.jpg\",\"question_operaotr\":\"\",\"question_operate_option\":\"\",\"question_status\":\"0\"},\"ids\":\"20\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1618531979),(166,1,'admin','/eKrnmBMykb.php/index/login','登录','{\"__token__\":\"***\",\"username\":\"admin\",\"password\":\"***\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1618582082),(167,1,'admin','/eKrnmBMykb.php/question/questioninfo/edit/ids/26?dialog=1','问题反馈 / 反馈问题 / 编辑','{\"dialog\":\"1\",\"row\":{\"question_title\":\"1112\",\"question_content\":\"23232\",\"question_user_id\":\"7\",\"question_user_tel\":\"\",\"question_type\":\"收费类\",\"question_datetime\":\"2021-04-16 21:51:18\",\"question_files\":\"\",\"question_operaotr\":\"\",\"question_operate_option\":\"\",\"question_status\":\"1\"},\"ids\":\"26\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1618582100),(168,1,'admin','/eKrnmBMykb.php/question/questioninfo/edit/ids/28?dialog=1','问题反馈 / 反馈问题 / 编辑','{\"dialog\":\"1\",\"row\":{\"question_title\":\"最后一次测试\",\"question_content\":\"测试了各个输入框在提交时是否可用\",\"question_user_id\":\"7\",\"question_user_tel\":\"15358691188\",\"question_type\":\"民生类\",\"question_datetime\":\"2021-04-16 23:51:17\",\"question_files\":\"\\/uploads\\/20210416\\/961bed67300fefec24cb5b65b2343cb6.jpg\",\"question_operaotr\":\"李得\",\"question_operate_option\":\"已经处理完成\",\"question_status\":\"3\"},\"ids\":\"28\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1618588404),(169,1,'admin','/eKrnmBMykb.php/question/questioninfo/edit/ids/28?dialog=1','问题反馈 / 反馈问题 / 编辑','{\"dialog\":\"1\",\"row\":{\"question_title\":\"最后一次测试\",\"question_content\":\"测试了各个输入框在提交时是否可用\",\"question_user_id\":\"7\",\"question_user_tel\":\"15358691188\",\"question_type\":\"民生类\",\"question_datetime\":\"2021-04-16 23:51:17\",\"question_files\":\"\\/uploads\\/20210416\\/961bed67300fefec24cb5b65b2343cb6.jpg\",\"question_operaotr\":\"李得\",\"question_operate_option\":\"已经处理完成\",\"question_status\":\"3\"},\"ids\":\"28\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1618588472),(170,1,'admin','/eKrnmBMykb.php/index/login','登录','{\"__token__\":\"***\",\"username\":\"admin\",\"password\":\"***\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1618593262),(171,2,'1001','/eKrnmBMykb.php/index/login','登录','{\"__token__\":\"***\",\"username\":\"1001\",\"password\":\"***\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1618593529),(172,2,'1001','/eKrnmBMykb.php/index/login','登录','{\"__token__\":\"***\",\"username\":\"1001\",\"password\":\"***\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1621005975),(173,2,'1001','/eKrnmBMykb.php/index/login','登录','{\"__token__\":\"***\",\"username\":\"1001\",\"password\":\"***\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1621258406),(174,2,'1001','/eKrnmBMykb.php/index/login','登录','{\"__token__\":\"***\",\"username\":\"1001\",\"password\":\"***\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1621782065),(175,1,'admin','/eKrnmBMykb.php/index/login','登录','{\"__token__\":\"***\",\"username\":\"admin\",\"password\":\"***\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1621945071),(176,1,'admin','/eKrnmBMykb.php/command/get_field_list','在线命令管理','{\"table\":\"smart_IO_info\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1621949685),(177,1,'admin','/eKrnmBMykb.php/command/command/action/command','在线命令管理','{\"commandtype\":\"crud\",\"isrelation\":\"0\",\"local\":\"1\",\"delete\":\"0\",\"force\":\"1\",\"table\":\"smart_IO_info\",\"controller\":\"IO\\/IOinfo\",\"model\":\"\",\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"action\":\"command\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1621949707),(178,1,'admin','/eKrnmBMykb.php/command/command/action/execute','在线命令管理','{\"commandtype\":\"crud\",\"isrelation\":\"0\",\"local\":\"1\",\"delete\":\"0\",\"force\":\"1\",\"table\":\"smart_IO_info\",\"controller\":\"IO\\/IOinfo\",\"model\":\"\",\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"action\":\"execute\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1621949709),(179,1,'admin','/eKrnmBMykb.php/command/get_controller_list','在线命令管理','{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1621949712),(180,1,'admin','/eKrnmBMykb.php/command/get_controller_list','在线命令管理','{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1621949714),(181,1,'admin','/eKrnmBMykb.php/command/command/action/command','在线命令管理','{\"commandtype\":\"menu\",\"allcontroller\":\"0\",\"delete\":\"0\",\"force\":\"1\",\"controllerfile_text\":\"\",\"controllerfile\":\"IO\\/IOinfo.php\",\"action\":\"command\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1621949717),(182,1,'admin','/eKrnmBMykb.php/command/command/action/execute','在线命令管理','{\"commandtype\":\"menu\",\"allcontroller\":\"0\",\"delete\":\"0\",\"force\":\"1\",\"controllerfile_text\":\"\",\"controllerfile\":\"IO\\/IOinfo.php\",\"action\":\"execute\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1621949718),(183,1,'admin','/eKrnmBMykb.php/command/command/action/command','在线命令管理','{\"commandtype\":\"crud\",\"isrelation\":\"0\",\"local\":\"1\",\"delete\":\"0\",\"force\":\"1\",\"table\":\"smart_IO_info\",\"controller\":\"IO\\/IOinfo\",\"model\":\"\",\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"action\":\"command\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1621949749),(184,1,'admin','/eKrnmBMykb.php/command/command/action/execute','在线命令管理','{\"commandtype\":\"crud\",\"isrelation\":\"0\",\"local\":\"1\",\"delete\":\"0\",\"force\":\"1\",\"table\":\"smart_IO_info\",\"controller\":\"IO\\/IOinfo\",\"model\":\"\",\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"action\":\"execute\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1621949750),(185,1,'admin','/eKrnmBMykb.php/command/command/action/command','在线命令管理','{\"commandtype\":\"menu\",\"allcontroller\":\"0\",\"delete\":\"0\",\"force\":\"1\",\"controllerfile_text\":\"\",\"controllerfile\":\"IO\\/IOinfo.php\",\"action\":\"command\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1621949760),(186,1,'admin','/eKrnmBMykb.php/command/command/action/execute','在线命令管理','{\"commandtype\":\"menu\",\"allcontroller\":\"0\",\"delete\":\"0\",\"force\":\"1\",\"controllerfile_text\":\"\",\"controllerfile\":\"IO\\/IOinfo.php\",\"action\":\"execute\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1621949761),(187,1,'admin','/eKrnmBMykb.php/command/get_field_list','在线命令管理','{\"table\":\"smart_admin\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1621949961),(188,1,'admin','/eKrnmBMykb.php/command/get_field_list','在线命令管理','{\"table\":\"smart_door_info\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1621949977),(189,1,'admin','/eKrnmBMykb.php/command/command/action/command','在线命令管理','{\"commandtype\":\"crud\",\"isrelation\":\"0\",\"local\":\"1\",\"delete\":\"1\",\"force\":\"1\",\"table\":\"smart_door_info\",\"controller\":\"door\\/doorinfo\",\"model\":\"\",\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"action\":\"command\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1621949989),(190,1,'admin','/eKrnmBMykb.php/command/command/action/execute','在线命令管理','{\"commandtype\":\"crud\",\"isrelation\":\"0\",\"local\":\"1\",\"delete\":\"1\",\"force\":\"1\",\"table\":\"smart_door_info\",\"controller\":\"door\\/doorinfo\",\"model\":\"\",\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"action\":\"execute\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1621949990),(191,1,'admin','/eKrnmBMykb.php/command/get_controller_list','在线命令管理','{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1621949994),(192,1,'admin','/eKrnmBMykb.php/command/get_controller_list','在线命令管理','{\"q_word\":[\"\"],\"pageNumber\":\"2\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1621949997),(193,1,'admin','/eKrnmBMykb.php/command/get_controller_list','在线命令管理','{\"q_word\":[\"\"],\"pageNumber\":\"3\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1621949999),(194,1,'admin','/eKrnmBMykb.php/command/get_controller_list','在线命令管理','{\"q_word\":[\"\"],\"pageNumber\":\"4\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1621950001),(195,1,'admin','/eKrnmBMykb.php/command/get_controller_list','在线命令管理','{\"q_word\":[\"\"],\"pageNumber\":\"3\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1621950003),(196,1,'admin','/eKrnmBMykb.php/command/get_controller_list','在线命令管理','{\"q_word\":[\"\"],\"pageNumber\":\"2\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1621950006),(197,1,'admin','/eKrnmBMykb.php/command/get_controller_list','在线命令管理','{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1621950012),(198,1,'admin','/eKrnmBMykb.php/command/get_controller_list','在线命令管理','{\"q_word\":[\"\"],\"pageNumber\":\"2\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1621950025),(199,1,'admin','/eKrnmBMykb.php/command/get_controller_list','在线命令管理','{\"q_word\":[\"\"],\"pageNumber\":\"3\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1621950030),(200,1,'admin','/eKrnmBMykb.php/command/get_controller_list','在线命令管理','{\"q_word\":[\"\"],\"pageNumber\":\"4\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1621950035),(201,1,'admin','/eKrnmBMykb.php/command/command/action/execute','在线命令管理','{\"commandtype\":\"crud\",\"isrelation\":\"0\",\"local\":\"1\",\"delete\":\"0\",\"force\":\"1\",\"table\":\"smart_door_info\",\"controller\":\"door\\/doorinfo\",\"model\":\"\",\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"action\":\"execute\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1621950082),(202,1,'admin','/eKrnmBMykb.php/command/command/action/command','在线命令管理','{\"commandtype\":\"crud\",\"isrelation\":\"0\",\"local\":\"1\",\"delete\":\"1\",\"force\":\"1\",\"table\":\"smart_door_info\",\"controller\":\"door\\/doorinfo\",\"model\":\"\",\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"action\":\"command\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1621950091),(203,1,'admin','/eKrnmBMykb.php/command/command/action/command','在线命令管理','{\"commandtype\":\"crud\",\"isrelation\":\"0\",\"local\":\"1\",\"delete\":\"1\",\"force\":\"1\",\"table\":\"smart_door_info\",\"controller\":\"door\\/doorinfo\",\"model\":\"\",\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"action\":\"command\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1621950100),(204,1,'admin','/eKrnmBMykb.php/command/command/action/execute','在线命令管理','{\"commandtype\":\"crud\",\"isrelation\":\"0\",\"local\":\"1\",\"delete\":\"1\",\"force\":\"1\",\"table\":\"smart_door_info\",\"controller\":\"door\\/doorinfo\",\"model\":\"\",\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"action\":\"execute\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1621950114),(205,1,'admin','/eKrnmBMykb.php/command/command/action/execute','在线命令管理','{\"commandtype\":\"crud\",\"isrelation\":\"0\",\"local\":\"1\",\"delete\":\"1\",\"force\":\"1\",\"table\":\"smart_door_info\",\"controller\":\"door\\/doorinfo\",\"model\":\"\",\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"action\":\"execute\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1621950130),(206,1,'admin','/eKrnmBMykb.php/command/command/action/command','在线命令管理','{\"commandtype\":\"crud\",\"isrelation\":\"0\",\"local\":\"1\",\"delete\":\"1\",\"force\":\"1\",\"table\":\"smart_door_info\",\"controller\":\"io\\/ioinfo\",\"model\":\"\",\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"action\":\"command\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1621950153),(207,1,'admin','/eKrnmBMykb.php/command/command/action/execute','在线命令管理','{\"commandtype\":\"crud\",\"isrelation\":\"0\",\"local\":\"1\",\"delete\":\"1\",\"force\":\"1\",\"table\":\"smart_door_info\",\"controller\":\"io\\/ioinfo\",\"model\":\"\",\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"action\":\"execute\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1621950155),(208,1,'admin','/eKrnmBMykb.php/command/command/action/command','在线命令管理','{\"commandtype\":\"crud\",\"isrelation\":\"0\",\"local\":\"1\",\"delete\":\"0\",\"force\":\"1\",\"table\":\"smart_door_info\",\"controller\":\"door\\/doorinfo\",\"model\":\"\",\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"action\":\"command\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1621950176),(209,1,'admin','/eKrnmBMykb.php/command/command/action/command','在线命令管理','{\"commandtype\":\"crud\",\"isrelation\":\"0\",\"local\":\"1\",\"delete\":\"0\",\"force\":\"1\",\"table\":\"smart_door_info\",\"controller\":\"door\\/doorinfo\",\"model\":\"\",\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"action\":\"command\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1621950178),(210,1,'admin','/eKrnmBMykb.php/command/command/action/execute','在线命令管理','{\"commandtype\":\"crud\",\"isrelation\":\"0\",\"local\":\"1\",\"delete\":\"0\",\"force\":\"1\",\"table\":\"smart_door_info\",\"controller\":\"door\\/doorinfo\",\"model\":\"\",\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"action\":\"execute\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1621950179),(211,1,'admin','/eKrnmBMykb.php/command/get_controller_list','在线命令管理','{\"q_word\":[\"\"],\"pageNumber\":\"4\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1621950182),(212,1,'admin','/eKrnmBMykb.php/command/get_controller_list','在线命令管理','{\"q_word\":[\"\"],\"pageNumber\":\"3\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1621950184),(213,1,'admin','/eKrnmBMykb.php/command/get_controller_list','在线命令管理','{\"q_word\":[\"\"],\"pageNumber\":\"2\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1621950186),(214,1,'admin','/eKrnmBMykb.php/command/get_controller_list','在线命令管理','{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1621950188),(215,1,'admin','/eKrnmBMykb.php/command/get_controller_list','在线命令管理','{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1621950190),(216,1,'admin','/eKrnmBMykb.php/command/command/action/command','在线命令管理','{\"commandtype\":\"menu\",\"allcontroller\":\"0\",\"delete\":\"1\",\"force\":\"1\",\"controllerfile_text\":\"\",\"controllerfile\":\"IO\\/IOinfo.php\",\"action\":\"command\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1621950193),(217,1,'admin','/eKrnmBMykb.php/command/command/action/execute','在线命令管理','{\"commandtype\":\"menu\",\"allcontroller\":\"0\",\"delete\":\"1\",\"force\":\"1\",\"controllerfile_text\":\"\",\"controllerfile\":\"IO\\/IOinfo.php\",\"action\":\"execute\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1621950195),(218,1,'admin','/eKrnmBMykb.php/command/get_controller_list','在线命令管理','{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1621950202),(219,1,'admin','/eKrnmBMykb.php/command/get_controller_list','在线命令管理','{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1621950203),(220,1,'admin','/eKrnmBMykb.php/command/get_controller_list','在线命令管理','{\"q_word\":[\"\"],\"pageNumber\":\"2\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1621950207),(221,1,'admin','/eKrnmBMykb.php/command/get_controller_list','在线命令管理','{\"q_word\":[\"\"],\"pageNumber\":\"3\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1621950209),(222,1,'admin','/eKrnmBMykb.php/command/get_controller_list','在线命令管理','{\"q_word\":[\"\"],\"pageNumber\":\"4\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1621950211),(223,1,'admin','/eKrnmBMykb.php/command/get_controller_list','在线命令管理','{\"q_word\":[\"\"],\"pageNumber\":\"3\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1621950213),(224,1,'admin','/eKrnmBMykb.php/command/get_controller_list','在线命令管理','{\"q_word\":[\"\"],\"pageNumber\":\"2\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1621950216),(225,1,'admin','/eKrnmBMykb.php/command/get_controller_list','在线命令管理','{\"q_word\":[\"\"],\"pageNumber\":\"2\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1621950219),(226,1,'admin','/eKrnmBMykb.php/command/command/action/command','在线命令管理','{\"commandtype\":\"menu\",\"allcontroller\":\"0\",\"delete\":\"0\",\"force\":\"1\",\"controllerfile_text\":\"\",\"controllerfile\":\"door\\/Doorinfo.php\",\"action\":\"command\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1621950221),(227,1,'admin','/eKrnmBMykb.php/command/command/action/execute','在线命令管理','{\"commandtype\":\"menu\",\"allcontroller\":\"0\",\"delete\":\"0\",\"force\":\"1\",\"controllerfile_text\":\"\",\"controllerfile\":\"door\\/Doorinfo.php\",\"action\":\"execute\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1621950223),(228,1,'admin','/eKrnmBMykb.php/auth/rule/del','权限管理 / 菜单规则 / 删除','{\"action\":\"del\",\"ids\":\"181\",\"params\":\"\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1621950244),(229,1,'admin','/eKrnmBMykb.php/auth/rule/del','权限管理 / 菜单规则 / 删除','{\"action\":\"del\",\"ids\":\"180\",\"params\":\"\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1621950248),(230,1,'admin','/eKrnmBMykb.php/auth/rule/edit/ids/188?dialog=1','权限管理 / 菜单规则 / 编辑','{\"dialog\":\"1\",\"__token__\":\"***\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"door\",\"title\":\"门禁管理\",\"url\":\"\",\"icon\":\"fa fa-list\",\"weigh\":\"138\",\"condition\":\"\",\"menutype\":\"addtabs\",\"extend\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"188\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1621950285),(231,1,'admin','/eKrnmBMykb.php/auth/rule/edit/ids/93?dialog=1','权限管理 / 菜单规则 / 编辑','{\"dialog\":\"1\",\"__token__\":\"***\",\"row\":{\"ismenu\":\"1\",\"pid\":\"92\",\"name\":\"vote\\/subject\",\"title\":\"投票项目管理\",\"url\":\"\",\"icon\":\"fa fa-list\",\"weigh\":\"0\",\"condition\":\"\",\"menutype\":\"addtabs\",\"extend\":\"\",\"remark\":\"新建投票项目，或对原有投票项目进行管理\",\"status\":\"normal\"},\"ids\":\"93\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1621950398),(232,1,'admin','/eKrnmBMykb.php/auth/rule/edit/ids/173?dialog=1','权限管理 / 菜单规则 / 编辑','{\"dialog\":\"1\",\"__token__\":\"***\",\"row\":{\"ismenu\":\"1\",\"pid\":\"165\",\"name\":\"question\\/questioninfo\",\"title\":\"反馈问题\",\"url\":\"\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"0\",\"condition\":\"\",\"menutype\":\"addtabs\",\"extend\":\"\",\"remark\":\"查看业主反馈的问题\",\"status\":\"normal\"},\"ids\":\"173\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1621950455),(233,1,'admin','/eKrnmBMykb.php/auth/rule/edit/ids/99?dialog=1','权限管理 / 菜单规则 / 编辑','{\"dialog\":\"1\",\"__token__\":\"***\",\"row\":{\"ismenu\":\"1\",\"pid\":\"92\",\"name\":\"vote\\/player\",\"title\":\"投票选手(项)管理\",\"url\":\"\",\"icon\":\"fa fa-users\",\"weigh\":\"0\",\"condition\":\"\",\"menutype\":\"addtabs\",\"extend\":\"\",\"remark\":\"对投票选手或投票选项进行维护管理，审核\",\"status\":\"normal\"},\"ids\":\"99\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1621950538),(234,1,'admin','/eKrnmBMykb.php/auth/rule/edit/ids/122?dialog=1','权限管理 / 菜单规则 / 编辑','{\"dialog\":\"1\",\"__token__\":\"***\",\"row\":{\"ismenu\":\"1\",\"pid\":\"92\",\"name\":\"vote\\/comment\",\"title\":\"投票评论管理\",\"url\":\"\",\"icon\":\"fa fa-comment\",\"weigh\":\"0\",\"condition\":\"\",\"menutype\":\"addtabs\",\"extend\":\"\",\"remark\":\"对投票的评论区信息进行审核，决定是否可见，进行风控\",\"status\":\"normal\"},\"ids\":\"122\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1621950567),(235,1,'admin','/eKrnmBMykb.php/auth/rule/edit/ids/147?dialog=1','权限管理 / 菜单规则 / 编辑','{\"dialog\":\"1\",\"__token__\":\"***\",\"row\":{\"ismenu\":\"1\",\"pid\":\"134\",\"name\":\"wechat\\/menu\",\"title\":\"菜单管理\",\"url\":\"\",\"icon\":\"fa fa-list\",\"weigh\":\"0\",\"condition\":\"\",\"menutype\":\"addtabs\",\"extend\":\"\",\"remark\":\"微信公众号自定义菜单维护\",\"status\":\"normal\"},\"ids\":\"147\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1621950587),(236,1,'admin','/eKrnmBMykb.php/auth/rule/edit/ids/189?dialog=1','权限管理 / 菜单规则 / 编辑','{\"dialog\":\"1\",\"__token__\":\"***\",\"row\":{\"ismenu\":\"1\",\"pid\":\"188\",\"name\":\"door\\/doorinfo\",\"title\":\"门禁点信息\",\"url\":\"\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"0\",\"condition\":\"\",\"menutype\":\"addtabs\",\"extend\":\"\",\"remark\":\"对小区存在的门禁信息点进行维护，供业主选择远程开启\",\"status\":\"normal\"},\"ids\":\"189\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1621950622),(237,1,'admin','/eKrnmBMykb.php/command/get_field_list','在线命令管理','{\"table\":\"smart_admin\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1621953097),(238,1,'admin','/eKrnmBMykb.php/command/get_field_list','在线命令管理','{\"table\":\"smart_door_record\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1621953107),(239,1,'admin','/eKrnmBMykb.php/command/command/action/command','在线命令管理','{\"commandtype\":\"crud\",\"isrelation\":\"0\",\"local\":\"1\",\"delete\":\"0\",\"force\":\"1\",\"table\":\"smart_door_record\",\"controller\":\"door\\/doorrecord\",\"model\":\"\",\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"action\":\"command\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1621953121),(240,1,'admin','/eKrnmBMykb.php/command/command/action/execute','在线命令管理','{\"commandtype\":\"crud\",\"isrelation\":\"0\",\"local\":\"1\",\"delete\":\"0\",\"force\":\"1\",\"table\":\"smart_door_record\",\"controller\":\"door\\/doorrecord\",\"model\":\"\",\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"action\":\"execute\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1621953125),(241,1,'admin','/eKrnmBMykb.php/command/get_controller_list','在线命令管理','{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1621953128),(242,1,'admin','/eKrnmBMykb.php/command/get_controller_list','在线命令管理','{\"q_word\":[\"\"],\"pageNumber\":\"2\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1621953131),(243,1,'admin','/eKrnmBMykb.php/command/get_controller_list','在线命令管理','{\"q_word\":[\"\"],\"pageNumber\":\"3\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1621953133),(244,1,'admin','/eKrnmBMykb.php/command/get_controller_list','在线命令管理','{\"q_word\":[\"\"],\"pageNumber\":\"4\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1621953134),(245,1,'admin','/eKrnmBMykb.php/command/get_controller_list','在线命令管理','{\"q_word\":[\"\"],\"pageNumber\":\"3\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1621953136),(246,1,'admin','/eKrnmBMykb.php/command/get_controller_list','在线命令管理','{\"q_word\":[\"\"],\"pageNumber\":\"2\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1621953138),(247,1,'admin','/eKrnmBMykb.php/command/get_controller_list','在线命令管理','{\"q_word\":[\"\"],\"pageNumber\":\"2\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1621953140),(248,1,'admin','/eKrnmBMykb.php/command/command/action/command','在线命令管理','{\"commandtype\":\"menu\",\"allcontroller\":\"0\",\"delete\":\"0\",\"force\":\"0\",\"controllerfile_text\":\"\",\"controllerfile\":\"door\\/Doorrecord.php\",\"action\":\"command\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1621953142),(249,1,'admin','/eKrnmBMykb.php/command/command/action/execute','在线命令管理','{\"commandtype\":\"menu\",\"allcontroller\":\"0\",\"delete\":\"0\",\"force\":\"0\",\"controllerfile_text\":\"\",\"controllerfile\":\"door\\/Doorrecord.php\",\"action\":\"execute\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1621953143),(250,1,'admin','/eKrnmBMykb.php/command/command/action/command','在线命令管理','{\"commandtype\":\"crud\",\"isrelation\":\"0\",\"local\":\"1\",\"delete\":\"0\",\"force\":\"1\",\"table\":\"smart_door_record\",\"controller\":\"door\\/doorrecord\",\"model\":\"\",\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"action\":\"command\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1621953498),(251,1,'admin','/eKrnmBMykb.php/command/command/action/execute','在线命令管理','{\"commandtype\":\"crud\",\"isrelation\":\"0\",\"local\":\"1\",\"delete\":\"0\",\"force\":\"1\",\"table\":\"smart_door_record\",\"controller\":\"door\\/doorrecord\",\"model\":\"\",\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"action\":\"execute\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1621953504),(252,1,'admin','/eKrnmBMykb.php/auth/group/roletree','权限管理 / 角色组','{\"id\":\"6\",\"pid\":\"1\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1621954953),(253,1,'admin','/eKrnmBMykb.php/auth/group/edit/ids/6?dialog=1','权限管理 / 角色组 / 编辑','{\"dialog\":\"1\",\"__token__\":\"***\",\"row\":{\"rules\":\"1,8,9,10,11,13,14,15,16,17,29,30,31,32,33,34,40,41,42,43,44,45,46,47,48,49,50,67,68,69,70,71,72,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,151,152,153,154,155,156,157,158,159,160,161,162,163,164,166,167,168,169,170,171,172,175,177,188,189,190,191,192,193,194,195,196,197,198,199,200,201,202,2,5,66,165,173\",\"pid\":\"1\",\"name\":\"企业管理员\",\"status\":\"normal\"},\"ids\":\"6\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1621954966),(254,1,'admin','/eKrnmBMykb.php/command/execute/ids/19','在线命令管理 / 运行','{\"ids\":\"19\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1621955507),(255,1,'admin','/eKrnmBMykb.php/auth/rule/edit/ids/196?dialog=1','权限管理 / 菜单规则 / 编辑','{\"dialog\":\"1\",\"__token__\":\"***\",\"row\":{\"ismenu\":\"1\",\"pid\":\"188\",\"name\":\"door\\/doorrecord\",\"title\":\"开门记录\",\"url\":\"\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"0\",\"condition\":\"\",\"menutype\":\"addtabs\",\"extend\":\"\",\"remark\":\"查看远程开门禁记录及执行状态\",\"status\":\"normal\"},\"ids\":\"196\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1621955601),(256,2,'1001','/eKrnmBMykb.php/index/login','登录','{\"__token__\":\"***\",\"username\":\"1001\",\"password\":\"***\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1621955619),(257,2,'1001','/eKrnmBMykb.php/door/doorinfo/add?dialog=1','门禁管理 / 门禁点信息 / 添加','{\"dialog\":\"1\",\"row\":{\"door_code\":\"01001\",\"door_name\":\"大门东侧人行门禁\",\"IO_garden\":\"星雨华府\"}}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1621955655),(258,2,'1001','/eKrnmBMykb.php/door/doorrecord/add?dialog=1','门禁管理 / 开门记录 / 添加','{\"dialog\":\"1\",\"row\":{\"record_user\":\"admin\",\"record_send_time\":\"2021-05-25 23:14:25\",\"record_excute_time\":\"2021-05-25 23:14:40\",\"record_type\":\"开门\",\"record_status\":\"0\"}}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1621955686),(259,2,'1001','/eKrnmBMykb.php/door/doorrecord/edit/ids/1?dialog=1','门禁管理 / 开门记录 / 编辑','{\"dialog\":\"1\",\"row\":{\"record_user\":\"admin\",\"record_send_time\":\"2021-05-25 23:14:25\",\"record_excute_time\":\"\",\"record_type\":\"开门\",\"record_status\":\"0\"},\"ids\":\"1\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1621955759),(260,2,'1001','/eKrnmBMykb.php/index/login','登录','{\"__token__\":\"***\",\"username\":\"1001\",\"password\":\"***\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1622037501),(261,1,'admin','/eKrnmBMykb.php/index/login?url=%2FeKrnmBMykb.php%2Fthird%3Faddtabs%3D1','登录','{\"url\":\"\\/eKrnmBMykb.php\\/third?addtabs=1\",\"__token__\":\"***\",\"username\":\"admin\",\"password\":\"***\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1622041925),(262,1,'admin','/eKrnmBMykb.php/command/get_field_list','在线命令管理','{\"table\":\"smart_admin\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1622041932),(263,1,'admin','/eKrnmBMykb.php/command/get_field_list','在线命令管理','{\"table\":\"smart_door_record\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1622041944),(264,1,'admin','/eKrnmBMykb.php/command/get_field_list','在线命令管理','{\"table\":\"smart_admin\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1622041986),(265,1,'admin','/eKrnmBMykb.php/command/get_field_list','在线命令管理','{\"table\":\"smart_admin\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1622041986),(266,1,'admin','/eKrnmBMykb.php/command/get_field_list','在线命令管理','{\"table\":\"smart_admin\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1622041986),(267,1,'admin','/eKrnmBMykb.php/command/get_field_list','在线命令管理','{\"table\":\"smart_admin\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1622041986),(268,1,'admin','/eKrnmBMykb.php/command/get_field_list','在线命令管理','{\"table\":\"smart_door_info\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1622041993),(269,1,'admin','/eKrnmBMykb.php/command/get_field_list','在线命令管理','{\"table\":\"smart_door_info\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1622041993),(270,1,'admin','/eKrnmBMykb.php/command/command/action/command','在线命令管理','{\"commandtype\":\"crud\",\"isrelation\":\"1\",\"local\":\"1\",\"delete\":\"0\",\"force\":\"1\",\"table\":\"smart_door_record\",\"controller\":\"door\\/doorrecord\",\"model\":\"\",\"relation\":{\"2\":{\"relation\":\"smart_door_info\",\"relationmode\":\"belongsto\",\"relationforeignkey\":\"record_door_id\",\"relationprimarykey\":\"door_id\"}},\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"action\":\"command\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1622042017),(271,1,'admin','/eKrnmBMykb.php/command/command/action/execute','在线命令管理','{\"commandtype\":\"crud\",\"isrelation\":\"1\",\"local\":\"1\",\"delete\":\"0\",\"force\":\"1\",\"table\":\"smart_door_record\",\"controller\":\"door\\/doorrecord\",\"model\":\"\",\"relation\":{\"2\":{\"relation\":\"smart_door_info\",\"relationmode\":\"belongsto\",\"relationforeignkey\":\"record_door_id\",\"relationprimarykey\":\"door_id\"}},\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"action\":\"execute\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1622042023),(272,1,'admin','/eKrnmBMykb.php/door/doorrecord/del','门禁管理 / 开门记录 / 删除','{\"action\":\"del\",\"ids\":\"4,3,2\",\"params\":\"\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1622048160),(273,1,'admin','/eKrnmBMykb.php/door/doorinfo/add?dialog=1','门禁管理 / 门禁点信息 / 添加','{\"dialog\":\"1\",\"row\":{\"door_code\":\"02001\",\"door_name\":\"大门机动车入口道闸\",\"IO_garden\":\"星雨华府\"}}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1622048519),(274,1,'admin','/eKrnmBMykb.php/question/questioninfo/del','问题反馈 / 反馈问题 / 删除','{\"action\":\"del\",\"ids\":\"30\",\"params\":\"\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1622048675),(275,1,'admin','/eKrnmBMykb.php/index/login','登录','{\"__token__\":\"***\",\"username\":\"admin\",\"password\":\"***\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1622378459),(276,1,'admin','/eKrnmBMykb.php/command/get_field_list','在线命令管理','{\"table\":\"smart_admin\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1622380836),(277,1,'admin','/eKrnmBMykb.php/command/get_field_list','在线命令管理','{\"table\":\"smart_door_info\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1622380845),(278,1,'admin','/eKrnmBMykb.php/command/command/action/command','在线命令管理','{\"commandtype\":\"crud\",\"isrelation\":\"0\",\"local\":\"1\",\"delete\":\"0\",\"force\":\"1\",\"table\":\"smart_door_info\",\"controller\":\"door\\/doorinfo\",\"model\":\"\",\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"action\":\"command\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1622380868),(279,1,'admin','/eKrnmBMykb.php/command/command/action/execute','在线命令管理','{\"commandtype\":\"crud\",\"isrelation\":\"0\",\"local\":\"1\",\"delete\":\"0\",\"force\":\"1\",\"table\":\"smart_door_info\",\"controller\":\"door\\/doorinfo\",\"model\":\"\",\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"action\":\"execute\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1622380870),(280,1,'admin','/eKrnmBMykb.php/command/command/action/command','在线命令管理','{\"commandtype\":\"crud\",\"isrelation\":\"0\",\"local\":\"1\",\"delete\":\"0\",\"force\":\"1\",\"table\":\"smart_door_info\",\"controller\":\"door\\/doorinfo\",\"model\":\"\",\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"door_type\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"action\":\"command\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1622381071),(281,1,'admin','/eKrnmBMykb.php/command/command/action/execute','在线命令管理','{\"commandtype\":\"crud\",\"isrelation\":\"0\",\"local\":\"1\",\"delete\":\"0\",\"force\":\"1\",\"table\":\"smart_door_info\",\"controller\":\"door\\/doorinfo\",\"model\":\"\",\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"door_type\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"action\":\"execute\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1622381074),(282,1,'admin','/eKrnmBMykb.php/door/doorinfo/del','门禁管理 / 门禁点信息 / 删除','{\"action\":\"del\",\"ids\":\"2,1\",\"params\":\"\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1622381164),(283,1,'admin','/eKrnmBMykb.php/command/get_field_list','在线命令管理','{\"table\":\"smart_admin\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1622381179),(284,1,'admin','/eKrnmBMykb.php/command/execute/ids/22','在线命令管理 / 运行','{\"ids\":\"22\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1622381190),(285,1,'admin','/eKrnmBMykb.php/door/doorinfo/add?dialog=1','门禁管理 / 门禁点信息 / 添加','{\"dialog\":\"1\",\"row\":{\"door_code\":\"01001\",\"door_name\":\"一号门\",\"IO_garden\":\"阳光小区\",\"door_type\":\"0\"}}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1622381225),(286,1,'admin','/eKrnmBMykb.php/door/doorinfo/add?dialog=1','门禁管理 / 门禁点信息 / 添加','{\"dialog\":\"1\",\"row\":{\"door_code\":\"01004\",\"door_name\":\"四号门\",\"IO_garden\":\"阳光小区\",\"door_type\":\"0\"}}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1622381823),(287,1,'admin','/eKrnmBMykb.php/door/doorinfo/add?dialog=1','门禁管理 / 门禁点信息 / 添加','{\"dialog\":\"1\",\"row\":{\"door_code\":\"01006\",\"door_name\":\"六号门\",\"IO_garden\":\"阳光小区\",\"door_type\":\"0\"}}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1622381863),(288,1,'admin','/eKrnmBMykb.php/door/doorinfo/add?dialog=1','门禁管理 / 门禁点信息 / 添加','{\"dialog\":\"1\",\"row\":{\"door_code\":\"01007\",\"door_name\":\"七号门\",\"IO_garden\":\"阳光小区\",\"door_type\":\"0\"}}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1622381887),(289,1,'admin','/eKrnmBMykb.php/door/doorinfo/add?dialog=1','门禁管理 / 门禁点信息 / 添加','{\"dialog\":\"1\",\"row\":{\"door_code\":\"01008\",\"door_name\":\"八号门\",\"IO_garden\":\"阳光小区\",\"door_type\":\"0\"}}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1622381903),(290,1,'admin','/eKrnmBMykb.php/door/doorinfo/add?dialog=1','门禁管理 / 门禁点信息 / 添加','{\"dialog\":\"1\",\"row\":{\"door_code\":\"02001\",\"door_name\":\"综合楼\",\"IO_garden\":\"阳光小区\",\"door_type\":\"1\"}}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1622381988),(291,1,'admin','/eKrnmBMykb.php/door/doorinfo/add?dialog=1','门禁管理 / 门禁点信息 / 添加','{\"dialog\":\"1\",\"row\":{\"door_code\":\"02002\",\"door_name\":\"2号门\",\"IO_garden\":\"阳光小区\",\"door_type\":\"1\"}}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1622382005),(292,1,'admin','/eKrnmBMykb.php/command/execute/ids/24','在线命令管理 / 运行','{\"ids\":\"24\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1622383749),(293,1,'admin','/eKrnmBMykb.php/door/doorinfo/edit/ids/1?dialog=1','门禁管理 / 门禁点信息 / 编辑','{\"dialog\":\"1\",\"row\":{\"door_code\":\"01001\",\"door_name\":\"一号门\",\"IO_garden\":\"阳光小区\",\"door_type\":\"0\",\"door_ip\":\"192.168.1.11\",\"door_port\":\"8000\",\"door_username\":\"admin\",\"door_password\":\"***\",\"door_channlno\":\"1\"},\"ids\":\"1\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1622383816),(294,1,'admin','/eKrnmBMykb.php/door/doorinfo/edit/ids/4?dialog=1','门禁管理 / 门禁点信息 / 编辑','{\"dialog\":\"1\",\"row\":{\"door_code\":\"01004\",\"door_name\":\"四号门\",\"IO_garden\":\"阳光小区\",\"door_type\":\"0\",\"door_ip\":\"192.168.1.11\",\"door_port\":\"8000\",\"door_username\":\"admin\",\"door_password\":\"***\",\"door_channlno\":\"4\"},\"ids\":\"4\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1622383849),(295,1,'admin','/eKrnmBMykb.php/door/doorinfo/edit/ids/6?dialog=1','门禁管理 / 门禁点信息 / 编辑','{\"dialog\":\"1\",\"row\":{\"door_code\":\"01006\",\"door_name\":\"六号门\",\"IO_garden\":\"阳光小区\",\"door_type\":\"0\",\"door_ip\":\"192.168.1.11\",\"door_port\":\"8000\",\"door_username\":\"admin\",\"door_password\":\"***\",\"door_channlno\":\"\"},\"ids\":\"6\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1622385007),(296,1,'admin','/eKrnmBMykb.php/door/doorinfo/edit/ids/6?dialog=1','门禁管理 / 门禁点信息 / 编辑','{\"dialog\":\"1\",\"row\":{\"door_code\":\"01006\",\"door_name\":\"六号门\",\"IO_garden\":\"阳光小区\",\"door_type\":\"0\",\"door_ip\":\"192.168.1.11\",\"door_port\":\"8000\",\"door_username\":\"admin\",\"door_password\":\"***\",\"door_channlno\":\"6\"},\"ids\":\"6\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1622385017),(297,1,'admin','/eKrnmBMykb.php/door/doorinfo/edit/ids/7?dialog=1','门禁管理 / 门禁点信息 / 编辑','{\"dialog\":\"1\",\"row\":{\"door_code\":\"01007\",\"door_name\":\"七号门\",\"IO_garden\":\"阳光小区\",\"door_type\":\"0\",\"door_ip\":\"192.168.1.11\",\"door_port\":\"8000\",\"door_username\":\"admin\",\"door_password\":\"***\",\"door_channlno\":\"7\"},\"ids\":\"7\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1622385042),(298,1,'admin','/eKrnmBMykb.php/door/doorinfo/edit/ids/8?dialog=1','门禁管理 / 门禁点信息 / 编辑','{\"dialog\":\"1\",\"row\":{\"door_code\":\"01008\",\"door_name\":\"八号门\",\"IO_garden\":\"阳光小区\",\"door_type\":\"0\",\"door_ip\":\"192.168.1.11\",\"door_port\":\"8000\",\"door_username\":\"admin\",\"door_password\":\"***\",\"door_channlno\":\"8\"},\"ids\":\"8\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1622385059),(299,1,'admin','/eKrnmBMykb.php/door/doorinfo/edit/ids/10?dialog=1','门禁管理 / 门禁点信息 / 编辑','{\"dialog\":\"1\",\"row\":{\"door_code\":\"02002\",\"door_name\":\"2号门\",\"IO_garden\":\"阳光小区\",\"door_type\":\"1\",\"door_ip\":\"192.168.1.10\",\"door_port\":\"8000\",\"door_username\":\"admin\",\"door_password\":\"***\",\"door_channlno\":\"2\"},\"ids\":\"10\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1622385085),(300,1,'admin','/eKrnmBMykb.php/door/doorinfo/edit/ids/9?dialog=1','门禁管理 / 门禁点信息 / 编辑','{\"dialog\":\"1\",\"row\":{\"door_code\":\"02001\",\"door_name\":\"综合楼\",\"IO_garden\":\"阳光小区\",\"door_type\":\"1\",\"door_ip\":\"192.168.1.10\",\"door_port\":\"8000\",\"door_username\":\"admin\",\"door_password\":\"***\",\"door_channlno\":\"1\"},\"ids\":\"9\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1622385104),(301,1,'admin','/eKrnmBMykb.php/door/doorrecord/del','门禁管理 / 开门记录 / 删除','{\"action\":\"del\",\"ids\":\"11\",\"params\":\"\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1622385212),(302,1,'admin','/eKrnmBMykb.php/index/login','登录','{\"__token__\":\"***\",\"username\":\"admin\",\"password\":\"***\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.115 Safari/537.36 Qaxbrowser',1622444984);
/*!40000 ALTER TABLE `smart_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smart_area`
--

DROP TABLE IF EXISTS `smart_area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `smart_area` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `pid` int(10) DEFAULT NULL COMMENT '父id',
  `shortname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '简称',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '名称',
  `mergename` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '全称',
  `level` tinyint(4) DEFAULT NULL COMMENT '层级 0 1 2 省市区县',
  `pinyin` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '拼音',
  `code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '长途区号',
  `zip` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '邮编',
  `first` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '首字母',
  `lng` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '经度',
  `lat` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '纬度',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='地区表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smart_area`
--

LOCK TABLES `smart_area` WRITE;
/*!40000 ALTER TABLE `smart_area` DISABLE KEYS */;
/*!40000 ALTER TABLE `smart_area` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smart_attachment`
--

DROP TABLE IF EXISTS `smart_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `smart_attachment` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `admin_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '管理员ID',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '物理路径',
  `imagewidth` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '宽度',
  `imageheight` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '高度',
  `imagetype` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '图片类型',
  `imageframes` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '图片帧数',
  `filename` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '文件名称',
  `filesize` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `mimetype` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'mime类型',
  `extparam` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '透传数据',
  `createtime` int(10) DEFAULT NULL COMMENT '创建日期',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `uploadtime` int(10) DEFAULT NULL COMMENT '上传时间',
  `storage` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'local' COMMENT '存储位置',
  `sha1` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '文件 sha1编码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='附件表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smart_attachment`
--

LOCK TABLES `smart_attachment` WRITE;
/*!40000 ALTER TABLE `smart_attachment` DISABLE KEYS */;
INSERT INTO `smart_attachment` VALUES (1,1,0,'/assets/img/qrcode.png','150','150','png',0,'qrcode.png',21859,'image/png','',1491635035,1491635035,1491635035,'local','17163603d0263e4838b9387ff2cd4877e8b018f6'),(2,1,0,'/uploads/20210411/21985bd56c746e1df1274c3e520039bc.jpg','500','277','jpg',0,'src=http___image.sonhoo.com_server18_photos_photo_1569814086_20202123538477.png&amp;refer=http___ima',27873,'image/jpeg','',1618145900,1618145900,1618145900,'local','46b9a38a9e4cf09886c66753249c259b7c6ae151'),(3,1,0,'/uploads/20210411/ac8d5e112adfdebfa1a20f7c1978ede3.jpg','600','400','jpg',0,'src=http___dpic.tiankong.com_cr_vf_QJ6897690279.jpg&amp;refer=http___dpic.tiankong.jpg',70114,'image/jpeg','',1618146071,1618146071,1618146071,'local','fc62d1832e6e5d0b974489a83911f63521d7124b'),(4,1,0,'/uploads/20210411/acfe2a6af3faf001821ef7a02c3b4bcf.jpg','491','367','jpg',0,'src=http___img1.gtimg.com_suzhou_house_pics_hv1_13_149_12_818308.jpg&amp;refer=http___img1.gtimg.jpg',38124,'image/jpeg','',1618146365,1618146365,1618146365,'local','f4cddddf1a4b0dbde3f518a6995e6f8ff9f21e61'),(5,1,0,'/uploads/20210411/b498dab6d5a9df523c56fbdaaaa75e69.jpg','450','338','jpg',0,'src=http___p3.ssl.cdn.btime.com_t013c751dbccf8d7c3e.jpg_size=450x338_size=450x338&amp;refer=http___p',36669,'image/jpeg','',1618146406,1618146406,1618146406,'local','1734765d772333d7d85420325e80a29e50b357c0'),(6,1,1,'/uploads/20210411/98403e953a4b62dfe2d78a2ff9951987.jpg','1080','720','jpg',0,'src=http___n.sinaimg.cn_sinacn11_200_w1080h720_20180528_192e-hcaquev3791935.jpg&amp;refer=http___n.s',89950,'image/jpeg','',1618150884,1618150884,1618150884,'local','589fdedba222d14bcca30509b8da75f4296be956'),(7,1,1,'/uploads/20210411/45b791433ba99f3b36c389c7db184ae8.jpg','1227','912','jpg',0,'src=http___guifun.oss-cn-hangzhou.aliyuncs.com_upfiles_upload_2020_03_1583033843105531.jpg&amp;refer',75592,'image/jpeg','',1618151189,1618151189,1618151189,'local','ba7af41a6953d20b678fec7ed38cd8eb5745daf7'),(8,1,1,'/uploads/20210412/45b791433ba99f3b36c389c7db184ae8.jpg','1227','912','jpg',0,'src=http___guifun.oss-cn-hangzhou.aliyuncs.com_upfiles_upload_2020_03_1583033843105531.jpg&amp;refer',75592,'image/jpeg','',1618237275,1618237275,1618237275,'local','ba7af41a6953d20b678fec7ed38cd8eb5745daf7'),(9,2,1,'/uploads/20210413/961bed67300fefec24cb5b65b2343cb6.jpg','3840','2400','jpg',0,'francesco-ungaro-1fzbUyzsHV8-unsplash.jpg',870376,'image/jpeg','',1618299764,1618299764,1618299764,'local','a7f1b9d8c30ab4a8ed18b9cc9d144f6cfc9afb83'),(10,1,1,'/uploads/20210413/489af80e5c10bebbe303f58cf14f5529.jpg','3840','2400','jpg',0,'abc-123.jpg',1118260,'image/jpeg','',1618301272,1618301272,1618301272,'local','6fff815eb9f5e6f552d37df483225d05b76d67ef'),(11,1,1,'/uploads/20210413/ffbdabe1c2b351d6cdc0da2fe8b6d71b.jpg','3840','2400','jpg',0,'cristina-gottardi-wndpWTiDuT0-unsplash.jpg',1885674,'image/jpeg','',1618324685,1618324685,1618324685,'local','d7a20e1a8054b037bfbbf8b699c4c6430f5e796b'),(12,0,7,'/uploads/20210416/489af80e5c10bebbe303f58cf14f5529.jpg','3840','2400','jpg',0,'abc-123.jpg',1118260,'image/jpeg','',1618529771,1618529771,1618529771,'local','6fff815eb9f5e6f552d37df483225d05b76d67ef'),(13,0,7,'/uploads/20210416/db5d8c6da8880d901580fb06fe29c0fe.jpg','5120','3413','jpg',0,'desktop.jpg',2568488,'image/jpeg','',1618529850,1618529850,1618529850,'local','ce826b4b4f8684f15a9221853d98ab85973b13eb'),(14,0,7,'/uploads/20210416/961bed67300fefec24cb5b65b2343cb6.jpg','3840','2400','jpg',0,'francesco-ungaro-1fzbUyzsHV8-unsplash.jpg',870376,'image/jpeg','',1618529913,1618529913,1618529913,'local','a7f1b9d8c30ab4a8ed18b9cc9d144f6cfc9afb83'),(15,0,7,'/uploads/20210416/ffbdabe1c2b351d6cdc0da2fe8b6d71b.jpg','3840','2400','jpg',0,'cristina-gottardi-wndpWTiDuT0-unsplash.jpg',1885674,'image/jpeg','',1618530317,1618530317,1618530317,'local','d7a20e1a8054b037bfbbf8b699c4c6430f5e796b'),(16,0,7,'/uploads/20210416/aba222b24c7c4e4991b60b4589d07495.jpg','4000','3000','jpg',0,'16185809132692034068088077391715.jpg',831146,'image/jpeg','',1618580920,1618580920,1618580920,'local','56e3d3a307443c11f0315d7b1a809f1e27fcadad'),(17,0,7,'/uploads/20210417/db5d8c6da8880d901580fb06fe29c0fe.jpg','5120','3413','jpg',0,'desktop.jpg',2568488,'image/jpeg','',1618591042,1618591042,1618591042,'local','ce826b4b4f8684f15a9221853d98ab85973b13eb'),(18,0,7,'/uploads/20210417/961bed67300fefec24cb5b65b2343cb6.jpg','3840','2400','jpg',0,'francesco-ungaro-1fzbUyzsHV8-unsplash.jpg',870376,'image/jpeg','',1618592233,1618592233,1618592233,'local','a7f1b9d8c30ab4a8ed18b9cc9d144f6cfc9afb83'),(19,0,7,'/uploads/20210417/ffbdabe1c2b351d6cdc0da2fe8b6d71b.jpg','3840','2400','jpg',0,'cristina-gottardi-wndpWTiDuT0-unsplash.jpg',1885674,'image/jpeg','',1618592868,1618592868,1618592868,'local','d7a20e1a8054b037bfbbf8b699c4c6430f5e796b'),(20,0,7,'/uploads/20210417/743414f73a0ddd85da56e85388047014.jpg','3840','2160','jpg',0,'luke-stackpoole-mStq-dtsXCQ-unsplash.jpg',1106954,'image/jpeg','',1618593144,1618593144,1618593144,'local','e447e65f51e3dea42a8ed8e0cc259047e81baa90'),(21,0,7,'/uploads/20210524/888193def5da9a557f0249d20ce85087.jpg','887','1920','jpg',0,'wx_camera_1621862476953.jpg',895586,'image/jpeg','',1621867565,1621867565,1621867565,'local','64acfc48b7090d93e2e344826e09a2605e9e6744');
/*!40000 ALTER TABLE `smart_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smart_auth_group`
--

DROP TABLE IF EXISTS `smart_auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `smart_auth_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父组别',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '组名',
  `rules` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '规则ID',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `status` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='分组表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smart_auth_group`
--

LOCK TABLES `smart_auth_group` WRITE;
/*!40000 ALTER TABLE `smart_auth_group` DISABLE KEYS */;
INSERT INTO `smart_auth_group` VALUES (1,0,'Admin group','*',1491635035,1491635035,'normal'),(6,1,'企业管理员','1,8,9,10,11,13,14,15,16,17,29,30,31,32,33,34,40,41,42,43,44,45,46,47,48,49,50,67,68,69,70,71,72,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,151,152,153,154,155,156,157,158,159,160,161,162,163,164,166,167,168,169,170,171,172,175,177,188,189,190,191,192,193,194,195,196,197,198,199,200,201,202,2,5,66,165,173',1618242661,1621954966,'normal');
/*!40000 ALTER TABLE `smart_auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smart_auth_group_access`
--

DROP TABLE IF EXISTS `smart_auth_group_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `smart_auth_group_access` (
  `uid` int(10) unsigned NOT NULL COMMENT '会员ID',
  `group_id` int(10) unsigned NOT NULL COMMENT '级别ID',
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='权限分组表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smart_auth_group_access`
--

LOCK TABLES `smart_auth_group_access` WRITE;
/*!40000 ALTER TABLE `smart_auth_group_access` DISABLE KEYS */;
INSERT INTO `smart_auth_group_access` VALUES (1,1),(2,6);
/*!40000 ALTER TABLE `smart_auth_group_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smart_auth_rule`
--

DROP TABLE IF EXISTS `smart_auth_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `smart_auth_rule` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` enum('menu','file') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'file' COMMENT 'menu为菜单,file为权限节点',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父ID',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '规则名称',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '规则名称',
  `icon` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '图标',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '规则URL',
  `condition` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '条件',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '备注',
  `ismenu` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否为菜单',
  `menutype` enum('addtabs','blank','dialog','ajax') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '菜单类型',
  `extend` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '扩展属性',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `weigh` int(10) NOT NULL DEFAULT '0' COMMENT '权重',
  `status` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`) USING BTREE,
  KEY `pid` (`pid`),
  KEY `weigh` (`weigh`)
) ENGINE=InnoDB AUTO_INCREMENT=203 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='节点表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smart_auth_rule`
--

LOCK TABLES `smart_auth_rule` WRITE;
/*!40000 ALTER TABLE `smart_auth_rule` DISABLE KEYS */;
INSERT INTO `smart_auth_rule` VALUES (1,'file',0,'dashboard','Dashboard','fa fa-dashboard','','','Dashboard tips',1,NULL,'',1491635035,1491635035,143,'normal'),(2,'file',0,'general','General','fa fa-cogs','','','',1,NULL,'',1491635035,1491635035,137,'normal'),(3,'file',0,'category','Category','fa fa-leaf','','','Category tips',1,NULL,'',1491635035,1491635035,119,'normal'),(4,'file',0,'addon','Addon','fa fa-rocket','','','Addon tips',1,NULL,'',1491635035,1491635035,0,'normal'),(5,'file',0,'auth','Auth','fa fa-group','','','',1,NULL,'',1491635035,1491635035,99,'normal'),(6,'file',2,'general/config','Config','fa fa-cog','','','Config tips',1,NULL,'',1491635035,1491635035,60,'normal'),(7,'file',2,'general/attachment','Attachment','fa fa-file-image-o','','','Attachment tips',1,NULL,'',1491635035,1491635035,53,'normal'),(8,'file',2,'general/profile','Profile','fa fa-user','','','',1,NULL,'',1491635035,1491635035,34,'normal'),(9,'file',5,'auth/admin','Admin','fa fa-user','','','Admin tips',1,NULL,'',1491635035,1491635035,118,'normal'),(10,'file',5,'auth/adminlog','Admin log','fa fa-list-alt','','','Admin log tips',1,NULL,'',1491635035,1491635035,113,'normal'),(11,'file',5,'auth/group','Group','fa fa-group','','','Group tips',1,NULL,'',1491635035,1491635035,109,'normal'),(12,'file',5,'auth/rule','Rule','fa fa-bars','','','Rule tips',1,NULL,'',1491635035,1491635035,104,'normal'),(13,'file',1,'dashboard/index','View','fa fa-circle-o','','','',0,NULL,'',1491635035,1491635035,136,'normal'),(14,'file',1,'dashboard/add','Add','fa fa-circle-o','','','',0,NULL,'',1491635035,1491635035,135,'normal'),(15,'file',1,'dashboard/del','Delete','fa fa-circle-o','','','',0,NULL,'',1491635035,1491635035,133,'normal'),(16,'file',1,'dashboard/edit','Edit','fa fa-circle-o','','','',0,NULL,'',1491635035,1491635035,134,'normal'),(17,'file',1,'dashboard/multi','Multi','fa fa-circle-o','','','',0,NULL,'',1491635035,1491635035,132,'normal'),(18,'file',6,'general/config/index','View','fa fa-circle-o','','','',0,NULL,'',1491635035,1491635035,52,'normal'),(19,'file',6,'general/config/add','Add','fa fa-circle-o','','','',0,NULL,'',1491635035,1491635035,51,'normal'),(20,'file',6,'general/config/edit','Edit','fa fa-circle-o','','','',0,NULL,'',1491635035,1491635035,50,'normal'),(21,'file',6,'general/config/del','Delete','fa fa-circle-o','','','',0,NULL,'',1491635035,1491635035,49,'normal'),(22,'file',6,'general/config/multi','Multi','fa fa-circle-o','','','',0,NULL,'',1491635035,1491635035,48,'normal'),(23,'file',7,'general/attachment/index','View','fa fa-circle-o','','','Attachment tips',0,NULL,'',1491635035,1491635035,59,'normal'),(24,'file',7,'general/attachment/select','Select attachment','fa fa-circle-o','','','',0,NULL,'',1491635035,1491635035,58,'normal'),(25,'file',7,'general/attachment/add','Add','fa fa-circle-o','','','',0,NULL,'',1491635035,1491635035,57,'normal'),(26,'file',7,'general/attachment/edit','Edit','fa fa-circle-o','','','',0,NULL,'',1491635035,1491635035,56,'normal'),(27,'file',7,'general/attachment/del','Delete','fa fa-circle-o','','','',0,NULL,'',1491635035,1491635035,55,'normal'),(28,'file',7,'general/attachment/multi','Multi','fa fa-circle-o','','','',0,NULL,'',1491635035,1491635035,54,'normal'),(29,'file',8,'general/profile/index','View','fa fa-circle-o','','','',0,NULL,'',1491635035,1491635035,33,'normal'),(30,'file',8,'general/profile/update','Update profile','fa fa-circle-o','','','',0,NULL,'',1491635035,1491635035,32,'normal'),(31,'file',8,'general/profile/add','Add','fa fa-circle-o','','','',0,NULL,'',1491635035,1491635035,31,'normal'),(32,'file',8,'general/profile/edit','Edit','fa fa-circle-o','','','',0,NULL,'',1491635035,1491635035,30,'normal'),(33,'file',8,'general/profile/del','Delete','fa fa-circle-o','','','',0,NULL,'',1491635035,1491635035,29,'normal'),(34,'file',8,'general/profile/multi','Multi','fa fa-circle-o','','','',0,NULL,'',1491635035,1491635035,28,'normal'),(35,'file',3,'category/index','View','fa fa-circle-o','','','Category tips',0,NULL,'',1491635035,1491635035,142,'normal'),(36,'file',3,'category/add','Add','fa fa-circle-o','','','',0,NULL,'',1491635035,1491635035,141,'normal'),(37,'file',3,'category/edit','Edit','fa fa-circle-o','','','',0,NULL,'',1491635035,1491635035,140,'normal'),(38,'file',3,'category/del','Delete','fa fa-circle-o','','','',0,NULL,'',1491635035,1491635035,139,'normal'),(39,'file',3,'category/multi','Multi','fa fa-circle-o','','','',0,NULL,'',1491635035,1491635035,138,'normal'),(40,'file',9,'auth/admin/index','View','fa fa-circle-o','','','Admin tips',0,NULL,'',1491635035,1491635035,117,'normal'),(41,'file',9,'auth/admin/add','Add','fa fa-circle-o','','','',0,NULL,'',1491635035,1491635035,116,'normal'),(42,'file',9,'auth/admin/edit','Edit','fa fa-circle-o','','','',0,NULL,'',1491635035,1491635035,115,'normal'),(43,'file',9,'auth/admin/del','Delete','fa fa-circle-o','','','',0,NULL,'',1491635035,1491635035,114,'normal'),(44,'file',10,'auth/adminlog/index','View','fa fa-circle-o','','','Admin log tips',0,NULL,'',1491635035,1491635035,112,'normal'),(45,'file',10,'auth/adminlog/detail','Detail','fa fa-circle-o','','','',0,NULL,'',1491635035,1491635035,111,'normal'),(46,'file',10,'auth/adminlog/del','Delete','fa fa-circle-o','','','',0,NULL,'',1491635035,1491635035,110,'normal'),(47,'file',11,'auth/group/index','View','fa fa-circle-o','','','Group tips',0,NULL,'',1491635035,1491635035,108,'normal'),(48,'file',11,'auth/group/add','Add','fa fa-circle-o','','','',0,NULL,'',1491635035,1491635035,107,'normal'),(49,'file',11,'auth/group/edit','Edit','fa fa-circle-o','','','',0,NULL,'',1491635035,1491635035,106,'normal'),(50,'file',11,'auth/group/del','Delete','fa fa-circle-o','','','',0,NULL,'',1491635035,1491635035,105,'normal'),(51,'file',12,'auth/rule/index','View','fa fa-circle-o','','','Rule tips',0,NULL,'',1491635035,1491635035,103,'normal'),(52,'file',12,'auth/rule/add','Add','fa fa-circle-o','','','',0,NULL,'',1491635035,1491635035,102,'normal'),(53,'file',12,'auth/rule/edit','Edit','fa fa-circle-o','','','',0,NULL,'',1491635035,1491635035,101,'normal'),(54,'file',12,'auth/rule/del','Delete','fa fa-circle-o','','','',0,NULL,'',1491635035,1491635035,100,'normal'),(55,'file',4,'addon/index','View','fa fa-circle-o','','','Addon tips',0,NULL,'',1491635035,1491635035,0,'normal'),(56,'file',4,'addon/add','Add','fa fa-circle-o','','','',0,NULL,'',1491635035,1491635035,0,'normal'),(57,'file',4,'addon/edit','Edit','fa fa-circle-o','','','',0,NULL,'',1491635035,1491635035,0,'normal'),(58,'file',4,'addon/del','Delete','fa fa-circle-o','','','',0,NULL,'',1491635035,1491635035,0,'normal'),(59,'file',4,'addon/downloaded','Local addon','fa fa-circle-o','','','',0,NULL,'',1491635035,1491635035,0,'normal'),(60,'file',4,'addon/state','Update state','fa fa-circle-o','','','',0,NULL,'',1491635035,1491635035,0,'normal'),(63,'file',4,'addon/config','Setting','fa fa-circle-o','','','',0,NULL,'',1491635035,1491635035,0,'normal'),(64,'file',4,'addon/refresh','Refresh','fa fa-circle-o','','','',0,NULL,'',1491635035,1491635035,0,'normal'),(65,'file',4,'addon/multi','Multi','fa fa-circle-o','','','',0,NULL,'',1491635035,1491635035,0,'normal'),(66,'file',0,'user','业主管理','fa fa-list','','','',1,'addtabs','',1491635035,1618299894,142,'normal'),(67,'file',66,'user/user','业主信息','fa fa-user','','','管理业主信息',1,'addtabs','',1491635035,1618241853,0,'normal'),(68,'file',67,'user/user/index','View','fa fa-circle-o','','','',0,NULL,'',1491635035,1491635035,0,'normal'),(69,'file',67,'user/user/edit','Edit','fa fa-circle-o','','','',0,NULL,'',1491635035,1491635035,0,'normal'),(70,'file',67,'user/user/add','Add','fa fa-circle-o','','','',0,NULL,'',1491635035,1491635035,0,'normal'),(71,'file',67,'user/user/del','Del','fa fa-circle-o','','','',0,NULL,'',1491635035,1491635035,0,'normal'),(72,'file',67,'user/user/multi','Multi','fa fa-circle-o','','','',0,NULL,'',1491635035,1491635035,0,'normal'),(73,'file',66,'user/group','业主分组','fa fa-users','','','',1,'addtabs','',1491635035,1618239660,0,'normal'),(74,'file',73,'user/group/add','Add','fa fa-circle-o','','','',0,NULL,'',1491635035,1491635035,0,'normal'),(75,'file',73,'user/group/edit','Edit','fa fa-circle-o','','','',0,NULL,'',1491635035,1491635035,0,'normal'),(76,'file',73,'user/group/index','View','fa fa-circle-o','','','',0,NULL,'',1491635035,1491635035,0,'normal'),(77,'file',73,'user/group/del','Del','fa fa-circle-o','','','',0,NULL,'',1491635035,1491635035,0,'normal'),(78,'file',73,'user/group/multi','Multi','fa fa-circle-o','','','',0,NULL,'',1491635035,1491635035,0,'normal'),(79,'file',66,'user/rule','业主规则','fa fa-circle-o','','','',1,'addtabs','',1491635035,1618239670,0,'normal'),(80,'file',79,'user/rule/index','View','fa fa-circle-o','','','',0,NULL,'',1491635035,1491635035,0,'normal'),(81,'file',79,'user/rule/del','Del','fa fa-circle-o','','','',0,NULL,'',1491635035,1491635035,0,'normal'),(82,'file',79,'user/rule/add','Add','fa fa-circle-o','','','',0,NULL,'',1491635035,1491635035,0,'normal'),(83,'file',79,'user/rule/edit','Edit','fa fa-circle-o','','','',0,NULL,'',1491635035,1491635035,0,'normal'),(84,'file',79,'user/rule/multi','Multi','fa fa-circle-o','','','',0,NULL,'',1491635035,1491635035,0,'normal'),(85,'file',0,'command','在线命令管理','fa fa-terminal','','','',1,NULL,'',1617980543,1617980543,0,'normal'),(86,'file',85,'command/index','查看','fa fa-circle-o','','','',0,NULL,'',1617980543,1617980543,0,'normal'),(87,'file',85,'command/add','添加','fa fa-circle-o','','','',0,NULL,'',1617980543,1617980543,0,'normal'),(88,'file',85,'command/detail','详情','fa fa-circle-o','','','',0,NULL,'',1617980543,1617980543,0,'normal'),(89,'file',85,'command/execute','运行','fa fa-circle-o','','','',0,NULL,'',1617980543,1617980543,0,'normal'),(90,'file',85,'command/del','删除','fa fa-circle-o','','','',0,NULL,'',1617980543,1617980543,0,'normal'),(91,'file',85,'command/multi','批量更新','fa fa-circle-o','','','',0,NULL,'',1617980543,1617980543,0,'normal'),(92,'file',0,'vote','投票管理','fa fa-bar-chart','','','',1,'addtabs','',1617980564,1618302087,140,'normal'),(93,'file',92,'vote/subject','投票项目管理','fa fa-list','','','新建投票项目，或对原有投票项目进行管理',1,'addtabs','',1617980564,1621950397,0,'normal'),(94,'file',93,'vote/subject/index','查看','fa fa-circle-o','','','',0,NULL,'',1617980564,1617980564,0,'normal'),(95,'file',93,'vote/subject/add','添加','fa fa-circle-o','','','',0,NULL,'',1617980564,1617980564,0,'normal'),(96,'file',93,'vote/subject/edit','编辑','fa fa-circle-o','','','',0,NULL,'',1617980564,1617980564,0,'normal'),(97,'file',93,'vote/subject/del','删除','fa fa-circle-o','','','',0,NULL,'',1617980564,1617980564,0,'normal'),(98,'file',93,'vote/subject/multi','批量更新','fa fa-circle-o','','','',0,NULL,'',1617980564,1617980564,0,'normal'),(99,'file',92,'vote/player','投票选手(项)管理','fa fa-users','','','对投票选手或投票选项进行维护管理，审核',1,'addtabs','',1617980564,1621950537,0,'normal'),(100,'file',99,'vote/player/index','查看','fa fa-circle-o','','','',0,NULL,'',1617980564,1617980564,0,'normal'),(101,'file',99,'vote/player/add','添加','fa fa-circle-o','','','',0,NULL,'',1617980564,1617980564,0,'normal'),(102,'file',99,'vote/player/edit','编辑','fa fa-circle-o','','','',0,NULL,'',1617980564,1617980564,0,'normal'),(103,'file',99,'vote/player/del','删除','fa fa-circle-o','','','',0,NULL,'',1617980564,1617980564,0,'normal'),(104,'file',99,'vote/player/multi','批量更新','fa fa-circle-o','','','',0,NULL,'',1617980564,1617980564,0,'normal'),(105,'file',99,'vote/player/import','导入','fa fa-circle-o','','','',0,NULL,'',1617980564,1617980564,0,'normal'),(106,'file',99,'vote/player/detail','详情','fa fa-circle-o','','','',0,NULL,'',1617980564,1617980564,0,'normal'),(107,'file',92,'vote/category','项目分类管理','fa fa-leaf','','','',0,NULL,'',1617980564,1617980564,0,'normal'),(108,'file',107,'vote/category/index','查看','fa fa-circle-o','','','',0,NULL,'',1617980564,1617980564,0,'normal'),(109,'file',107,'vote/category/add','添加','fa fa-circle-o','','','',0,NULL,'',1617980564,1617980564,0,'normal'),(110,'file',107,'vote/category/edit','编辑','fa fa-circle-o','','','',0,NULL,'',1617980564,1617980564,0,'normal'),(111,'file',107,'vote/category/del','删除','fa fa-circle-o','','','',0,NULL,'',1617980564,1617980564,0,'normal'),(112,'file',107,'vote/category/multi','批量更新','fa fa-circle-o','','','',0,NULL,'',1617980564,1617980564,0,'normal'),(113,'file',107,'vote/category/import','导入','fa fa-circle-o','','','',0,NULL,'',1617980564,1617980564,0,'normal'),(114,'file',92,'vote/statistics','项目统计报表','fa fa-bar-chart','','','',0,NULL,'',1617980564,1617980564,0,'normal'),(115,'file',114,'vote/statistics/index','查看','fa fa-circle-o','','','',0,NULL,'',1617980564,1617980564,0,'normal'),(116,'file',92,'vote/record','投票记录管理','fa fa-list','','','',1,NULL,'',1617980564,1617980564,0,'normal'),(117,'file',116,'vote/record/index','查看','fa fa-circle-o','','','',0,NULL,'',1617980564,1617980564,0,'normal'),(118,'file',116,'vote/record/add','添加','fa fa-circle-o','','','',0,NULL,'',1617980564,1617980564,0,'normal'),(119,'file',116,'vote/record/edit','编辑','fa fa-circle-o','','','',0,NULL,'',1617980564,1617980564,0,'normal'),(120,'file',116,'vote/record/del','删除','fa fa-circle-o','','','',0,NULL,'',1617980564,1617980564,0,'normal'),(121,'file',116,'vote/record/multi','批量更新','fa fa-circle-o','','','',0,NULL,'',1617980564,1617980564,0,'normal'),(122,'file',92,'vote/comment','投票评论管理','fa fa-comment','','','对投票的评论区信息进行审核，决定是否可见，进行风控',1,'addtabs','',1617980564,1621950567,0,'normal'),(123,'file',122,'vote/comment/index','查看','fa fa-circle-o','','','',0,NULL,'',1617980564,1617980564,0,'normal'),(124,'file',122,'vote/comment/add','添加','fa fa-circle-o','','','',0,NULL,'',1617980564,1617980564,0,'normal'),(125,'file',122,'vote/comment/edit','编辑','fa fa-circle-o','','','',0,NULL,'',1617980564,1617980564,0,'normal'),(126,'file',122,'vote/comment/del','删除','fa fa-circle-o','','','',0,NULL,'',1617980564,1617980564,0,'normal'),(127,'file',122,'vote/comment/multi','批量更新','fa fa-circle-o','','','',0,NULL,'',1617980564,1617980564,0,'normal'),(128,'file',92,'vote/fields','投票字段管理','fa fa-circle-o','','','',0,NULL,'',1617980564,1617980564,0,'normal'),(129,'file',128,'vote/fields/index','查看','fa fa-circle-o','','','',0,NULL,'',1617980564,1617980564,0,'normal'),(130,'file',128,'vote/fields/add','添加','fa fa-circle-o','','','',0,NULL,'',1617980564,1617980564,0,'normal'),(131,'file',128,'vote/fields/edit','编辑','fa fa-circle-o','','','',0,NULL,'',1617980564,1617980564,0,'normal'),(132,'file',128,'vote/fields/del','删除','fa fa-circle-o','','','',0,NULL,'',1617980564,1617980564,0,'normal'),(133,'file',128,'vote/fields/multi','批量更新','fa fa-circle-o','','','',0,NULL,'',1617980564,1617980564,0,'normal'),(134,'file',0,'wechat','微信管理','fa fa-wechat','','','',1,'addtabs','',1617980590,1618302104,139,'normal'),(135,'file',134,'wechat/autoreply','自动回复管理','fa fa-reply-all','','','',1,NULL,'',1617980590,1617980590,0,'normal'),(136,'file',135,'wechat/autoreply/index','查看','fa fa-circle-o','','','',0,NULL,'',1617980590,1617980590,0,'normal'),(137,'file',135,'wechat/autoreply/add','添加','fa fa-circle-o','','','',0,NULL,'',1617980590,1617980590,0,'normal'),(138,'file',135,'wechat/autoreply/edit','修改','fa fa-circle-o','','','',0,NULL,'',1617980590,1617980590,0,'normal'),(139,'file',135,'wechat/autoreply/del','删除','fa fa-circle-o','','','',0,NULL,'',1617980590,1617980590,0,'normal'),(140,'file',135,'wechat/autoreply/multi','批量更新','fa fa-circle-o','','','',0,NULL,'',1617980590,1617980590,0,'normal'),(141,'file',134,'wechat/config','配置管理','fa fa-cog','','','',1,NULL,'',1617980590,1617980590,0,'normal'),(142,'file',141,'wechat/config/index','查看','fa fa-circle-o','','','',0,NULL,'',1617980590,1617980590,0,'normal'),(143,'file',141,'wechat/config/add','添加','fa fa-circle-o','','','',0,NULL,'',1617980590,1617980590,0,'normal'),(144,'file',141,'wechat/config/edit','修改','fa fa-circle-o','','','',0,NULL,'',1617980590,1617980590,0,'normal'),(145,'file',141,'wechat/config/del','删除','fa fa-circle-o','','','',0,NULL,'',1617980590,1617980590,0,'normal'),(146,'file',141,'wechat/config/multi','批量更新','fa fa-circle-o','','','',0,NULL,'',1617980590,1617980590,0,'normal'),(147,'file',134,'wechat/menu','菜单管理','fa fa-list','','','微信公众号自定义菜单维护',1,'addtabs','',1617980590,1621950587,0,'normal'),(148,'file',147,'wechat/menu/index','查看','fa fa-circle-o','','','',0,NULL,'',1617980590,1617980590,0,'normal'),(149,'file',147,'wechat/menu/add','添加','fa fa-circle-o','','','',0,NULL,'',1617980590,1617980590,0,'normal'),(150,'file',147,'wechat/menu/edit','修改','fa fa-circle-o','','','',0,NULL,'',1617980590,1617980590,0,'normal'),(151,'file',147,'wechat/menu/del','删除','fa fa-circle-o','','','',0,NULL,'',1617980590,1617980590,0,'normal'),(152,'file',147,'wechat/menu/remote','加载远程菜单','fa fa-circle-o','','','',0,NULL,'',1617980590,1617980590,0,'normal'),(153,'file',147,'wechat/menu/sync','同步','fa fa-circle-o','','','',0,NULL,'',1617980590,1617980590,0,'normal'),(154,'file',147,'wechat/menu/multi','批量更新','fa fa-circle-o','','','',0,NULL,'',1617980590,1617980590,0,'normal'),(155,'file',134,'wechat/response','资源管理','fa fa-list-alt','','','',1,NULL,'',1617980590,1617980590,0,'normal'),(156,'file',155,'wechat/response/index','查看','fa fa-circle-o','','','',0,NULL,'',1617980590,1617980590,0,'normal'),(157,'file',155,'wechat/response/add','添加','fa fa-circle-o','','','',0,NULL,'',1617980590,1617980590,0,'normal'),(158,'file',155,'wechat/response/edit','修改','fa fa-circle-o','','','',0,NULL,'',1617980590,1617980590,0,'normal'),(159,'file',155,'wechat/response/del','删除','fa fa-circle-o','','','',0,NULL,'',1617980590,1617980590,0,'normal'),(160,'file',155,'wechat/response/select','选择','fa fa-circle-o','','','',0,NULL,'',1617980590,1617980590,0,'normal'),(161,'file',155,'wechat/response/multi','批量更新','fa fa-circle-o','','','',0,NULL,'',1617980590,1617980590,0,'normal'),(162,'file',0,'third','第三方登录管理','fa fa-users','','','',1,NULL,'',1617980600,1617980600,0,'normal'),(163,'file',162,'third/index','查看','fa fa-circle-o','','','',0,NULL,'',1617980600,1617980600,0,'normal'),(164,'file',162,'third/del','删除','fa fa-circle-o','','','',0,NULL,'',1617980600,1617980600,0,'normal'),(165,'file',0,'question','问题反馈','fa fa-list','','','',1,'addtabs','',1618299812,1618299916,141,'normal'),(166,'file',165,'question/type','问题分类','fa fa-circle-o','','','设置反馈问题的类别，方便后台分类处理和统计',1,'addtabs','',1618299812,1618299980,0,'normal'),(167,'file',166,'question/type/import','Import','fa fa-circle-o','','','',0,NULL,'',1618299812,1618299812,0,'normal'),(168,'file',166,'question/type/index','查看','fa fa-circle-o','','','',0,NULL,'',1618299812,1618299812,0,'normal'),(169,'file',166,'question/type/add','添加','fa fa-circle-o','','','',0,NULL,'',1618299812,1618299812,0,'normal'),(170,'file',166,'question/type/edit','编辑','fa fa-circle-o','','','',0,NULL,'',1618299812,1618299812,0,'normal'),(171,'file',166,'question/type/del','删除','fa fa-circle-o','','','',0,NULL,'',1618299812,1618299812,0,'normal'),(172,'file',166,'question/type/multi','批量更新','fa fa-circle-o','','','',0,NULL,'',1618299812,1618299812,0,'normal'),(173,'file',165,'question/questioninfo','反馈问题','fa fa-circle-o','','','查看业主反馈的问题',1,'addtabs','',1618301376,1621950455,0,'normal'),(174,'file',173,'question/questioninfo/import','Import','fa fa-circle-o','','','',0,NULL,'',1618301376,1618301376,0,'normal'),(175,'file',173,'question/questioninfo/index','查看','fa fa-circle-o','','','',0,NULL,'',1618301376,1618301376,0,'normal'),(176,'file',173,'question/questioninfo/add','添加','fa fa-circle-o','','','',0,NULL,'',1618301376,1618301376,0,'normal'),(177,'file',173,'question/questioninfo/edit','编辑','fa fa-circle-o','','','',0,NULL,'',1618301376,1618301376,0,'normal'),(178,'file',173,'question/questioninfo/del','删除','fa fa-circle-o','','','',0,NULL,'',1618301376,1618301376,0,'normal'),(179,'file',173,'question/questioninfo/multi','批量更新','fa fa-circle-o','','','',0,NULL,'',1618301376,1618301376,0,'normal'),(188,'file',0,'door','门禁管理','fa fa-list','','','',1,'addtabs','',1621950223,1621950285,138,'normal'),(189,'file',188,'door/doorinfo','门禁点信息','fa fa-circle-o','','','对小区存在的门禁信息点进行维护，供业主选择远程开启',1,'addtabs','',1621950223,1621950622,0,'normal'),(190,'file',189,'door/doorinfo/import','Import','fa fa-circle-o','','','',0,NULL,'',1621950223,1621950223,0,'normal'),(191,'file',189,'door/doorinfo/index','查看','fa fa-circle-o','','','',0,NULL,'',1621950223,1621950223,0,'normal'),(192,'file',189,'door/doorinfo/add','添加','fa fa-circle-o','','','',0,NULL,'',1621950223,1621950223,0,'normal'),(193,'file',189,'door/doorinfo/edit','编辑','fa fa-circle-o','','','',0,NULL,'',1621950223,1621950223,0,'normal'),(194,'file',189,'door/doorinfo/del','删除','fa fa-circle-o','','','',0,NULL,'',1621950223,1621950223,0,'normal'),(195,'file',189,'door/doorinfo/multi','批量更新','fa fa-circle-o','','','',0,NULL,'',1621950223,1621950223,0,'normal'),(196,'file',188,'door/doorrecord','开门记录','fa fa-circle-o','','','查看远程开门禁记录及执行状态',1,'addtabs','',1621953143,1621955600,0,'normal'),(197,'file',196,'door/doorrecord/import','Import','fa fa-circle-o','','','',0,NULL,'',1621953143,1621953143,0,'normal'),(198,'file',196,'door/doorrecord/index','查看','fa fa-circle-o','','','',0,NULL,'',1621953143,1621953143,0,'normal'),(199,'file',196,'door/doorrecord/add','添加','fa fa-circle-o','','','',0,NULL,'',1621953143,1621953143,0,'normal'),(200,'file',196,'door/doorrecord/edit','编辑','fa fa-circle-o','','','',0,NULL,'',1621953143,1621953143,0,'normal'),(201,'file',196,'door/doorrecord/del','删除','fa fa-circle-o','','','',0,NULL,'',1621953143,1621953143,0,'normal'),(202,'file',196,'door/doorrecord/multi','批量更新','fa fa-circle-o','','','',0,NULL,'',1621953143,1621953143,0,'normal');
/*!40000 ALTER TABLE `smart_auth_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smart_category`
--

DROP TABLE IF EXISTS `smart_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `smart_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父ID',
  `type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '栏目类型',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '',
  `flag` set('hot','index','recommend') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '',
  `image` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '图片',
  `keywords` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '关键字',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '描述',
  `diyname` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '自定义名称',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `weigh` int(10) NOT NULL DEFAULT '0' COMMENT '权重',
  `status` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `weigh` (`weigh`,`id`),
  KEY `pid` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='分类表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smart_category`
--

LOCK TABLES `smart_category` WRITE;
/*!40000 ALTER TABLE `smart_category` DISABLE KEYS */;
INSERT INTO `smart_category` VALUES (1,0,'page','官方新闻','news','recommend','/assets/img/qrcode.png','','','news',1491635035,1491635035,1,'normal'),(2,0,'page','移动应用','mobileapp','hot','/assets/img/qrcode.png','','','mobileapp',1491635035,1491635035,2,'normal'),(3,2,'page','微信公众号','wechatpublic','index','/assets/img/qrcode.png','','','wechatpublic',1491635035,1491635035,3,'normal'),(4,2,'page','Android开发','android','recommend','/assets/img/qrcode.png','','','android',1491635035,1491635035,4,'normal'),(5,0,'page','软件产品','software','recommend','/assets/img/qrcode.png','','','software',1491635035,1491635035,5,'normal'),(6,5,'page','网站建站','website','recommend','/assets/img/qrcode.png','','','website',1491635035,1491635035,6,'normal'),(7,5,'page','企业管理软件','company','index','/assets/img/qrcode.png','','','company',1491635035,1491635035,7,'normal'),(8,6,'page','PC端','website-pc','recommend','/assets/img/qrcode.png','','','website-pc',1491635035,1491635035,8,'normal'),(9,6,'page','移动端','website-mobile','recommend','/assets/img/qrcode.png','','','website-mobile',1491635035,1491635035,9,'normal'),(10,7,'page','CRM系统 ','company-crm','recommend','/assets/img/qrcode.png','','','company-crm',1491635035,1491635035,10,'normal'),(11,7,'page','SASS平台软件','company-sass','recommend','/assets/img/qrcode.png','','','company-sass',1491635035,1491635035,11,'normal'),(12,0,'test','测试1','test1','recommend','/assets/img/qrcode.png','','','test1',1491635035,1491635035,12,'normal'),(13,0,'test','测试2','test2','recommend','/assets/img/qrcode.png','','','test2',1491635035,1491635035,13,'normal');
/*!40000 ALTER TABLE `smart_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smart_command`
--

DROP TABLE IF EXISTS `smart_command`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `smart_command` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `type` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '类型',
  `params` varchar(1500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '参数',
  `command` varchar(1500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '命令',
  `content` text COMMENT '返回结果',
  `executetime` int(10) unsigned DEFAULT NULL COMMENT '执行时间',
  `createtime` int(10) unsigned DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) unsigned DEFAULT NULL COMMENT '更新时间',
  `status` enum('successed','failured') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'failured' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COMMENT='在线命令表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smart_command`
--

LOCK TABLES `smart_command` WRITE;
/*!40000 ALTER TABLE `smart_command` DISABLE KEYS */;
INSERT INTO `smart_command` VALUES (1,'crud','[\"--table=smart_question_type\",\"--controller=question\\/type\"]','php think crud --table=smart_question_type --controller=question/type','Build Successed',1618299799,1618299799,1618299799,'successed'),(2,'menu','[\"--controller=question\\/Type\"]','php think menu --controller=question/Type','Build Successed!',1618299812,1618299812,1618299812,'successed'),(3,'crud','[\"--table=smart_question_info\",\"--controller=question\\/questioninfo\",\"--selectpagesuffix=question_type\",\"--editorsuffix=question_content\",\"--headingfilterfield=question_status\"]','php think crud --table=smart_question_info --controller=question/questioninfo --selectpagesuffix=question_type --editorsuffix=question_content --headingfilterfield=question_status','Build Successed',1618301351,1618301351,1618301351,'successed'),(4,'menu','[\"--controller=question\\/Questioninfo\"]','php think menu --controller=question/Questioninfo','Build Successed!',1618301376,1618301376,1618301376,'successed'),(5,'crud','[\"--force=1\",\"--table=smart_IO_info\",\"--controller=IO\\/IOinfo\"]','php think crud --force=1 --table=smart_IO_info --controller=IO/IOinfo','Build Successed',1621949708,1621949708,1621949709,'successed'),(6,'menu','[\"--controller=IO\\/IOinfo\"]','php think menu --controller=IO/IOinfo','Build Successed!',1621949718,1621949718,1621949718,'successed'),(7,'crud','[\"--force=1\",\"--table=smart_IO_info\",\"--controller=IO\\/IOinfo\"]','php think crud --force=1 --table=smart_IO_info --controller=IO/IOinfo','Build Successed',1621949750,1621949750,1621949750,'successed'),(8,'menu','[\"--controller=IO\\/IOinfo\"]','php think menu --controller=IO/IOinfo','Build Successed!',1621949761,1621949761,1621949761,'successed'),(9,'crud','[\"--delete=1\",\"--force=1\",\"--table=smart_door_info\",\"--controller=door\\/doorinfo\"]','php think crud --delete=1 --force=1 --table=smart_door_info --controller=door/doorinfo','/home/www/admin/localhost_9005/wwwroot/public/../application/admin/controller/door/Doorinfo.php\n/home/www/admin/localhost_9005/wwwroot/public/../application/admin/model/door/Doorinfo.php\n/home/www/admin/localhost_9005/wwwroot/public/../application/admin/validate/door/Doorinfo.php\n/home/www/admin/localhost_9005/wwwroot/application/admin/view/door/doorinfo/add.html\n/home/www/admin/localhost_9005/wwwroot/application/admin/view/door/doorinfo/edit.html\n/home/www/admin/localhost_9005/wwwroot/application/admin/view/door/doorinfo/index.html\n/home/www/admin/localhost_9005/wwwroot/application/admin/view/door/doorinfo/recyclebin.html\n/home/www/admin/localhost_9005/wwwroot/application/admin/lang/zh-cn/door/doorinfo.php\n/home/www/admin/localhost_9005/wwwroot/public/assets/js/backend/door/doorinfo.js\nDelete Successed',1621949989,1621949989,1621949990,'successed'),(10,'crud','[\"--force=1\",\"--table=smart_door_info\",\"--controller=door\\/doorinfo\"]','php think crud --force=1 --table=smart_door_info --controller=door/doorinfo','Build Successed',1621950082,1621950082,1621950082,'successed'),(11,'crud','[\"--delete=1\",\"--force=1\",\"--table=smart_door_info\",\"--controller=door\\/doorinfo\"]','php think crud --delete=1 --force=1 --table=smart_door_info --controller=door/doorinfo','/home/www/admin/localhost_9005/wwwroot/public/../application/admin/controller/door/Doorinfo.php\n/home/www/admin/localhost_9005/wwwroot/public/../application/admin/model/door/Doorinfo.php\n/home/www/admin/localhost_9005/wwwroot/public/../application/admin/validate/door/Doorinfo.php\n/home/www/admin/localhost_9005/wwwroot/application/admin/view/door/doorinfo/add.html\n/home/www/admin/localhost_9005/wwwroot/application/admin/view/door/doorinfo/edit.html\n/home/www/admin/localhost_9005/wwwroot/application/admin/view/door/doorinfo/index.html\n/home/www/admin/localhost_9005/wwwroot/application/admin/view/door/doorinfo/recyclebin.html\n/home/www/admin/localhost_9005/wwwroot/application/admin/lang/zh-cn/door/doorinfo.php\n/home/www/admin/localhost_9005/wwwroot/public/assets/js/backend/door/doorinfo.js\nDelete Successed',1621950114,1621950114,1621950114,'successed'),(12,'crud','[\"--delete=1\",\"--force=1\",\"--table=smart_door_info\",\"--controller=door\\/doorinfo\"]','php think crud --delete=1 --force=1 --table=smart_door_info --controller=door/doorinfo','/home/www/admin/localhost_9005/wwwroot/public/../application/admin/controller/door/Doorinfo.php\n/home/www/admin/localhost_9005/wwwroot/public/../application/admin/model/door/Doorinfo.php\n/home/www/admin/localhost_9005/wwwroot/public/../application/admin/validate/door/Doorinfo.php\n/home/www/admin/localhost_9005/wwwroot/application/admin/view/door/doorinfo/add.html\n/home/www/admin/localhost_9005/wwwroot/application/admin/view/door/doorinfo/edit.html\n/home/www/admin/localhost_9005/wwwroot/application/admin/view/door/doorinfo/index.html\n/home/www/admin/localhost_9005/wwwroot/application/admin/view/door/doorinfo/recyclebin.html\n/home/www/admin/localhost_9005/wwwroot/application/admin/lang/zh-cn/door/doorinfo.php\n/home/www/admin/localhost_9005/wwwroot/public/assets/js/backend/door/doorinfo.js\nDelete Successed',1621950130,1621950130,1621950130,'successed'),(13,'crud','[\"--delete=1\",\"--force=1\",\"--table=smart_door_info\",\"--controller=io\\/ioinfo\"]','php think crud --delete=1 --force=1 --table=smart_door_info --controller=io/ioinfo','/home/www/admin/localhost_9005/wwwroot/public/../application/admin/controller/io/Ioinfo.php\n/home/www/admin/localhost_9005/wwwroot/public/../application/admin/model/io/Ioinfo.php\n/home/www/admin/localhost_9005/wwwroot/public/../application/admin/validate/io/Ioinfo.php\n/home/www/admin/localhost_9005/wwwroot/application/admin/view/io/ioinfo/add.html\n/home/www/admin/localhost_9005/wwwroot/application/admin/view/io/ioinfo/edit.html\n/home/www/admin/localhost_9005/wwwroot/application/admin/view/io/ioinfo/index.html\n/home/www/admin/localhost_9005/wwwroot/application/admin/view/io/ioinfo/recyclebin.html\n/home/www/admin/localhost_9005/wwwroot/application/admin/lang/zh-cn/io/ioinfo.php\n/home/www/admin/localhost_9005/wwwroot/public/assets/js/backend/io/ioinfo.js\nDelete Successed',1621950154,1621950154,1621950154,'successed'),(14,'crud','[\"--force=1\",\"--table=smart_door_info\",\"--controller=door\\/doorinfo\"]','php think crud --force=1 --table=smart_door_info --controller=door/doorinfo','Build Successed',1621950178,1621950178,1621950179,'successed'),(15,'menu','[\"--delete=1\",\"--controller=IO\\/IOinfo\"]','php think menu --delete=1 --controller=IO/IOinfo','There is no menu to delete',1621950195,1621950195,1621950195,'failured'),(16,'menu','[\"--controller=door\\/Doorinfo\"]','php think menu --controller=door/Doorinfo','Build Successed!',1621950223,1621950223,1621950223,'successed'),(17,'crud','[\"--force=1\",\"--table=smart_door_record\",\"--controller=door\\/doorrecord\"]','php think crud --force=1 --table=smart_door_record --controller=door/doorrecord','Build Successed',1621953124,1621953124,1621953125,'successed'),(18,'menu','[\"--controller=door\\/Doorrecord\"]','php think menu --controller=door/Doorrecord','Build Successed!',1621953143,1621953143,1621953143,'successed'),(19,'crud','[\"--force=1\",\"--table=smart_door_record\",\"--controller=door\\/doorrecord\"]','php think crud --force=1 --table=smart_door_record --controller=door/doorrecord','Build Successed',1621953504,1621953504,1621953504,'successed'),(20,'crud','[\"--force=1\",\"--table=smart_door_record\",\"--controller=door\\/doorrecord\"]','php think crud --force=1 --table=smart_door_record --controller=door/doorrecord','Build Successed',1621955507,1621955507,1621955507,'successed'),(21,'crud','[\"--force=1\",\"--table=smart_door_record\",\"--controller=door\\/doorrecord\",\"--relation=smart_door_info\",\"--relationmode=belongsto\",\"--relationforeignkey=record_door_id\",\"--relationprimarykey=door_id\"]','php think crud --force=1 --table=smart_door_record --controller=door/doorrecord --relation=smart_door_info --relationmode=belongsto --relationforeignkey=record_door_id --relationprimarykey=door_id','Build Successed',1622042023,1622042023,1622042023,'successed'),(22,'crud','[\"--force=1\",\"--table=smart_door_info\",\"--controller=door\\/doorinfo\"]','php think crud --force=1 --table=smart_door_info --controller=door/doorinfo','Build Successed',1622380869,1622380869,1622380870,'successed'),(23,'crud','[\"--force=1\",\"--table=smart_door_info\",\"--controller=door\\/doorinfo\",\"--enumradiosuffix=door_type\"]','php think crud --force=1 --table=smart_door_info --controller=door/doorinfo --enumradiosuffix=door_type','Build Successed',1622381073,1622381073,1622381073,'successed'),(24,'crud','[\"--force=1\",\"--table=smart_door_info\",\"--controller=door\\/doorinfo\"]','php think crud --force=1 --table=smart_door_info --controller=door/doorinfo','Build Successed',1622381190,1622381190,1622381190,'successed'),(25,'crud','[\"--force=1\",\"--table=smart_door_info\",\"--controller=door\\/doorinfo\"]','php think crud --force=1 --table=smart_door_info --controller=door/doorinfo','Build Successed',1622383748,1622383748,1622383749,'successed');
/*!40000 ALTER TABLE `smart_command` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smart_config`
--

DROP TABLE IF EXISTS `smart_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `smart_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '变量名',
  `group` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '分组',
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '变量标题',
  `tip` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '变量描述',
  `type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '类型:string,text,int,bool,array,datetime,date,file',
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '变量值',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '变量字典数据',
  `rule` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '验证规则',
  `extend` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '扩展属性',
  `setting` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '配置',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='系统配置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smart_config`
--

LOCK TABLES `smart_config` WRITE;
/*!40000 ALTER TABLE `smart_config` DISABLE KEYS */;
INSERT INTO `smart_config` VALUES (1,'name','basic','Site name','请填写站点名称','string','智慧住建','','required','',''),(2,'beian','basic','Beian','粤ICP备15000000号-1','string','','','','',''),(3,'cdnurl','basic','Cdn url','如果全站静态资源使用第三方云储存请配置该值','string','','','','',''),(4,'version','basic','Version','如果静态资源有变动请重新配置该值','string','1.0.1','','required','',''),(5,'timezone','basic','Timezone','','string','Asia/Shanghai','','required','',''),(6,'forbiddenip','basic','Forbidden ip','一行一条记录','text','','','','',''),(7,'languages','basic','Languages','','array','{\"backend\":\"zh-cn\",\"frontend\":\"zh-cn\"}','','required','',''),(8,'fixedpage','basic','Fixed page','请尽量输入左侧菜单栏存在的链接','string','dashboard','','required','',''),(9,'categorytype','dictionary','Category type','','array','{\"default\":\"Default\",\"page\":\"Page\",\"article\":\"Article\",\"test\":\"Test\"}','','','',''),(10,'configgroup','dictionary','Config group','','array','{\"basic\":\"Basic\",\"email\":\"Email\",\"dictionary\":\"Dictionary\",\"user\":\"User\",\"example\":\"Example\"}','','','',''),(11,'mail_type','email','Mail type','选择邮件发送方式','select','1','[\"请选择\",\"SMTP\"]','','',''),(12,'mail_smtp_host','email','Mail smtp host','错误的配置发送邮件会导致服务器超时','string','smtp.qq.com','','','',''),(13,'mail_smtp_port','email','Mail smtp port','(不加密默认25,SSL默认465,TLS默认587)','string','465','','','',''),(14,'mail_smtp_user','email','Mail smtp user','（填写完整用户名）','string','10000','','','',''),(15,'mail_smtp_pass','email','Mail smtp password','（填写您的密码或授权码）','string','password','','','',''),(16,'mail_verify_type','email','Mail vertify type','（SMTP验证方式[推荐SSL]）','select','2','[\"无\",\"TLS\",\"SSL\"]','','',''),(17,'mail_from','email','Mail from','','string','10000@qq.com','','','','');
/*!40000 ALTER TABLE `smart_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smart_door_info`
--

DROP TABLE IF EXISTS `smart_door_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `smart_door_info` (
  `door_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '门禁点ID',
  `door_code` varchar(45) NOT NULL COMMENT '门禁点编号',
  `door_name` varchar(45) NOT NULL COMMENT '门禁点名称',
  `IO_garden` varchar(45) NOT NULL COMMENT '小区名称',
  `door_type` enum('0','1') DEFAULT NULL COMMENT '类型:0=门禁,1=道闸',
  `door_ip` varchar(45) DEFAULT NULL COMMENT '设备IP',
  `door_port` varchar(45) DEFAULT NULL COMMENT '设备端口',
  `door_username` varchar(45) DEFAULT NULL COMMENT '用户名',
  `door_password` varchar(45) DEFAULT NULL COMMENT '密码',
  `door_channlno` varchar(45) DEFAULT NULL COMMENT '通道号',
  PRIMARY KEY (`door_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='门禁点信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smart_door_info`
--

LOCK TABLES `smart_door_info` WRITE;
/*!40000 ALTER TABLE `smart_door_info` DISABLE KEYS */;
INSERT INTO `smart_door_info` VALUES (1,'01001','一号门','阳光小区','0','192.168.1.11','8000','admin','123456','1'),(4,'01004','四号门','阳光小区','0','192.168.1.11','8000','admin','123456','4'),(6,'01006','六号门','阳光小区','0','192.168.1.11','8000','admin','123456','6'),(7,'01007','七号门','阳光小区','0','192.168.1.11','8000','admin','123456','7'),(8,'01008','八号门','阳光小区','0','192.168.1.11','8000','admin','123456','8'),(9,'02001','综合楼','阳光小区','1','192.168.1.10','8000','admin','123456','1'),(10,'02002','2号门','阳光小区','1','192.168.1.10','8000','admin','123456','2');
/*!40000 ALTER TABLE `smart_door_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smart_door_record`
--

DROP TABLE IF EXISTS `smart_door_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `smart_door_record` (
  `record_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '开门记录ID',
  `record_door_id` varchar(45) DEFAULT NULL COMMENT '门禁点ID',
  `record_user` varchar(45) NOT NULL COMMENT '发起人',
  `record_send_time` int(10) DEFAULT NULL COMMENT '发送时间',
  `record_excute_time` int(11) DEFAULT NULL COMMENT '执行时间',
  `record_type` varchar(45) DEFAULT NULL COMMENT '动作类型',
  `record_status` enum('0','1','2') NOT NULL COMMENT '执行状态:0=已发送,1=已完成,2=异常',
  PRIMARY KEY (`record_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COMMENT='开门记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smart_door_record`
--

LOCK TABLES `smart_door_record` WRITE;
/*!40000 ALTER TABLE `smart_door_record` DISABLE KEYS */;
INSERT INTO `smart_door_record` VALUES (5,'1','admin',1622048136,NULL,'请求开门','1'),(6,'1','admin',1622048189,NULL,'请求开门','1'),(7,'1','admin',1622048214,NULL,'请求开门','1'),(8,'1','admin',1622048274,NULL,'请求开门','1'),(9,'1','admin',1622048295,NULL,'请求开门','1'),(10,'1','admin',1622048564,NULL,'请求开道闸','1'),(12,'4','admin',1622378655,NULL,'请求开门','1'),(13,'1','admin',1622378715,NULL,'请求开门','1'),(14,'9','admin',1622382125,NULL,'请求开道闸','1'),(15,'10','admin',1622382136,NULL,'请求开道闸','1'),(16,'8','admin',1622462320,NULL,'请求开门','1'),(17,'6','admin',1622462392,NULL,'请求开门','1'),(18,'8','admin',1622462473,NULL,'请求开门','1'),(19,'10','admin',1622462482,NULL,'请求开道闸','1'),(20,'1','admin',1622462497,NULL,'请求开门','1'),(21,'6','admin',1622462522,NULL,'请求开门','1'),(22,'9','admin',1622462556,NULL,'请求开道闸','1'),(23,'1','admin',1622462560,NULL,'请求开门','1'),(24,'1','admin',1622462637,NULL,'请求开门','1'),(25,'1','admin',1622462660,NULL,'请求开门','1'),(26,'1','admin',1622463668,NULL,'请求开门','1'),(27,'1','admin',1622465460,NULL,'请求开门','1'),(28,'1','admin',1622465714,NULL,'请求开门','1'),(29,'1','admin',1622465751,NULL,'请求开门','1'),(30,'8','admin',1622465802,NULL,'请求开门','1'),(31,'7','admin',1622465890,NULL,'请求开门','1');
/*!40000 ALTER TABLE `smart_door_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smart_ems`
--

DROP TABLE IF EXISTS `smart_ems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `smart_ems` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `event` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '事件',
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '邮箱',
  `code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '验证码',
  `times` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '验证次数',
  `ip` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'IP',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='邮箱验证码表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smart_ems`
--

LOCK TABLES `smart_ems` WRITE;
/*!40000 ALTER TABLE `smart_ems` DISABLE KEYS */;
/*!40000 ALTER TABLE `smart_ems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smart_question_info`
--

DROP TABLE IF EXISTS `smart_question_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `smart_question_info` (
  `question_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '问题ID',
  `question_title` varchar(45) DEFAULT NULL COMMENT '标题',
  `question_content` tinytext COMMENT '问题内容',
  `question_user_id` int(10) DEFAULT NULL COMMENT '反映人ID',
  `question_user` varchar(45) DEFAULT NULL COMMENT '反映人',
  `question_user_tel` varchar(45) DEFAULT NULL COMMENT '联系电话',
  `question_type` varchar(45) DEFAULT NULL COMMENT '问题类别',
  `question_datetime` varchar(45) DEFAULT NULL COMMENT '提交时间',
  `question_files` varchar(255) DEFAULT NULL COMMENT '附件',
  `question_operaotr` varchar(45) DEFAULT NULL COMMENT '处理人',
  `question_operate_option` varchar(45) DEFAULT NULL COMMENT '处理意见',
  `question_status` enum('0','1','2','3','4') DEFAULT NULL COMMENT '问题处理状态:0=提交,1=已受理,2=处理中,3=完结,4=收档',
  PRIMARY KEY (`question_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COMMENT='反馈问题';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smart_question_info`
--

LOCK TABLES `smart_question_info` WRITE;
/*!40000 ALTER TABLE `smart_question_info` DISABLE KEYS */;
INSERT INTO `smart_question_info` VALUES (1,'安全通道内杂特问题的反映','五号楼应急通道内，多个楼层堆放各种杂物，严重影响消防安全',7,'业主','12345678901','物业类','1618324651','/uploads/20210413/ffbdabe1c2b351d6cdc0da2fe8b6d71b.jpg','','','0'),(29,'这人真帅','这个男的真帅',7,'admin','15358691188',NULL,'1621867595','/uploads/20210524/888193def5da9a557f0249d20ce85087.jpg',NULL,'','0');
/*!40000 ALTER TABLE `smart_question_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smart_question_type`
--

DROP TABLE IF EXISTS `smart_question_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `smart_question_type` (
  `question_type_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '类别ID',
  `question_type` varchar(45) NOT NULL COMMENT '问题类别',
  PRIMARY KEY (`question_type_id`),
  UNIQUE KEY `question_type_UNIQUE` (`question_type`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='问题分类';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smart_question_type`
--

LOCK TABLES `smart_question_type` WRITE;
/*!40000 ALTER TABLE `smart_question_type` DISABLE KEYS */;
INSERT INTO `smart_question_type` VALUES (4,'收费类'),(2,'民生类'),(1,'物业类'),(3,'邻里类');
/*!40000 ALTER TABLE `smart_question_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smart_sms`
--

DROP TABLE IF EXISTS `smart_sms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `smart_sms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `event` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '事件',
  `mobile` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '手机号',
  `code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '验证码',
  `times` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '验证次数',
  `ip` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'IP',
  `createtime` int(10) unsigned DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='短信验证码表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smart_sms`
--

LOCK TABLES `smart_sms` WRITE;
/*!40000 ALTER TABLE `smart_sms` DISABLE KEYS */;
/*!40000 ALTER TABLE `smart_sms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smart_test`
--

DROP TABLE IF EXISTS `smart_test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `smart_test` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `admin_id` int(10) NOT NULL DEFAULT '0' COMMENT '管理员ID',
  `category_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分类ID(单选)',
  `category_ids` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '分类ID(多选)',
  `week` enum('monday','tuesday','wednesday') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '星期(单选):monday=星期一,tuesday=星期二,wednesday=星期三',
  `flag` set('hot','index','recommend') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '标志(多选):hot=热门,index=首页,recommend=推荐',
  `genderdata` enum('male','female') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'male' COMMENT '性别(单选):male=男,female=女',
  `hobbydata` set('music','reading','swimming') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '爱好(多选):music=音乐,reading=读书,swimming=游泳',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '标题',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '内容',
  `image` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '图片',
  `images` varchar(1500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '图片组',
  `attachfile` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '附件',
  `keywords` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '关键字',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '描述',
  `city` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '省市',
  `json` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '配置:key=名称,value=值',
  `price` float(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '价格',
  `views` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '点击',
  `startdate` date DEFAULT NULL COMMENT '开始日期',
  `activitytime` datetime DEFAULT NULL COMMENT '活动时间(datetime)',
  `year` year(4) DEFAULT NULL COMMENT '年',
  `times` time DEFAULT NULL COMMENT '时间',
  `refreshtime` int(10) DEFAULT NULL COMMENT '刷新时间(int)',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `deletetime` int(10) DEFAULT NULL COMMENT '删除时间',
  `weigh` int(10) NOT NULL DEFAULT '0' COMMENT '权重',
  `switch` tinyint(1) NOT NULL DEFAULT '0' COMMENT '开关',
  `status` enum('normal','hidden') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'normal' COMMENT '状态',
  `state` enum('0','1','2') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '状态值:0=禁用,1=正常,2=推荐',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='测试表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smart_test`
--

LOCK TABLES `smart_test` WRITE;
/*!40000 ALTER TABLE `smart_test` DISABLE KEYS */;
INSERT INTO `smart_test` VALUES (1,0,12,'12,13','monday','hot,index','male','music,reading','我是一篇测试文章','<p>我是测试内容</p>','/assets/img/avatar.png','/assets/img/avatar.png,/assets/img/qrcode.png','/assets/img/avatar.png','关键字','描述','广西壮族自治区/百色市/平果县','{\"a\":\"1\",\"b\":\"2\"}',0.00,0,'2017-07-10','2017-07-10 18:24:45',2017,'18:24:45',1491635035,1491635035,1491635035,NULL,0,1,'normal','1');
/*!40000 ALTER TABLE `smart_test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smart_third`
--

DROP TABLE IF EXISTS `smart_third`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `smart_third` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` int(10) unsigned DEFAULT '0' COMMENT '会员ID',
  `platform` varchar(30) DEFAULT '' COMMENT '第三方应用',
  `apptype` varchar(50) DEFAULT '' COMMENT '应用类型',
  `unionid` varchar(100) DEFAULT '' COMMENT '第三方UNIONID',
  `openid` varchar(100) DEFAULT '' COMMENT '第三方OPENID',
  `openname` varchar(100) DEFAULT '' COMMENT '第三方会员昵称',
  `access_token` varchar(255) DEFAULT '' COMMENT 'AccessToken',
  `refresh_token` varchar(255) DEFAULT 'RefreshToken',
  `expires_in` int(10) unsigned DEFAULT '0' COMMENT '有效期',
  `createtime` int(10) unsigned DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) unsigned DEFAULT NULL COMMENT '更新时间',
  `logintime` int(10) unsigned DEFAULT NULL COMMENT '登录时间',
  `expiretime` int(10) unsigned DEFAULT NULL COMMENT '过期时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `platform` (`platform`,`openid`),
  KEY `user_id` (`user_id`,`platform`),
  KEY `unionid` (`platform`,`unionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='第三方登录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smart_third`
--

LOCK TABLES `smart_third` WRITE;
/*!40000 ALTER TABLE `smart_third` DISABLE KEYS */;
/*!40000 ALTER TABLE `smart_third` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smart_user`
--

DROP TABLE IF EXISTS `smart_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `smart_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `group_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '组别ID',
  `username` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '用户名',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '昵称',
  `password` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '密码',
  `salt` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '密码盐',
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '电子邮箱',
  `mobile` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '手机号',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '头像',
  `level` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '等级',
  `gender` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '性别',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `bio` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '格言',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '余额',
  `score` int(10) NOT NULL DEFAULT '0' COMMENT '积分',
  `successions` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '连续登录天数',
  `maxsuccessions` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '最大连续登录天数',
  `prevtime` int(10) DEFAULT NULL COMMENT '上次登录时间',
  `logintime` int(10) DEFAULT NULL COMMENT '登录时间',
  `loginip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '登录IP',
  `loginfailure` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '失败次数',
  `joinip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '加入IP',
  `jointime` int(10) DEFAULT NULL COMMENT '加入时间',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `token` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'Token',
  `status` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '状态',
  `verification` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '验证',
  `buildingno` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '楼栋单元号',
  `parkingno` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '停车位',
  PRIMARY KEY (`id`),
  KEY `username` (`username`),
  KEY `email` (`email`),
  KEY `mobile` (`mobile`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='会员表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smart_user`
--

LOCK TABLES `smart_user` WRITE;
/*!40000 ALTER TABLE `smart_user` DISABLE KEYS */;
INSERT INTO `smart_user` VALUES (7,0,'admin','业主','8b4ad3e40e4223bd7f56d847a73a102b','d8PKil','99@qq.com','13801409049','/uploads/20210412/45b791433ba99f3b36c389c7db184ae8.jpg',0,1,'2021-04-12','这家伙太懒，只留下冒着热气的大',0.00,0,2,2,1622378645,1622462312,'192.168.0.102',0,'0',1618242245,1618242247,1622462312,'','normal','','星雨华府5号楼306','无');
/*!40000 ALTER TABLE `smart_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smart_user_group`
--

DROP TABLE IF EXISTS `smart_user_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `smart_user_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '组名',
  `rules` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '权限节点',
  `createtime` int(10) DEFAULT NULL COMMENT '添加时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `status` enum('normal','hidden') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='会员组表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smart_user_group`
--

LOCK TABLES `smart_user_group` WRITE;
/*!40000 ALTER TABLE `smart_user_group` DISABLE KEYS */;
INSERT INTO `smart_user_group` VALUES (1,'默认组','11,10,9,7,5,4,2,3,1',1491635035,1618239595,'normal');
/*!40000 ALTER TABLE `smart_user_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smart_user_money_log`
--

DROP TABLE IF EXISTS `smart_user_money_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `smart_user_money_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '变更余额',
  `before` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '变更前余额',
  `after` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '变更后余额',
  `memo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '备注',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='会员余额变动表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smart_user_money_log`
--

LOCK TABLES `smart_user_money_log` WRITE;
/*!40000 ALTER TABLE `smart_user_money_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `smart_user_money_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smart_user_rule`
--

DROP TABLE IF EXISTS `smart_user_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `smart_user_rule` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) DEFAULT NULL COMMENT '父ID',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '名称',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '标题',
  `remark` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `ismenu` tinyint(1) DEFAULT NULL COMMENT '是否菜单',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `weigh` int(10) DEFAULT '0' COMMENT '权重',
  `status` enum('normal','hidden') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='会员规则表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smart_user_rule`
--

LOCK TABLES `smart_user_rule` WRITE;
/*!40000 ALTER TABLE `smart_user_rule` DISABLE KEYS */;
INSERT INTO `smart_user_rule` VALUES (1,0,'index','Frontend','',1,1491635035,1491635035,1,'normal'),(2,0,'api','API Interface','',1,1491635035,1491635035,2,'normal'),(3,1,'user','User Module','',1,1491635035,1491635035,12,'normal'),(4,2,'user','User Module','',1,1491635035,1491635035,11,'normal'),(5,3,'index/user/login','Login','',0,1491635035,1491635035,5,'normal'),(6,3,'index/user/register','Register','',0,1491635035,1617974190,7,'hidden'),(7,3,'index/user/index','User Center','',0,1491635035,1491635035,9,'normal'),(8,3,'index/user/profile','Profile','',0,1491635035,1491635035,4,'normal'),(9,4,'api/user/login','Login','',0,1491635035,1491635035,6,'normal'),(10,4,'api/user/register','Register','',0,1491635035,1491635035,8,'normal'),(11,4,'api/user/index','User Center','',0,1491635035,1491635035,10,'normal'),(12,4,'api/user/profile','Profile','',0,1491635035,1491635035,3,'normal');
/*!40000 ALTER TABLE `smart_user_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smart_user_score_log`
--

DROP TABLE IF EXISTS `smart_user_score_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `smart_user_score_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `score` int(10) NOT NULL DEFAULT '0' COMMENT '变更积分',
  `before` int(10) NOT NULL DEFAULT '0' COMMENT '变更前积分',
  `after` int(10) NOT NULL DEFAULT '0' COMMENT '变更后积分',
  `memo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '备注',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='会员积分变动表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smart_user_score_log`
--

LOCK TABLES `smart_user_score_log` WRITE;
/*!40000 ALTER TABLE `smart_user_score_log` DISABLE KEYS */;
INSERT INTO `smart_user_score_log` VALUES (1,1,0,0,0,'管理员变更积分',1618145153),(2,1,0,0,0,'管理员变更积分',1618237277),(3,2,0,0,0,'管理员变更积分',1618237581),(4,6,0,0,0,'管理员变更积分',1618239575),(5,6,0,0,0,'管理员变更积分',1618241749),(6,6,0,0,0,'管理员变更积分',1618241756),(7,1,0,0,0,'管理员变更积分',1618241765),(8,6,0,0,0,'管理员变更积分',1618241799),(9,2,0,0,0,'管理员变更积分',1618241806);
/*!40000 ALTER TABLE `smart_user_score_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smart_user_token`
--

DROP TABLE IF EXISTS `smart_user_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `smart_user_token` (
  `token` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Token',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `expiretime` int(10) DEFAULT NULL COMMENT '过期时间',
  PRIMARY KEY (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='会员Token表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smart_user_token`
--

LOCK TABLES `smart_user_token` WRITE;
/*!40000 ALTER TABLE `smart_user_token` DISABLE KEYS */;
INSERT INTO `smart_user_token` VALUES ('71d8e5a3dd497c33e065b4f422bfe9ed80a6d407',7,1621866884,1624458884),('9d66fe99042ff90b0fdd172c79be3035f94d974a',7,1621783058,1624375058),('c783d7857c6238164ff6ed9bf535399323d891a6',7,1622462312,1625054312),('fbab6c63b4773671e572568544e263d14d59bfd9',7,1622378645,1624970645);
/*!40000 ALTER TABLE `smart_user_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smart_version`
--

DROP TABLE IF EXISTS `smart_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `smart_version` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `oldversion` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '旧版本号',
  `newversion` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '新版本号',
  `packagesize` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '包大小',
  `content` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '升级内容',
  `downloadurl` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '下载地址',
  `enforce` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '强制更新',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `weigh` int(10) NOT NULL DEFAULT '0' COMMENT '权重',
  `status` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='版本表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smart_version`
--

LOCK TABLES `smart_version` WRITE;
/*!40000 ALTER TABLE `smart_version` DISABLE KEYS */;
/*!40000 ALTER TABLE `smart_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smart_vote_category`
--

DROP TABLE IF EXISTS `smart_vote_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `smart_vote_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `subject_id` int(10) unsigned DEFAULT '0' COMMENT '投票项目ID',
  `pid` int(10) unsigned DEFAULT '0' COMMENT '父类ID',
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `image` varchar(100) DEFAULT NULL COMMENT '图片',
  `createtime` int(10) DEFAULT NULL COMMENT '添加时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `weigh` int(10) DEFAULT '0' COMMENT '权重',
  `status` enum('hidden','normal') DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='投票分类表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smart_vote_category`
--

LOCK TABLES `smart_vote_category` WRITE;
/*!40000 ALTER TABLE `smart_vote_category` DISABLE KEYS */;
INSERT INTO `smart_vote_category` VALUES (1,1,0,'维修类','',1618146185,1618146185,1,'normal'),(2,1,0,'民生类','',1618146196,1618146196,2,'normal');
/*!40000 ALTER TABLE `smart_vote_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smart_vote_comment`
--

DROP TABLE IF EXISTS `smart_vote_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `smart_vote_comment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `subject_id` int(10) DEFAULT NULL COMMENT '项目ID',
  `player_id` int(10) DEFAULT NULL COMMENT '参赛人ID',
  `user_id` int(10) DEFAULT NULL COMMENT '会员ID',
  `nickname` varchar(100) DEFAULT NULL COMMENT '昵称',
  `content` varchar(1500) DEFAULT NULL COMMENT '内容',
  `ip` varchar(50) DEFAULT NULL COMMENT 'IP',
  `createtime` int(10) DEFAULT NULL COMMENT '添加时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `status` enum('normal','hidden') DEFAULT 'hidden' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `player_id` (`player_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='投票评论表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smart_vote_comment`
--

LOCK TABLES `smart_vote_comment` WRITE;
/*!40000 ALTER TABLE `smart_vote_comment` DISABLE KEYS */;
INSERT INTO `smart_vote_comment` VALUES (1,1,1,1,'','还可以这么搞吗？','127.0.0.1',1618147553,1618147568,'normal'),(2,2,3,1,NULL,'真漂亮的小姐姐','192.168.0.101',1618152725,1618152725,'hidden'),(3,2,3,7,'','123456','127.0.0.1',1618323360,1618323381,'normal');
/*!40000 ALTER TABLE `smart_vote_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smart_vote_fields`
--

DROP TABLE IF EXISTS `smart_vote_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `smart_vote_fields` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `subject_id` int(10) NOT NULL DEFAULT '0' COMMENT '模型ID',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '名称',
  `type` varchar(30) NOT NULL DEFAULT '' COMMENT '类型',
  `title` varchar(30) NOT NULL DEFAULT '' COMMENT '标题',
  `content` text COMMENT '内容',
  `defaultvalue` varchar(100) NOT NULL DEFAULT '' COMMENT '默认值',
  `rule` varchar(100) DEFAULT '' COMMENT '验证规则',
  `msg` varchar(30) DEFAULT '0' COMMENT '错误消息',
  `ok` varchar(30) DEFAULT '0' COMMENT '成功消息',
  `tip` varchar(30) DEFAULT '' COMMENT '提示消息',
  `decimals` tinyint(1) DEFAULT NULL COMMENT '小数点',
  `length` mediumint(8) DEFAULT NULL COMMENT '长度',
  `minimum` smallint(6) DEFAULT NULL COMMENT '最小数量',
  `maximum` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '最大数量',
  `extend` varchar(255) NOT NULL DEFAULT '' COMMENT '扩展信息',
  `iscontribute` tinyint(1) DEFAULT '0' COMMENT '是否可投稿',
  `setting` varchar(1500) DEFAULT '' COMMENT '配置信息',
  `weigh` int(10) NOT NULL DEFAULT '0' COMMENT '排序',
  `createtime` int(10) DEFAULT NULL COMMENT '添加时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `status` enum('normal','hidden') NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `model_id` (`subject_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='投票报名字段表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smart_vote_fields`
--

LOCK TABLES `smart_vote_fields` WRITE;
/*!40000 ALTER TABLE `smart_vote_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `smart_vote_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smart_vote_player`
--

DROP TABLE IF EXISTS `smart_vote_player`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `smart_vote_player` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `subject_id` int(10) unsigned DEFAULT '0' COMMENT '项目ID',
  `category_id` int(10) unsigned DEFAULT '0' COMMENT '分类ID',
  `user_id` int(10) unsigned DEFAULT '0' COMMENT '会员ID',
  `number` int(10) unsigned DEFAULT '1' COMMENT '编号',
  `nickname` varchar(100) DEFAULT NULL COMMENT '昵称',
  `intro` varchar(100) DEFAULT NULL COMMENT '介绍',
  `content` text COMMENT '内容',
  `image` varchar(100) DEFAULT NULL COMMENT '图片',
  `bgcolor` varchar(30) DEFAULT NULL COMMENT '背景颜色',
  `banner` varchar(100) DEFAULT NULL COMMENT '背景图片',
  `votes` int(10) unsigned DEFAULT '0' COMMENT '得票数',
  `views` int(10) unsigned DEFAULT '0' COMMENT '浏览次数',
  `comments` int(10) unsigned DEFAULT '0' COMMENT '评论数',
  `applydata` text COMMENT '报名信息',
  `createtime` int(10) DEFAULT NULL COMMENT '添加时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `votetime` int(10) DEFAULT NULL COMMENT '投票时间',
  `memo` varchar(100) DEFAULT '' COMMENT '备注',
  `status` enum('normal','hidden','rejected') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'hidden' COMMENT '状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `subject_id_2` (`subject_id`,`number`),
  KEY `subject_id` (`subject_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='投票参赛表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smart_vote_player`
--

LOCK TABLES `smart_vote_player` WRITE;
/*!40000 ALTER TABLE `smart_vote_player` DISABLE KEYS */;
INSERT INTO `smart_vote_player` VALUES (1,1,1,0,1,'A方案（自筹资金）','一单元业主承担','相关费用由一单元62户业主承担','/uploads/20210411/acfe2a6af3faf001821ef7a02c3b4bcf.jpg','','',1,6,1,'[]',1618146374,1618150011,1618146511,'','normal'),(2,1,1,0,2,'B方案（公共维修基金）','申请公众维修基金用于维修','申请公众维修基金用于维修','/uploads/20210411/b498dab6d5a9df523c56fbdaaaa75e69.jpg','','',0,1,0,'[]',1618146410,1618149995,1618146376,'','normal'),(3,2,0,1,1,'吴俊雷','吴俊雷任沤鸿物业管理部经理，工作兢兢业业，任劳任怨。对待业主为人和气，主动为业主排忧解难。','吴俊雷任沤鸿物业管理部经理，工作兢兢业业，任劳任怨。对待业主为人和气，主动为业主排忧解难。','/uploads/20210411/45b791433ba99f3b36c389c7db184ae8.jpg','','',9,10,2,'[]',1618151191,1618593199,1618593199,'','normal');
/*!40000 ALTER TABLE `smart_vote_player` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smart_vote_record`
--

DROP TABLE IF EXISTS `smart_vote_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `smart_vote_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT '0' COMMENT '会员ID',
  `subject_id` int(10) unsigned DEFAULT '0' COMMENT '投票项目ID',
  `player_id` int(10) unsigned DEFAULT '0' COMMENT '参赛人ID',
  `ip` varchar(50) DEFAULT NULL COMMENT 'IP',
  `createtime` int(10) DEFAULT NULL COMMENT '添加时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `subject_id` (`subject_id`,`player_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='投票记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smart_vote_record`
--

LOCK TABLES `smart_vote_record` WRITE;
/*!40000 ALTER TABLE `smart_vote_record` DISABLE KEYS */;
INSERT INTO `smart_vote_record` VALUES (1,1,1,1,'127.0.0.1',1618146511,1618146511),(2,1,2,3,'127.0.0.1',1618151217,1618151217),(3,1,2,3,'127.0.0.1',1618151244,1618151244),(4,1,2,3,'192.168.0.101',1618152706,1618152706),(5,1,2,3,'192.168.0.101',1618152708,1618152708),(6,7,2,3,'127.0.0.1',1618305847,1618305847),(7,7,2,3,'127.0.0.1',1618323301,1618323301),(8,0,2,3,'127.0.0.1',1618409961,1618409961),(9,7,2,3,'192.168.0.102',1618502843,1618502843),(10,7,2,3,'127.0.0.1',1618593199,1618593199);
/*!40000 ALTER TABLE `smart_vote_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smart_vote_subject`
--

DROP TABLE IF EXISTS `smart_vote_subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `smart_vote_subject` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT '0' COMMENT '会员ID',
  `title` varchar(100) DEFAULT NULL COMMENT '标题',
  `image` varchar(100) DEFAULT NULL COMMENT '图片',
  `keywords` varchar(255) DEFAULT NULL COMMENT '关键字',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `rules` varchar(1500) DEFAULT NULL COMMENT '规则',
  `intro` varchar(255) DEFAULT NULL COMMENT '介绍',
  `content` text COMMENT '内容',
  `banner` varchar(1500) DEFAULT NULL COMMENT '背景图片',
  `players` int(10) unsigned DEFAULT '0' COMMENT '参赛人数',
  `votes` int(10) unsigned DEFAULT '0' COMMENT '累积投票数',
  `voters` int(10) unsigned DEFAULT '0' COMMENT '累积投票人数',
  `views` int(10) unsigned DEFAULT '0' COMMENT '累积访问次数',
  `maxvoteplayers` int(10) unsigned DEFAULT '0' COMMENT '最大可投选手数',
  `pervoteplayers` int(10) unsigned DEFAULT '0' COMMENT '每天可投选手数',
  `maxvotenums` int(10) unsigned DEFAULT '0' COMMENT '总共可投票数',
  `pervotenums` int(10) unsigned DEFAULT '1' COMMENT '每天可投票数',
  `maxvotelimit` int(10) unsigned DEFAULT '0' COMMENT '为同一选手总最大投票数',
  `pervotelimit` int(10) unsigned DEFAULT '1' COMMENT '每天可为同一选手投票数',
  `maxcatevotenums` int(10) DEFAULT '0' COMMENT '总共同一分类最大投票数',
  `percatevotenums` int(10) DEFAULT '0' COMMENT '每天同一分类最大投票数',
  `maxcatevoteplayers` int(10) DEFAULT '0' COMMENT '同一分类最大可投选手数',
  `limitarea` varchar(255) DEFAULT '' COMMENT '限制区域',
  `needlogin` tinyint(1) unsigned DEFAULT '0' COMMENT '是否需要登录',
  `onlywechat` tinyint(1) unsigned DEFAULT '0' COMMENT '是否只在微信',
  `diyname` varchar(50) DEFAULT NULL COMMENT '自定义名称',
  `playername` varchar(50) DEFAULT NULL COMMENT '参赛名称',
  `subjecttpl` varchar(50) DEFAULT NULL COMMENT '项目页模板',
  `playertpl` varchar(50) DEFAULT NULL COMMENT '详情页模板',
  `ranktpl` varchar(50) DEFAULT NULL COMMENT '排行榜页模板',
  `applytpl` varchar(50) DEFAULT '' COMMENT '报名页模板',
  `applyfields` varchar(1500) DEFAULT NULL COMMENT '报名字段',
  `iscomment` tinyint(1) unsigned DEFAULT '1' COMMENT '是否允许评论',
  `isapply` tinyint(1) unsigned DEFAULT '1' COMMENT '是否开放报名',
  `setting` varchar(1500) DEFAULT '' COMMENT '项目配置',
  `pagesize` int(10) unsigned DEFAULT '0' COMMENT '分页大小',
  `begintime` int(10) DEFAULT NULL COMMENT '开始时间',
  `endtime` int(10) DEFAULT NULL COMMENT '结束时间',
  `createtime` int(10) DEFAULT NULL COMMENT '添加时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `status` enum('normal','hidden','expired','rejected') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'hidden' COMMENT '状态',
  `memo` varchar(100) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='投票项目表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smart_vote_subject`
--

LOCK TABLES `smart_vote_subject` WRITE;
/*!40000 ALTER TABLE `smart_vote_subject` DISABLE KEYS */;
INSERT INTO `smart_vote_subject` VALUES (1,0,'关于五号楼一单元一号电梯维修方案的投票','/uploads/20210411/21985bd56c746e1df1274c3e520039bc.jpg','电梯维修','需要更换吊装钢丝',NULL,'目前电梯已经过免费维保期，电梯吊装钢丝绳磨损严重，为安全起见，需要更换钢丝绳，目前更换方案已经，关于费用出处有两个方案供业主选择，即由一单元62户业主单独承担，或申请公共维修基金维修更换。','目前电梯已经过免费维保期，电梯吊装钢丝绳磨损严重，为安全起见，需要更换钢丝绳，目前更换方案已经，关于费用出处有两个方案供业主选择，即由一单元62户业主单独承担，或申请公共维修基金维修更换。','/uploads/20210411/ac8d5e112adfdebfa1a20f7c1978ede3.jpg',2,1,1,23,1,1,1,1,1,1,1,1,1,'',1,0,'电梯维修费用方案投票','方案','subject.html','player.html','rank.html','apply.html',NULL,1,0,'{\"contributefields\":[\"nickname\",\"image\",\"intro\",\"content\"]}',0,1618145775,1621342575,1618146151,1618146502,'normal',''),(2,0,'最美物业服务人员评选活动','/uploads/20210411/98403e953a4b62dfe2d78a2ff9951987.jpg','最美物业评选','最美物业服务人员评选活动',NULL,'2021年度沤鸿物业服务人员综合评选活动，请业主参与，评选出您身边最美物业人。','2021年度沤鸿物业服务人员综合评选活动，请业主参与，评选出您身边最美物业人。','/uploads/20210411/ac8d5e112adfdebfa1a20f7c1978ede3.jpg',1,9,3,39,10,2,0,5,0,0,0,0,0,'',0,0,'最美物业人评选','选手','subject.html','player.html','rank.html','apply.html',NULL,1,0,'{\"contributefields\":[\"nickname\",\"image\",\"intro\",\"content\"]}',0,1618150812,1622470812,1618151008,1618323335,'normal','');
/*!40000 ALTER TABLE `smart_vote_subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smart_wechat_autoreply`
--

DROP TABLE IF EXISTS `smart_wechat_autoreply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `smart_wechat_autoreply` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '标题',
  `text` varchar(100) NOT NULL DEFAULT '' COMMENT '触发文本',
  `eventkey` varchar(50) NOT NULL DEFAULT '' COMMENT '响应事件',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `weigh` int(10) NOT NULL DEFAULT '0' COMMENT '权重',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` varchar(30) NOT NULL DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `eventkey` (`eventkey`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='微信自动回复表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smart_wechat_autoreply`
--

LOCK TABLES `smart_wechat_autoreply` WRITE;
/*!40000 ALTER TABLE `smart_wechat_autoreply` DISABLE KEYS */;
INSERT INTO `smart_wechat_autoreply` VALUES (1,'输入hello','hello','58c7d908c4570','',1,1493366855,1493366855,'normal'),(2,'输入你好','你好','58fdfaa9e1965','',2,1493704976,1493704976,'normal');
/*!40000 ALTER TABLE `smart_wechat_autoreply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smart_wechat_captcha`
--

DROP TABLE IF EXISTS `smart_wechat_captcha`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `smart_wechat_captcha` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `event` varchar(100) DEFAULT '' COMMENT '事件',
  `openid` varchar(255) DEFAULT NULL COMMENT '用户openid',
  `context` varchar(20) DEFAULT NULL COMMENT '上下文',
  `code` varchar(30) DEFAULT NULL COMMENT '验证码',
  `times` int(10) unsigned DEFAULT '0' COMMENT '验证次数',
  `ip` varchar(50) DEFAULT '' COMMENT 'IP',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `ip` (`ip`,`event`) USING BTREE,
  KEY `openid` (`openid`(191),`event`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微信公众号验证码';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smart_wechat_captcha`
--

LOCK TABLES `smart_wechat_captcha` WRITE;
/*!40000 ALTER TABLE `smart_wechat_captcha` DISABLE KEYS */;
/*!40000 ALTER TABLE `smart_wechat_captcha` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smart_wechat_config`
--

DROP TABLE IF EXISTS `smart_wechat_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `smart_wechat_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '配置名称',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '配置标题',
  `value` text NOT NULL COMMENT '配置值',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='微信配置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smart_wechat_config`
--

LOCK TABLES `smart_wechat_config` WRITE;
/*!40000 ALTER TABLE `smart_wechat_config` DISABLE KEYS */;
INSERT INTO `smart_wechat_config` VALUES (1,'menu','微信菜单','[{\"name\":\"FastAdmin\",\"sub_button\":[{\"name\":\"官网\",\"type\":\"view\",\"url\":\"http:\\/\\/www.fastadmin.net\"},{\"name\":\"在线演示\",\"type\":\"click\",\"key\":\"\"},{\"name\":\"文档\",\"type\":\"view\",\"url\":\"http:\\/\\/doc.fastadmin.net\"}]},{\"name\":\"在线客服\",\"type\":\"click\",\"key\":\"58cb852984970\"},{\"name\":\"关于我们\",\"type\":\"click\",\"key\":\"58bf944aa0777\"}]',1497398820,1500538185),(2,'service','客服配置','{\"onlinetime\":\"09:00-18:00\",\"offlinemsg\":\"请在工作时间联系客服！\",\"nosessionmsg\":\"当前没有客服在线！请稍后重试！\",\"waitformsg\":\"请问有什么可以帮到您？\"}',1497429674,1497429674),(3,'signin','连续登录配置','{\"s1\":\"100\",\"s2\":\"200\",\"s3\":\"300\",\"sn\":\"500\"}',1497429711,1497429711);
/*!40000 ALTER TABLE `smart_wechat_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smart_wechat_context`
--

DROP TABLE IF EXISTS `smart_wechat_context`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `smart_wechat_context` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `openid` varchar(64) NOT NULL DEFAULT '',
  `type` varchar(30) NOT NULL DEFAULT '' COMMENT '类型',
  `eventkey` varchar(64) NOT NULL DEFAULT '',
  `command` varchar(64) NOT NULL DEFAULT '',
  `message` varchar(255) NOT NULL DEFAULT '' COMMENT '内容',
  `refreshtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后刷新时间',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `openid` (`openid`,`eventkey`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微信上下文表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smart_wechat_context`
--

LOCK TABLES `smart_wechat_context` WRITE;
/*!40000 ALTER TABLE `smart_wechat_context` DISABLE KEYS */;
/*!40000 ALTER TABLE `smart_wechat_context` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smart_wechat_response`
--

DROP TABLE IF EXISTS `smart_wechat_response`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `smart_wechat_response` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '资源名',
  `eventkey` varchar(128) NOT NULL DEFAULT '' COMMENT '事件',
  `type` enum('text','image','news','voice','video','music','link','app') NOT NULL DEFAULT 'text' COMMENT '类型',
  `content` text NOT NULL COMMENT '内容',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` varchar(30) NOT NULL DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `eventkey` (`eventkey`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='微信资源表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smart_wechat_response`
--

LOCK TABLES `smart_wechat_response` WRITE;
/*!40000 ALTER TABLE `smart_wechat_response` DISABLE KEYS */;
INSERT INTO `smart_wechat_response` VALUES (1,'签到送积分','58adaf7876aab','app','{\"app\":\"signin\"}','',1487777656,1487777656,'normal'),(2,'关于我们','58bf944aa0777','app','{\"app\":\"page\",\"id\":\"1\"}','',1488950346,1488950346,'normal'),(3,'自动回复1','58c7d908c4570','text','{\"content\":\"world\"}','',1489492232,1489492232,'normal'),(5,'自动回复2','58fdfaa9e1965','text','{\"content\":\"我是FastAdmin!\"}','',1493039785,1493039785,'normal');
/*!40000 ALTER TABLE `smart_wechat_response` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-31 21:23:43
