# ************************************************************
# Sequel Pro SQL dump
# Version 5446
#
# https://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.26)
# Database: tienchin
# Generation Time: 2022-05-05 11:48:52 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
SET NAMES utf8mb4;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table gen_table
# ------------------------------------------------------------

DROP TABLE IF EXISTS `gen_table`;

CREATE TABLE `gen_table` (
  `table_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='代码生成业务表';



# Dump of table gen_table_column
# ------------------------------------------------------------

DROP TABLE IF EXISTS `gen_table_column`;

CREATE TABLE `gen_table_column` (
  `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '字典类型',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='代码生成业务表字段';



# Dump of table sys_config
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_config`;

CREATE TABLE `sys_config` (
  `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) COLLATE utf8mb4_unicode_ci DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='参数配置表';

LOCK TABLES `sys_config` WRITE;
/*!40000 ALTER TABLE `sys_config` DISABLE KEYS */;

INSERT INTO `sys_config` (`config_id`, `config_name`, `config_key`, `config_value`, `config_type`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`)
VALUES
	(1,'主框架页-默认皮肤样式名称','sys.index.skinName','skin-blue','Y','admin','2022-04-21 19:29:25','',NULL,'蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow'),
	(2,'用户管理-账号初始密码','sys.user.initPassword','123456','Y','admin','2022-04-21 19:29:25','',NULL,'初始化密码 123456'),
	(3,'主框架页-侧边栏主题','sys.index.sideTheme','theme-dark','Y','admin','2022-04-21 19:29:25','',NULL,'深色主题theme-dark，浅色主题theme-light'),
	(4,'账号自助-验证码开关','sys.account.captchaOnOff','true','Y','admin','2022-04-21 19:29:25','',NULL,'是否开启验证码功能（true开启，false关闭）'),
	(5,'账号自助-是否开启用户注册功能','sys.account.registerUser','false','Y','admin','2022-04-21 19:29:25','',NULL,'是否开启注册用户功能（true开启，false关闭）');

/*!40000 ALTER TABLE `sys_config` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_dept
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_dept`;

CREATE TABLE `sys_dept` (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父部门id',
  `ancestors` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `leader` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '邮箱',
  `status` char(1) COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='部门表';

LOCK TABLES `sys_dept` WRITE;
/*!40000 ALTER TABLE `sys_dept` DISABLE KEYS */;

INSERT INTO `sys_dept` (`dept_id`, `parent_id`, `ancestors`, `dept_name`, `order_num`, `leader`, `phone`, `email`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`)
VALUES
	(100,0,'0','SiMa科技',0,'TienChin','15888888888','ry@qq.com','0','0','admin','2022-04-21 19:29:23','',NULL),
	(101,100,'0,100','深圳总公司',1,'TienChin','15888888888','ry@qq.com','0','0','admin','2022-04-21 19:29:23','',NULL),
	(102,100,'0,100','长沙分公司',2,'TienChin','15888888888','ry@qq.com','0','0','admin','2022-04-21 19:29:24','',NULL),
	(103,101,'0,100,101','研发部门',1,'TienChin','15888888888','ry@qq.com','0','0','admin','2022-04-21 19:29:24','',NULL),
	(104,101,'0,100,101','市场部门',2,'TienChin','15888888888','ry@qq.com','0','0','admin','2022-04-21 19:29:24','',NULL),
	(105,101,'0,100,101','测试部门',3,'TienChin','15888888888','ry@qq.com','0','0','admin','2022-04-21 19:29:24','',NULL),
	(106,101,'0,100,101','财务部门',4,'TienChin','15888888888','ry@qq.com','0','0','admin','2022-04-21 19:29:24','',NULL),
	(107,101,'0,100,101','运维部门',5,'TienChin','15888888888','ry@qq.com','0','0','admin','2022-04-21 19:29:24','',NULL),
	(108,102,'0,100,102','市场部门',1,'TienChin','15888888888','ry@qq.com','0','0','admin','2022-04-21 19:29:24','',NULL),
	(109,102,'0,100,102','财务部门',2,'TienChin','15888888888','ry@qq.com','0','0','admin','2022-04-21 19:29:24','',NULL);

/*!40000 ALTER TABLE `sys_dept` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_dict_data
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_dict_data`;

CREATE TABLE `sys_dict_data` (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) DEFAULT '0' COMMENT '字典排序',
  `dict_label` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) COLLATE utf8mb4_unicode_ci DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='字典数据表';

LOCK TABLES `sys_dict_data` WRITE;
/*!40000 ALTER TABLE `sys_dict_data` DISABLE KEYS */;

INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`)
VALUES
	(1,1,'男','0','sys_user_sex','','','Y','0','admin','2022-04-21 19:29:25','',NULL,'性别男'),
	(2,2,'女','1','sys_user_sex','','','N','0','admin','2022-04-21 19:29:25','',NULL,'性别女'),
	(3,3,'未知','2','sys_user_sex','','','N','0','admin','2022-04-21 19:29:25','',NULL,'性别未知'),
	(4,1,'显示','0','sys_show_hide','','primary','Y','0','admin','2022-04-21 19:29:25','',NULL,'显示菜单'),
	(5,2,'隐藏','1','sys_show_hide','','danger','N','0','admin','2022-04-21 19:29:25','',NULL,'隐藏菜单'),
	(6,1,'正常','0','sys_normal_disable','','primary','Y','0','admin','2022-04-21 19:29:25','',NULL,'正常状态'),
	(7,2,'停用','1','sys_normal_disable','','danger','N','0','admin','2022-04-21 19:29:25','',NULL,'停用状态'),
	(8,1,'正常','0','sys_job_status','','primary','Y','0','admin','2022-04-21 19:29:25','',NULL,'正常状态'),
	(9,2,'暂停','1','sys_job_status','','danger','N','0','admin','2022-04-21 19:29:25','',NULL,'停用状态'),
	(10,1,'默认','DEFAULT','sys_job_group','','','Y','0','admin','2022-04-21 19:29:25','',NULL,'默认分组'),
	(11,2,'系统','SYSTEM','sys_job_group','','','N','0','admin','2022-04-21 19:29:25','',NULL,'系统分组'),
	(12,1,'是','Y','sys_yes_no','','primary','Y','0','admin','2022-04-21 19:29:25','',NULL,'系统默认是'),
	(13,2,'否','N','sys_yes_no','','danger','N','0','admin','2022-04-21 19:29:25','',NULL,'系统默认否'),
	(14,1,'通知','1','sys_notice_type','','warning','Y','0','admin','2022-04-21 19:29:25','',NULL,'通知'),
	(15,2,'公告','2','sys_notice_type','','success','N','0','admin','2022-04-21 19:29:25','',NULL,'公告'),
	(16,1,'正常','0','sys_notice_status','','primary','Y','0','admin','2022-04-21 19:29:25','',NULL,'正常状态'),
	(17,2,'关闭','1','sys_notice_status','','danger','N','0','admin','2022-04-21 19:29:25','',NULL,'关闭状态'),
	(18,1,'新增','1','sys_oper_type','','info','N','0','admin','2022-04-21 19:29:25','',NULL,'新增操作'),
	(19,2,'修改','2','sys_oper_type','','info','N','0','admin','2022-04-21 19:29:25','',NULL,'修改操作'),
	(20,3,'删除','3','sys_oper_type','','danger','N','0','admin','2022-04-21 19:29:25','',NULL,'删除操作'),
	(21,4,'授权','4','sys_oper_type','','primary','N','0','admin','2022-04-21 19:29:25','',NULL,'授权操作'),
	(22,5,'导出','5','sys_oper_type','','warning','N','0','admin','2022-04-21 19:29:25','',NULL,'导出操作'),
	(23,6,'导入','6','sys_oper_type','','warning','N','0','admin','2022-04-21 19:29:25','',NULL,'导入操作'),
	(24,7,'强退','7','sys_oper_type','','danger','N','0','admin','2022-04-21 19:29:25','',NULL,'强退操作'),
	(25,8,'生成代码','8','sys_oper_type','','warning','N','0','admin','2022-04-21 19:29:25','',NULL,'生成操作'),
	(26,9,'清空数据','9','sys_oper_type','','danger','N','0','admin','2022-04-21 19:29:25','',NULL,'清空操作'),
	(27,1,'成功','0','sys_common_status','','primary','N','0','admin','2022-04-21 19:29:25','',NULL,'正常状态'),
	(28,2,'失败','1','sys_common_status','','danger','N','0','admin','2022-04-21 19:29:25','',NULL,'停用状态'),
	(100,1,'年卡折扣券','1','activity_type',NULL,NULL,'N','0','',NULL,'',NULL,'年费折扣卡'),
	(101,2,'年卡代金券','2','activity_type',NULL,NULL,'N','0','',NULL,'',NULL,'年费代金券'),
	(102,1,'小时','0','limit_time_type',NULL,NULL,'N','0','',NULL,'',NULL,NULL),
	(103,2,'天','1','limit_time_type',NULL,NULL,'N','0','',NULL,'',NULL,NULL),
	(104,3,'周','2','limit_time_type',NULL,NULL,'N','0','',NULL,'',NULL,NULL),
	(105,0,'已分配','1','clue_status_type',NULL,'default','N','0','admin','2022-04-30 17:19:29','',NULL,NULL),
	(106,1,'进行中','2','clue_status_type',NULL,'default','N','0','admin','2022-04-30 17:19:42','',NULL,NULL),
	(107,2,'已回收','3','clue_status_type',NULL,'default','N','0','admin','2022-04-30 17:20:15','admin','2022-04-30 17:20:23',NULL),
	(108,3,'伪线索','4','clue_status_type',NULL,'default','N','0','admin','2022-04-30 17:20:46','',NULL,NULL),
	(109,0,'近期报名','0','intention_level',NULL,'default','N','0','admin','2022-05-03 13:09:45','',NULL,NULL),
	(110,1,'考虑中，打算报名','1','intention_level',NULL,'default','N','0','admin','2022-05-03 13:10:12','',NULL,NULL),
	(111,2,'了解一下','2','intention_level',NULL,'default','N','0','admin','2022-05-03 13:10:45','',NULL,NULL),
	(112,3,'随便看看','3','intention_level',NULL,'default','N','0','admin','2022-05-03 13:10:56','',NULL,NULL),
	(113,0,'随便练练','0','intention_type',NULL,'default','N','0','admin','2022-05-03 13:17:55','',NULL,NULL),
	(114,1,'泰拳','1','intention_type',NULL,'default','N','0','admin','2022-05-03 13:18:06','',NULL,NULL),
	(115,2,'减肥','2','intention_type',NULL,'default','N','0','admin','2022-05-03 13:18:21','',NULL,NULL),
	(116,3,'舞蹈','3','intention_type',NULL,'default','N','0','admin','2022-05-03 13:18:37','',NULL,NULL),
	(117,4,'游泳','4','intention_type',NULL,'default','N','0','admin','2022-05-03 13:20:46','',NULL,NULL),
	(118,0,'空号','0','invalid_clue_type',NULL,NULL,'N','0','',NULL,'',NULL,NULL),
	(119,1,'无法联系','1','invalid_clue_type',NULL,NULL,'N','0','',NULL,'',NULL,NULL),
	(120,2,'停机','2','invalid_clue_type',NULL,NULL,'N','0','',NULL,'',NULL,NULL),
	(121,3,'其他','3','invalid_clue_type',NULL,NULL,'N','0','',NULL,'',NULL,NULL);

/*!40000 ALTER TABLE `sys_dict_data` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_dict_type
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_dict_type`;

CREATE TABLE `sys_dict_type` (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '字典类型',
  `status` char(1) COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`),
  UNIQUE KEY `dict_type` (`dict_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='字典类型表';

LOCK TABLES `sys_dict_type` WRITE;
/*!40000 ALTER TABLE `sys_dict_type` DISABLE KEYS */;

INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`)
VALUES
	(1,'用户性别','sys_user_sex','0','admin','2022-04-21 19:29:25','',NULL,'用户性别列表'),
	(2,'菜单状态','sys_show_hide','0','admin','2022-04-21 19:29:25','',NULL,'菜单状态列表'),
	(3,'系统开关','sys_normal_disable','0','admin','2022-04-21 19:29:25','',NULL,'系统开关列表'),
	(4,'任务状态','sys_job_status','0','admin','2022-04-21 19:29:25','',NULL,'任务状态列表'),
	(5,'任务分组','sys_job_group','0','admin','2022-04-21 19:29:25','',NULL,'任务分组列表'),
	(6,'系统是否','sys_yes_no','0','admin','2022-04-21 19:29:25','',NULL,'系统是否列表'),
	(7,'通知类型','sys_notice_type','0','admin','2022-04-21 19:29:25','',NULL,'通知类型列表'),
	(8,'通知状态','sys_notice_status','0','admin','2022-04-21 19:29:25','',NULL,'通知状态列表'),
	(9,'操作类型','sys_oper_type','0','admin','2022-04-21 19:29:25','',NULL,'操作类型列表'),
	(10,'系统状态','sys_common_status','0','admin','2022-04-21 19:29:25','',NULL,'登录状态列表'),
	(100,'促销类型','activity_type','0','admin',NULL,'',NULL,'促销活动类型'),
	(101,'回收时间单位','limit_time_type','0','admin',NULL,'',NULL,'线索/商机回收时间单位'),
	(102,'线索状态','clue_status_type','0','admin','2022-04-30 17:18:36','',NULL,NULL),
	(104,'意向等级','intention_level','0','admin','2022-05-03 13:08:45','',NULL,NULL),
	(105,'意向类型','intention_type','0','admin','2022-05-03 13:17:34','',NULL,NULL),
	(106,'无效线索类型','invalid_clue_type','0','',NULL,'',NULL,NULL);

/*!40000 ALTER TABLE `sys_dict_type` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_job
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_job`;

CREATE TABLE `sys_job` (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) COLLATE utf8mb4_unicode_ci DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`,`job_name`,`job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='定时任务调度表';

LOCK TABLES `sys_job` WRITE;
/*!40000 ALTER TABLE `sys_job` DISABLE KEYS */;

INSERT INTO `sys_job` (`job_id`, `job_name`, `job_group`, `invoke_target`, `cron_expression`, `misfire_policy`, `concurrent`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`)
VALUES
	(1,'系统默认（无参）','DEFAULT','ryTask.ryNoParams','0/10 * * * * ?','3','1','1','admin','2022-04-21 19:29:25','',NULL,''),
	(2,'系统默认（有参）','DEFAULT','ryTask.ryParams(\'ry\')','0/15 * * * * ?','3','1','1','admin','2022-04-21 19:29:25','',NULL,''),
	(3,'系统默认（多参）','DEFAULT','ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)','0/20 * * * * ?','3','1','1','admin','2022-04-21 19:29:25','',NULL,'');

/*!40000 ALTER TABLE `sys_job` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_job_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_job_log`;

CREATE TABLE `sys_job_log` (
  `job_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '日志信息',
  `status` char(1) COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '异常信息',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='定时任务调度日志表';



# Dump of table sys_logininfor
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_logininfor`;

CREATE TABLE `sys_logininfor` (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '操作系统',
  `status` char(1) COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '提示消息',
  `login_time` datetime DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='系统访问记录';

LOCK TABLES `sys_logininfor` WRITE;
/*!40000 ALTER TABLE `sys_logininfor` DISABLE KEYS */;

INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`)
VALUES
	(100,'admin','127.0.0.1','内网IP','Chrome 10','Mac OS X','1','验证码错误','2022-04-21 20:02:43'),
	(101,'admin','127.0.0.1','内网IP','Chrome 10','Mac OS X','0','登录成功','2022-04-21 20:02:46'),
	(102,'admin','127.0.0.1','内网IP','Chrome 10','Mac OS X','0','登录成功','2022-04-21 22:06:28'),
	(103,'admin','127.0.0.1','内网IP','Chrome 10','Mac OS X','1','验证码已失效','2022-04-21 23:11:50'),
	(104,'admin','127.0.0.1','内网IP','Chrome 10','Mac OS X','0','登录成功','2022-04-21 23:11:54'),
	(105,'admin','127.0.0.1','内网IP','Chrome 10','Mac OS X','0','登录成功','2022-04-23 08:09:02'),
	(106,'admin','127.0.0.1','内网IP','Chrome 10','Mac OS X','1','验证码错误','2022-04-23 08:21:12'),
	(107,'admin','127.0.0.1','内网IP','Chrome 10','Mac OS X','1','验证码错误','2022-04-23 08:21:15'),
	(108,'admin','127.0.0.1','内网IP','Chrome 10','Mac OS X','0','登录成功','2022-04-23 08:21:18'),
	(109,'admin','127.0.0.1','内网IP','Chrome 10','Mac OS X','0','登录成功','2022-04-23 09:21:25'),
	(110,'admin','127.0.0.1','内网IP','Chrome 10','Mac OS X','0','登录成功','2022-04-23 09:21:41'),
	(111,'admin','127.0.0.1','内网IP','Chrome 10','Mac OS X','0','登录成功','2022-04-23 11:40:56'),
	(112,'admin','127.0.0.1','内网IP','Chrome 10','Mac OS X','0','登录成功','2022-04-23 15:12:34'),
	(113,'admin','127.0.0.1','内网IP','Chrome 10','Mac OS X','0','退出成功','2022-04-23 16:02:47'),
	(114,'admin','127.0.0.1','内网IP','Chrome 10','Mac OS X','0','登录成功','2022-04-23 16:02:51'),
	(115,'admin','127.0.0.1','内网IP','Chrome 10','Mac OS X','0','退出成功','2022-04-23 16:02:57'),
	(116,'javaboy','127.0.0.1','内网IP','Chrome 10','Mac OS X','1','用户不存在/密码错误','2022-04-23 16:03:03'),
	(117,'javaboy','127.0.0.1','内网IP','Chrome 10','Mac OS X','0','登录成功','2022-04-23 16:03:11'),
	(118,'javaboy','127.0.0.1','内网IP','Chrome 10','Mac OS X','0','退出成功','2022-04-23 16:04:48'),
	(119,'admin','127.0.0.1','内网IP','Chrome 10','Mac OS X','0','登录成功','2022-04-23 16:04:52'),
	(120,'admin','127.0.0.1','内网IP','Chrome 10','Mac OS X','0','退出成功','2022-04-23 16:05:20'),
	(121,'javaboy','127.0.0.1','内网IP','Chrome 10','Mac OS X','1','用户不存在/密码错误','2022-04-23 16:05:27'),
	(122,'javaboy','127.0.0.1','内网IP','Chrome 10','Mac OS X','0','登录成功','2022-04-23 16:05:33'),
	(123,'javaboy','127.0.0.1','内网IP','Chrome 10','Mac OS X','0','退出成功','2022-04-23 16:06:00'),
	(124,'admin','127.0.0.1','内网IP','Chrome 10','Mac OS X','0','登录成功','2022-04-23 16:06:04'),
	(125,'admin','127.0.0.1','内网IP','Chrome 10','Mac OS X','0','登录成功','2022-04-23 17:15:27'),
	(126,'admin','127.0.0.1','内网IP','Chrome 10','Mac OS X','0','登录成功','2022-04-23 17:51:19'),
	(127,'admin','127.0.0.1','内网IP','Chrome 10','Mac OS X','0','登录成功','2022-04-25 14:36:26'),
	(128,'admin','127.0.0.1','内网IP','Chrome 10','Mac OS X','0','登录成功','2022-04-25 19:17:33'),
	(129,'admin','127.0.0.1','内网IP','Chrome 10','Mac OS X','0','登录成功','2022-04-25 21:02:43'),
	(130,'admin','127.0.0.1','内网IP','Chrome 10','Mac OS X','0','登录成功','2022-04-25 22:05:11'),
	(131,'admin','127.0.0.1','内网IP','Chrome 10','Mac OS X','0','登录成功','2022-04-26 18:58:19'),
	(132,'admin','127.0.0.1','内网IP','Chrome 10','Mac OS X','0','登录成功','2022-04-26 21:18:53'),
	(133,'admin','127.0.0.1','内网IP','Chrome 10','Mac OS X','0','登录成功','2022-04-27 21:34:58'),
	(134,'admin','127.0.0.1','内网IP','Chrome 10','Mac OS X','0','登录成功','2022-04-28 20:42:59'),
	(135,'admin','127.0.0.1','内网IP','Chrome 10','Mac OS X','0','登录成功','2022-04-28 23:01:08'),
	(136,'admin','127.0.0.1','内网IP','Chrome 10','Mac OS X','0','登录成功','2022-04-29 20:32:39'),
	(137,'admin','127.0.0.1','内网IP','Chrome 10','Mac OS X','0','登录成功','2022-04-29 20:59:24'),
	(138,'admin','127.0.0.1','内网IP','Chrome 10','Mac OS X','0','登录成功','2022-04-30 10:04:14'),
	(139,'admin','127.0.0.1','内网IP','Chrome 10','Mac OS X','0','登录成功','2022-04-30 16:30:28'),
	(140,'admin','127.0.0.1','内网IP','Chrome 10','Mac OS X','0','退出成功','2022-04-30 16:30:36'),
	(141,'admin','127.0.0.1','内网IP','Chrome 10','Mac OS X','0','登录成功','2022-04-30 16:30:51'),
	(142,'admin','127.0.0.1','内网IP','Chrome 10','Mac OS X','0','退出成功','2022-04-30 16:48:21'),
	(143,'admin','127.0.0.1','内网IP','Chrome 10','Mac OS X','0','登录成功','2022-04-30 16:50:47'),
	(144,'admin','127.0.0.1','内网IP','Chrome 10','Mac OS X','0','退出成功','2022-04-30 16:54:39'),
	(145,'admin','127.0.0.1','内网IP','Chrome 10','Mac OS X','0','登录成功','2022-04-30 16:55:07'),
	(146,'admin','127.0.0.1','内网IP','Chrome 10','Mac OS X','0','登录成功','2022-04-30 16:59:48'),
	(147,'admin','127.0.0.1','内网IP','Chrome 10','Mac OS X','0','登录成功','2022-04-30 17:08:49'),
	(148,'admin','127.0.0.1','内网IP','Chrome 10','Mac OS X','0','登录成功','2022-04-30 19:49:30'),
	(149,'admin','127.0.0.1','内网IP','Chrome 10','Mac OS X','0','登录成功','2022-04-30 22:16:34'),
	(150,'admin','127.0.0.1','内网IP','Chrome 10','Mac OS X','0','登录成功','2022-04-30 22:32:52'),
	(151,'admin','127.0.0.1','内网IP','Chrome 10','Mac OS X','0','登录成功','2022-05-01 19:31:28'),
	(152,'admin','127.0.0.1','内网IP','Chrome 10','Mac OS X','0','登录成功','2022-05-03 12:43:52'),
	(153,'admin','127.0.0.1','内网IP','Chrome 10','Mac OS X','0','登录成功','2022-05-03 13:39:44'),
	(154,'admin','127.0.0.1','内网IP','Chrome 10','Mac OS X','0','登录成功','2022-05-03 15:59:03'),
	(155,'admin','127.0.0.1','内网IP','Chrome 10','Mac OS X','0','登录成功','2022-05-03 16:32:09'),
	(156,'admin','127.0.0.1','内网IP','Chrome 10','Mac OS X','0','登录成功','2022-05-03 17:58:10'),
	(157,'admin','127.0.0.1','内网IP','Chrome 10','Mac OS X','0','登录成功','2022-05-03 20:25:22'),
	(158,'admin','127.0.0.1','内网IP','Chrome 10','Mac OS X','0','退出成功','2022-05-03 20:50:07'),
	(159,'itboyhub','127.0.0.1','内网IP','Chrome 10','Mac OS X','0','登录成功','2022-05-03 20:50:27'),
	(160,'admin','127.0.0.1','内网IP','Chrome 10','Mac OS X','0','登录成功','2022-05-03 20:51:12'),
	(161,'admin','127.0.0.1','内网IP','Chrome 10','Mac OS X','0','登录成功','2022-05-03 21:19:51'),
	(162,'admin','127.0.0.1','内网IP','Chrome 10','Mac OS X','0','登录成功','2022-05-04 11:24:10'),
	(163,'admin','127.0.0.1','内网IP','Chrome 10','Mac OS X','1','验证码错误','2022-05-04 16:43:55'),
	(164,'admin','127.0.0.1','内网IP','Chrome 10','Mac OS X','1','验证码错误','2022-05-04 16:43:57'),
	(165,'admin','127.0.0.1','内网IP','Chrome 10','Mac OS X','0','登录成功','2022-05-04 16:44:00'),
	(166,'admin','127.0.0.1','内网IP','Chrome 10','Mac OS X','0','登录成功','2022-05-05 19:42:05');

/*!40000 ALTER TABLE `sys_logininfor` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_menu
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_menu`;

CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父菜单ID',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `path` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '路由参数',
  `is_frame` int(1) DEFAULT '1' COMMENT '是否为外链（0是 1否）',
  `is_cache` int(1) DEFAULT '0' COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='菜单权限表';

LOCK TABLES `sys_menu` WRITE;
/*!40000 ALTER TABLE `sys_menu` DISABLE KEYS */;

INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`)
VALUES
	(1,'系统管理',0,20,'system',NULL,'',1,0,'M','0','0','','system','admin','2022-04-21 22:40:25','','2022-04-21 22:40:44','系统管理目录'),
	(2,'系统监控',1,10,'monitor',NULL,'',1,0,'M','0','0','','monitor','admin','2022-04-21 22:40:25','admin','2022-04-21 22:40:44','系统监控目录'),
	(3,'系统工具',1,11,'tool',NULL,'',1,0,'M','0','0','','tool','admin','2022-04-21 22:40:25','admin','2022-04-21 22:40:44','系统工具目录'),
	(4,'天勤官网',0,21,'http://tienchin.vip',NULL,'',0,0,'M','0','0','','guide','admin','2022-04-21 22:40:25','','2022-04-21 22:40:44','TienChin官网地址'),
	(100,'用户管理',1,1,'user','system/user/index','',1,0,'C','0','0','system:user:list','user','admin','2022-04-21 22:40:25','','2022-04-21 22:40:44','用户管理菜单'),
	(101,'角色管理',1,2,'role','system/role/index','',1,0,'C','0','0','system:role:list','peoples','admin','2022-04-21 22:40:25','','2022-04-21 22:40:44','角色管理菜单'),
	(102,'菜单管理',1,3,'menu','system/menu/index','',1,0,'C','0','0','system:menu:list','tree-table','admin','2022-04-21 22:40:25','','2022-04-21 22:40:44','菜单管理菜单'),
	(103,'部门管理',1,4,'dept','system/dept/index','',1,0,'C','0','0','system:dept:list','tree','admin','2022-04-21 22:40:25','','2022-04-21 22:40:44','部门管理菜单'),
	(104,'岗位管理',1,5,'post','system/post/index','',1,0,'C','0','0','system:post:list','post','admin','2022-04-21 22:40:25','','2022-04-21 22:40:44','岗位管理菜单'),
	(105,'字典管理',1,6,'dict','system/dict/index','',1,0,'C','0','0','system:dict:list','dict','admin','2022-04-21 22:40:25','','2022-04-21 22:40:44','字典管理菜单'),
	(106,'参数设置',1,7,'config','system/config/index','',1,0,'C','0','0','system:config:list','edit','admin','2022-04-21 22:40:25','','2022-04-21 22:40:44','参数设置菜单'),
	(107,'通知公告',1,8,'notice','system/notice/index','',1,0,'C','0','0','system:notice:list','message','admin','2022-04-21 22:40:25','','2022-04-21 22:40:44','通知公告菜单'),
	(108,'日志管理',1,9,'log','','',1,0,'M','0','0','','log','admin','2022-04-21 22:40:25','','2022-04-21 22:40:44','日志管理菜单'),
	(109,'在线用户',2,1,'online','monitor/online/index','',1,0,'C','0','0','monitor:online:list','online','admin','2022-04-21 22:40:25','','2022-04-21 22:40:44','在线用户菜单'),
	(110,'定时任务',2,2,'job','monitor/job/index','',1,0,'C','0','0','monitor:job:list','job','admin','2022-04-21 22:40:25','','2022-04-21 22:40:44','定时任务菜单'),
	(111,'数据监控',2,3,'druid','monitor/druid/index','',1,0,'C','0','0','monitor:druid:list','druid','admin','2022-04-21 22:40:25','','2022-04-21 22:40:44','数据监控菜单'),
	(112,'服务监控',2,4,'server','monitor/server/index','',1,0,'C','0','0','monitor:server:list','server','admin','2022-04-21 22:40:25','','2022-04-21 22:40:44','服务监控菜单'),
	(113,'缓存监控',2,5,'cache','monitor/cache/index','',1,0,'C','0','0','monitor:cache:list','redis','admin','2022-04-21 22:40:25','','2022-04-21 22:40:44','缓存监控菜单'),
	(114,'表单构建',3,1,'build','tool/build/index','',1,0,'C','0','0','tool:build:list','build','admin','2022-04-21 22:40:25','','2022-04-21 22:40:44','表单构建菜单'),
	(115,'代码生成',3,2,'gen','tool/gen/index','',1,0,'C','0','0','tool:gen:list','code','admin','2022-04-21 22:40:25','','2022-04-21 22:40:44','代码生成菜单'),
	(116,'系统接口',3,3,'swagger','tool/swagger/index','',1,0,'C','0','0','tool:swagger:list','swagger','admin','2022-04-21 22:40:25','','2022-04-21 22:40:44','系统接口菜单'),
	(500,'操作日志',108,1,'operlog','monitor/operlog/index','',1,0,'C','0','0','monitor:operlog:list','form','admin','2022-04-21 22:40:25','','2022-04-21 22:40:44','操作日志菜单'),
	(501,'登录日志',108,2,'logininfor','monitor/logininfor/index','',1,0,'C','0','0','monitor:logininfor:list','logininfor','admin','2022-04-21 22:40:25','','2022-04-21 22:40:44','登录日志菜单'),
	(1001,'用户查询',100,1,'','','',1,0,'F','0','0','system:user:query','#','admin','2022-04-21 22:40:25','','2022-04-21 22:40:44',''),
	(1002,'用户新增',100,2,'','','',1,0,'F','0','0','system:user:add','#','admin','2022-04-21 22:40:25','','2022-04-21 22:40:44',''),
	(1003,'用户修改',100,3,'','','',1,0,'F','0','0','system:user:edit','#','admin','2022-04-21 22:40:25','','2022-04-21 22:40:44',''),
	(1004,'用户删除',100,4,'','','',1,0,'F','0','0','system:user:remove','#','admin','2022-04-21 22:40:25','','2022-04-21 22:40:44',''),
	(1005,'用户导出',100,5,'','','',1,0,'F','0','0','system:user:export','#','admin','2022-04-21 22:40:25','','2022-04-21 22:40:44',''),
	(1006,'用户导入',100,6,'','','',1,0,'F','0','0','system:user:import','#','admin','2022-04-21 22:40:25','','2022-04-21 22:40:44',''),
	(1007,'重置密码',100,7,'','','',1,0,'F','0','0','system:user:resetPwd','#','admin','2022-04-21 22:40:25','','2022-04-21 22:40:44',''),
	(1008,'角色查询',101,1,'','','',1,0,'F','0','0','system:role:query','#','admin','2022-04-21 22:40:25','','2022-04-21 22:40:44',''),
	(1009,'角色新增',101,2,'','','',1,0,'F','0','0','system:role:add','#','admin','2022-04-21 22:40:25','','2022-04-21 22:40:44',''),
	(1010,'角色修改',101,3,'','','',1,0,'F','0','0','system:role:edit','#','admin','2022-04-21 22:40:25','','2022-04-21 22:40:44',''),
	(1011,'角色删除',101,4,'','','',1,0,'F','0','0','system:role:remove','#','admin','2022-04-21 22:40:25','','2022-04-21 22:40:44',''),
	(1012,'角色导出',101,5,'','','',1,0,'F','0','0','system:role:export','#','admin','2022-04-21 22:40:25','','2022-04-21 22:40:44',''),
	(1013,'菜单查询',102,1,'','','',1,0,'F','0','0','system:menu:query','#','admin','2022-04-21 22:40:25','','2022-04-21 22:40:44',''),
	(1014,'菜单新增',102,2,'','','',1,0,'F','0','0','system:menu:add','#','admin','2022-04-21 22:40:25','','2022-04-21 22:40:44',''),
	(1015,'菜单修改',102,3,'','','',1,0,'F','0','0','system:menu:edit','#','admin','2022-04-21 22:40:25','','2022-04-21 22:40:44',''),
	(1016,'菜单删除',102,4,'','','',1,0,'F','0','0','system:menu:remove','#','admin','2022-04-21 22:40:25','','2022-04-21 22:40:44',''),
	(1017,'部门查询',103,1,'','','',1,0,'F','0','0','system:dept:query','#','admin','2022-04-21 22:40:25','','2022-04-21 22:40:44',''),
	(1018,'部门新增',103,2,'','','',1,0,'F','0','0','system:dept:add','#','admin','2022-04-21 22:40:25','','2022-04-21 22:40:44',''),
	(1019,'部门修改',103,3,'','','',1,0,'F','0','0','system:dept:edit','#','admin','2022-04-21 22:40:25','','2022-04-21 22:40:44',''),
	(1020,'部门删除',103,4,'','','',1,0,'F','0','0','system:dept:remove','#','admin','2022-04-21 22:40:25','','2022-04-21 22:40:44',''),
	(1021,'岗位查询',104,1,'','','',1,0,'F','0','0','system:post:query','#','admin','2022-04-21 22:40:25','','2022-04-21 22:40:44',''),
	(1022,'岗位新增',104,2,'','','',1,0,'F','0','0','system:post:add','#','admin','2022-04-21 22:40:25','','2022-04-21 22:40:44',''),
	(1023,'岗位修改',104,3,'','','',1,0,'F','0','0','system:post:edit','#','admin','2022-04-21 22:40:25','','2022-04-21 22:40:44',''),
	(1024,'岗位删除',104,4,'','','',1,0,'F','0','0','system:post:remove','#','admin','2022-04-21 22:40:25','','2022-04-21 22:40:44',''),
	(1025,'岗位导出',104,5,'','','',1,0,'F','0','0','system:post:export','#','admin','2022-04-21 22:40:25','','2022-04-21 22:40:44',''),
	(1026,'字典查询',105,1,'#','','',1,0,'F','0','0','system:dict:query','#','admin','2022-04-21 22:40:25','','2022-04-21 22:40:44',''),
	(1027,'字典新增',105,2,'#','','',1,0,'F','0','0','system:dict:add','#','admin','2022-04-21 22:40:25','','2022-04-21 22:40:44',''),
	(1028,'字典修改',105,3,'#','','',1,0,'F','0','0','system:dict:edit','#','admin','2022-04-21 22:40:25','','2022-04-21 22:40:44',''),
	(1029,'字典删除',105,4,'#','','',1,0,'F','0','0','system:dict:remove','#','admin','2022-04-21 22:40:25','','2022-04-21 22:40:44',''),
	(1030,'字典导出',105,5,'#','','',1,0,'F','0','0','system:dict:export','#','admin','2022-04-21 22:40:25','','2022-04-21 22:40:44',''),
	(1031,'参数查询',106,1,'#','','',1,0,'F','0','0','system:config:query','#','admin','2022-04-21 22:40:25','','2022-04-21 22:40:44',''),
	(1032,'参数新增',106,2,'#','','',1,0,'F','0','0','system:config:add','#','admin','2022-04-21 22:40:25','','2022-04-21 22:40:44',''),
	(1033,'参数修改',106,3,'#','','',1,0,'F','0','0','system:config:edit','#','admin','2022-04-21 22:40:25','','2022-04-21 22:40:44',''),
	(1034,'参数删除',106,4,'#','','',1,0,'F','0','0','system:config:remove','#','admin','2022-04-21 22:40:25','','2022-04-21 22:40:44',''),
	(1035,'参数导出',106,5,'#','','',1,0,'F','0','0','system:config:export','#','admin','2022-04-21 22:40:25','','2022-04-21 22:40:44',''),
	(1036,'公告查询',107,1,'#','','',1,0,'F','0','0','system:notice:query','#','admin','2022-04-21 22:40:25','','2022-04-21 22:40:44',''),
	(1037,'公告新增',107,2,'#','','',1,0,'F','0','0','system:notice:add','#','admin','2022-04-21 22:40:25','','2022-04-21 22:40:44',''),
	(1038,'公告修改',107,3,'#','','',1,0,'F','0','0','system:notice:edit','#','admin','2022-04-21 22:40:25','','2022-04-21 22:40:44',''),
	(1039,'公告删除',107,4,'#','','',1,0,'F','0','0','system:notice:remove','#','admin','2022-04-21 22:40:25','','2022-04-21 22:40:44',''),
	(1040,'操作查询',500,1,'#','','',1,0,'F','0','0','monitor:operlog:query','#','admin','2022-04-21 22:40:25','','2022-04-21 22:40:44',''),
	(1041,'操作删除',500,2,'#','','',1,0,'F','0','0','monitor:operlog:remove','#','admin','2022-04-21 22:40:25','','2022-04-21 22:40:44',''),
	(1042,'日志导出',500,4,'#','','',1,0,'F','0','0','monitor:operlog:export','#','admin','2022-04-21 22:40:25','','2022-04-21 22:40:44',''),
	(1043,'登录查询',501,1,'#','','',1,0,'F','0','0','monitor:logininfor:query','#','admin','2022-04-21 22:40:25','','2022-04-21 22:40:44',''),
	(1044,'登录删除',501,2,'#','','',1,0,'F','0','0','monitor:logininfor:remove','#','admin','2022-04-21 22:40:25','','2022-04-21 22:40:44',''),
	(1045,'日志导出',501,3,'#','','',1,0,'F','0','0','monitor:logininfor:export','#','admin','2022-04-21 22:40:25','','2022-04-21 22:40:44',''),
	(1046,'在线查询',109,1,'#','','',1,0,'F','0','0','monitor:online:query','#','admin','2022-04-21 22:40:25','','2022-04-21 22:40:44',''),
	(1047,'批量强退',109,2,'#','','',1,0,'F','0','0','monitor:online:batchLogout','#','admin','2022-04-21 22:40:25','','2022-04-21 22:40:44',''),
	(1048,'单条强退',109,3,'#','','',1,0,'F','0','0','monitor:online:forceLogout','#','admin','2022-04-21 22:40:25','','2022-04-21 22:40:44',''),
	(1049,'任务查询',110,1,'#','','',1,0,'F','0','0','monitor:job:query','#','admin','2022-04-21 22:40:25','','2022-04-21 22:40:44',''),
	(1050,'任务新增',110,2,'#','','',1,0,'F','0','0','monitor:job:add','#','admin','2022-04-21 22:40:25','','2022-04-21 22:40:44',''),
	(1051,'任务修改',110,3,'#','','',1,0,'F','0','0','monitor:job:edit','#','admin','2022-04-21 22:40:25','','2022-04-21 22:40:44',''),
	(1052,'任务删除',110,4,'#','','',1,0,'F','0','0','monitor:job:remove','#','admin','2022-04-21 22:40:25','','2022-04-21 22:40:44',''),
	(1053,'状态修改',110,5,'#','','',1,0,'F','0','0','monitor:job:changeStatus','#','admin','2022-04-21 22:40:25','','2022-04-21 22:40:44',''),
	(1054,'任务导出',110,7,'#','','',1,0,'F','0','0','monitor:job:export','#','admin','2022-04-21 22:40:25','','2022-04-21 22:40:44',''),
	(1055,'生成查询',115,1,'#','','',1,0,'F','0','0','tool:gen:query','#','admin','2022-04-21 22:40:25','','2022-04-21 22:40:44',''),
	(1056,'生成修改',115,2,'#','','',1,0,'F','0','0','tool:gen:edit','#','admin','2022-04-21 22:40:25','','2022-04-21 22:40:44',''),
	(1057,'生成删除',115,3,'#','','',1,0,'F','0','0','tool:gen:remove','#','admin','2022-04-21 22:40:25','','2022-04-21 22:40:44',''),
	(1058,'导入代码',115,2,'#','','',1,0,'F','0','0','tool:gen:import','#','admin','2022-04-21 22:40:25','','2022-04-21 22:40:44',''),
	(1059,'预览代码',115,4,'#','','',1,0,'F','0','0','tool:gen:preview','#','admin','2022-04-21 22:40:25','','2022-04-21 22:40:44',''),
	(1060,'生成代码',115,5,'#','','',1,0,'F','0','0','tool:gen:code','#','admin','2022-04-21 22:40:25','','2022-04-21 22:40:44',''),
	(2001,'商机管理',0,2,'business','tienchin/business/index',NULL,1,0,'C','0','0','tienchin:business:list','edit','admin','2022-04-21 22:40:25','admin','2022-04-21 22:40:44',''),
	(2002,'合同管理',0,3,'contract','tienchin/contract/index',NULL,1,0,'C','0','0','tienchin:contract:list','documentation','admin','2022-04-21 22:40:25','admin','2022-04-21 22:40:44',''),
	(2003,'促销活动',0,4,'activity','tienchin/activity/index',NULL,1,0,'C','0','0','tienchin:activity:list','peoples','admin','2022-04-21 22:40:25','admin','2022-04-21 22:40:44','活动管理菜单'),
	(2004,'私教课程',0,5,'course','tienchin/course/index',NULL,1,0,'C','0','0','tienchin:course:list','list','admin','2022-04-21 22:40:25','admin','2022-04-21 22:40:44','课程管理菜单'),
	(2005,'线索管理',0,1,'clue','tienchin/clue/index',NULL,1,0,'C','0','0','tienchin:clue:list','checkbox','admin','2022-04-21 22:40:25','admin','2022-04-21 22:40:44','线索管理菜单'),
	(2006,'统计分析',0,6,'analysis','tienchin/analysis/index',NULL,1,0,'C','0','0','tienchin:analysis:list','chart','admin','2022-04-21 22:40:25','admin','2022-04-21 22:40:44',''),
	(2007,'转派管理',0,7,'transfer','tienchin/transfer/index',NULL,1,0,'C','0','0','tienchin:transfer:list','example','admin','2022-04-21 22:40:25','admin','2022-04-21 22:40:44',''),
	(2008,'渠道管理',0,8,'channel','tienchin/channel/index',NULL,1,0,'C','0','0','tienchin:channel:list','row','admin','2022-04-21 22:40:25','admin','2022-04-23 09:25:13','渠道管理'),
	(3001,'商机管理查询',2001,1,'',NULL,NULL,1,0,'F','0','0','business:business:query','#','admin','2022-04-21 22:40:25','admin','2022-04-21 22:40:44',''),
	(3002,'商机管理新增',2001,2,'',NULL,NULL,1,0,'F','0','0','business:business:add','#','admin','2022-04-21 22:40:25','admin','2022-04-21 22:40:44',''),
	(3003,'商机管理查看',2001,4,'',NULL,NULL,1,0,'F','0','0','business:business:info','#','admin','2022-04-21 22:40:25','admin','2022-04-21 22:40:44',''),
	(3004,'商机管理分配',2001,5,'',NULL,NULL,1,0,'F','0','0','business:business:assignment','#','admin','2022-04-21 22:40:25','admin','2022-04-21 22:40:44',''),
	(3005,'商机跟进',2001,6,'',NULL,NULL,1,0,'F','0','0','business:record:add','#','admin','2022-04-21 22:40:25','admin','2022-04-21 22:40:44',''),
	(3006,'踢回公海',2001,8,'',NULL,NULL,1,0,'F','0','0','business:business:back','#','admin','2022-04-21 22:40:25','admin','2022-04-21 22:40:44',''),
	(3007,'查询公海池',2001,9,'',NULL,NULL,1,0,'F','0','0','business:business:pool','#','admin','2022-04-21 22:40:25','admin','2022-04-21 22:40:44',''),
	(3008,'商机捞取',2001,10,'',NULL,NULL,1,0,'F','0','0','business:business:gain','#','admin','2022-04-21 22:40:25','','2022-04-21 22:40:44',''),
	(3009,'活动查看',2001,11,'',NULL,NULL,1,0,'F','0','0','tienchin:activity:list','#','admin','2022-04-21 22:40:25','','2022-04-21 22:40:44',''),
	(3010,'商机转合同',2001,14,'',NULL,NULL,1,0,'F','0','0','contract:contract:change','#','admin','2022-04-21 22:40:25','','2022-04-21 22:40:44',''),
	(3011,'合同查询',2002,1,'',NULL,NULL,1,0,'F','0','0','contract:contract:query','#','admin','2022-04-21 22:40:25','admin','2022-04-21 22:40:44',''),
	(3012,'合同新增',2002,2,'',NULL,NULL,1,0,'F','0','0','contract:contract:add','#','admin','2022-04-21 22:40:25','','2022-04-21 22:40:44',''),
	(3013,'合同修改',2002,3,'',NULL,NULL,1,0,'F','0','0','contract:contract:edit','#','admin','2022-04-21 22:40:25','','2022-04-21 22:40:44',''),
	(3014,'合同删除',2002,4,'',NULL,NULL,1,0,'F','0','0','contract:contract:remove','#','admin','2022-04-21 22:40:25','','2022-04-21 22:40:44',''),
	(3015,'合同导出',2002,5,'',NULL,NULL,1,0,'F','0','0','contract:contract:export','#','admin','2022-04-21 22:40:25','','2022-04-21 22:40:44',''),
	(3016,'合同审核',2002,6,'',NULL,NULL,1,0,'F','0','0','contract:contract:audit','#','admin','2022-04-21 22:40:25','','2022-04-21 22:40:44',''),
	(3017,'合同及流程查看',2002,7,'',NULL,NULL,1,0,'F','0','0','contract:contract:info','#','admin','2022-04-21 22:40:25','admin','2022-04-21 22:40:44',''),
	(3018,'通过',2002,8,'',NULL,NULL,1,0,'F','0','0','contract:contract:pass','#','admin','2022-04-21 22:40:25','','2022-04-21 22:40:44',''),
	(3019,'驳回',2002,9,'',NULL,NULL,1,0,'F','0','0','contract:contract:reject','#','admin','2022-04-21 22:40:25','','2022-04-21 22:40:44',''),
	(3020,'合同基本信息查看',2002,10,'',NULL,NULL,1,0,'F','0','0','contract:contract:detail','#','admin','2022-04-21 22:40:25','','2022-04-21 22:40:44',''),
	(3021,'活动管理查询',2003,1,'#','',NULL,1,0,'F','0','0','tienchin:activity:query','#','admin','2022-04-21 22:40:25','admin','2022-04-21 22:40:44',''),
	(3022,'活动管理新增',2003,2,'#','',NULL,1,0,'F','0','0','tienchin:activity:add','#','admin','2022-04-21 22:40:25','admin','2022-04-21 22:40:44',''),
	(3023,'活动管理修改',2003,3,'#','',NULL,1,0,'F','0','0','tienchin:activity:edit','#','admin','2022-04-21 22:40:25','admin','2022-04-21 22:40:44',''),
	(3024,'活动管理删除',2003,4,'#','',NULL,1,0,'F','0','0','tienchin:activity:remove','#','admin','2022-04-21 22:40:25','admin','2022-04-21 22:40:44',''),
	(3025,'活动管理导出',2003,5,'#','',NULL,1,0,'F','0','0','tienchin:activity:export','#','admin','2022-04-21 22:40:25','admin','2022-04-21 22:40:44',''),
	(3026,'课程管理查询',2004,1,'#','',NULL,1,0,'F','0','0','tienchin:course:query','#','admin','2022-04-21 22:40:25','','2022-04-21 22:40:44',''),
	(3027,'课程管理新增',2004,2,'#','',NULL,1,0,'F','0','0','tienchin:course:add','#','admin','2022-04-21 22:40:25','','2022-04-21 22:40:44',''),
	(3028,'课程管理修改',2004,3,'#','',NULL,1,0,'F','0','0','tienchin:course:edit','#','admin','2022-04-21 22:40:25','','2022-04-21 22:40:44',''),
	(3029,'课程管理删除',2004,4,'#','',NULL,1,0,'F','0','0','tienchin:course:remove','#','admin','2022-04-21 22:40:25','','2022-04-21 22:40:44',''),
	(3030,'课程管理导出',2004,5,'#','',NULL,1,0,'F','0','0','tienchin:course:export','#','admin','2022-04-21 22:40:25','','2022-04-21 22:40:44',''),
	(3031,'线索管理查询',2005,1,'#','',NULL,1,0,'F','0','0','tienchin:clue:query','#','admin','2022-04-21 22:40:25','','2022-04-21 22:40:44',''),
	(3032,'线索管理新增',2005,2,'#','',NULL,1,0,'F','0','0','tienchin:clue:add','#','admin','2022-04-21 22:40:25','','2022-04-21 22:40:44',''),
	(3033,'线索管理跟进',2005,3,'#','',NULL,1,0,'F','0','0','tienchin:clue:record:add','#','admin','2022-04-21 22:40:25','admin','2022-04-21 22:40:44',''),
	(3034,'线索管理删除',2005,4,'#','',NULL,1,0,'F','0','0','tienchin:clue:remove','#','admin','2022-04-21 22:40:25','','2022-04-21 22:40:44',''),
	(3035,'线索管理查看',2005,6,'',NULL,NULL,1,0,'F','0','0','tienchin:clue:info','#','admin','2022-04-21 22:40:25','','2022-04-21 22:40:44',''),
	(3036,'线索管理分配',2005,7,'',NULL,NULL,1,0,'F','0','0','tienchin:clue:assignment','#','admin','2022-04-21 22:40:25','admin','2022-04-21 22:40:44',''),
	(3037,'线索池',2005,8,'',NULL,NULL,1,0,'F','0','0','tienchin:clue:pool','#','admin','2022-04-21 22:40:25','admin','2022-04-21 22:40:44',''),
	(3038,'线索跟进记录',2005,9,'',NULL,NULL,1,0,'F','0','0','tienchin:clue:record:list','#','admin','2022-04-21 22:40:25','','2022-04-21 22:40:44',''),
	(3039,'线索管理批量添加',2005,10,'',NULL,NULL,1,0,'F','0','0','tienchin:clue:batchAdd','#','admin','2022-04-21 22:40:25','admin','2022-04-21 22:40:44',''),
	(3040,'线索捞取',2005,11,'clues:clue:gain',NULL,NULL,1,0,'F','0','0','tienchin:clue:gain','#','admin','2022-04-21 22:40:25','admin','2022-04-21 22:40:44',''),
	(3041,'首页基础数据查询',0,30,'',NULL,NULL,1,0,'F','1','0','indexHome:baseQuery','#','admin','2022-04-21 22:40:25','','2022-04-21 22:40:44',''),
	(3042,'首页今日简报',0,31,'',NULL,NULL,1,0,'F','1','0','indexHome:todayQuery','#','admin','2022-04-21 22:40:25','','2022-04-21 22:40:44',''),
	(3043,'首页待办',0,32,'',NULL,NULL,1,0,'F','1','0','indexHome:todoQuery','#','admin','2022-04-21 22:40:25','','2022-04-21 22:40:44',''),
	(3044,'首页漏斗图',0,33,'',NULL,NULL,1,0,'F','1','0','indexHome:funnelQuery','#','admin','2022-04-21 22:40:25','','2022-04-21 22:40:44',''),
	(3045,'首页销售龙虎榜',0,34,'',NULL,NULL,1,0,'F','1','0','indexHome:saleQuery','#','admin','2022-04-21 22:40:25','','2022-04-21 22:40:44',''),
	(3046,'首页商机龙虎榜',0,35,'',NULL,NULL,1,0,'F','1','0','indexHome:businessQuery','#','admin','2022-04-21 22:40:25','','2022-04-21 22:40:44',''),
	(3047,'渠道管理查询',2008,1,'#','',NULL,1,0,'F','0','0','tienchin:channel:query','#','admin','2022-04-21 22:40:25','','2022-04-21 22:40:44',''),
	(3048,'渠道管理新增',2008,2,'#','',NULL,1,0,'F','0','0','tienchin:channel:add','#','admin','2022-04-21 22:40:25','','2022-04-21 22:40:44',''),
	(3049,'渠道管理修改',2008,3,'#','',NULL,1,0,'F','0','0','tienchin:channel:edit','#','admin','2022-04-21 22:40:25','','2022-04-21 22:40:44',''),
	(3050,'渠道管理删除',2008,4,'#','',NULL,1,0,'F','0','0','tienchin:channel:remove','#','admin','2022-04-21 22:40:25','','2022-04-21 22:40:44',''),
	(3053,'活动管理导入',2003,6,'#','',NULL,1,0,'F','0','0','tienchin:activity:import','#','admin','2022-04-21 22:40:25','admin','2022-04-21 22:40:44','');

/*!40000 ALTER TABLE `sys_menu` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_notice
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_notice`;

CREATE TABLE `sys_notice` (
  `notice_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob COMMENT '公告内容',
  `status` char(1) COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='通知公告表';

LOCK TABLES `sys_notice` WRITE;
/*!40000 ALTER TABLE `sys_notice` DISABLE KEYS */;

INSERT INTO `sys_notice` (`notice_id`, `notice_title`, `notice_type`, `notice_content`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`)
VALUES
	(1,'温馨提醒：2018-07-01 SiMa新版本发布啦','2',X'E696B0E78988E69CACE58685E5AEB9','0','admin','2022-04-21 19:29:25','',NULL,'管理员'),
	(2,'维护通知：2018-07-01 SiMa系统凌晨维护','1',X'E7BBB4E68AA4E58685E5AEB9','0','admin','2022-04-21 19:29:25','',NULL,'管理员');

/*!40000 ALTER TABLE `sys_notice` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_oper_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_oper_log`;

CREATE TABLE `sys_oper_log` (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '请求方式',
  `operator_type` int(1) DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '返回参数',
  `status` int(1) DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='操作日志记录';

LOCK TABLES `sys_oper_log` WRITE;
/*!40000 ALTER TABLE `sys_oper_log` DISABLE KEYS */;

INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`)
VALUES
	(100,'菜单管理',2,'org.javaboy.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"query\":\"\",\"icon\":\"monitor\",\"orderNum\":2,\"menuName\":\"系统监控\",\"params\":{},\"parentId\":1,\"isCache\":\"0\",\"path\":\"monitor\",\"children\":[],\"createTime\":1650540564000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-21 20:19:27'),
	(101,'菜单管理',2,'org.javaboy.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"query\":\"\",\"icon\":\"tool\",\"orderNum\":3,\"menuName\":\"系统工具\",\"params\":{},\"parentId\":1,\"isCache\":\"0\",\"path\":\"tool\",\"children\":[],\"createTime\":1650540564000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":3,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-21 20:19:37'),
	(102,'菜单管理',2,'org.javaboy.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"query\":\"\",\"icon\":\"monitor\",\"orderNum\":10,\"menuName\":\"系统监控\",\"params\":{},\"parentId\":1,\"isCache\":\"0\",\"path\":\"monitor\",\"children\":[],\"createTime\":1650540564000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-21 20:20:26'),
	(103,'菜单管理',2,'org.javaboy.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"query\":\"\",\"icon\":\"tool\",\"orderNum\":11,\"menuName\":\"系统工具\",\"params\":{},\"parentId\":1,\"isCache\":\"0\",\"path\":\"tool\",\"children\":[],\"createTime\":1650540564000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":3,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-21 20:20:33'),
	(104,'菜单管理',2,'org.javaboy.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"icon\":\"edit\",\"orderNum\":1,\"menuName\":\"线索管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"clue\",\"component\":\"tienchin/clue/index\",\"children\":[],\"createTime\":1617325351000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2005,\"menuType\":\"C\",\"perms\":\"tienchin:clue:list\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-21 22:14:18'),
	(105,'菜单管理',2,'org.javaboy.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"icon\":\"documentation\",\"orderNum\":2,\"menuName\":\"商机管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"business\",\"component\":\"tienchin/business/index\",\"children\":[],\"createTime\":1617154774000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2001,\"menuType\":\"C\",\"perms\":\"tienchin:business:list\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-21 22:14:29'),
	(106,'菜单管理',2,'org.javaboy.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"icon\":\"documentation\",\"orderNum\":3,\"menuName\":\"合同管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"contract\",\"component\":\"tienchin/contract/index\",\"children\":[],\"createTime\":1617154827000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2002,\"menuType\":\"C\",\"perms\":\"tienchin:contract:list\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-21 22:14:37'),
	(107,'菜单管理',2,'org.javaboy.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"icon\":\"form\",\"orderNum\":2,\"menuName\":\"商机管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"business\",\"component\":\"tienchin/business/index\",\"children\":[],\"createTime\":1617154774000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2001,\"menuType\":\"C\",\"perms\":\"tienchin:business:list\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-21 22:15:25'),
	(108,'菜单管理',2,'org.javaboy.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"icon\":\"checkbox\",\"orderNum\":2,\"menuName\":\"商机管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"business\",\"component\":\"tienchin/business/index\",\"children\":[],\"createTime\":1617154774000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2001,\"menuType\":\"C\",\"perms\":\"tienchin:business:list\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-21 22:15:53'),
	(109,'菜单管理',2,'org.javaboy.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"icon\":\"checkbox\",\"orderNum\":1,\"menuName\":\"线索管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"clue\",\"component\":\"tienchin/clue/index\",\"children\":[],\"createTime\":1617325351000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2005,\"menuType\":\"C\",\"perms\":\"tienchin:clue:list\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-21 22:16:09'),
	(110,'菜单管理',2,'org.javaboy.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"icon\":\"edit\",\"orderNum\":2,\"menuName\":\"商机管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"business\",\"component\":\"tienchin/business/index\",\"children\":[],\"createTime\":1617154774000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2001,\"menuType\":\"C\",\"perms\":\"tienchin:business:list\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-21 22:16:23'),
	(111,'菜单管理',2,'org.javaboy.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"icon\":\"peoples\",\"orderNum\":4,\"menuName\":\"活动管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"activity\",\"component\":\"tienchin/activity/index\",\"children\":[],\"createTime\":1617216998000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2003,\"menuType\":\"C\",\"perms\":\"tienchin:activity:list\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-21 22:16:40'),
	(112,'菜单管理',2,'org.javaboy.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"icon\":\"list\",\"orderNum\":5,\"menuName\":\"课程管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"course\",\"component\":\"tienchin/course/index\",\"children\":[],\"createTime\":1617243256000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2004,\"menuType\":\"C\",\"perms\":\"tienchin:course:list\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-21 22:17:09'),
	(113,'菜单管理',2,'org.javaboy.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"icon\":\"chart\",\"orderNum\":6,\"menuName\":\"统计分析\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"analysis\",\"component\":\"tienchin/analysis/index\",\"children\":[],\"createTime\":1618438016000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2006,\"menuType\":\"C\",\"perms\":\"tienchin:analysis:list\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-21 22:18:00'),
	(114,'菜单管理',2,'org.javaboy.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"icon\":\"row\",\"orderNum\":8,\"menuName\":\"渠道管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"channel\",\"component\":\"tienchin/channel/index\",\"children\":[],\"createTime\":1650552025000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2008,\"menuType\":\"C\",\"perms\":\"tienchin:channel:list\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-23 09:25:13'),
	(115,'渠道管理',1,'org.javaboy.web.controller.channel.ChannelController.add()','POST',1,'admin',NULL,'/tienchin/channel/','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"channelName\":\"公众号推广\",\"remark\":\"无\",\"channelId\":5,\"status\":0}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-23 15:28:30'),
	(116,'渠道管理',1,'org.javaboy.web.controller.channel.ChannelController.add()','POST',1,'admin',NULL,'/tienchin/channel/','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"createTime\":\"2022-04-23T15:32:37.291317000\",\"channelName\":\"小程序推广\",\"remark\":\"哈哈\",\"updateTime\":\"2022-04-23T15:32:37.291340000\",\"channelId\":6,\"status\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-23 15:32:37'),
	(117,'渠道管理',2,'org.javaboy.web.controller.channel.ChannelController.edit()','PUT',1,'admin',NULL,'/tienchin/channel/','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"createTime\":\"2022-04-23T15:32:37\",\"updateBy\":\"admin\",\"channelName\":\"小程序推广\",\"remark\":\"哈哈\",\"updateTime\":\"2022-04-23T15:43:10.696303000\",\"channelId\":6,\"status\":0}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-23 15:43:10'),
	(118,'渠道管理',2,'org.javaboy.web.controller.channel.ChannelController.edit()','PUT',1,'admin',NULL,'/tienchin/channel/','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"updateBy\":\"admin\",\"channelName\":\"公众号推广\",\"remark\":\"无\",\"updateTime\":\"2022-04-23T15:43:25.483379000\",\"channelId\":5,\"status\":0}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-23 15:43:25'),
	(119,'渠道管理',1,'org.javaboy.web.controller.channel.ChannelController.add()','POST',1,'admin',NULL,'/tienchin/channel/','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"createTime\":\"2022-04-23T15:52:22.730498000\",\"channelName\":\"1\",\"updateTime\":\"2022-04-23T15:52:22.730521000\",\"channelId\":7,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-23 15:52:22'),
	(120,'渠道管理',1,'org.javaboy.web.controller.channel.ChannelController.add()','POST',1,'admin',NULL,'/tienchin/channel/','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"createTime\":\"2022-04-23T15:52:27.385589000\",\"channelName\":\"2\",\"updateTime\":\"2022-04-23T15:52:27.385604000\",\"channelId\":8,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-23 15:52:27'),
	(121,'渠道管理',1,'org.javaboy.web.controller.channel.ChannelController.add()','POST',1,'admin',NULL,'/tienchin/channel/','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"createTime\":\"2022-04-23T15:52:32.218497000\",\"channelName\":\"3\",\"updateTime\":\"2022-04-23T15:52:32.218510000\",\"channelId\":9,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-23 15:52:32'),
	(122,'渠道管理',1,'org.javaboy.web.controller.channel.ChannelController.add()','POST',1,'admin',NULL,'/tienchin/channel/','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"createTime\":\"2022-04-23T15:52:36.517940000\",\"channelName\":\"4\",\"updateTime\":\"2022-04-23T15:52:36.517953000\",\"channelId\":10,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-23 15:52:36'),
	(123,'渠道管理',1,'org.javaboy.web.controller.channel.ChannelController.add()','POST',1,'admin',NULL,'/tienchin/channel/','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"createTime\":\"2022-04-23T15:52:40.315709000\",\"channelName\":\"5\",\"updateTime\":\"2022-04-23T15:52:40.315722000\",\"channelId\":11,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-23 15:52:40'),
	(124,'渠道管理',1,'org.javaboy.web.controller.channel.ChannelController.add()','POST',1,'admin',NULL,'/tienchin/channel/','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"createTime\":\"2022-04-23T15:52:45.340749000\",\"channelName\":\"6\",\"updateTime\":\"2022-04-23T15:52:45.340768000\",\"channelId\":12,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-23 15:52:45'),
	(125,'渠道管理',3,'org.javaboy.web.controller.channel.ChannelController.remove()','DELETE',1,'admin',NULL,'/tienchin/channel/10','127.0.0.1','内网IP','{channelIds=10}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-23 16:00:59'),
	(126,'渠道管理',3,'org.javaboy.web.controller.channel.ChannelController.remove()','DELETE',1,'admin',NULL,'/tienchin/channel/8,9','127.0.0.1','内网IP','{channelIds=8,9}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-23 16:01:06'),
	(127,'渠道管理',3,'org.javaboy.web.controller.channel.ChannelController.remove()','DELETE',1,'admin',NULL,'/tienchin/channel/11','127.0.0.1','内网IP','{channelIds=11}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-23 16:01:11'),
	(128,'渠道管理',3,'org.javaboy.web.controller.channel.ChannelController.remove()','DELETE',1,'admin',NULL,'/tienchin/channel/12','127.0.0.1','内网IP','{channelIds=12}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-23 16:01:14'),
	(129,'用户管理',1,'org.javaboy.web.controller.system.SysUserController.add()','POST',1,'admin',NULL,'/system/user','127.0.0.1','内网IP','{\"phonenumber\":\"13222222222\",\"admin\":false,\"password\":\"$2a$10$Ly7592NawJoGLSaZxiHK1ODqz5BFC2z77rz7kIp4bGqBeeGaBdtQe\",\"postIds\":[1],\"email\":\"111@qq.com\",\"nickName\":\"javaboy\",\"sex\":\"0\",\"deptId\":100,\"params\":{},\"userName\":\"javaboy\",\"userId\":100,\"createBy\":\"admin\",\"roleIds\":[2],\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-23 16:02:13'),
	(130,'角色管理',2,'org.javaboy.web.controller.system.SysRoleController.edit()','PUT',1,'admin',NULL,'/system/role','127.0.0.1','内网IP','{\"flag\":false,\"roleId\":2,\"admin\":false,\"remark\":\"普通角色\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"params\":{},\"roleSort\":\"2\",\"deptCheckStrictly\":true,\"createTime\":1650540564000,\"updateBy\":\"admin\",\"menuCheckStrictly\":true,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"menuIds\":[2008,3049,3050,1,100,1001,1002,1003,1004,1005,1006,1007,101,1008,1009,1010,1011,1012,102,1013,1014,1015,1016,103,1017,1018,1019,1020,104,1021,1022,1023,1024,1025,105,1026,1027,1028,1029,1030,106,1031,1032,1033,1034,1035,107,1036,1037,1038,1039,108,500,1040,1041,1042,501,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,3,114,115,1055,1056,1058,1057,1059,1060,116,4],\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-23 16:02:41'),
	(131,'渠道管理',1,'org.javaboy.web.controller.channel.ChannelController.add()','POST',1,'javaboy',NULL,'/tienchin/channel/','127.0.0.1','内网IP','{\"createBy\":\"javaboy\",\"createTime\":\"2022-04-23T16:03:39.739159000\",\"channelName\":\"1\",\"remark\":\"1\",\"updateTime\":\"2022-04-23T16:03:39.739183000\",\"channelId\":13,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-23 16:03:39'),
	(132,'角色管理',2,'org.javaboy.web.controller.system.SysRoleController.edit()','PUT',1,'admin',NULL,'/system/role','127.0.0.1','内网IP','{\"flag\":false,\"roleId\":2,\"admin\":false,\"remark\":\"普通角色\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"params\":{},\"roleSort\":\"2\",\"deptCheckStrictly\":true,\"createTime\":1650540564000,\"updateBy\":\"admin\",\"menuCheckStrictly\":true,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"menuIds\":[2008,3049,3050,3051,1,100,1001,1002,1003,1004,1005,1006,1007,101,1008,1009,1010,1011,1012,102,1013,1014,1015,1016,103,1017,1018,1019,1020,104,1021,1022,1023,1024,1025,105,1026,1027,1028,1029,1030,106,1031,1032,1033,1034,1035,107,1036,1037,1038,1039,108,500,1040,1041,1042,501,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,3,114,115,1055,1056,1058,1057,1059,1060,116,4],\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-23 16:05:16'),
	(133,'渠道管理',2,'org.javaboy.web.controller.channel.ChannelController.edit()','PUT',1,'javaboy',NULL,'/tienchin/channel/','127.0.0.1','内网IP','{\"createBy\":\"javaboy\",\"createTime\":\"2022-04-23T16:03:40\",\"updateBy\":\"javaboy\",\"channelName\":\"2\",\"remark\":\"2\",\"updateTime\":\"2022-04-23T16:05:55.456727000\",\"channelId\":13,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-23 16:05:55'),
	(134,'渠道管理',3,'org.javaboy.web.controller.channel.ChannelController.remove()','DELETE',1,'admin',NULL,'/tienchin/channel/7','127.0.0.1','内网IP','{channelIds=7}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-23 16:23:06'),
	(135,'渠道管理',1,'org.javaboy.web.controller.channel.ChannelController.add()','POST',1,'admin',NULL,'/tienchin/channel/','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"createTime\":\"2022-04-23T17:15:40.743756000\",\"channelName\":\"3\",\"remark\":\"3\",\"updateTime\":\"2022-04-23T17:15:40.743780000\",\"channelId\":14,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-23 17:15:40'),
	(136,'渠道管理',2,'org.javaboy.web.controller.channel.ChannelController.edit()','PUT',1,'admin',NULL,'/tienchin/channel/','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"createTime\":\"2022-04-23T17:15:41\",\"updateBy\":\"admin\",\"channelName\":\"1\",\"remark\":\"1\",\"updateTime\":\"2022-04-23T17:15:49.480939000\",\"channelId\":14,\"status\":\"1\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-23 17:15:49'),
	(137,'渠道管理',3,'org.javaboy.web.controller.channel.ChannelController.remove()','DELETE',1,'admin',NULL,'/tienchin/channel/14','127.0.0.1','内网IP','{channelIds=14}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-23 17:15:53'),
	(138,'渠道管理',1,'org.javaboy.tienchin.web.controller.channel.ChannelController.add()','POST',1,'admin',NULL,'/tienchin/channel/','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"createTime\":\"2022-04-25T14:36:38.375538000\",\"channelName\":\"6\",\"remark\":\"6\",\"updateTime\":\"2022-04-25T14:36:38.375583000\",\"channelId\":15,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-25 14:36:38'),
	(139,'渠道管理',2,'org.javaboy.tienchin.web.controller.channel.ChannelController.edit()','PUT',1,'admin',NULL,'/tienchin/channel/','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"createTime\":\"2022-04-25T14:36:38\",\"updateBy\":\"admin\",\"channelName\":\"6\",\"remark\":\"666\",\"updateTime\":\"2022-04-25T14:36:43.738604000\",\"channelId\":15,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-25 14:36:43'),
	(140,'渠道管理',3,'org.javaboy.tienchin.web.controller.channel.ChannelController.remove()','DELETE',1,'admin',NULL,'/tienchin/channel/15','127.0.0.1','内网IP','{channelIds=15}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-25 14:36:46'),
	(141,'促销活动',1,'org.javaboy.tienchin.web.controller.activity.ActivityController.add()','POST',1,'admin',NULL,'/tienchin/activity/','127.0.0.1','内网IP','{\"code\":\"17023b447a50418d86618f429df401f5\",\"channel\":\"2\",\"discount\":8.0,\"type\":\"1\",\"createBy\":\"admin\",\"createTime\":\"2022-04-25T20:51:47.892860000\",\"name\":\"抖音啊啊啊\",\"id\":1,\"info\":\"活动\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-25 20:51:47'),
	(142,'促销活动',1,'org.javaboy.tienchin.web.controller.activity.ActivityController.add()','POST',1,'admin',NULL,'/tienchin/activity/','127.0.0.1','内网IP','{\"code\":\"cb6329fcf3944424b2a884f28a5a26ba\",\"voucher\":3.0,\"channel\":\"1\",\"type\":\"2\",\"createBy\":\"admin\",\"createTime\":\"2022-04-25T21:03:22.654389000\",\"name\":\"啊啊啊啊\",\"id\":2,\"info\":\"反反复复反反复复\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-25 21:03:22'),
	(143,'促销活动',1,'org.javaboy.tienchin.web.controller.activity.ActivityController.add()','POST',1,'admin',NULL,'/tienchin/activity/','127.0.0.1','内网IP','{\"code\":\"476874bd3bfa4209ba11196edcbb4b90\",\"channel\":\"1\",\"discount\":4.0,\"type\":\"1\",\"createBy\":\"admin\",\"createTime\":\"2022-04-25T21:12:49.449320000\",\"name\":\"ffffff\",\"beginTime\":\"2022-04-29T00:00:00\",\"endTime\":\"2022-05-24T23:59:59\",\"id\":3,\"info\":\"aaaaa\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-25 21:12:49'),
	(144,'促销活动',1,'org.javaboy.tienchin.web.controller.activity.ActivityController.add()','POST',1,'admin',NULL,'/tienchin/activity/','127.0.0.1','内网IP','{\"code\":\"7d43499a10464c68bbf2b85559ab9b41\",\"channel\":\"2\",\"discount\":2.0,\"type\":\"1\",\"createBy\":\"admin\",\"createTime\":\"2022-04-25T21:13:45.300551000\",\"name\":\"vvvv\",\"beginTime\":\"2022-05-03T00:00:00\",\"endTime\":\"2022-05-17T23:59:59\",\"id\":4,\"info\":\"aaaaa\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-25 21:13:45'),
	(145,'促销活动',2,'org.javaboy.tienchin.web.controller.activity.ActivityController.edit()','PUT',1,'admin',NULL,'/tienchin/activity/','127.0.0.1','内网IP','{\"code\":\"17023b447a50418d86618f429df401f5\",\"channel\":\"2\",\"discount\":8.0,\"updateTime\":\"2022-04-25T22:15:07.026523000\",\"type\":\"1\",\"createBy\":\"admin\",\"createTime\":\"2022-04-25T20:51:48\",\"updateBy\":\"admin\",\"name\":\"抖音啊啊啊\",\"beginTime\":\"2022-05-16T00:00:00\",\"endTime\":\"2022-05-19T23:59:59\",\"id\":1,\"info\":\"活动\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-25 22:15:07'),
	(146,'促销活动',2,'org.javaboy.tienchin.web.controller.activity.ActivityController.edit()','PUT',1,'admin',NULL,'/tienchin/activity/','127.0.0.1','内网IP','{\"code\":\"cb6329fcf3944424b2a884f28a5a26ba\",\"voucher\":3.0,\"channel\":\"1\",\"updateTime\":\"2022-04-25T22:15:17.514217000\",\"type\":\"2\",\"createBy\":\"admin\",\"createTime\":\"2022-04-25T21:03:23\",\"updateBy\":\"admin\",\"name\":\"啊啊啊啊\",\"beginTime\":\"2022-05-17T00:00:00\",\"endTime\":\"2022-06-30T23:59:59\",\"id\":2,\"info\":\"反反复复反反复复\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-25 22:15:17'),
	(147,'促销活动',2,'org.javaboy.tienchin.web.controller.activity.ActivityController.edit()','PUT',1,'admin',NULL,'/tienchin/activity/','127.0.0.1','内网IP','{\"code\":\"476874bd3bfa4209ba11196edcbb4b90\",\"channel\":\"1\",\"discount\":4.0,\"updateTime\":\"2022-04-25T22:17:28.825232000\",\"type\":\"1\",\"createBy\":\"admin\",\"createTime\":\"2022-04-25T21:12:49\",\"updateBy\":\"admin\",\"name\":\"ffffff\",\"beginTime\":\"2022-04-29T00:00:00\",\"endTime\":\"2022-05-24T23:59:59\",\"id\":3,\"info\":\"aaaaabb\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-25 22:17:28'),
	(148,'促销活动',2,'org.javaboy.tienchin.web.controller.activity.ActivityController.changeStatus()','PUT',1,'admin',NULL,'/tienchin/activity/changeStatus','127.0.0.1','内网IP','{\"updateTime\":\"2022-04-25T22:26:33.560635000\",\"updateBy\":\"admin\",\"status\":\"1\"}',NULL,1,'\n### Error updating database.  Cause: java.sql.SQLException: Field \'info\' doesn\'t have a default value\n### The error may exist in org/javaboy/tienchin/activity/mapper/ActivityMapper.java (best guess)\n### The error may involve org.javaboy.tienchin.activity.mapper.ActivityMapper.insert-Inline\n### The error occurred while setting parameters\n### SQL: INSERT INTO tienchin_activity  ( status,    update_time,  update_by )  VALUES  ( ?,    ?,  ? )\n### Cause: java.sql.SQLException: Field \'info\' doesn\'t have a default value\n; Field \'info\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'info\' doesn\'t have a default value','2022-04-25 22:26:33'),
	(149,'促销活动',2,'org.javaboy.tienchin.web.controller.activity.ActivityController.changeStatus()','PUT',1,'admin',NULL,'/tienchin/activity/changeStatus','127.0.0.1','内网IP','{\"updateTime\":\"2022-04-25T22:33:09.052762000\",\"updateBy\":\"admin\",\"status\":\"1\"}','{\"msg\":\"操作失败\",\"code\":500}',0,NULL,'2022-04-25 22:33:09'),
	(150,'促销活动',2,'org.javaboy.tienchin.web.controller.activity.ActivityController.changeStatus()','PUT',1,'admin',NULL,'/tienchin/activity/changeStatus','127.0.0.1','内网IP','{\"updateTime\":\"2022-04-25T22:33:39.056838000\",\"updateBy\":\"admin\",\"status\":\"1\"}','{\"msg\":\"操作失败\",\"code\":500}',0,NULL,'2022-04-25 22:33:39'),
	(151,'促销活动',2,'org.javaboy.tienchin.web.controller.activity.ActivityController.changeStatus()','PUT',1,'admin',NULL,'/tienchin/activity/changeStatus','127.0.0.1','内网IP','{\"updateTime\":\"2022-04-25T22:35:21.552468000\",\"updateBy\":\"admin\",\"id\":4,\"status\":\"1\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-25 22:35:21'),
	(152,'促销活动',2,'org.javaboy.tienchin.web.controller.activity.ActivityController.changeStatus()','PUT',1,'admin',NULL,'/tienchin/activity/changeStatus','127.0.0.1','内网IP','{\"updateTime\":\"2022-04-25T22:36:26.908846000\",\"updateBy\":\"admin\",\"id\":4,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-25 22:36:26'),
	(153,'促销活动',2,'org.javaboy.tienchin.web.controller.activity.ActivityController.changeStatus()','PUT',1,'admin',NULL,'/tienchin/activity/changeStatus','127.0.0.1','内网IP','{\"updateTime\":\"2022-04-25T22:37:21.119720000\",\"updateBy\":\"admin\",\"id\":1,\"status\":\"1\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-25 22:37:21'),
	(154,'促销活动',2,'org.javaboy.tienchin.web.controller.activity.ActivityController.changeStatus()','PUT',1,'admin',NULL,'/tienchin/activity/changeStatus','127.0.0.1','内网IP','{\"updateTime\":\"2022-04-25T22:37:25.835419000\",\"updateBy\":\"admin\",\"id\":3,\"status\":\"1\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-25 22:37:25'),
	(155,'促销活动',2,'org.javaboy.tienchin.web.controller.activity.ActivityController.edit()','PUT',1,'admin',NULL,'/tienchin/activity/','127.0.0.1','内网IP','{\"code\":\"476874bd3bfa4209ba11196edcbb4b90\",\"channel\":\"1\",\"discount\":4.0,\"updateTime\":\"2022-04-25T22:37:31.893071000\",\"type\":\"1\",\"createBy\":\"admin\",\"createTime\":\"2022-04-25T21:12:49\",\"updateBy\":\"admin\",\"name\":\"ffffff\",\"beginTime\":\"2022-04-29T00:00:00\",\"endTime\":\"2022-05-24T23:59:59\",\"id\":3,\"info\":\"aaaaabb\",\"status\":\"1\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-25 22:37:31'),
	(156,'促销活动',2,'org.javaboy.tienchin.web.controller.activity.ActivityController.edit()','PUT',1,'admin',NULL,'/tienchin/activity/','127.0.0.1','内网IP','{\"code\":\"476874bd3bfa4209ba11196edcbb4b90\",\"channel\":\"1\",\"discount\":4.0,\"updateTime\":\"2022-04-25T22:37:44.974603000\",\"type\":\"1\",\"createBy\":\"admin\",\"createTime\":\"2022-04-25T21:12:49\",\"updateBy\":\"admin\",\"name\":\"ffffff\",\"beginTime\":\"2022-04-29T00:00:00\",\"endTime\":\"2022-05-24T23:59:59\",\"id\":3,\"info\":\"aaaaabb\",\"status\":\"1\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-25 22:37:45'),
	(157,'促销活动',2,'org.javaboy.tienchin.web.controller.activity.ActivityController.changeStatus()','PUT',1,'admin',NULL,'/tienchin/activity/changeStatus','127.0.0.1','内网IP','{\"updateTime\":\"2022-04-25T22:37:57.592055000\",\"updateBy\":\"admin\",\"id\":2,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-25 22:37:57'),
	(158,'促销活动',2,'org.javaboy.tienchin.web.controller.activity.ActivityController.changeStatus()','PUT',1,'admin',NULL,'/tienchin/activity/changeStatus','127.0.0.1','内网IP','{\"updateTime\":\"2022-04-25T22:38:00.005682000\",\"updateBy\":\"admin\",\"id\":3,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-25 22:38:00'),
	(159,'促销活动',2,'org.javaboy.tienchin.web.controller.activity.ActivityController.edit()','PUT',1,'admin',NULL,'/tienchin/activity/','127.0.0.1','内网IP','{\"code\":\"7d43499a10464c68bbf2b85559ab9b41\",\"channel\":\"2\",\"discount\":2.0,\"updateTime\":\"2022-04-25T22:38:06.556611000\",\"type\":\"1\",\"createBy\":\"admin\",\"createTime\":\"2022-04-25T21:13:45\",\"updateBy\":\"admin\",\"name\":\"vvvv\",\"beginTime\":\"2022-05-03T00:00:00\",\"endTime\":\"2022-05-17T23:59:59\",\"id\":4,\"info\":\"aaaaa\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-25 22:38:06'),
	(160,'促销活动',2,'org.javaboy.tienchin.web.controller.activity.ActivityController.edit()','PUT',1,'admin',NULL,'/tienchin/activity/','127.0.0.1','内网IP','{\"code\":\"7d43499a10464c68bbf2b85559ab9b41\",\"channel\":\"2\",\"discount\":2.0,\"updateTime\":\"2022-04-25T22:40:10.386576000\",\"type\":\"1\",\"createBy\":\"admin\",\"createTime\":\"2022-04-25T21:13:45\",\"updateBy\":\"admin\",\"name\":\"vvvv\",\"beginTime\":\"2022-05-03T00:00:00\",\"endTime\":\"2022-05-17T23:59:59\",\"id\":4,\"info\":\"aaaaa\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-25 22:40:10'),
	(161,'促销活动',2,'org.javaboy.tienchin.web.controller.activity.ActivityController.changeStatus()','PUT',1,'admin',NULL,'/tienchin/activity/changeStatus','127.0.0.1','内网IP','{\"updateTime\":\"2022-04-25T22:40:23.061039000\",\"updateBy\":\"admin\",\"id\":2,\"status\":\"1\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-25 22:40:23'),
	(162,'促销活动',2,'org.javaboy.tienchin.web.controller.activity.ActivityController.changeStatus()','PUT',1,'admin',NULL,'/tienchin/activity/changeStatus','127.0.0.1','内网IP','{\"updateTime\":\"2022-04-25T22:41:40.558278000\",\"updateBy\":\"admin\",\"id\":2,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-25 22:41:40'),
	(163,'促销活动',2,'org.javaboy.tienchin.web.controller.activity.ActivityController.changeStatus()','PUT',1,'admin',NULL,'/tienchin/activity/changeStatus','127.0.0.1','内网IP','{\"updateTime\":\"2022-04-25T22:42:36.844437000\",\"updateBy\":\"admin\",\"id\":2,\"status\":\"1\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-25 22:42:36'),
	(164,'促销活动',2,'org.javaboy.tienchin.web.controller.activity.ActivityController.edit()','PUT',1,'admin',NULL,'/tienchin/activity/','127.0.0.1','内网IP','{\"code\":\"7d43499a10464c68bbf2b85559ab9b41\",\"channel\":\"2\",\"discount\":2.3,\"updateTime\":\"2022-04-25T22:42:50.170617000\",\"type\":\"1\",\"createBy\":\"admin\",\"createTime\":\"2022-04-25T21:13:45\",\"updateBy\":\"admin\",\"name\":\"vvvv\",\"beginTime\":\"2022-05-03T00:00:00\",\"endTime\":\"2022-05-17T23:59:59\",\"id\":4,\"info\":\"aaaaa\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-25 22:42:50'),
	(165,'促销活动',2,'org.javaboy.tienchin.web.controller.activity.ActivityController.changeStatus()','PUT',1,'admin',NULL,'/tienchin/activity/changeStatus','127.0.0.1','内网IP','{\"updateTime\":\"2022-04-25T22:42:56.610092000\",\"updateBy\":\"admin\",\"id\":3,\"status\":\"1\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-25 22:42:56'),
	(166,'促销活动',1,'org.javaboy.tienchin.web.controller.activity.ActivityController.add()','POST',1,'admin',NULL,'/tienchin/activity/','127.0.0.1','内网IP','{\"code\":\"9e5e58d3d9d942d6a0bd1632cdd584a4\",\"channel\":\"3\",\"discount\":6.0,\"type\":\"1\",\"createBy\":\"admin\",\"createTime\":\"2022-04-26T19:56:06.938339000\",\"name\":\"地推\",\"beginTime\":\"2022-05-22T00:00:00\",\"endTime\":\"2022-05-23T23:59:59\",\"id\":5,\"info\":\"啊啊啊\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-26 19:56:06'),
	(167,'用户管理',5,'org.javaboy.tienchin.web.controller.system.SysUserController.export()','POST',1,'admin',NULL,'/system/user/export','127.0.0.1','内网IP','{\"admin\":false,\"params\":{\"dataScope\":\"\"}}',NULL,0,NULL,'2022-04-26 20:02:44'),
	(168,'用户管理',5,'org.javaboy.tienchin.web.controller.system.SysUserController.export()','POST',1,'admin',NULL,'/system/user/export','127.0.0.1','内网IP','{\"admin\":false,\"params\":{\"dataScope\":\"\"}}',NULL,0,NULL,'2022-04-26 20:06:25'),
	(169,'用户管理',5,'org.javaboy.tienchin.web.controller.system.SysUserController.export()','POST',1,'admin',NULL,'/system/user/export','127.0.0.1','内网IP','{\"admin\":false,\"params\":{\"dataScope\":\"\"}}',NULL,0,NULL,'2022-04-26 20:23:19'),
	(170,'活动管理',5,'org.javaboy.tienchin.web.controller.activity.ActivityController.export()','POST',1,'admin',NULL,'/tienchin/activity/export','127.0.0.1','内网IP','{}',NULL,0,NULL,'2022-04-26 20:27:23'),
	(171,'活动管理',5,'org.javaboy.tienchin.web.controller.activity.ActivityController.export()','POST',1,'admin',NULL,'/tienchin/activity/export','127.0.0.1','内网IP','{}',NULL,0,NULL,'2022-04-26 20:28:10'),
	(172,'活动管理',5,'org.javaboy.tienchin.web.controller.activity.ActivityController.export()','POST',1,'admin',NULL,'/tienchin/activity/export','127.0.0.1','内网IP','{}',NULL,0,NULL,'2022-04-26 20:31:10'),
	(173,'活动管理',5,'org.javaboy.tienchin.web.controller.activity.ActivityController.export()','POST',1,'admin',NULL,'/tienchin/activity/export','127.0.0.1','内网IP','{}',NULL,0,NULL,'2022-04-26 20:32:18'),
	(174,'活动管理',5,'org.javaboy.tienchin.web.controller.activity.ActivityController.export()','POST',1,'admin',NULL,'/tienchin/activity/export','127.0.0.1','内网IP','{\"beginTime\":\"2022-05-15T00:00:00\",\"endTime\":\"2022-05-20T23:59:59\"}',NULL,0,NULL,'2022-04-26 20:32:42'),
	(175,'活动管理',6,'org.javaboy.tienchin.web.controller.activity.ActivityController.importData()','POST',1,'admin',NULL,'/tienchin/activity/importData','127.0.0.1','内网IP','',NULL,1,'method: public void org.javaboy.tienchin.activity.entity.Activity.setBeginTime(java.time.LocalDateTime), obj: Activity{id=null, code=17023b447a50418d86618f429df401f5, name=抖音啊啊啊, channel=2, info=活动, type=1, discount=8.0, voucher=null, status=, beginTime=null, endTime=null, createTime=null, updateTime=null, createBy=null, updateBy=null}, args: [Ljava.lang.Object;@24259f76','2022-04-26 20:39:56'),
	(176,'活动管理',6,'org.javaboy.tienchin.web.controller.activity.ActivityController.importData()','POST',1,'admin',NULL,'/tienchin/activity/importData','127.0.0.1','内网IP','',NULL,1,'method: public void org.javaboy.tienchin.activity.entity.Activity.setBeginTime(java.time.LocalDateTime), obj: Activity{id=null, code=17023b447a50418d86618f429df401f5, name=抖音啊啊啊, channel=2, info=活动, type=1, discount=8.0, voucher=null, status=, beginTime=null, endTime=null, createTime=null, updateTime=null, createBy=null, updateBy=null}, args: [Ljava.lang.Object;@311c6e37','2022-04-26 20:41:12'),
	(177,'活动管理',6,'org.javaboy.tienchin.web.controller.activity.ActivityController.importData()','POST',1,'admin',NULL,'/tienchin/activity/importData','127.0.0.1','内网IP','',NULL,1,'method: public void org.javaboy.tienchin.activity.entity.Activity.setBeginTime(java.time.LocalDateTime), obj: Activity{id=null, code=17023b447a50418d86618f429df401f5, name=抖音啊啊啊, channel=2, info=活动, type=1, discount=8.0, voucher=null, status=0, beginTime=null, endTime=null, createTime=null, updateTime=null, createBy=null, updateBy=null}, args: [Ljava.lang.Object;@323a1ffa','2022-04-26 20:41:36'),
	(178,'活动管理',6,'org.javaboy.tienchin.web.controller.activity.ActivityController.importData()','POST',1,'admin',NULL,'/tienchin/activity/importData','127.0.0.1','内网IP','',NULL,1,'method: public void org.javaboy.tienchin.activity.entity.Activity.setBeginTime(java.time.LocalDateTime), obj: Activity{id=null, code=17023b447a50418d86618f429df401f5, name=抖音啊啊啊, channel=2, info=活动, type=1, discount=8.0, voucher=null, status=0, beginTime=null, endTime=null, createTime=null, updateTime=null, createBy=null, updateBy=null}, args: [Ljava.lang.Object;@52b094d6','2022-04-26 20:42:33'),
	(179,'活动管理',6,'org.javaboy.tienchin.web.controller.activity.ActivityController.importData()','POST',1,'admin',NULL,'/tienchin/activity/importData','127.0.0.1','内网IP','',NULL,1,'method: public void org.javaboy.tienchin.activity.entity.Activity.setBeginTime(java.time.LocalDateTime), obj: Activity{id=null, code=17023b447a50418d86618f429df401f5, name=抖音啊啊啊, channel=2, info=活动, type=1, discount=8.0, voucher=null, status=0, beginTime=null, endTime=null, createTime=null, updateTime=null, createBy=null, updateBy=null}, args: [Ljava.lang.Object;@9e47550','2022-04-26 20:43:45'),
	(180,'活动管理',6,'org.javaboy.tienchin.web.controller.activity.ActivityController.importData()','POST',1,'admin',NULL,'/tienchin/activity/importData','127.0.0.1','内网IP','',NULL,1,'method: public void org.javaboy.tienchin.activity.entity.Activity.setBeginTime(java.time.LocalDateTime), obj: Activity{id=null, code=17023b447a50418d86618f429df401f5, name=抖音啊啊啊, channel=2, info=活动, type=1, discount=8.0, voucher=null, status=0, beginTime=null, endTime=null, createTime=null, updateTime=null, createBy=null, updateBy=null}, args: [Ljava.lang.Object;@40e1a396','2022-04-26 21:00:16'),
	(181,'活动管理',6,'org.javaboy.tienchin.web.controller.activity.ActivityController.importData()','POST',1,'admin',NULL,'/tienchin/activity/importData','127.0.0.1','内网IP','','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-26 21:19:09'),
	(182,'活动管理',5,'org.javaboy.tienchin.web.controller.activity.ActivityController.export()','POST',1,'admin',NULL,'/tienchin/activity/export','127.0.0.1','内网IP','{}',NULL,0,NULL,'2022-04-26 21:19:28'),
	(183,'活动管理',6,'org.javaboy.tienchin.web.controller.activity.ActivityController.importData()','POST',1,'admin',NULL,'/tienchin/activity/importData','127.0.0.1','内网IP','','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-26 21:19:39'),
	(184,'活动管理',3,'org.javaboy.tienchin.web.controller.activity.ActivityController.remove()','DELETE',1,'admin',NULL,'/tienchin/activity/9,10','127.0.0.1','内网IP','{activityIds=9,10}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-26 21:26:58'),
	(185,'活动管理',3,'org.javaboy.tienchin.web.controller.activity.ActivityController.remove()','DELETE',1,'admin',NULL,'/tienchin/activity/12','127.0.0.1','内网IP','{activityIds=12}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-26 21:27:07'),
	(186,'渠道管理',3,'org.javaboy.tienchin.web.controller.channel.ChannelController.remove()','DELETE',1,'admin',NULL,'/tienchin/channel/1','127.0.0.1','内网IP','{channelIds=1}','{\"msg\":\"该渠道下有活动，无法删除\",\"code\":500}',0,NULL,'2022-04-26 21:39:09'),
	(187,'渠道管理',3,'org.javaboy.tienchin.web.controller.channel.ChannelController.remove()','DELETE',1,'admin',NULL,'/tienchin/channel/2','127.0.0.1','内网IP','{channelIds=2}','{\"msg\":\"该渠道下有活动，无法删除\",\"code\":500}',0,NULL,'2022-04-26 21:39:16'),
	(188,'渠道管理',3,'org.javaboy.tienchin.web.controller.channel.ChannelController.remove()','DELETE',1,'admin',NULL,'/tienchin/channel/13','127.0.0.1','内网IP','{channelIds=13}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-26 21:39:20'),
	(189,'渠道管理',1,'org.javaboy.tienchin.web.controller.channel.ChannelController.add()','POST',1,'admin',NULL,'/tienchin/channel/','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"createTime\":\"2022-04-26T21:40:50.233033000\",\"channelName\":\"3\",\"remark\":\"3\",\"channelId\":16,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-26 21:40:50'),
	(190,'渠道管理',1,'org.javaboy.tienchin.web.controller.channel.ChannelController.add()','POST',1,'admin',NULL,'/tienchin/channel/','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"createTime\":\"2022-04-26T21:40:55.866156000\",\"channelName\":\"4\",\"remark\":\"4\",\"channelId\":17,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-26 21:40:55'),
	(191,'渠道管理',1,'org.javaboy.tienchin.web.controller.channel.ChannelController.add()','POST',1,'admin',NULL,'/tienchin/channel/','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"createTime\":\"2022-04-26T21:41:02.472058000\",\"channelName\":\"5\",\"remark\":\"5\",\"channelId\":18,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-26 21:41:02'),
	(192,'渠道管理',3,'org.javaboy.tienchin.web.controller.channel.ChannelController.remove()','DELETE',1,'admin',NULL,'/tienchin/channel/18','127.0.0.1','内网IP','{channelIds=18}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-26 21:41:06'),
	(193,'渠道管理',3,'org.javaboy.tienchin.web.controller.channel.ChannelController.remove()','DELETE',1,'admin',NULL,'/tienchin/channel/16,17','127.0.0.1','内网IP','{channelIds=16,17}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-26 21:41:13'),
	(194,'渠道管理',3,'org.javaboy.tienchin.web.controller.channel.ChannelController.remove()','DELETE',1,'admin',NULL,'/tienchin/channel/1,2,3,4,5,6,13','127.0.0.1','内网IP','{channelIds=1,2,3,4,5,6,13}','{\"msg\":\"该渠道下有活动，无法删除\",\"code\":500}',0,NULL,'2022-04-26 21:41:17'),
	(195,'渠道管理',3,'org.javaboy.tienchin.web.controller.channel.ChannelController.remove()','DELETE',1,'admin',NULL,'/tienchin/channel/1','127.0.0.1','内网IP','{channelIds=1}','{\"msg\":\"该渠道下有活动，无法删除\",\"code\":500}',0,NULL,'2022-04-26 21:41:26'),
	(196,'渠道管理',3,'org.javaboy.tienchin.web.controller.channel.ChannelController.remove()','DELETE',1,'admin',NULL,'/tienchin/channel/1','127.0.0.1','内网IP','{channelIds=1}','{\"msg\":\"该渠道下有活动，无法删除\",\"code\":500}',0,NULL,'2022-04-26 21:41:29'),
	(197,'促销活动',1,'org.javaboy.tienchin.web.controller.activity.ActivityController.add()','POST',1,'admin',NULL,'/tienchin/activity/','127.0.0.1','内网IP','{\"code\":\"67d5d4d1cb884b11849b236ca9555556\",\"channel\":\"5\",\"discount\":0.4,\"type\":\"1\",\"createBy\":\"admin\",\"createTime\":\"2022-04-26T22:15:17.837676000\",\"name\":\"头条投放\",\"beginTime\":\"2022-05-15T00:00:00\",\"endTime\":\"2022-05-23T23:59:59\",\"id\":13,\"info\":\"零零落落零零落落\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-26 22:15:17'),
	(198,'促销活动',2,'org.javaboy.tienchin.web.controller.activity.ActivityController.edit()','PUT',1,'admin',NULL,'/tienchin/activity/','127.0.0.1','内网IP','{\"code\":\"67d5d4d1cb884b11849b236ca9555556\",\"channel\":\"5\",\"discount\":0.6,\"updateTime\":\"2022-04-26T22:15:30.223683000\",\"type\":\"1\",\"createBy\":\"admin\",\"createTime\":\"2022-04-26T22:15:18\",\"updateBy\":\"admin\",\"name\":\"头条投放\",\"beginTime\":\"2022-05-15T00:00:00\",\"endTime\":\"2022-05-23T23:59:59\",\"id\":13,\"info\":\"零零落落零零落落\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-26 22:15:30'),
	(199,'促销活动',2,'org.javaboy.tienchin.web.controller.activity.ActivityController.changeStatus()','PUT',1,'admin',NULL,'/tienchin/activity/changeStatus','127.0.0.1','内网IP','{\"updateTime\":\"2022-04-26T22:15:34.648406000\",\"updateBy\":\"admin\",\"id\":13,\"status\":\"1\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-26 22:15:34'),
	(200,'促销活动',2,'org.javaboy.tienchin.web.controller.activity.ActivityController.changeStatus()','PUT',1,'admin',NULL,'/tienchin/activity/changeStatus','127.0.0.1','内网IP','{\"updateTime\":\"2022-04-26T22:15:39.248894000\",\"updateBy\":\"admin\",\"id\":13,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-26 22:15:39'),
	(201,'促销活动',2,'org.javaboy.tienchin.web.controller.activity.ActivityController.edit()','PUT',1,'admin',NULL,'/tienchin/activity/','127.0.0.1','内网IP','{\"code\":\"17023b447a50418d86618f429df401f5\",\"channel\":\"2\",\"discount\":8.1,\"updateTime\":\"2022-04-26T22:15:49.538454000\",\"type\":\"1\",\"createBy\":\"admin\",\"createTime\":\"2022-04-25T20:51:48\",\"updateBy\":\"admin\",\"name\":\"抖音啊啊啊\",\"beginTime\":\"2022-05-16T00:00:00\",\"endTime\":\"2022-05-19T23:59:59\",\"id\":1,\"info\":\"活动\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-26 22:15:49'),
	(202,'活动管理',5,'org.javaboy.tienchin.web.controller.activity.ActivityController.export()','POST',1,'admin',NULL,'/tienchin/activity/export','127.0.0.1','内网IP','{}',NULL,0,NULL,'2022-04-26 22:16:03'),
	(203,'活动管理',6,'org.javaboy.tienchin.web.controller.activity.ActivityController.importData()','POST',1,'admin',NULL,'/tienchin/activity/importData','127.0.0.1','内网IP','','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-26 22:16:16'),
	(204,'活动管理',3,'org.javaboy.tienchin.web.controller.activity.ActivityController.remove()','DELETE',1,'admin',NULL,'/tienchin/activity/14,15,16,17,18,19,20,21,22,23','127.0.0.1','内网IP','{activityIds=14,15,16,17,18,19,20,21,22,23}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-26 22:16:24'),
	(205,'活动管理',3,'org.javaboy.tienchin.web.controller.activity.ActivityController.remove()','DELETE',1,'admin',NULL,'/tienchin/activity/13','127.0.0.1','内网IP','{activityIds=13}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-26 22:16:28'),
	(206,'活动管理',3,'org.javaboy.tienchin.web.controller.activity.ActivityController.remove()','DELETE',1,'admin',NULL,'/tienchin/activity/11,8','127.0.0.1','内网IP','{activityIds=11,8}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-26 22:16:33'),
	(207,'活动管理',5,'org.javaboy.tienchin.web.controller.activity.ActivityController.export()','POST',1,'admin',NULL,'/tienchin/activity/export','127.0.0.1','内网IP','{}',NULL,0,NULL,'2022-04-27 21:36:08'),
	(208,'促销活动',2,'org.javaboy.tienchin.web.controller.activity.ActivityController.edit()','PUT',1,'admin',NULL,'/tienchin/activity/','127.0.0.1','内网IP','{\"code\":\"17023b447a50418d86618f429df401f5\",\"channel\":\"2\",\"discount\":8.2,\"updateTime\":\"2022-04-28T20:43:13.655148000\",\"type\":\"1\",\"createBy\":\"admin\",\"createTime\":\"2022-04-25T20:51:48\",\"updateBy\":\"admin\",\"name\":\"抖音啊啊啊\",\"beginTime\":\"2022-05-16T00:00:00\",\"endTime\":\"2022-05-19T23:59:59\",\"id\":1,\"info\":\"活动\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-28 20:43:13'),
	(209,'角色管理',2,'org.javaboy.tienchin.web.controller.system.SysRoleController.changeStatus()','PUT',1,'admin',NULL,'/system/role/changeStatus','127.0.0.1','内网IP','{\"flag\":false,\"roleId\":1,\"admin\":true,\"params\":{},\"deptCheckStrictly\":false,\"menuCheckStrictly\":false,\"status\":\"1\"}',NULL,1,'不允许操作超级管理员角色','2022-04-28 23:01:31'),
	(210,'角色管理',2,'org.javaboy.tienchin.web.controller.system.SysRoleController.changeStatus()','PUT',1,'admin',NULL,'/system/role/changeStatus','127.0.0.1','内网IP','{\"flag\":false,\"roleId\":2,\"admin\":false,\"params\":{},\"deptCheckStrictly\":false,\"updateBy\":\"admin\",\"menuCheckStrictly\":false,\"status\":\"1\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-28 23:01:34'),
	(211,'角色管理',2,'org.javaboy.tienchin.web.controller.system.SysRoleController.changeStatus()','PUT',1,'admin',NULL,'/system/role/changeStatus','127.0.0.1','内网IP','{\"flag\":false,\"roleId\":2,\"admin\":false,\"params\":{},\"deptCheckStrictly\":false,\"updateBy\":\"admin\",\"menuCheckStrictly\":false,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-28 23:01:38'),
	(212,'渠道管理',2,'org.javaboy.tienchin.web.controller.channel.ChannelController.edit()','PUT',1,'admin',NULL,'/tienchin/channel/','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"createTime\":\"2022-04-23T15:12:13\",\"updateBy\":\"admin\",\"channelName\":\"百度搜索\",\"remark\":\"aaaaa\",\"updateTime\":\"2022-04-28T23:02:36.873651000\",\"params\":{},\"channelId\":1,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-28 23:02:36'),
	(213,'渠道管理',1,'org.javaboy.tienchin.web.controller.channel.ChannelController.add()','POST',1,'admin',NULL,'/tienchin/channel/','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"createTime\":\"2022-04-28T23:02:43.721875000\",\"channelName\":\"d\",\"remark\":\"d\",\"params\":{},\"channelId\":19,\"status\":\"1\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-28 23:02:43'),
	(214,'渠道管理',2,'org.javaboy.tienchin.web.controller.channel.ChannelController.edit()','PUT',1,'admin',NULL,'/tienchin/channel/','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"createTime\":\"2022-04-28T23:02:44\",\"updateBy\":\"admin\",\"channelName\":\"d\",\"remark\":\"d\",\"updateTime\":\"2022-04-28T23:02:48.875529000\",\"params\":{},\"channelId\":19,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-28 23:02:48'),
	(215,'线索管理',1,'org.javaboy.tienchin.web.controller.clue.ClueController.add()','POST',1,'admin',NULL,'/tienchin/clue/','127.0.0.1','内网IP','{\"qq\":\"88888888\",\"gender\":\"0\",\"channel\":\"2\",\"activityId\":1,\"createBy\":\"admin\",\"weixin\":\"zhangsan\",\"createTime\":\"2022-04-30T10:05:07.348455000\",\"phone\":\"13222222222\",\"name\":\"赵六\",\"id\":1,\"age\":20,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-30 10:05:07'),
	(216,'线索管理',1,'org.javaboy.tienchin.web.controller.clue.ClueController.add()','POST',1,'admin',NULL,'/tienchin/clue/','127.0.0.1','内网IP','{\"qq\":\"1111111\",\"gender\":\"0\",\"channel\":\"2\",\"activityId\":4,\"createBy\":\"admin\",\"weixin\":\"ffff33333\",\"createTime\":\"2022-04-30T10:10:49.257412000\",\"phone\":\"13233333333\",\"name\":\"aaa\",\"id\":2,\"age\":1,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-30 10:10:49'),
	(217,'线索管理',1,'org.javaboy.tienchin.web.controller.clue.ClueController.add()','POST',1,'admin',NULL,'/tienchin/clue/','127.0.0.1','内网IP','{\"qq\":\"8359458903\",\"gender\":\"0\",\"channel\":\"2\",\"activityId\":4,\"createBy\":\"admin\",\"weixin\":\"aaaa39459034\",\"createTime\":\"2022-04-30T10:13:22.136263000\",\"phone\":\"13199999999\",\"name\":\"lisi\",\"id\":3,\"age\":4}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-30 10:13:22'),
	(218,'线索管理',1,'org.javaboy.tienchin.web.controller.clue.ClueController.add()','POST',1,'admin',NULL,'/tienchin/clue/','127.0.0.1','内网IP','{\"qq\":\"8453798748\",\"gender\":\"0\",\"channel\":\"2\",\"activityId\":6,\"createBy\":\"admin\",\"weixin\":\"angwu\",\"createTime\":\"2022-04-30T16:34:06.704494000\",\"phone\":\"13433333333\",\"name\":\"王五\",\"endTime\":\"2022-04-30T17:34:06.730722000\",\"id\":4,\"age\":33}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-30 16:34:06'),
	(219,'线索管理',1,'org.javaboy.tienchin.web.controller.clue.ClueController.add()','POST',1,'admin',NULL,'/tienchin/clue/','127.0.0.1','内网IP','{\"qq\":\"8789475893\",\"gender\":\"0\",\"channel\":\"2\",\"activityId\":7,\"createBy\":\"admin\",\"weixin\":\"kdajfd\",\"createTime\":\"2022-04-30T16:42:03.782272000\",\"phone\":\"18988888888\",\"name\":\"找刘\",\"endTime\":\"2022-04-30T17:42:03.815129000\",\"id\":5,\"age\":66}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-30 16:42:03'),
	(220,'字典类型',1,'org.javaboy.tienchin.web.controller.system.SysDictTypeController.add()','POST',1,'admin',NULL,'/system/dict/type','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"dictName\":\"线索状态\",\"params\":{},\"dictType\":\"clue_status_type\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-30 17:18:36'),
	(221,'字典数据',1,'org.javaboy.tienchin.web.controller.system.SysDictDataController.add()','POST',1,'admin',NULL,'/system/dict/data','127.0.0.1','内网IP','{\"dictValue\":\"1\",\"listClass\":\"default\",\"dictSort\":0,\"params\":{},\"dictType\":\"clue_status_type\",\"dictLabel\":\"已分配\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-30 17:19:29'),
	(222,'字典数据',1,'org.javaboy.tienchin.web.controller.system.SysDictDataController.add()','POST',1,'admin',NULL,'/system/dict/data','127.0.0.1','内网IP','{\"dictValue\":\"2\",\"listClass\":\"default\",\"dictSort\":1,\"params\":{},\"dictType\":\"clue_status_type\",\"dictLabel\":\"进行中\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-30 17:19:42'),
	(223,'字典数据',1,'org.javaboy.tienchin.web.controller.system.SysDictDataController.add()','POST',1,'admin',NULL,'/system/dict/data','127.0.0.1','内网IP','{\"dictValue\":\"3\",\"listClass\":\"default\",\"dictSort\":3,\"params\":{},\"dictType\":\"clue_status_type\",\"dictLabel\":\"已回收\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-30 17:20:15'),
	(224,'字典数据',2,'org.javaboy.tienchin.web.controller.system.SysDictDataController.edit()','PUT',1,'admin',NULL,'/system/dict/data','127.0.0.1','内网IP','{\"dictValue\":\"3\",\"listClass\":\"default\",\"dictSort\":2,\"params\":{},\"dictType\":\"clue_status_type\",\"dictLabel\":\"已回收\",\"createBy\":\"admin\",\"default\":false,\"isDefault\":\"N\",\"createTime\":\"2022-04-30T17:20:15\",\"dictCode\":107,\"updateBy\":\"admin\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-30 17:20:23'),
	(225,'字典数据',1,'org.javaboy.tienchin.web.controller.system.SysDictDataController.add()','POST',1,'admin',NULL,'/system/dict/data','127.0.0.1','内网IP','{\"dictValue\":\"4\",\"listClass\":\"default\",\"dictSort\":3,\"params\":{},\"dictType\":\"clue_status_type\",\"dictLabel\":\"伪线索\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-30 17:20:46'),
	(226,'线索管理',1,'org.javaboy.tienchin.web.controller.clue.ClueController.add()','POST',1,'admin',NULL,'/tienchin/clue/','127.0.0.1','内网IP','{\"qq\":\"983458903\",\"gender\":\"1\",\"channel\":\"2\",\"activityId\":4,\"createBy\":\"admin\",\"weixin\":\"dsjkfajkfd\",\"createTime\":\"2022-04-30T19:51:43.174664000\",\"phone\":\"18899999999\",\"name\":\"zhangsan\",\"endTime\":\"2022-04-30T20:51:43.194924000\",\"id\":6,\"age\":30}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-30 19:51:43'),
	(227,'线索管理',1,'org.javaboy.tienchin.web.controller.clue.ClueController.add()','POST',1,'admin',NULL,'/tienchin/clue/','127.0.0.1','内网IP','{\"qq\":\"904589305\",\"gender\":\"0\",\"channel\":\"2\",\"activityId\":4,\"createBy\":\"admin\",\"weixin\":\"jfaldkld\",\"createTime\":\"2022-04-30T19:55:27.286194000\",\"phone\":\"11111111111\",\"name\":\"zhaoliu\",\"endTime\":\"2022-04-30T20:55:27.291660000\",\"id\":7,\"age\":3}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-30 19:55:27'),
	(228,'字典类型',1,'org.javaboy.tienchin.web.controller.system.SysDictTypeController.add()','POST',1,'admin',NULL,'/system/dict/type','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"dictName\":\"意向等级\",\"params\":{},\"dictType\":\"intention_level\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-05-03 13:08:45'),
	(229,'字典数据',1,'org.javaboy.tienchin.web.controller.system.SysDictDataController.add()','POST',1,'admin',NULL,'/system/dict/data','127.0.0.1','内网IP','{\"dictValue\":\"0\",\"listClass\":\"default\",\"dictSort\":0,\"params\":{},\"dictType\":\"intention_level\",\"dictLabel\":\"近期报名\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-05-03 13:09:45'),
	(230,'字典数据',1,'org.javaboy.tienchin.web.controller.system.SysDictDataController.add()','POST',1,'admin',NULL,'/system/dict/data','127.0.0.1','内网IP','{\"dictValue\":\"1\",\"listClass\":\"default\",\"dictSort\":1,\"params\":{},\"dictType\":\"intention_level\",\"dictLabel\":\"考虑中，打算报名\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-05-03 13:10:12'),
	(231,'字典数据',1,'org.javaboy.tienchin.web.controller.system.SysDictDataController.add()','POST',1,'admin',NULL,'/system/dict/data','127.0.0.1','内网IP','{\"dictValue\":\"2\",\"listClass\":\"default\",\"dictSort\":2,\"params\":{},\"dictType\":\"intention_level\",\"dictLabel\":\"了解一下\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-05-03 13:10:45'),
	(232,'字典数据',1,'org.javaboy.tienchin.web.controller.system.SysDictDataController.add()','POST',1,'admin',NULL,'/system/dict/data','127.0.0.1','内网IP','{\"dictValue\":\"3\",\"listClass\":\"default\",\"dictSort\":3,\"params\":{},\"dictType\":\"intention_level\",\"dictLabel\":\"随便看看\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-05-03 13:10:56'),
	(233,'字典类型',1,'org.javaboy.tienchin.web.controller.system.SysDictTypeController.add()','POST',1,'admin',NULL,'/system/dict/type','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"dictName\":\"意向类型\",\"params\":{},\"dictType\":\"intention_type\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-05-03 13:17:34'),
	(234,'字典数据',1,'org.javaboy.tienchin.web.controller.system.SysDictDataController.add()','POST',1,'admin',NULL,'/system/dict/data','127.0.0.1','内网IP','{\"dictValue\":\"0\",\"listClass\":\"default\",\"dictSort\":0,\"params\":{},\"dictType\":\"intention_type\",\"dictLabel\":\"随便练练\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-05-03 13:17:55'),
	(235,'字典数据',1,'org.javaboy.tienchin.web.controller.system.SysDictDataController.add()','POST',1,'admin',NULL,'/system/dict/data','127.0.0.1','内网IP','{\"dictValue\":\"1\",\"listClass\":\"default\",\"dictSort\":1,\"params\":{},\"dictType\":\"intention_type\",\"dictLabel\":\"泰拳\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-05-03 13:18:06'),
	(236,'字典数据',1,'org.javaboy.tienchin.web.controller.system.SysDictDataController.add()','POST',1,'admin',NULL,'/system/dict/data','127.0.0.1','内网IP','{\"dictValue\":\"2\",\"listClass\":\"default\",\"dictSort\":2,\"params\":{},\"dictType\":\"intention_type\",\"dictLabel\":\"减肥\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-05-03 13:18:21'),
	(237,'字典数据',1,'org.javaboy.tienchin.web.controller.system.SysDictDataController.add()','POST',1,'admin',NULL,'/system/dict/data','127.0.0.1','内网IP','{\"dictValue\":\"3\",\"listClass\":\"default\",\"dictSort\":3,\"params\":{},\"dictType\":\"intention_type\",\"dictLabel\":\"舞蹈\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-05-03 13:18:37'),
	(238,'字典数据',1,'org.javaboy.tienchin.web.controller.system.SysDictDataController.add()','POST',1,'admin',NULL,'/system/dict/data','127.0.0.1','内网IP','{\"dictValue\":\"4\",\"listClass\":\"default\",\"dictSort\":4,\"params\":{},\"dictType\":\"intention_type\",\"dictLabel\":\"游泳\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-05-03 13:20:46'),
	(239,'线索管理',2,'org.javaboy.tienchin.web.controller.clue.ClueController.follow()','PUT',1,'admin',NULL,'/tienchin/clue/','127.0.0.1','内网IP','{\"qq\":\"8789475893\",\"gender\":\"0\",\"level\":\"了解一下\",\"nextTime\":\"2022-04-30T16:42:03\",\"subject\":\"舞蹈\",\"channel\":\"2\",\"updateTime\":\"2022-04-30T16:42:03\",\"activityId\":7,\"createBy\":\"admin\",\"transfer\":\"0\",\"weixin\":\"kdajfd\",\"createTime\":\"2022-04-30T16:42:04\",\"phone\":\"18988888888\",\"falseCount\":0,\"record\":\"kkkkkkk\",\"name\":\"找刘\",\"endTime\":\"2022-04-30T17:42:04\",\"id\":5,\"age\":65,\"status\":\"1\"}',NULL,1,'\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'level\' at row 1\n### The error may exist in org/javaboy/tienchin/clue/mapper/ClueMapper.java (best guess)\n### The error may involve org.javaboy.tienchin.clue.mapper.ClueMapper.updateById-Inline\n### The error occurred while setting parameters\n### SQL: UPDATE tienchin_clue  SET name=?, phone=?, channel=?, activity_id=?, gender=?, age=?, weixin=?, qq=?, level=?, subject=?, status=?, create_by=?, false_count=?, next_time=?, update_time=?, transfer=?, end_time=?, create_time=?  WHERE id=?\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'level\' at row 1\n; Data truncation: Data too long for column \'level\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'level\' at row 1','2022-05-03 16:40:23'),
	(240,'线索管理',2,'org.javaboy.tienchin.web.controller.clue.ClueController.follow()','PUT',1,'admin',NULL,'/tienchin/clue/','127.0.0.1','内网IP','{\"qq\":\"8789475893\",\"gender\":\"0\",\"level\":\"了解一下\",\"nextTime\":\"2022-04-30T16:42:03\",\"subject\":\"舞蹈\",\"channel\":\"2\",\"updateTime\":\"2022-04-30T16:42:03\",\"activityId\":7,\"createBy\":\"admin\",\"transfer\":\"0\",\"weixin\":\"kdajfd\",\"createTime\":\"2022-04-30T16:42:04\",\"phone\":\"18988888888\",\"falseCount\":0,\"record\":\"kkkkkkk\",\"name\":\"找刘\",\"endTime\":\"2022-04-30T17:42:04\",\"id\":5,\"age\":65,\"status\":\"1\"}',NULL,1,'\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'level\' at row 1\n### The error may exist in org/javaboy/tienchin/clue/mapper/ClueMapper.java (best guess)\n### The error may involve org.javaboy.tienchin.clue.mapper.ClueMapper.updateById-Inline\n### The error occurred while setting parameters\n### SQL: UPDATE tienchin_clue  SET name=?, phone=?, channel=?, activity_id=?, gender=?, age=?, weixin=?, qq=?, level=?, subject=?, status=?, create_by=?, false_count=?, next_time=?, update_time=?, transfer=?, end_time=?, create_time=?  WHERE id=?\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'level\' at row 1\n; Data truncation: Data too long for column \'level\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'level\' at row 1','2022-05-03 16:40:47'),
	(241,'线索管理',2,'org.javaboy.tienchin.web.controller.clue.ClueController.follow()','PUT',1,'admin',NULL,'/tienchin/clue/','127.0.0.1','内网IP','{\"qq\":\"8789475893\",\"gender\":\"0\",\"level\":\"2\",\"nextTime\":\"2022-04-30T16:42:03\",\"subject\":\"舞蹈\",\"channel\":\"2\",\"updateTime\":\"2022-04-30T16:42:03\",\"activityId\":7,\"createBy\":\"admin\",\"transfer\":\"0\",\"weixin\":\"kdajfd\",\"createTime\":\"2022-04-30T16:42:04\",\"phone\":\"18988888888\",\"falseCount\":0,\"record\":\"oooooo\",\"name\":\"找刘\",\"endTime\":\"2022-04-30T17:42:04\",\"id\":5,\"age\":66,\"status\":\"1\"}',NULL,1,'\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'subject\' at row 1\n### The error may exist in org/javaboy/tienchin/clue/mapper/ClueMapper.java (best guess)\n### The error may involve org.javaboy.tienchin.clue.mapper.ClueMapper.updateById-Inline\n### The error occurred while setting parameters\n### SQL: UPDATE tienchin_clue  SET name=?, phone=?, channel=?, activity_id=?, gender=?, age=?, weixin=?, qq=?, level=?, subject=?, status=?, create_by=?, false_count=?, next_time=?, update_time=?, transfer=?, end_time=?, create_time=?  WHERE id=?\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'subject\' at row 1\n; Data truncation: Data too long for column \'subject\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'subject\' at row 1','2022-05-03 16:42:44'),
	(242,'线索管理',2,'org.javaboy.tienchin.web.controller.clue.ClueController.follow()','PUT',1,'admin',NULL,'/tienchin/clue/','127.0.0.1','内网IP','{\"qq\":\"8789475893\",\"gender\":\"0\",\"level\":\"2\",\"nextTime\":\"2022-04-30T16:42:03\",\"subject\":\"3\",\"channel\":\"2\",\"updateTime\":\"2022-04-30T16:42:03\",\"activityId\":7,\"createBy\":\"admin\",\"transfer\":\"0\",\"weixin\":\"kdajfd\",\"createTime\":\"2022-04-30T16:42:04\",\"phone\":\"18988888888\",\"falseCount\":0,\"record\":\"oooooo\",\"name\":\"找刘\",\"endTime\":\"2022-04-30T17:42:04\",\"id\":5,\"age\":66,\"status\":\"1\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-05-03 16:43:21'),
	(243,'线索管理',2,'org.javaboy.tienchin.web.controller.clue.ClueController.follow()','PUT',1,'admin',NULL,'/tienchin/clue/','127.0.0.1','内网IP','{\"qq\":\"8789475893\",\"gender\":\"0\",\"level\":\"2\",\"nextTime\":\"2022-05-05T00:00:00\",\"subject\":\"3\",\"channel\":\"2\",\"updateTime\":\"2022-04-30T16:42:03\",\"activityId\":7,\"createBy\":\"admin\",\"transfer\":\"0\",\"weixin\":\"kdajfd\",\"createTime\":\"2022-04-30T16:42:04\",\"phone\":\"18988888888\",\"falseCount\":0,\"record\":\"继续跟进\",\"name\":\"找刘\",\"endTime\":\"2022-04-30T17:42:04\",\"id\":5,\"age\":30,\"status\":\"1\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-05-03 16:46:05'),
	(244,'线索管理',2,'org.javaboy.tienchin.web.controller.clue.ClueController.follow()','PUT',1,'admin',NULL,'/tienchin/clue/','127.0.0.1','内网IP','{\"qq\":\"22222\",\"gender\":\"0\",\"level\":\"3\",\"subject\":\"4\",\"channel\":\"2\",\"activityId\":4,\"createBy\":\"admin\",\"transfer\":\"0\",\"weixin\":\"ffff33333\",\"createTime\":\"2022-04-30T10:10:49\",\"phone\":\"13233333333\",\"falseCount\":0,\"record\":\"电话跟进一次\",\"name\":\"aaa\",\"id\":2,\"age\":3,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-05-03 17:02:07'),
	(245,'线索管理',2,'org.javaboy.tienchin.web.controller.clue.ClueController.follow()','PUT',1,'admin',NULL,'/tienchin/clue/','127.0.0.1','内网IP','{\"qq\":\"88888888\",\"gender\":\"0\",\"channel\":\"2\",\"activityId\":1,\"createBy\":\"admin\",\"transfer\":\"0\",\"weixin\":\"zhangsan\",\"createTime\":\"2022-04-30T10:05:07\",\"phone\":\"13222222222\",\"falseCount\":0,\"record\":\"零零落落\",\"name\":\"赵六\",\"id\":1,\"age\":20,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-05-03 17:10:08'),
	(246,'线索管理',2,'org.javaboy.tienchin.web.controller.clue.ClueController.follow()','PUT',1,'admin',NULL,'/tienchin/clue/','127.0.0.1','内网IP','{\"qq\":\"88888888\",\"gender\":\"0\",\"channel\":\"2\",\"activityId\":1,\"createBy\":\"admin\",\"transfer\":\"0\",\"weixin\":\"zhangsan\",\"createTime\":\"2022-04-30T10:05:07\",\"phone\":\"13222222222\",\"falseCount\":0,\"name\":\"赵六\",\"id\":1,\"age\":20,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-05-03 17:10:30'),
	(247,'线索管理',2,'org.javaboy.tienchin.web.controller.clue.ClueController.assginClue()','PUT',1,'admin',NULL,'/tienchin/clue/assign','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"createTime\":\"2022-05-03T20:25:47.219500000\",\"deptId\":100,\"id\":5,\"type\":0,\"userId\":100,\"assignId\":4,\"latest\":true}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-05-03 20:25:47'),
	(248,'线索管理',2,'org.javaboy.tienchin.web.controller.clue.ClueController.assginClue()','PUT',1,'admin',NULL,'/tienchin/clue/assign','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"createTime\":\"2022-05-03T20:26:57.394687000\",\"deptId\":100,\"id\":6,\"type\":0,\"userId\":100,\"assignId\":4,\"latest\":true}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-05-03 20:26:57'),
	(249,'线索管理',2,'org.javaboy.tienchin.web.controller.clue.ClueController.assginClue()','PUT',1,'admin',NULL,'/tienchin/clue/assign','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"createTime\":\"2022-05-03T20:27:26.559868000\",\"deptId\":100,\"id\":7,\"type\":0,\"userId\":100,\"assignId\":4,\"latest\":true}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-05-03 20:27:26'),
	(250,'线索管理',2,'org.javaboy.tienchin.web.controller.clue.ClueController.assginClue()','PUT',1,'admin',NULL,'/tienchin/clue/assign','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"createTime\":\"2022-05-03T20:29:45.342162000\",\"deptId\":100,\"id\":8,\"type\":0,\"userId\":100,\"assignId\":4,\"latest\":true}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-05-03 20:29:45'),
	(251,'线索管理',2,'org.javaboy.tienchin.web.controller.clue.ClueController.assginClue()','PUT',1,'admin',NULL,'/tienchin/clue/assign','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"createTime\":\"2022-05-03T20:30:16.524057000\",\"deptId\":100,\"id\":9,\"type\":0,\"userId\":100,\"assignId\":5,\"latest\":true}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-05-03 20:30:16'),
	(252,'线索管理',2,'org.javaboy.tienchin.web.controller.clue.ClueController.assginClue()','PUT',1,'admin',NULL,'/tienchin/clue/assign','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"createTime\":\"2022-05-03T20:31:30.790216000\",\"deptId\":100,\"id\":10,\"type\":0,\"userId\":100,\"assignId\":6,\"latest\":true}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-05-03 20:31:30'),
	(253,'线索管理',2,'org.javaboy.tienchin.web.controller.clue.ClueController.assginClue()','PUT',1,'admin',NULL,'/tienchin/clue/assign','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"createTime\":\"2022-05-03T20:33:16.031351000\",\"deptId\":100,\"id\":11,\"type\":0,\"userId\":100,\"assignId\":4,\"latest\":true}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-05-03 20:33:16'),
	(254,'线索管理',2,'org.javaboy.tienchin.web.controller.clue.ClueController.assginClue()','PUT',1,'admin',NULL,'/tienchin/clue/assign','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"createTime\":\"2022-05-03T20:37:19.360938000\",\"deptId\":100,\"id\":12,\"type\":0,\"userName\":\"javaboy\",\"userId\":100,\"assignId\":4,\"latest\":true}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-05-03 20:37:19'),
	(255,'线索管理',2,'org.javaboy.tienchin.web.controller.clue.ClueController.assginClue()','PUT',1,'admin',NULL,'/tienchin/clue/assign','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"createTime\":\"2022-05-03T20:39:45.223193000\",\"deptId\":100,\"id\":13,\"type\":0,\"userName\":\"javaboy\",\"userId\":100,\"assignId\":4,\"latest\":true}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-05-03 20:39:45'),
	(256,'线索管理',2,'org.javaboy.tienchin.web.controller.clue.ClueController.assginClue()','PUT',1,'admin',NULL,'/tienchin/clue/assign','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"createTime\":\"2022-05-03T20:42:51.654226000\",\"deptId\":100,\"id\":14,\"type\":0,\"userName\":\"admin\",\"userId\":1,\"assignId\":5,\"latest\":true}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-05-03 20:42:51'),
	(257,'线索管理',2,'org.javaboy.tienchin.web.controller.clue.ClueController.assginClue()','PUT',1,'admin',NULL,'/tienchin/clue/assign','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"createTime\":\"2022-05-03T20:45:20.668972000\",\"deptId\":100,\"id\":15,\"type\":0,\"userName\":\"ry\",\"userId\":2,\"assignId\":5,\"latest\":true}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-05-03 20:45:20'),
	(258,'用户管理',1,'org.javaboy.tienchin.web.controller.system.SysUserController.add()','POST',1,'admin',NULL,'/system/user','127.0.0.1','内网IP','{\"phonenumber\":\"18900000000\",\"admin\":false,\"password\":\"$2a$10$HLA/ysyz5FdzbPWrvmZ8beN..BygUrnm.qi2REY/0Rduzur3UjPce\",\"postIds\":[1],\"email\":\"222@qq.com\",\"nickName\":\"江南\",\"sex\":\"0\",\"deptId\":100,\"params\":{},\"userName\":\"itboyhub\",\"userId\":101,\"createBy\":\"admin\",\"roleIds\":[2],\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-05-03 20:47:57'),
	(259,'角色管理',1,'org.javaboy.tienchin.web.controller.system.SysRoleController.add()','POST',1,'admin',NULL,'/system/role','127.0.0.1','内网IP','{\"flag\":false,\"roleId\":3,\"admin\":false,\"params\":{},\"roleSort\":\"0\",\"deptCheckStrictly\":true,\"createBy\":\"admin\",\"menuCheckStrictly\":true,\"roleKey\":\"clue_manager_role\",\"roleName\":\"线索管理角色\",\"deptIds\":[],\"menuIds\":[2003,2008,1,100,103,2005,3031,3032,3033,3034,3035,3036,3037,3038,3039,3040,3021,3047,1001,1017],\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-05-03 20:49:40'),
	(260,'用户管理',2,'org.javaboy.tienchin.web.controller.system.SysUserController.edit()','PUT',1,'admin',NULL,'/system/user','127.0.0.1','内网IP','{\"roles\":[{\"flag\":false,\"roleId\":2,\"admin\":false,\"dataScope\":\"2\",\"params\":{},\"roleSort\":\"2\",\"deptCheckStrictly\":false,\"menuCheckStrictly\":false,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"status\":\"0\"}],\"phonenumber\":\"18900000000\",\"admin\":false,\"delFlag\":\"0\",\"password\":\"\",\"updateBy\":\"admin\",\"postIds\":[1],\"loginIp\":\"\",\"email\":\"222@qq.com\",\"nickName\":\"江南\",\"sex\":\"0\",\"deptId\":100,\"avatar\":\"\",\"dept\":{\"deptName\":\"SiMa科技\",\"leader\":\"TienChin\",\"deptId\":100,\"orderNum\":\"0\",\"params\":{},\"parentId\":0,\"children\":[],\"ancestors\":\"0\",\"status\":\"0\"},\"params\":{},\"userName\":\"itboyhub\",\"userId\":101,\"createBy\":\"admin\",\"roleIds\":[3],\"createTime\":\"2022-05-03T20:47:57\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-05-03 20:49:57'),
	(261,'角色管理',2,'org.javaboy.tienchin.web.controller.system.SysRoleController.edit()','PUT',1,'admin',NULL,'/system/role','127.0.0.1','内网IP','{\"flag\":false,\"roleId\":3,\"admin\":false,\"dataScope\":\"1\",\"delFlag\":\"0\",\"params\":{},\"roleSort\":\"0\",\"deptCheckStrictly\":true,\"createTime\":\"2022-05-03T20:49:40\",\"updateBy\":\"admin\",\"menuCheckStrictly\":true,\"roleKey\":\"clue_manager_role\",\"roleName\":\"线索管理角色\",\"menuIds\":[2005,2003,2008,1,100,103,3031,3032,3033,3034,3035,3021,3047,1001,1017],\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-05-03 20:51:40'),
	(262,'线索管理',2,'org.javaboy.tienchin.web.controller.clue.ClueController.follow()','PUT',1,'admin',NULL,'/tienchin/clue/','127.0.0.1','内网IP','{\"qq\":\"8453798748\",\"gender\":\"0\",\"failCount\":0,\"level\":\"2\",\"nextTime\":\"2022-04-30T16:34:06\",\"subject\":\"3\",\"channel\":\"2\",\"updateTime\":\"2022-04-30T16:34:06\",\"activityId\":6,\"createBy\":\"admin\",\"transfer\":\"0\",\"weixin\":\"angwu\",\"createTime\":\"2022-04-30T16:34:07\",\"phone\":\"13433333333\",\"record\":\"aaaaaa\",\"name\":\"王五\",\"endTime\":\"2022-04-30T17:34:07\",\"id\":4,\"age\":33,\"status\":\"1\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-05-03 21:48:34'),
	(263,'线索管理',2,'org.javaboy.tienchin.web.controller.clue.ClueController.invalidClue()','PUT',1,'admin',NULL,'/tienchin/clue/invalid','127.0.0.1','内网IP','{\"record\":\"undefined:undefined\",\"id\":4}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-05-03 21:48:58'),
	(264,'线索管理',2,'org.javaboy.tienchin.web.controller.clue.ClueController.invalidClue()','PUT',1,'admin',NULL,'/tienchin/clue/invalid','127.0.0.1','内网IP','{\"record\":\"无法联系:vvvvvvv\",\"id\":4}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-05-03 21:49:59'),
	(265,'线索管理',2,'org.javaboy.tienchin.web.controller.clue.ClueController.invalidClue()','PUT',1,'admin',NULL,'/tienchin/clue/invalid','127.0.0.1','内网IP','{\"record\":\"停机:rrrrrrrr\",\"id\":4}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-05-03 21:50:11');

/*!40000 ALTER TABLE `sys_oper_log` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_post
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_post`;

CREATE TABLE `sys_post` (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` char(1) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='岗位信息表';

LOCK TABLES `sys_post` WRITE;
/*!40000 ALTER TABLE `sys_post` DISABLE KEYS */;

INSERT INTO `sys_post` (`post_id`, `post_code`, `post_name`, `post_sort`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`)
VALUES
	(1,'ceo','董事长',1,'0','admin','2022-04-21 19:29:24','',NULL,''),
	(2,'se','项目经理',2,'0','admin','2022-04-21 19:29:24','',NULL,''),
	(3,'hr','人力资源',3,'0','admin','2022-04-21 19:29:24','',NULL,''),
	(4,'user','普通员工',4,'0','admin','2022-04-21 19:29:24','',NULL,'');

/*!40000 ALTER TABLE `sys_post` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_role
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_role`;

CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) COLLATE utf8mb4_unicode_ci DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) DEFAULT '1' COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) DEFAULT '1' COMMENT '部门树选择项是否关联显示',
  `status` char(1) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='角色信息表';

LOCK TABLES `sys_role` WRITE;
/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;

INSERT INTO `sys_role` (`role_id`, `role_name`, `role_key`, `role_sort`, `data_scope`, `menu_check_strictly`, `dept_check_strictly`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`)
VALUES
	(1,'超级管理员','admin',1,'1',1,1,'0','0','admin','2022-04-21 19:29:24','',NULL,'超级管理员'),
	(2,'普通角色','common',2,'2',0,0,'0','0','admin','2022-04-21 19:29:24','admin','2022-04-28 23:01:38','普通角色'),
	(3,'线索管理角色','clue_manager_role',0,'1',1,1,'0','0','admin','2022-05-03 20:49:40','admin','2022-05-03 20:51:40',NULL);

/*!40000 ALTER TABLE `sys_role` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_role_dept
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_role_dept`;

CREATE TABLE `sys_role_dept` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`,`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='角色和部门关联表';

LOCK TABLES `sys_role_dept` WRITE;
/*!40000 ALTER TABLE `sys_role_dept` DISABLE KEYS */;

INSERT INTO `sys_role_dept` (`role_id`, `dept_id`)
VALUES
	(2,100),
	(2,101),
	(2,105);

/*!40000 ALTER TABLE `sys_role_dept` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_role_menu
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_role_menu`;

CREATE TABLE `sys_role_menu` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='角色和菜单关联表';

LOCK TABLES `sys_role_menu` WRITE;
/*!40000 ALTER TABLE `sys_role_menu` DISABLE KEYS */;

INSERT INTO `sys_role_menu` (`role_id`, `menu_id`)
VALUES
	(2,1),
	(2,2),
	(2,3),
	(2,4),
	(2,100),
	(2,101),
	(2,102),
	(2,103),
	(2,104),
	(2,105),
	(2,106),
	(2,107),
	(2,108),
	(2,109),
	(2,110),
	(2,111),
	(2,112),
	(2,113),
	(2,114),
	(2,115),
	(2,116),
	(2,500),
	(2,501),
	(2,1001),
	(2,1002),
	(2,1003),
	(2,1004),
	(2,1005),
	(2,1006),
	(2,1007),
	(2,1008),
	(2,1009),
	(2,1010),
	(2,1011),
	(2,1012),
	(2,1013),
	(2,1014),
	(2,1015),
	(2,1016),
	(2,1017),
	(2,1018),
	(2,1019),
	(2,1020),
	(2,1021),
	(2,1022),
	(2,1023),
	(2,1024),
	(2,1025),
	(2,1026),
	(2,1027),
	(2,1028),
	(2,1029),
	(2,1030),
	(2,1031),
	(2,1032),
	(2,1033),
	(2,1034),
	(2,1035),
	(2,1036),
	(2,1037),
	(2,1038),
	(2,1039),
	(2,1040),
	(2,1041),
	(2,1042),
	(2,1043),
	(2,1044),
	(2,1045),
	(2,1046),
	(2,1047),
	(2,1048),
	(2,1049),
	(2,1050),
	(2,1051),
	(2,1052),
	(2,1053),
	(2,1054),
	(2,1055),
	(2,1056),
	(2,1057),
	(2,1058),
	(2,1059),
	(2,1060),
	(2,2008),
	(2,3049),
	(2,3050),
	(2,3051),
	(3,1),
	(3,100),
	(3,103),
	(3,1001),
	(3,1017),
	(3,2003),
	(3,2005),
	(3,2008),
	(3,3021),
	(3,3031),
	(3,3032),
	(3,3033),
	(3,3034),
	(3,3035),
	(3,3047);

/*!40000 ALTER TABLE `sys_role_menu` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_user`;

CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '手机号码',
  `sex` char(1) COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '密码',
  `status` char(1) COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户信息表';

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;

INSERT INTO `sys_user` (`user_id`, `dept_id`, `user_name`, `nick_name`, `user_type`, `email`, `phonenumber`, `sex`, `avatar`, `password`, `status`, `del_flag`, `login_ip`, `login_date`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`)
VALUES
	(1,103,'admin','admin','00','ry@163.com','15888888888','1','','$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2','0','0','127.0.0.1','2022-05-05 19:42:06','admin','2022-04-21 19:29:24','','2022-05-05 19:42:05','管理员'),
	(2,105,'ry','ry','00','ry@qq.com','15666666666','1','','$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2','0','0','127.0.0.1','2022-04-21 19:29:24','admin','2022-04-21 19:29:24','',NULL,'测试员'),
	(100,100,'javaboy','javaboy','00','111@qq.com','13222222222','0','','$2a$10$Ly7592NawJoGLSaZxiHK1ODqz5BFC2z77rz7kIp4bGqBeeGaBdtQe','0','0','127.0.0.1','2022-04-23 16:05:34','admin','2022-04-23 16:02:13','','2022-04-23 16:05:33',NULL),
	(101,100,'itboyhub','江南','00','222@qq.com','18900000000','0','','$2a$10$HLA/ysyz5FdzbPWrvmZ8beN..BygUrnm.qi2REY/0Rduzur3UjPce','0','0','127.0.0.1','2022-05-03 20:50:27','admin','2022-05-03 20:47:57','admin','2022-05-03 20:50:27',NULL);

/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_user_post
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_user_post`;

CREATE TABLE `sys_user_post` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`,`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户与岗位关联表';

LOCK TABLES `sys_user_post` WRITE;
/*!40000 ALTER TABLE `sys_user_post` DISABLE KEYS */;

INSERT INTO `sys_user_post` (`user_id`, `post_id`)
VALUES
	(1,1),
	(2,2),
	(100,1),
	(101,1);

/*!40000 ALTER TABLE `sys_user_post` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_user_role
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_user_role`;

CREATE TABLE `sys_user_role` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户和角色关联表';

LOCK TABLES `sys_user_role` WRITE;
/*!40000 ALTER TABLE `sys_user_role` DISABLE KEYS */;

INSERT INTO `sys_user_role` (`user_id`, `role_id`)
VALUES
	(1,1),
	(2,2),
	(100,2),
	(101,3);

/*!40000 ALTER TABLE `sys_user_role` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table tienchin_activity
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tienchin_activity`;

CREATE TABLE `tienchin_activity` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `code` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '活动编号',
  `name` varchar(512) COLLATE utf8_bin DEFAULT NULL COMMENT '活动名称',
  `channel` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '渠道来源',
  `info` varchar(512) COLLATE utf8_bin NOT NULL COMMENT '活动简介',
  `type` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '活动类型',
  `discount` float DEFAULT NULL COMMENT '年费折扣',
  `voucher` double DEFAULT NULL COMMENT '年费代金券',
  `status` char(1) COLLATE utf8_bin DEFAULT '1' COMMENT '状态',
  `begin_time` timestamp NULL DEFAULT NULL COMMENT '开始时间',
  `end_time` timestamp NULL DEFAULT NULL COMMENT '结束时间',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `create_by` varchar(16) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `update_by` varchar(16) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `remark` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='活动管理';

LOCK TABLES `tienchin_activity` WRITE;
/*!40000 ALTER TABLE `tienchin_activity` DISABLE KEYS */;

INSERT INTO `tienchin_activity` (`id`, `code`, `name`, `channel`, `info`, `type`, `discount`, `voucher`, `status`, `begin_time`, `end_time`, `create_time`, `update_time`, `create_by`, `update_by`, `remark`)
VALUES
	(1,X'3137303233623434376135303431386438363631386634323964663430316635',X'E68A96E99FB3E5958AE5958AE5958A',X'32',X'E6B4BBE58AA8',X'31',8.2,NULL,X'30','2022-05-16 00:00:00','2022-05-19 23:59:59','2022-04-25 20:51:48','2022-04-28 20:43:14',X'61646D696E',X'61646D696E',NULL),
	(2,X'6362363332396663663339343434323462326138383466323861356132366261',X'E5958AE5958AE5958AE5958A',X'31',X'E58F8DE58F8DE5A48DE5A48DE58F8DE58F8DE5A48DE5A48D',X'32',NULL,3,X'31','2022-05-17 00:00:00','2022-06-30 23:59:59','2022-04-25 21:03:23','2022-04-25 22:42:37',X'61646D696E',X'61646D696E',NULL),
	(3,X'3437363837346264336266613432303962613131313936656463626234623930',X'666666666666',X'31',X'61616161616262',X'31',4,NULL,X'31','2022-04-29 00:00:00','2022-05-24 23:59:59','2022-04-25 21:12:49','2022-04-25 22:42:57',X'61646D696E',X'61646D696E',NULL),
	(4,X'3764343334393961313034363463363862626632623835353539616239623431',X'76767676',X'32',X'6161616161',X'31',2.3,NULL,X'30','2022-05-03 00:00:00','2022-05-17 23:59:59','2022-04-25 21:13:45','2022-04-25 22:42:50',X'61646D696E',X'61646D696E',NULL),
	(5,X'3965356535386433643964393432643661306264313633326364643538346134',X'E59CB0E68EA8',X'33',X'E5958AE5958AE5958A',X'31',6,NULL,X'30','2022-05-22 00:00:00','2022-05-23 23:59:59','2022-04-26 19:56:07',NULL,X'61646D696E',NULL,NULL),
	(6,X'3137303233623434376135303431386438363631386634323964663430316635',X'E68A96E99FB3E5958AE5958AE5958A',X'32',X'E6B4BBE58AA8',X'31',8,NULL,X'30','2022-05-16 00:00:00','2022-05-19 23:59:59',NULL,NULL,X'61646D696E',X'61646D696E',NULL),
	(7,X'3137303233623434376135303431386438363631386634323964663430316635',X'E68A96E99FB3E5958AE5958AE5958A',X'32',X'E6B4BBE58AA8',X'31',8,NULL,X'30','2022-05-16 00:00:00','2022-05-19 23:59:59',NULL,NULL,X'61646D696E',X'61646D696E',NULL);

/*!40000 ALTER TABLE `tienchin_activity` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table tienchin_assignment
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tienchin_assignment`;

CREATE TABLE `tienchin_assignment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `type` int(1) DEFAULT '0' COMMENT '类型0 线索 1 商机',
  `assign_id` bigint(20) DEFAULT NULL COMMENT '线索/商机 id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '所属人用户id',
  `user_name` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '所属人名称',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '所属人所属组织',
  `latest` tinyint(1) DEFAULT '1' COMMENT '是否当前最新分配人',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '分配时间',
  `create_by` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '分配人',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '更新人',
  `remark` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='分配记录表';

LOCK TABLES `tienchin_assignment` WRITE;
/*!40000 ALTER TABLE `tienchin_assignment` DISABLE KEYS */;

INSERT INTO `tienchin_assignment` (`id`, `type`, `assign_id`, `user_id`, `user_name`, `dept_id`, `latest`, `create_time`, `create_by`, `update_time`, `update_by`, `remark`)
VALUES
	(1,0,4,1,X'61646D696E',103,0,'2022-04-30 16:34:07',X'61646D696E','2022-05-03 20:39:45',NULL,NULL),
	(2,0,5,1,X'61646D696E',103,0,'2022-04-30 16:42:04',X'61646D696E','2022-05-03 20:42:51',NULL,NULL),
	(3,0,6,1,X'61646D696E',103,1,'2022-04-30 19:51:43',X'61646D696E','2022-05-03 20:39:32',NULL,NULL),
	(4,0,7,1,X'61646D696E',103,1,'2022-04-30 19:55:27',X'61646D696E',NULL,NULL,NULL),
	(13,0,4,100,X'6A617661626F79',100,1,'2022-05-03 20:39:45',X'61646D696E',NULL,NULL,NULL),
	(14,0,5,1,X'61646D696E',100,0,'2022-05-03 20:42:52',X'61646D696E','2022-05-03 20:45:20',NULL,NULL),
	(15,0,5,2,X'7279',100,1,'2022-05-03 20:45:21',X'61646D696E',NULL,NULL,NULL);

/*!40000 ALTER TABLE `tienchin_assignment` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table tienchin_channel
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tienchin_channel`;

CREATE TABLE `tienchin_channel` (
  `channel_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `channel_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '渠道名称',
  `status` int(11) DEFAULT '0' COMMENT '渠道状态 0可用；1禁用',
  `remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `create_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `update_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`channel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `tienchin_channel` WRITE;
/*!40000 ALTER TABLE `tienchin_channel` DISABLE KEYS */;

INSERT INTO `tienchin_channel` (`channel_id`, `channel_name`, `status`, `remark`, `create_time`, `update_time`, `create_by`, `update_by`)
VALUES
	(1,'百度搜索',0,'aaaaa','2022-04-23 15:12:13','2022-04-28 23:02:37','admin','admin'),
	(2,'抖音短视频',0,'无','2022-04-23 15:12:13','2022-04-23 15:12:23','admin','admin'),
	(3,'线下地推',0,'无','2022-04-23 15:12:13','2022-04-23 15:12:23','admin','admin'),
	(4,'KOL渠道',0,'无','2022-04-23 15:12:13','2022-04-23 15:12:23','admin','admin'),
	(5,'公众号推广',0,'无',NULL,'2022-04-23 15:43:25','admin','admin'),
	(6,'小程序推广',0,'哈哈','2022-04-23 15:32:37','2022-04-23 15:43:11','admin','admin'),
	(13,'2',0,'2','2022-04-23 16:03:40','2022-04-23 16:05:55','javaboy','javaboy'),
	(19,'d',0,'d','2022-04-28 23:02:44','2022-04-28 23:02:49','admin','admin');

/*!40000 ALTER TABLE `tienchin_channel` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table tienchin_clue
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tienchin_clue`;

CREATE TABLE `tienchin_clue` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '线索id',
  `name` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '客户姓名',
  `phone` varchar(11) COLLATE utf8_bin DEFAULT NULL COMMENT '手机号',
  `channel` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '来源渠道',
  `activity_id` bigint(20) DEFAULT NULL COMMENT '来源活动',
  `gender` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '1 男 0 女',
  `age` int(11) DEFAULT NULL COMMENT '年龄',
  `weixin` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '微信',
  `qq` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT 'qq',
  `level` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '意向等级',
  `subject` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '意向私教课程',
  `status` char(1) COLLATE utf8_bin DEFAULT '1' COMMENT '状态(已分配1  进行中2  回收3  伪线索4)',
  `fail_count` int(11) DEFAULT '0' COMMENT '伪线索失败次数(最大数3次)',
  `next_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '下次跟进时间',
  `transfer` char(1) COLLATE utf8_bin DEFAULT '0' COMMENT '是否转派',
  `end_time` timestamp NULL DEFAULT NULL COMMENT '线索失效时间',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '更新人',
  `remark` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='线索';

LOCK TABLES `tienchin_clue` WRITE;
/*!40000 ALTER TABLE `tienchin_clue` DISABLE KEYS */;

INSERT INTO `tienchin_clue` (`id`, `name`, `phone`, `channel`, `activity_id`, `gender`, `age`, `weixin`, `qq`, `level`, `subject`, `status`, `fail_count`, `next_time`, `transfer`, `end_time`, `create_time`, `create_by`, `update_time`, `update_by`, `remark`)
VALUES
	(1,X'E8B5B5E585AD',X'3133323232323232323232',X'32',1,X'30',20,X'7A68616E6773616E',X'3838383838383838',NULL,NULL,X'30',0,NULL,X'30',NULL,'2022-04-30 10:05:07',X'61646D696E',NULL,NULL,NULL),
	(2,X'616161',X'3133323333333333333333',X'32',4,X'30',3,X'666666663333333333',X'3232323232',X'33',X'34',X'30',0,'2022-05-03 17:02:07',X'30',NULL,'2022-04-30 10:10:49',X'61646D696E','2022-05-03 17:02:07',NULL,NULL),
	(3,X'6C697369',X'3133313939393939393939',X'32',4,X'30',4,X'616161613339343539303334',X'38333539343538393033',NULL,NULL,X'30',0,'2022-04-30 19:50:18',X'30',NULL,'2022-04-30 10:13:22',X'61646D696E','2022-04-30 19:50:18',NULL,NULL),
	(4,X'E78E8BE4BA94',X'3133343333333333333333',X'32',6,X'30',33,X'616E677775',X'38343533373938373438',X'32',X'33',X'31',3,'2022-05-03 21:50:11',X'30','2022-04-30 17:34:07','2022-04-30 16:34:07',X'61646D696E','2022-05-03 21:50:11',NULL,NULL),
	(5,X'E689BEE58898',X'3138393838383838383838',X'32',7,X'30',30,X'6B64616A6664',X'38373839343735383933',X'32',X'33',X'31',0,'2022-05-05 00:00:00',X'30','2022-04-30 17:42:04','2022-04-30 16:42:04',X'61646D696E','2022-04-30 16:42:03',NULL,NULL),
	(6,X'7A68616E6773616E',X'3138383939393939393939',X'32',4,X'31',30,X'64736A6B66616A6B6664',X'393833343538393033',NULL,NULL,X'31',0,'2022-04-30 19:51:43',X'30','2022-04-30 20:51:43','2022-04-30 19:51:43',X'61646D696E','2022-04-30 19:51:43',NULL,NULL),
	(7,X'7A68616F6C6975',X'3131313131313131313131',X'32',4,X'30',3,X'6A66616C646B6C64',X'393034353839333035',NULL,NULL,X'31',0,'2022-04-30 19:55:27',X'30','2022-04-30 20:55:27','2022-04-30 19:55:27',X'61646D696E','2022-04-30 19:55:27',NULL,NULL),
	(8,X'E689BEE58898',X'3138393838383838383838',X'32',7,X'30',66,X'6B64616A6664',X'38373839343735383933',NULL,NULL,X'31',0,'2022-04-30 16:42:03',X'30','2022-04-30 17:42:04','2022-04-30 16:42:04',X'61646D696E','2022-04-30 16:42:03',NULL,NULL),
	(9,X'7A68616E6773616E',X'3138383939393939393939',X'32',4,X'31',30,X'64736A6B66616A6B6664',X'393833343538393033',NULL,NULL,X'31',0,'2022-04-30 19:51:43',X'30','2022-04-30 20:51:43','2022-04-30 19:51:43',X'61646D696E','2022-04-30 19:51:43',NULL,NULL),
	(10,X'7A68616F6C6975',X'3131313131313131313131',X'32',4,X'30',3,X'6A66616C646B6C64',X'393034353839333035',NULL,NULL,X'31',0,'2022-04-30 19:55:27',X'30','2022-04-30 20:55:27','2022-04-30 19:55:27',X'61646D696E','2022-04-30 19:55:27',NULL,NULL),
	(11,X'E689BEE58898',X'3138393838383838383838',X'32',7,X'30',66,X'6B64616A6664',X'38373839343735383933',NULL,NULL,X'31',0,'2022-04-30 16:42:03',X'30','2022-04-30 17:42:04','2022-04-30 16:42:04',X'61646D696E','2022-04-30 16:42:03',NULL,NULL),
	(12,X'7A68616E6773616E',X'3138383939393939393939',X'32',4,X'31',30,X'64736A6B66616A6B6664',X'393833343538393033',NULL,NULL,X'31',0,'2022-04-30 19:51:43',X'30','2022-04-30 20:51:43','2022-04-30 19:51:43',X'61646D696E','2022-04-30 19:51:43',NULL,NULL),
	(13,X'7A68616F6C6975',X'3131313131313131313131',X'32',4,X'30',3,X'6A66616C646B6C64',X'393034353839333035',NULL,NULL,X'31',0,'2022-04-30 19:55:27',X'30','2022-04-30 20:55:27','2022-04-30 19:55:27',X'61646D696E','2022-04-30 19:55:27',NULL,NULL),
	(14,X'E689BEE58898',X'3138393838383838383838',X'32',7,X'30',66,X'6B64616A6664',X'38373839343735383933',NULL,NULL,X'31',0,'2022-04-30 16:42:03',X'30','2022-04-30 17:42:04','2022-04-30 16:42:04',X'61646D696E','2022-04-30 16:42:03',NULL,NULL),
	(15,X'7A68616E6773616E',X'3138383939393939393939',X'32',4,X'31',30,X'64736A6B66616A6B6664',X'393833343538393033',NULL,NULL,X'31',0,'2022-04-30 19:51:43',X'30','2022-04-30 20:51:43','2022-04-30 19:51:43',X'61646D696E','2022-04-30 19:51:43',NULL,NULL),
	(16,X'7A68616F6C6975',X'3131313131313131313131',X'32',4,X'30',3,X'6A66616C646B6C64',X'393034353839333035',NULL,NULL,X'31',0,'2022-04-30 19:55:27',X'30','2022-04-30 20:55:27','2022-04-30 19:55:27',X'61646D696E','2022-04-30 19:55:27',NULL,NULL);

/*!40000 ALTER TABLE `tienchin_clue` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table tienchin_follow_record
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tienchin_follow_record`;

CREATE TABLE `tienchin_follow_record` (
  `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(11) DEFAULT NULL COMMENT '线索还是商机',
  `assign_id` bigint(11) DEFAULT NULL COMMENT '线索/商机的id',
  `info` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '跟进记录',
  `create_by` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '跟进人',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '跟进时间',
  `update_by` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `tienchin_follow_record` WRITE;
/*!40000 ALTER TABLE `tienchin_follow_record` DISABLE KEYS */;

INSERT INTO `tienchin_follow_record` (`id`, `type`, `assign_id`, `info`, `create_by`, `create_time`, `update_by`, `update_time`)
VALUES
	(1,0,5,'oooooo','admin','2022-05-03 16:43:21',NULL,NULL),
	(2,0,5,'继续跟进','admin','2022-05-03 16:46:05',NULL,NULL),
	(3,0,2,'电话跟进一次','admin','2022-05-03 17:02:07',NULL,NULL),
	(4,0,1,'零零落落','admin','2022-05-03 17:10:08',NULL,NULL),
	(5,0,1,NULL,'admin','2022-05-03 17:10:31',NULL,NULL),
	(6,0,4,'aaaaaa','admin','2022-05-03 21:48:34',NULL,NULL),
	(7,0,4,'undefined:undefined','admin','2022-05-03 21:48:58',NULL,NULL),
	(8,0,4,'无法联系:vvvvvvv','admin','2022-05-03 21:50:00',NULL,NULL),
	(9,0,4,'停机:rrrrrrrr','admin','2022-05-03 21:50:11',NULL,NULL);

/*!40000 ALTER TABLE `tienchin_follow_record` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table tienchin_personal_course
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tienchin_personal_course`;

CREATE TABLE `tienchin_personal_course` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '课程id',
  `subject` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '课程归类',
  `name` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '课程名称',
  `price` double DEFAULT NULL COMMENT '价格',
  `apply_to` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '适用人群',
  `info` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '课程描述信息',
  `create_time` timestamp NULL DEFAULT NULL,
  `create_by` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `update_time` timestamp NULL DEFAULT NULL,
  `update_by` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `del_flag` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否删除 1 是',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='课程管理';



# Dump of table tienchin_rule
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tienchin_rule`;

CREATE TABLE `tienchin_rule` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `limit_time` int(11) DEFAULT NULL COMMENT '线索/商机回收时限',
  `limit_time_type` int(1) DEFAULT NULL COMMENT '时间单位（字典数据）',
  `warn_time` int(11) DEFAULT NULL COMMENT '线索/商机警告时间',
  `warn_time_type` int(1) DEFAULT NULL COMMENT '时间单位（字典数据）',
  `repeat_get_time` int(11) DEFAULT NULL COMMENT '重复捞取时间',
  `repeat_time_type` int(1) DEFAULT NULL COMMENT '时间单位（字典数据）',
  `max_number` int(11) DEFAULT NULL COMMENT '最大保有量',
  `type` int(1) DEFAULT '0' COMMENT '0 线索 1 商机',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='线索池规则';

LOCK TABLES `tienchin_rule` WRITE;
/*!40000 ALTER TABLE `tienchin_rule` DISABLE KEYS */;

INSERT INTO `tienchin_rule` (`id`, `limit_time`, `limit_time_type`, `warn_time`, `warn_time_type`, `repeat_get_time`, `repeat_time_type`, `max_number`, `type`)
VALUES
	(1,1,0,1,1,1,2,10,0);

/*!40000 ALTER TABLE `tienchin_rule` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
