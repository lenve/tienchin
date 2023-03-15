# ************************************************************
# Sequel Pro SQL dump
# Version 5446
#
# https://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 8.0.27)
# Database: tienchin-video
# Generation Time: 2023-02-04 15:13:50 +0000
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
  `table_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='代码生成业务表';



# Dump of table gen_table_column
# ------------------------------------------------------------

DROP TABLE IF EXISTS `gen_table_column`;

CREATE TABLE `gen_table_column` (
  `column_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '字典类型',
  `sort` int DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='代码生成业务表字段';



# Dump of table sys_config
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_config`;

CREATE TABLE `sys_config` (
  `config_id` int NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='参数配置表';

LOCK TABLES `sys_config` WRITE;
/*!40000 ALTER TABLE `sys_config` DISABLE KEYS */;

INSERT INTO `sys_config` (`config_id`, `config_name`, `config_key`, `config_value`, `config_type`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`)
VALUES
	(1,'主框架页-默认皮肤样式名称','sys.index.skinName','skin-blue','Y','admin','2023-01-16 16:20:39','',NULL,'蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow'),
	(2,'用户管理-账号初始密码','sys.user.initPassword','123456','Y','admin','2023-01-16 16:20:39','',NULL,'初始化密码 123456'),
	(3,'主框架页-侧边栏主题','sys.index.sideTheme','theme-dark','Y','admin','2023-01-16 16:20:39','',NULL,'深色主题theme-dark，浅色主题theme-light'),
	(4,'账号自助-验证码开关','sys.account.captchaOnOff','false','Y','admin','2023-01-16 16:20:39','',NULL,'是否开启验证码功能（true开启，false关闭）'),
	(5,'账号自助-是否开启用户注册功能','sys.account.registerUser','false','Y','admin','2023-01-16 16:20:39','',NULL,'是否开启注册用户功能（true开启，false关闭）');

/*!40000 ALTER TABLE `sys_config` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_dept
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_dept`;

CREATE TABLE `sys_dept` (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint DEFAULT '0' COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '部门名称',
  `order_num` int DEFAULT '0' COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='部门表';

LOCK TABLES `sys_dept` WRITE;
/*!40000 ALTER TABLE `sys_dept` DISABLE KEYS */;

INSERT INTO `sys_dept` (`dept_id`, `parent_id`, `ancestors`, `dept_name`, `order_num`, `leader`, `phone`, `email`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`)
VALUES
	(100,0,'0','TienChin健身科技',0,'TienChin健身','15888888888','ry@qq.com','0','0','admin','2023-01-16 16:20:26','',NULL),
	(101,100,'0,100','深圳总公司',1,'TienChin健身','15888888888','ry@qq.com','0','0','admin','2023-01-16 16:20:26','',NULL),
	(102,100,'0,100','长沙分公司',2,'TienChin健身','15888888888','ry@qq.com','0','0','admin','2023-01-16 16:20:26','',NULL),
	(103,101,'0,100,101','研发部门',1,'TienChin健身','15888888888','ry@qq.com','0','0','admin','2023-01-16 16:20:26','',NULL),
	(104,101,'0,100,101','市场部门',2,'TienChin健身','15888888888','ry@qq.com','0','0','admin','2023-01-16 16:20:26','',NULL),
	(105,101,'0,100,101','测试部门',3,'TienChin健身','15888888888','ry@qq.com','0','0','admin','2023-01-16 16:20:26','',NULL),
	(106,101,'0,100,101','财务部门',4,'TienChin健身','15888888888','ry@qq.com','0','0','admin','2023-01-16 16:20:26','',NULL),
	(107,101,'0,100,101','运维部门',5,'TienChin健身','15888888888','ry@qq.com','0','0','admin','2023-01-16 16:20:26','',NULL),
	(108,102,'0,100,102','市场部门',1,'TienChin健身','15888888888','ry@qq.com','0','0','admin','2023-01-16 16:20:26','',NULL),
	(109,102,'0,100,102','财务部门',2,'TienChin健身','15888888888','ry@qq.com','0','0','admin','2023-01-16 16:20:26','',NULL);

/*!40000 ALTER TABLE `sys_dept` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_dict_data
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_dict_data`;

CREATE TABLE `sys_dict_data` (
  `dict_code` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int DEFAULT '0' COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='字典数据表';

LOCK TABLES `sys_dict_data` WRITE;
/*!40000 ALTER TABLE `sys_dict_data` DISABLE KEYS */;

INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`)
VALUES
	(1,1,'男','0','sys_user_sex','','','Y','0','admin','2023-01-16 16:20:37','',NULL,'性别男'),
	(2,2,'女','1','sys_user_sex','','','N','0','admin','2023-01-16 16:20:37','',NULL,'性别女'),
	(3,3,'未知','2','sys_user_sex','','','N','0','admin','2023-01-16 16:20:37','',NULL,'性别未知'),
	(4,1,'显示','0','sys_show_hide','','primary','Y','0','admin','2023-01-16 16:20:37','',NULL,'显示菜单'),
	(5,2,'隐藏','1','sys_show_hide','','danger','N','0','admin','2023-01-16 16:20:37','',NULL,'隐藏菜单'),
	(6,1,'正常','0','sys_normal_disable','','primary','Y','0','admin','2023-01-16 16:20:37','',NULL,'正常状态'),
	(7,2,'停用','1','sys_normal_disable','','danger','N','0','admin','2023-01-16 16:20:38','',NULL,'停用状态'),
	(8,1,'正常','0','sys_job_status','','primary','Y','0','admin','2023-01-16 16:20:38','',NULL,'正常状态'),
	(9,2,'暂停','1','sys_job_status','','danger','N','0','admin','2023-01-16 16:20:38','',NULL,'停用状态'),
	(10,1,'默认','DEFAULT','sys_job_group','','','Y','0','admin','2023-01-16 16:20:38','',NULL,'默认分组'),
	(11,2,'系统','SYSTEM','sys_job_group','','','N','0','admin','2023-01-16 16:20:38','',NULL,'系统分组'),
	(12,1,'是','Y','sys_yes_no','','primary','Y','0','admin','2023-01-16 16:20:38','',NULL,'系统默认是'),
	(13,2,'否','N','sys_yes_no','','danger','N','0','admin','2023-01-16 16:20:38','',NULL,'系统默认否'),
	(14,1,'通知','1','sys_notice_type','','warning','Y','0','admin','2023-01-16 16:20:38','',NULL,'通知'),
	(15,2,'公告','2','sys_notice_type','','success','N','0','admin','2023-01-16 16:20:38','',NULL,'公告'),
	(16,1,'正常','0','sys_notice_status','','primary','Y','0','admin','2023-01-16 16:20:38','',NULL,'正常状态'),
	(17,2,'关闭','1','sys_notice_status','','danger','N','0','admin','2023-01-16 16:20:38','',NULL,'关闭状态'),
	(18,1,'新增','1','sys_oper_type','','info','N','0','admin','2023-01-16 16:20:38','',NULL,'新增操作'),
	(19,2,'修改','2','sys_oper_type','','info','N','0','admin','2023-01-16 16:20:38','',NULL,'修改操作'),
	(20,3,'删除','3','sys_oper_type','','danger','N','0','admin','2023-01-16 16:20:38','',NULL,'删除操作'),
	(21,4,'授权','4','sys_oper_type','','primary','N','0','admin','2023-01-16 16:20:38','',NULL,'授权操作'),
	(22,5,'导出','5','sys_oper_type','','warning','N','0','admin','2023-01-16 16:20:38','',NULL,'导出操作'),
	(23,6,'导入','6','sys_oper_type','','warning','N','0','admin','2023-01-16 16:20:38','',NULL,'导入操作'),
	(24,7,'强退','7','sys_oper_type','','danger','N','0','admin','2023-01-16 16:20:38','',NULL,'强退操作'),
	(25,8,'生成代码','8','sys_oper_type','','warning','N','0','admin','2023-01-16 16:20:38','',NULL,'生成操作'),
	(26,9,'清空数据','9','sys_oper_type','','danger','N','0','admin','2023-01-16 16:20:38','',NULL,'清空操作'),
	(27,1,'成功','0','sys_common_status','','primary','N','0','admin','2023-01-16 16:20:39','',NULL,'正常状态'),
	(28,2,'失败','1','sys_common_status','','danger','N','0','admin','2023-01-16 16:20:39','',NULL,'停用状态'),
	(100,0,'线上渠道','1','channel_type',NULL,'primary','N','0','admin','2023-01-16 16:24:21','',NULL,NULL),
	(101,1,'线下渠道','2','channel_type',NULL,'success','N','0','admin','2023-01-16 16:24:37','',NULL,NULL),
	(102,0,'正常','1','channel_status',NULL,'success','N','0','admin','2023-01-16 16:30:51','',NULL,NULL),
	(103,1,'禁用','0','channel_status',NULL,'info','N','0','admin','2023-01-16 16:31:09','',NULL,NULL),
	(104,0,'折扣券','1','activity_type',NULL,'primary','N','0','admin','2023-01-16 16:45:02','',NULL,NULL),
	(105,1,'代金券','2','activity_type',NULL,'success','N','0','admin','2023-01-16 16:45:14','',NULL,NULL),
	(106,0,'正常','1','activity_status',NULL,'primary','N','0','admin','2023-01-16 16:46:47','',NULL,NULL),
	(107,0,'禁用','0','activity_status',NULL,'info','N','0','admin','2023-01-16 16:46:57','admin','2023-01-16 17:01:09',NULL),
	(108,0,'舞蹈类','1','course_type',NULL,'primary','N','0','admin','2023-01-16 16:50:51','',NULL,NULL),
	(109,0,'游泳类','2','course_type',NULL,'success','N','0','admin','2023-01-16 16:51:06','',NULL,NULL),
	(110,0,'拳击类','3','course_type',NULL,'info','N','0','admin','2023-01-16 16:51:17','admin','2023-01-18 15:01:06',NULL),
	(111,0,'中小学生','1','course_apply_to',NULL,'primary','N','0','admin','2023-01-16 16:52:41','',NULL,NULL),
	(112,0,'上班族','2','course_apply_to',NULL,'success','N','0','admin','2023-01-16 16:52:49','',NULL,NULL),
	(113,0,'小白用户','3','course_apply_to',NULL,'info','N','0','admin','2023-01-16 16:53:04','',NULL,NULL),
	(114,0,'健身达人','4','course_apply_to',NULL,'warning','N','0','admin','2023-01-16 16:53:23','',NULL,NULL),
	(115,0,'近期报名','1','clue_level',NULL,'primary','N','0','admin','2023-01-16 17:08:39','',NULL,NULL),
	(116,0,'打算报名，考虑中','2','clue_level',NULL,'success','N','0','admin','2023-01-16 17:08:57','',NULL,NULL),
	(117,0,'了解一下','3','clue_level',NULL,'info','N','0','admin','2023-01-16 17:09:13','',NULL,NULL),
	(118,0,'打酱油','4','clue_level',NULL,'warning','N','0','admin','2023-01-16 17:09:24','',NULL,NULL),
	(119,0,'已分配','1','clue_status',NULL,'primary','N','0','admin','2023-01-16 17:11:14','',NULL,NULL),
	(120,0,'跟进中','2','clue_status',NULL,'success','N','0','admin','2023-01-16 17:11:27','',NULL,NULL),
	(121,0,'回收','3','clue_status',NULL,'info','N','0','admin','2023-01-16 17:11:39','',NULL,NULL),
	(122,0,'伪线索','4','clue_status',NULL,'warning','N','0','admin','2023-01-16 17:11:52','',NULL,NULL),
	(124,0,'空号','1','clue_invalidate',NULL,'primary','N','0','admin','2023-01-19 06:46:41','',NULL,NULL),
	(125,0,'停机','2','clue_invalidate',NULL,'success','N','0','admin','2023-01-19 06:46:53','',NULL,NULL),
	(126,0,'无法联系','3','clue_invalidate',NULL,'info','N','0','admin','2023-01-19 06:47:04','',NULL,NULL),
	(127,0,'其他','4','clue_invalidate',NULL,'warning','N','0','admin','2023-01-19 06:47:18','',NULL,NULL);

/*!40000 ALTER TABLE `sys_dict_data` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_dict_type
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_dict_type`;

CREATE TABLE `sys_dict_type` (
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`),
  UNIQUE KEY `dict_type` (`dict_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='字典类型表';

LOCK TABLES `sys_dict_type` WRITE;
/*!40000 ALTER TABLE `sys_dict_type` DISABLE KEYS */;

INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`)
VALUES
	(1,'用户性别','sys_user_sex','0','admin','2023-01-16 16:20:37','',NULL,'用户性别列表'),
	(2,'菜单状态','sys_show_hide','0','admin','2023-01-16 16:20:37','',NULL,'菜单状态列表'),
	(3,'系统开关','sys_normal_disable','0','admin','2023-01-16 16:20:37','',NULL,'系统开关列表'),
	(4,'任务状态','sys_job_status','0','admin','2023-01-16 16:20:37','',NULL,'任务状态列表'),
	(5,'任务分组','sys_job_group','0','admin','2023-01-16 16:20:37','',NULL,'任务分组列表'),
	(6,'系统是否','sys_yes_no','0','admin','2023-01-16 16:20:37','',NULL,'系统是否列表'),
	(7,'通知类型','sys_notice_type','0','admin','2023-01-16 16:20:37','',NULL,'通知类型列表'),
	(8,'通知状态','sys_notice_status','0','admin','2023-01-16 16:20:37','',NULL,'通知状态列表'),
	(9,'操作类型','sys_oper_type','0','admin','2023-01-16 16:20:37','',NULL,'操作类型列表'),
	(10,'系统状态','sys_common_status','0','admin','2023-01-16 16:20:37','',NULL,'登录状态列表'),
	(100,'渠道类型','channel_type','0','admin','2023-01-16 16:23:28','',NULL,NULL),
	(101,'渠道状态','channel_status','0','admin','2023-01-16 16:29:28','',NULL,NULL),
	(102,'活动类型','activity_type','0','admin','2023-01-16 16:38:54','',NULL,NULL),
	(103,'活动状态','activity_status','0','admin','2023-01-16 16:39:06','',NULL,NULL),
	(104,'课程类型','course_type','0','admin','2023-01-16 16:50:22','',NULL,NULL),
	(105,'课程适用人群','course_apply_to','0','admin','2023-01-16 16:52:09','',NULL,NULL),
	(106,'客户意向等级','clue_level','0','admin','2023-01-16 17:08:08','',NULL,NULL),
	(107,'线索状态','clue_status','0','admin','2023-01-16 17:10:49','',NULL,NULL),
	(108,'无效线索类型','clue_invalidate','0','admin','2023-01-19 06:46:24','',NULL,NULL);

/*!40000 ALTER TABLE `sys_dict_type` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_job
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_job`;

CREATE TABLE `sys_job` (
  `job_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`,`job_name`,`job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='定时任务调度表';

LOCK TABLES `sys_job` WRITE;
/*!40000 ALTER TABLE `sys_job` DISABLE KEYS */;

INSERT INTO `sys_job` (`job_id`, `job_name`, `job_group`, `invoke_target`, `cron_expression`, `misfire_policy`, `concurrent`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`)
VALUES
	(1,'系统默认（无参）','DEFAULT','ryTask.ryNoParams','0/10 * * * * ?','3','1','1','admin','2023-01-16 16:20:39','',NULL,''),
	(2,'系统默认（有参）','DEFAULT','ryTask.ryParams(\'ry\')','0/15 * * * * ?','3','1','1','admin','2023-01-16 16:20:39','',NULL,''),
	(3,'系统默认（多参）','DEFAULT','ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)','0/20 * * * * ?','3','1','1','admin','2023-01-16 16:20:39','',NULL,'');

/*!40000 ALTER TABLE `sys_job` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_job_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_job_log`;

CREATE TABLE `sys_job_log` (
  `job_log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '异常信息',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='定时任务调度日志表';



# Dump of table sys_logininfor
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_logininfor`;

CREATE TABLE `sys_logininfor` (
  `info_id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '提示消息',
  `login_time` datetime DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='系统访问记录';

LOCK TABLES `sys_logininfor` WRITE;
/*!40000 ALTER TABLE `sys_logininfor` DISABLE KEYS */;

INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`)
VALUES
	(1,'admin','127.0.0.1','内网IP','Chrome 10','Mac OS X','0','登录成功','2023-01-17 02:39:29'),
	(2,'admin','127.0.0.1','内网IP','Chrome 10','Mac OS X','0','退出成功','2023-01-17 02:52:19'),
	(3,'zhangsan','127.0.0.1','内网IP','Chrome 10','Mac OS X','0','登录成功','2023-01-17 02:52:26'),
	(4,'zhangsan','127.0.0.1','内网IP','Chrome 10','Mac OS X','0','退出成功','2023-01-17 02:52:40'),
	(5,'zhangsan','127.0.0.1','内网IP','Chrome 10','Mac OS X','0','登录成功','2023-01-17 02:52:43'),
	(6,'admin','127.0.0.1','内网IP','Chrome 10','Mac OS X','0','登录成功','2023-01-17 03:34:42'),
	(7,'admin','127.0.0.1','内网IP','Chrome 10','Mac OS X','0','登录成功','2023-01-17 05:39:26'),
	(8,'admin','127.0.0.1','内网IP','Chrome 10','Mac OS X','0','登录成功','2023-01-17 06:12:16'),
	(9,'admin','127.0.0.1','内网IP','Chrome 10','Mac OS X','0','登录成功','2023-01-17 08:03:01'),
	(10,'admin','127.0.0.1','内网IP','Chrome 10','Mac OS X','0','登录成功','2023-01-17 10:46:53'),
	(11,'admin','127.0.0.1','内网IP','Unknown','Unknown','0','登录成功','2023-01-17 11:21:03'),
	(12,'admin','127.0.0.1','内网IP','Chrome 10','Mac OS X','0','登录成功','2023-01-17 11:37:51'),
	(13,'admin','127.0.0.1','内网IP','Unknown','Unknown','0','登录成功','2023-01-17 12:45:09'),
	(14,'admin','127.0.0.1','内网IP','Unknown','Unknown','0','登录成功','2023-01-17 12:47:37'),
	(15,'admin','127.0.0.1','内网IP','Chrome 10','Mac OS X','0','登录成功','2023-01-17 12:56:07'),
	(16,'admin','127.0.0.1','内网IP','Chrome 10','Mac OS X','0','登录成功','2023-01-17 13:54:57'),
	(17,'admin','127.0.0.1','内网IP','Unknown','Unknown','0','登录成功','2023-01-17 13:56:58'),
	(18,'admin','127.0.0.1','内网IP','Unknown','Unknown','0','登录成功','2023-01-17 14:46:32'),
	(19,'admin','127.0.0.1','内网IP','Chrome 10','Mac OS X','0','登录成功','2023-01-18 03:53:03'),
	(20,'admin','127.0.0.1','内网IP','Chrome 10','Mac OS X','0','登录成功','2023-01-18 06:37:07'),
	(21,'admin','127.0.0.1','内网IP','Chrome 10','Mac OS X','0','退出成功','2023-01-18 07:29:51'),
	(22,'zhangsan','127.0.0.1','内网IP','Chrome 10','Mac OS X','0','登录成功','2023-01-18 07:29:59'),
	(23,'admin','127.0.0.1','内网IP','Chrome 10','Mac OS X','0','登录成功','2023-01-18 08:13:46'),
	(24,'admin','127.0.0.1','内网IP','Unknown','Unknown','0','登录成功','2023-01-18 08:15:00'),
	(25,'zhangsan','127.0.0.1','内网IP','Unknown','Unknown','0','登录成功','2023-01-18 08:16:02'),
	(26,'admin','127.0.0.1','内网IP','Chrome 10','Mac OS X','0','登录成功','2023-01-18 09:06:53'),
	(27,'zhangsan','127.0.0.1','内网IP','Unknown','Unknown','0','登录成功','2023-01-18 09:38:28'),
	(28,'admin','127.0.0.1','内网IP','Chrome 10','Mac OS X','0','登录成功','2023-01-18 10:16:08'),
	(29,'admin','127.0.0.1','内网IP','Unknown','Unknown','0','登录成功','2023-01-18 10:23:22'),
	(30,'admin','127.0.0.1','内网IP','Unknown','Unknown','0','登录成功','2023-01-18 10:44:28'),
	(31,'admin','127.0.0.1','内网IP','Unknown','Unknown','0','登录成功','2023-01-18 13:17:29'),
	(32,'admin','127.0.0.1','内网IP','Chrome 10','Mac OS X','0','登录成功','2023-01-18 13:29:40'),
	(33,'admin','127.0.0.1','内网IP','Chrome 10','Mac OS X','0','登录成功','2023-01-18 14:21:16'),
	(34,'admin','127.0.0.1','内网IP','Chrome 10','Mac OS X','0','登录成功','2023-01-19 05:06:53'),
	(35,'admin','127.0.0.1','内网IP','Unknown','Unknown','0','登录成功','2023-01-19 06:00:11'),
	(36,'admin','127.0.0.1','内网IP','Chrome 10','Mac OS X','0','登录成功','2023-01-19 11:26:32'),
	(37,'admin','127.0.0.1','内网IP','Chrome 10','Mac OS X','0','登录成功','2023-01-19 13:04:11'),
	(38,'admin','127.0.0.1','内网IP','Unknown','Unknown','0','登录成功','2023-01-19 13:50:30'),
	(39,'admin','127.0.0.1','内网IP','Chrome 10','Mac OS X','0','登录成功','2023-01-19 14:27:33'),
	(40,'admin','127.0.0.1','内网IP','Chrome 10','Mac OS X','0','登录成功','2023-02-04 10:07:01'),
	(41,'admin','127.0.0.1','内网IP','Chrome 10','Mac OS X','0','退出成功','2023-02-04 10:17:30'),
	(42,'admin','127.0.0.1','内网IP','Chrome 10','Mac OS X','0','登录成功','2023-02-04 11:31:05'),
	(43,'admin','127.0.0.1','内网IP','Chrome 10','Mac OS X','0','登录成功','2023-02-04 12:36:15');

/*!40000 ALTER TABLE `sys_logininfor` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_menu
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_menu`;

CREATE TABLE `sys_menu` (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint DEFAULT '0' COMMENT '父菜单ID',
  `order_num` int DEFAULT '0' COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '路由参数',
  `is_frame` int DEFAULT '1' COMMENT '是否为外链（0是 1否）',
  `is_cache` int DEFAULT '0' COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '备注',
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
	(2007,'转派管理',0,8,'transfer','tienchin/transfer/index',NULL,1,0,'C','0','0','tienchin:transfer:list','example','admin','2022-04-21 22:40:25','admin','2023-01-16 15:45:08',''),
	(2008,'渠道管理',0,7,'channel','tienchin/channel/index',NULL,1,0,'C','0','0','tienchin:channel:list','row','admin','2022-04-21 22:40:25','admin','2023-01-16 15:45:18','渠道管理'),
	(3021,'活动管理查询',2003,1,'#','',NULL,1,0,'F','0','0','tienchin:activity:query','#','admin','2022-04-21 22:40:25','admin','2022-04-21 22:40:44',''),
	(3022,'活动管理新增',2003,2,'#','',NULL,1,0,'F','0','0','tienchin:activity:create','#','admin','2022-04-21 22:40:25','admin','2022-04-21 22:40:44',''),
	(3023,'活动管理修改',2003,3,'#','',NULL,1,0,'F','0','0','tienchin:activity:edit','#','admin','2022-04-21 22:40:25','admin','2022-04-21 22:40:44',''),
	(3024,'活动管理删除',2003,4,'#','',NULL,1,0,'F','0','0','tienchin:activity:remove','#','admin','2022-04-21 22:40:25','admin','2022-04-21 22:40:44',''),
	(3025,'活动管理导出',2003,5,'#','',NULL,1,0,'F','0','0','tienchin:activity:export','#','admin','2022-04-21 22:40:25','admin','2022-04-21 22:40:44',''),
	(3026,'课程管理查询',2004,1,'#','',NULL,1,0,'F','0','0','tienchin:course:query','#','admin','2022-04-21 22:40:25','','2022-04-21 22:40:44',''),
	(3027,'课程管理新增',2004,2,'#','',NULL,1,0,'F','0','0','tienchin:course:create','#','admin','2022-04-21 22:40:25','','2022-04-21 22:40:44',''),
	(3028,'课程管理修改',2004,3,'#','',NULL,1,0,'F','0','0','tienchin:course:edit','#','admin','2022-04-21 22:40:25','','2022-04-21 22:40:44',''),
	(3029,'课程管理删除',2004,4,'#','',NULL,1,0,'F','0','0','tienchin:course:remove','#','admin','2022-04-21 22:40:25','','2022-04-21 22:40:44',''),
	(3030,'课程管理导出',2004,5,'#','',NULL,1,0,'F','0','0','tienchin:course:export','#','admin','2022-04-21 22:40:25','','2022-04-21 22:40:44',''),
	(3031,'查询线索',2005,1,'#','',NULL,1,0,'F','0','0','tienchin:clue:list','#','admin','2022-04-21 22:40:25','admin','2023-01-17 02:43:30',''),
	(3032,'添加线索',2005,2,'#','',NULL,1,0,'F','0','0','tienchin:clue:create','#','admin','2022-04-21 22:40:25','admin','2023-01-17 02:43:57',''),
	(3033,'删除线索',2005,3,'#','',NULL,1,0,'F','0','0','tienchin:clue:remove','#','admin','2022-04-21 22:40:25','admin','2023-01-17 02:44:36',''),
	(3034,'修改线索',2005,4,'#','',NULL,1,0,'F','0','0','tienchin:clue:edit','#','admin','2022-04-21 22:40:25','admin','2023-01-17 02:44:51',''),
	(3035,'跟进线索',2005,6,'',NULL,NULL,1,0,'F','0','0','tienchin:clue:follow','#','admin','2022-04-21 22:40:25','admin','2023-01-17 02:45:15',''),
	(3036,'分配线索',2005,7,'',NULL,NULL,1,0,'F','0','0','tienchin:clue:assignment','#','admin','2022-04-21 22:40:25','admin','2023-01-17 02:45:30',''),
	(3047,'渠道管理查询',2008,1,'#','',NULL,1,0,'F','0','0','tienchin:channel:query','#','admin','2022-04-21 22:40:25','','2022-04-21 22:40:44',''),
	(3048,'渠道管理新增',2008,2,'#','',NULL,1,0,'F','0','0','tienchin:channel:create','#','admin','2022-04-21 22:40:25','','2022-04-21 22:40:44',''),
	(3049,'渠道管理修改',2008,3,'#','',NULL,1,0,'F','0','0','tienchin:channel:edit','#','admin','2022-04-21 22:40:25','','2022-04-21 22:40:44',''),
	(3050,'渠道管理删除',2008,4,'#','',NULL,1,0,'F','0','0','tienchin:channel:remove','#','admin','2022-04-21 22:40:25','','2022-04-21 22:40:44',''),
	(3053,'活动管理导入',2003,6,'#','',NULL,1,0,'F','0','0','tienchin:activity:import','#','admin','2022-04-21 22:40:25','admin','2022-04-21 22:40:44',''),
	(3054,'渠道导入',2008,5,'',NULL,NULL,1,0,'F','0','0','tienchin:channel:import','#','admin','2023-01-17 02:49:30','',NULL,''),
	(3055,'渠道导出',2008,6,'',NULL,NULL,1,0,'F','0','0','tienchin:channel:export','#','admin','2023-01-17 02:49:56','',NULL,''),
	(3056,'查看线索',2005,8,'',NULL,NULL,1,0,'F','0','0','tienchin:clue:view','#','admin','2023-01-18 07:19:16','',NULL,''),
	(3057,'查询商机',2001,1,'',NULL,NULL,1,0,'F','0','0','tienchin:business:list','#','admin','2023-02-04 12:37:47','admin','2023-02-04 12:38:06',''),
	(3058,'添加商机',2001,2,'',NULL,NULL,1,0,'F','0','0','tienchin:business:create','#','admin','2023-02-04 12:38:31','',NULL,''),
	(3059,'删除商机',2001,3,'',NULL,NULL,1,0,'F','0','0','tienchin:business:remove','#','admin','2023-02-04 12:38:59','',NULL,''),
	(3060,'修改商机',2001,4,'',NULL,NULL,1,0,'F','0','0','tienchin:business:edit','#','admin','2023-02-04 12:39:19','',NULL,''),
	(3061,'跟进商机',2001,5,'',NULL,NULL,1,0,'F','0','0','tienchin:business:follow','#','admin','2023-02-04 12:39:51','',NULL,''),
	(3062,'分配商机',2001,6,'',NULL,NULL,1,0,'F','0','0','tienchin:business:assignment','#','admin','2023-02-04 12:40:14','',NULL,''),
	(3063,'查看商机',2001,7,'',NULL,NULL,1,0,'F','0','0','tienchin:business:view','#','admin','2023-02-04 12:40:33','',NULL,'');

/*!40000 ALTER TABLE `sys_menu` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_notice
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_notice`;

CREATE TABLE `sys_notice` (
  `notice_id` int NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='通知公告表';

LOCK TABLES `sys_notice` WRITE;
/*!40000 ALTER TABLE `sys_notice` DISABLE KEYS */;

INSERT INTO `sys_notice` (`notice_id`, `notice_title`, `notice_type`, `notice_content`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`)
VALUES
	(1,'温馨提醒：2018-07-01 TienChin健身新版本发布啦','2',X'E696B0E78988E69CACE58685E5AEB9','0','admin','2023-01-16 16:20:40','',NULL,'管理员'),
	(2,'维护通知：2018-07-01 TienChin健身系统凌晨维护','1',X'E7BBB4E68AA4E58685E5AEB9','0','admin','2023-01-16 16:20:40','',NULL,'管理员');

/*!40000 ALTER TABLE `sys_notice` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_oper_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_oper_log`;

CREATE TABLE `sys_oper_log` (
  `oper_id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '模块标题',
  `business_type` int DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '请求方式',
  `operator_type` int DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '返回参数',
  `status` int DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='操作日志记录';

LOCK TABLES `sys_oper_log` WRITE;
/*!40000 ALTER TABLE `sys_oper_log` DISABLE KEYS */;

INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`)
VALUES
	(1,'菜单管理',3,'org.javaboy.tienchin.web.controller.system.SysMenuController.remove(java.lang.Long)','DELETE',1,'admin',NULL,'/system/menu/3037','127.0.0.1','内网IP','{menuId=3037}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-01-17 02:45:54'),
	(2,'菜单管理',3,'org.javaboy.tienchin.web.controller.system.SysMenuController.remove(java.lang.Long)','DELETE',1,'admin',NULL,'/system/menu/3038','127.0.0.1','内网IP','{menuId=3038}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-01-17 02:46:01'),
	(3,'菜单管理',3,'org.javaboy.tienchin.web.controller.system.SysMenuController.remove(java.lang.Long)','DELETE',1,'admin',NULL,'/system/menu/3039','127.0.0.1','内网IP','{menuId=3039}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-01-17 02:46:08'),
	(4,'菜单管理',3,'org.javaboy.tienchin.web.controller.system.SysMenuController.remove(java.lang.Long)','DELETE',1,'admin',NULL,'/system/menu/3040','127.0.0.1','内网IP','{menuId=3040}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-01-17 02:46:13'),
	(5,'菜单管理',3,'org.javaboy.tienchin.web.controller.system.SysMenuController.remove(java.lang.Long)','DELETE',1,'admin',NULL,'/system/menu/3011','127.0.0.1','内网IP','{menuId=3011}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-01-17 02:46:33'),
	(6,'菜单管理',3,'org.javaboy.tienchin.web.controller.system.SysMenuController.remove(java.lang.Long)','DELETE',1,'admin',NULL,'/system/menu/3012','127.0.0.1','内网IP','{menuId=3012}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-01-17 02:46:37'),
	(7,'菜单管理',3,'org.javaboy.tienchin.web.controller.system.SysMenuController.remove(java.lang.Long)','DELETE',1,'admin',NULL,'/system/menu/3013','127.0.0.1','内网IP','{menuId=3013}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-01-17 02:46:42'),
	(8,'菜单管理',3,'org.javaboy.tienchin.web.controller.system.SysMenuController.remove(java.lang.Long)','DELETE',1,'admin',NULL,'/system/menu/3014','127.0.0.1','内网IP','{menuId=3014}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-01-17 02:46:46'),
	(9,'菜单管理',3,'org.javaboy.tienchin.web.controller.system.SysMenuController.remove(java.lang.Long)','DELETE',1,'admin',NULL,'/system/menu/3015','127.0.0.1','内网IP','{menuId=3015}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-01-17 02:46:51'),
	(10,'菜单管理',3,'org.javaboy.tienchin.web.controller.system.SysMenuController.remove(java.lang.Long)','DELETE',1,'admin',NULL,'/system/menu/3016','127.0.0.1','内网IP','{menuId=3016}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-01-17 02:46:56'),
	(11,'菜单管理',3,'org.javaboy.tienchin.web.controller.system.SysMenuController.remove(java.lang.Long)','DELETE',1,'admin',NULL,'/system/menu/3018','127.0.0.1','内网IP','{menuId=3018}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-01-17 02:47:00'),
	(12,'菜单管理',3,'org.javaboy.tienchin.web.controller.system.SysMenuController.remove(java.lang.Long)','DELETE',1,'admin',NULL,'/system/menu/3017','127.0.0.1','内网IP','{menuId=3017}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-01-17 02:47:04'),
	(13,'菜单管理',3,'org.javaboy.tienchin.web.controller.system.SysMenuController.remove(java.lang.Long)','DELETE',1,'admin',NULL,'/system/menu/3019','127.0.0.1','内网IP','{menuId=3019}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-01-17 02:47:07'),
	(14,'菜单管理',3,'org.javaboy.tienchin.web.controller.system.SysMenuController.remove(java.lang.Long)','DELETE',1,'admin',NULL,'/system/menu/3020','127.0.0.1','内网IP','{menuId=3020}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-01-17 02:47:11'),
	(15,'菜单管理',3,'org.javaboy.tienchin.web.controller.system.SysMenuController.remove(java.lang.Long)','DELETE',1,'admin',NULL,'/system/menu/3001','127.0.0.1','内网IP','{menuId=3001}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-01-17 02:47:21'),
	(16,'菜单管理',3,'org.javaboy.tienchin.web.controller.system.SysMenuController.remove(java.lang.Long)','DELETE',1,'admin',NULL,'/system/menu/3003','127.0.0.1','内网IP','{menuId=3003}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-01-17 02:47:25'),
	(17,'菜单管理',3,'org.javaboy.tienchin.web.controller.system.SysMenuController.remove(java.lang.Long)','DELETE',1,'admin',NULL,'/system/menu/3004','127.0.0.1','内网IP','{menuId=3004}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-01-17 02:47:28'),
	(18,'菜单管理',3,'org.javaboy.tienchin.web.controller.system.SysMenuController.remove(java.lang.Long)','DELETE',1,'admin',NULL,'/system/menu/3006','127.0.0.1','内网IP','{menuId=3006}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-01-17 02:47:31'),
	(19,'菜单管理',3,'org.javaboy.tienchin.web.controller.system.SysMenuController.remove(java.lang.Long)','DELETE',1,'admin',NULL,'/system/menu/3007','127.0.0.1','内网IP','{menuId=3007}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-01-17 02:47:35'),
	(20,'菜单管理',3,'org.javaboy.tienchin.web.controller.system.SysMenuController.remove(java.lang.Long)','DELETE',1,'admin',NULL,'/system/menu/3005','127.0.0.1','内网IP','{menuId=3005}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-01-17 02:47:38'),
	(21,'菜单管理',3,'org.javaboy.tienchin.web.controller.system.SysMenuController.remove(java.lang.Long)','DELETE',1,'admin',NULL,'/system/menu/3002','127.0.0.1','内网IP','{menuId=3002}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-01-17 02:47:44'),
	(22,'菜单管理',3,'org.javaboy.tienchin.web.controller.system.SysMenuController.remove(java.lang.Long)','DELETE',1,'admin',NULL,'/system/menu/3008','127.0.0.1','内网IP','{menuId=3008}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-01-17 02:47:49'),
	(23,'菜单管理',3,'org.javaboy.tienchin.web.controller.system.SysMenuController.remove(java.lang.Long)','DELETE',1,'admin',NULL,'/system/menu/3009','127.0.0.1','内网IP','{menuId=3009}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-01-17 02:47:54'),
	(24,'菜单管理',3,'org.javaboy.tienchin.web.controller.system.SysMenuController.remove(java.lang.Long)','DELETE',1,'admin',NULL,'/system/menu/3010','127.0.0.1','内网IP','{menuId=3010}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-01-17 02:47:58'),
	(25,'线索管理',1,'org.javaboy.tienchin.web.controller.tienchin.clue.ClueController.add(org.javaboy.tienchin.clue.domain.Clue)','POST',1,'admin',NULL,'/tienchin/clue','127.0.0.1','内网IP','{\"clueId\":18,\"activityId\":1,\"createBy\":\"admin\",\"createTime\":\"2023-01-17T15:20:05.223887000\",\"phone\":\"15111111111\",\"name\":\"王武\",\"age\":23,\"channelId\":2,\"status\":0}','{\"msg\":\"线索录入成功\",\"code\":200}',0,NULL,'2023-01-17 07:20:05'),
	(26,'字典数据',1,'org.javaboy.tienchin.web.controller.system.SysDictDataController.add(org.javaboy.tienchin.common.core.domain.entity.SysDictData)','POST',1,'admin',NULL,'/system/dict/data','127.0.0.1','内网IP','{\"dictValue\":\"0\",\"listClass\":\"danger\",\"dictSort\":0,\"params\":{},\"dictType\":\"clue_status\",\"dictLabel\":\"未分配\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-01-17 07:21:58'),
	(27,'字典类型',3,'org.javaboy.tienchin.web.controller.system.SysDictDataController.remove(java.lang.Long[])','DELETE',1,'admin',NULL,'/system/dict/data/123','127.0.0.1','内网IP','{dictCodes=123}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-01-17 07:24:35'),
	(28,'线索管理',1,'org.javaboy.tienchin.web.controller.tienchin.clue.ClueController.add(org.javaboy.tienchin.clue.domain.Clue)','POST',1,'admin',NULL,'/tienchin/clue','127.0.0.1','内网IP','{\"gender\":1,\"clueId\":19,\"activityId\":2,\"createBy\":\"admin\",\"createTime\":\"2023-01-17T15:27:46.890123000\",\"phone\":\"13111111111\",\"name\":\"张三\",\"age\":28,\"channelId\":1}','{\"msg\":\"线索录入成功\",\"code\":200}',0,NULL,'2023-01-17 07:27:46'),
	(29,'线索管理',1,'org.javaboy.tienchin.web.controller.tienchin.clue.ClueController.add(org.javaboy.tienchin.clue.domain.Clue)','POST',1,'admin',NULL,'/tienchin/clue','127.0.0.1','内网IP','{\"gender\":0,\"clueId\":20,\"activityId\":7,\"createBy\":\"admin\",\"createTime\":\"2023-01-17T18:47:17.172761000\",\"phone\":\"18111111111\",\"name\":\"里斯\",\"age\":33,\"channelId\":2}','{\"msg\":\"线索录入失败\",\"code\":500}',0,NULL,'2023-01-17 10:47:17'),
	(30,'线索管理',1,'org.javaboy.tienchin.web.controller.tienchin.clue.ClueController.add(org.javaboy.tienchin.clue.domain.Clue)','POST',1,'admin',NULL,'/tienchin/clue','127.0.0.1','内网IP','{\"gender\":0,\"activityId\":7,\"phone\":\"18111111111\",\"name\":\"里斯\",\"age\":33,\"channelId\":2}','{\"msg\":\"手机号码重复，线索录入失败\",\"code\":500}',0,NULL,'2023-01-17 10:48:58'),
	(31,'线索管理',1,'org.javaboy.tienchin.web.controller.tienchin.clue.ClueController.add(org.javaboy.tienchin.clue.domain.Clue)','POST',1,'admin',NULL,'/tienchin/clue','127.0.0.1','内网IP','{\"gender\":0,\"clueId\":21,\"activityId\":7,\"createBy\":\"admin\",\"createTime\":\"2023-01-17T18:49:09.184550000\",\"phone\":\"18111111112\",\"name\":\"里斯\",\"age\":33,\"channelId\":2}','{\"msg\":\"线索录入失败\",\"code\":500}',0,NULL,'2023-01-17 10:50:30'),
	(32,'线索管理',1,'org.javaboy.tienchin.web.controller.tienchin.clue.ClueController.add(org.javaboy.tienchin.clue.domain.Clue)','POST',1,'admin',NULL,'/tienchin/clue','127.0.0.1','内网IP','{\"gender\":0,\"activityId\":7,\"phone\":\"18111111112\",\"name\":\"里斯\",\"age\":33,\"channelId\":2}','{\"msg\":\"手机号码重复，线索录入失败\",\"code\":500}',0,NULL,'2023-01-17 10:53:31'),
	(33,'线索管理',1,'org.javaboy.tienchin.web.controller.tienchin.clue.ClueController.add(org.javaboy.tienchin.clue.domain.Clue)','POST',1,'admin',NULL,'/tienchin/clue','127.0.0.1','内网IP','{\"gender\":0,\"clueId\":22,\"activityId\":7,\"createBy\":\"admin\",\"createTime\":\"2023-01-17T18:53:38.549192000\",\"phone\":\"18111111113\",\"name\":\"里斯3\",\"age\":33,\"channelId\":2}','{\"msg\":\"线索录入成功\",\"code\":200}',0,NULL,'2023-01-17 10:53:38'),
	(34,'线索管理',1,'org.javaboy.tienchin.web.controller.tienchin.clue.ClueController.add(org.javaboy.tienchin.clue.domain.Clue)','POST',1,'admin',NULL,'/tienchin/clue','127.0.0.1','内网IP','{\"gender\":0,\"nextTime\":\"2023-01-18T19:55:04.403196000\",\"clueId\":23,\"activityId\":5,\"createBy\":\"admin\",\"createTime\":\"2023-01-17T19:55:04.403239000\",\"phone\":\"13111111111\",\"name\":\"张三\",\"age\":30,\"channelId\":3}','{\"msg\":\"线索录入成功\",\"code\":200}',0,NULL,'2023-01-17 11:55:04'),
	(35,'菜单管理',1,'org.javaboy.tienchin.web.controller.system.SysMenuController.add(org.javaboy.tienchin.common.core.domain.entity.SysMenu)','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"orderNum\":8,\"menuName\":\"查看线索\",\"params\":{},\"parentId\":2005,\"isCache\":\"0\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"F\",\"perms\":\"tienchin:clue:view\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-01-18 07:19:16'),
	(36,'角色管理',1,'org.javaboy.tienchin.web.controller.system.SysRoleController.add(org.javaboy.tienchin.common.core.domain.entity.SysRole)','POST',1,'admin',NULL,'/system/role','127.0.0.1','内网IP','{\"flag\":false,\"roleId\":4,\"admin\":false,\"params\":{},\"roleSort\":\"0\",\"deptCheckStrictly\":true,\"createBy\":\"admin\",\"menuCheckStrictly\":true,\"roleKey\":\"clue_role\",\"roleName\":\"线索管理员\",\"deptIds\":[],\"menuIds\":[2005,3056],\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-01-18 07:29:16'),
	(37,'角色管理',2,'org.javaboy.tienchin.web.controller.system.SysRoleController.edit(org.javaboy.tienchin.common.core.domain.entity.SysRole)','PUT',1,'admin',NULL,'/system/role','127.0.0.1','内网IP','{\"flag\":false,\"roleId\":4,\"admin\":false,\"dataScope\":\"1\",\"delFlag\":\"0\",\"params\":{},\"roleSort\":\"0\",\"deptCheckStrictly\":true,\"createTime\":1673998156000,\"updateBy\":\"admin\",\"menuCheckStrictly\":true,\"roleKey\":\"clue_role\",\"roleName\":\"线索管理员\",\"menuIds\":[2005,3031,3032,3033,3034,3036,3056],\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-01-18 07:29:35'),
	(38,'用户管理',4,'org.javaboy.tienchin.web.controller.system.SysUserController.insertAuthRole(java.lang.Long,java.lang.Long[])','PUT',1,'admin',NULL,'/system/user/authRole','127.0.0.1','内网IP','3 [4]','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-01-18 07:29:46'),
	(39,'线索管理',1,'org.javaboy.tienchin.web.controller.tienchin.clue.ClueController.add(org.javaboy.tienchin.clue.domain.Clue)','POST',1,'admin',NULL,'/tienchin/clue','127.0.0.1','内网IP','{\"gender\":1,\"nextTime\":\"2023-01-19T16:14:14.059755000\",\"clueId\":24,\"activityId\":4,\"createBy\":\"admin\",\"createTime\":\"2023-01-18T16:14:14.059800000\",\"phone\":\"18111111111\",\"name\":\"里斯\",\"age\":27,\"channelId\":2}','{\"msg\":\"线索录入成功\",\"code\":200}',0,NULL,'2023-01-18 08:14:14'),
	(40,'字典数据',2,'org.javaboy.tienchin.web.controller.system.SysDictDataController.edit(org.javaboy.tienchin.common.core.domain.entity.SysDictData)','PUT',1,'admin',NULL,'/system/dict/data','127.0.0.1','内网IP','{\"dictValue\":\"3\",\"listClass\":\"info\",\"dictSort\":0,\"params\":{},\"dictType\":\"course_type\",\"dictLabel\":\"拳击类\",\"createBy\":\"admin\",\"default\":false,\"isDefault\":\"N\",\"createTime\":1673859077000,\"dictCode\":110,\"updateBy\":\"admin\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-01-18 15:01:06'),
	(41,'字典类型',1,'org.javaboy.tienchin.web.controller.system.SysDictTypeController.add(org.javaboy.tienchin.common.core.domain.entity.SysDictType)','POST',1,'admin',NULL,'/system/dict/type','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"dictName\":\"无效线索类型\",\"params\":{},\"dictType\":\"clue_invalidate\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-01-19 06:46:25'),
	(42,'字典数据',1,'org.javaboy.tienchin.web.controller.system.SysDictDataController.add(org.javaboy.tienchin.common.core.domain.entity.SysDictData)','POST',1,'admin',NULL,'/system/dict/data','127.0.0.1','内网IP','{\"dictValue\":\"1\",\"listClass\":\"primary\",\"dictSort\":0,\"params\":{},\"dictType\":\"clue_invalidate\",\"dictLabel\":\"空号\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-01-19 06:46:41'),
	(43,'字典数据',1,'org.javaboy.tienchin.web.controller.system.SysDictDataController.add(org.javaboy.tienchin.common.core.domain.entity.SysDictData)','POST',1,'admin',NULL,'/system/dict/data','127.0.0.1','内网IP','{\"dictValue\":\"2\",\"listClass\":\"success\",\"dictSort\":0,\"params\":{},\"dictType\":\"clue_invalidate\",\"dictLabel\":\"停机\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-01-19 06:46:53'),
	(44,'字典数据',1,'org.javaboy.tienchin.web.controller.system.SysDictDataController.add(org.javaboy.tienchin.common.core.domain.entity.SysDictData)','POST',1,'admin',NULL,'/system/dict/data','127.0.0.1','内网IP','{\"dictValue\":\"3\",\"listClass\":\"info\",\"dictSort\":0,\"params\":{},\"dictType\":\"clue_invalidate\",\"dictLabel\":\"无法联系\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-01-19 06:47:04'),
	(45,'字典数据',1,'org.javaboy.tienchin.web.controller.system.SysDictDataController.add(org.javaboy.tienchin.common.core.domain.entity.SysDictData)','POST',1,'admin',NULL,'/system/dict/data','127.0.0.1','内网IP','{\"dictValue\":\"4\",\"listClass\":\"warning\",\"dictSort\":0,\"params\":{},\"dictType\":\"clue_invalidate\",\"dictLabel\":\"其他\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-01-19 06:47:18'),
	(46,'菜单管理',1,'org.javaboy.tienchin.web.controller.system.SysMenuController.add(org.javaboy.tienchin.common.core.domain.entity.SysMenu)','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"orderNum\":1,\"menuName\":\"查询商机\",\"params\":{},\"parentId\":2001,\"isCache\":\"0\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"F\",\"perms\":\"tienchin:business:query\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-02-04 12:37:47'),
	(47,'菜单管理',2,'org.javaboy.tienchin.web.controller.system.SysMenuController.edit(org.javaboy.tienchin.common.core.domain.entity.SysMenu)','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":1,\"menuName\":\"查询商机\",\"params\":{},\"parentId\":2001,\"isCache\":\"0\",\"path\":\"\",\"children\":[],\"createTime\":1675485467000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":3057,\"menuType\":\"F\",\"perms\":\"tienchin:business:list\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-02-04 12:38:06'),
	(48,'菜单管理',1,'org.javaboy.tienchin.web.controller.system.SysMenuController.add(org.javaboy.tienchin.common.core.domain.entity.SysMenu)','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"orderNum\":2,\"menuName\":\"添加商机\",\"params\":{},\"parentId\":2001,\"isCache\":\"0\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"F\",\"perms\":\"tienchin:business:create\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-02-04 12:38:31'),
	(49,'菜单管理',1,'org.javaboy.tienchin.web.controller.system.SysMenuController.add(org.javaboy.tienchin.common.core.domain.entity.SysMenu)','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"orderNum\":3,\"menuName\":\"删除商机\",\"params\":{},\"parentId\":2001,\"isCache\":\"0\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"F\",\"perms\":\"tienchin:business:remove\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-02-04 12:38:59'),
	(50,'菜单管理',1,'org.javaboy.tienchin.web.controller.system.SysMenuController.add(org.javaboy.tienchin.common.core.domain.entity.SysMenu)','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"orderNum\":4,\"menuName\":\"修改商机\",\"params\":{},\"parentId\":2001,\"isCache\":\"0\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"F\",\"perms\":\"tienchin:business:edit\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-02-04 12:39:19'),
	(51,'菜单管理',1,'org.javaboy.tienchin.web.controller.system.SysMenuController.add(org.javaboy.tienchin.common.core.domain.entity.SysMenu)','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"orderNum\":5,\"menuName\":\"跟进商机\",\"params\":{},\"parentId\":2001,\"isCache\":\"0\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"F\",\"perms\":\"tienchin:business:follow\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-02-04 12:39:51'),
	(52,'菜单管理',1,'org.javaboy.tienchin.web.controller.system.SysMenuController.add(org.javaboy.tienchin.common.core.domain.entity.SysMenu)','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"orderNum\":6,\"menuName\":\"分配商机\",\"params\":{},\"parentId\":2001,\"isCache\":\"0\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"F\",\"perms\":\"tienchin:business:assignment\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-02-04 12:40:14'),
	(53,'菜单管理',1,'org.javaboy.tienchin.web.controller.system.SysMenuController.add(org.javaboy.tienchin.common.core.domain.entity.SysMenu)','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"orderNum\":7,\"menuName\":\"查看商机\",\"params\":{},\"parentId\":2001,\"isCache\":\"0\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"F\",\"perms\":\"tienchin:business:view\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-02-04 12:40:33');

/*!40000 ALTER TABLE `sys_oper_log` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_post
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_post`;

CREATE TABLE `sys_post` (
  `post_id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='岗位信息表';

LOCK TABLES `sys_post` WRITE;
/*!40000 ALTER TABLE `sys_post` DISABLE KEYS */;

INSERT INTO `sys_post` (`post_id`, `post_code`, `post_name`, `post_sort`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`)
VALUES
	(1,'ceo','董事长',1,'0','admin','2023-01-16 16:20:27','',NULL,''),
	(2,'se','项目经理',2,'0','admin','2023-01-16 16:20:27','',NULL,''),
	(3,'hr','人力资源',3,'0','admin','2023-01-16 16:20:27','',NULL,''),
	(4,'user','普通员工',4,'0','admin','2023-01-16 16:20:27','',NULL,'');

/*!40000 ALTER TABLE `sys_post` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_role
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_role`;

CREATE TABLE `sys_role` (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) DEFAULT '1' COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) DEFAULT '1' COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='角色信息表';

LOCK TABLES `sys_role` WRITE;
/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;

INSERT INTO `sys_role` (`role_id`, `role_name`, `role_key`, `role_sort`, `data_scope`, `menu_check_strictly`, `dept_check_strictly`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`)
VALUES
	(1,'超级管理员','admin',1,'1',1,1,'0','0','admin','2023-01-16 16:20:27','',NULL,'超级管理员'),
	(2,'普通角色','common',2,'2',1,1,'0','0','admin','2023-01-16 16:20:27','',NULL,'普通角色'),
	(3,'渠道管理员','channel_role',0,'1',1,1,'0','0','admin','2023-01-17 02:51:57','',NULL,NULL),
	(4,'线索管理员','clue_role',0,'1',1,1,'0','0','admin','2023-01-18 07:29:16','admin','2023-01-18 07:29:35',NULL);

/*!40000 ALTER TABLE `sys_role` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_role_dept
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_role_dept`;

CREATE TABLE `sys_role_dept` (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
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
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
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
	(2,1000),
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
	(3,2008),
	(3,3047),
	(3,3048),
	(3,3049),
	(3,3050),
	(3,3055),
	(4,2005),
	(4,3031),
	(4,3032),
	(4,3033),
	(4,3034),
	(4,3036),
	(4,3056);

/*!40000 ALTER TABLE `sys_role_menu` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_user`;

CREATE TABLE `sys_user` (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户信息表';

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;

INSERT INTO `sys_user` (`user_id`, `dept_id`, `user_name`, `nick_name`, `user_type`, `email`, `phonenumber`, `sex`, `avatar`, `password`, `status`, `del_flag`, `login_ip`, `login_date`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`)
VALUES
	(1,103,'admin','TienChin健身','00','ry@163.com','15888888888','1','','$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2','0','0','127.0.0.1','2023-02-04 20:36:16','admin','2023-01-16 16:20:26','','2023-02-04 12:36:15','管理员'),
	(2,105,'ry','TienChin健身_test','00','ry@qq.com','15666666666','1','','$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2','0','0','127.0.0.1','2023-01-16 16:20:26','admin','2023-01-16 16:20:26','',NULL,'测试员'),
	(3,100,'zhangsan','张三','00','111@qq.com','13011111111','0','','$2a$10$V5aLwXgE8rF1Gm6Wl6dNNuS271ibQYqp64nccgEdDoRIQjfa71X8C','0','0','127.0.0.1','2023-01-18 17:38:28','admin','2023-01-17 02:50:55','','2023-01-18 09:38:27',NULL);

/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_user_post
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_user_post`;

CREATE TABLE `sys_user_post` (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`,`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户与岗位关联表';

LOCK TABLES `sys_user_post` WRITE;
/*!40000 ALTER TABLE `sys_user_post` DISABLE KEYS */;

INSERT INTO `sys_user_post` (`user_id`, `post_id`)
VALUES
	(1,1),
	(2,2);

/*!40000 ALTER TABLE `sys_user_post` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_user_role
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_user_role`;

CREATE TABLE `sys_user_role` (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户和角色关联表';

LOCK TABLES `sys_user_role` WRITE;
/*!40000 ALTER TABLE `sys_user_role` DISABLE KEYS */;

INSERT INTO `sys_user_role` (`user_id`, `role_id`)
VALUES
	(1,1),
	(2,2),
	(3,4);

/*!40000 ALTER TABLE `sys_user_role` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table tienchin_activity
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tienchin_activity`;

CREATE TABLE `tienchin_activity` (
  `activity_id` int NOT NULL AUTO_INCREMENT COMMENT '活动ID',
  `name` varchar(512) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '活动名称',
  `channel_id` int DEFAULT NULL COMMENT '渠道ID',
  `info` varchar(512) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '活动简介',
  `type` int DEFAULT NULL COMMENT '活动类型 1 折扣券 2 代金券',
  `discount` float DEFAULT NULL COMMENT '折扣券',
  `voucher` double DEFAULT NULL COMMENT '代金券',
  `status` int DEFAULT '1' COMMENT '活动状态 0 禁用 1 正常',
  `begin_time` datetime DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `create_by` varchar(16) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `update_by` varchar(16) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `del_flag` int DEFAULT NULL,
  PRIMARY KEY (`activity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin COMMENT='活动管理';

LOCK TABLES `tienchin_activity` WRITE;
/*!40000 ALTER TABLE `tienchin_activity` DISABLE KEYS */;

INSERT INTO `tienchin_activity` (`activity_id`, `name`, `channel_id`, `info`, `type`, `discount`, `voucher`, `status`, `begin_time`, `end_time`, `create_time`, `update_time`, `create_by`, `update_by`, `remark`, `del_flag`)
VALUES
	(1,X'E68A96E99FB3E5958AE5958AE5958A',2,X'E6B4BBE58AA8',1,8.2,NULL,0,'2022-05-16 00:00:00','2022-05-19 23:59:59','2022-04-25 20:51:48','2022-04-28 20:43:14',X'61646D696E',X'61646D696E',NULL,0),
	(2,X'E5958AE5958AE5958AE5958A',1,X'E58F8DE58F8DE5A48DE5A48DE58F8DE58F8DE5A48DE5A48D',2,NULL,3,0,'2022-05-17 00:00:00','2022-06-30 23:59:59','2022-04-25 21:03:23','2022-04-25 22:42:37',X'61646D696E',X'61646D696E',NULL,0),
	(3,X'666666666666',1,X'61616161616262',2,4,200,0,'2022-04-29 00:00:00','2022-05-24 23:59:59','2022-04-25 21:12:49','2023-01-17 00:47:37',X'61646D696E',X'61646D696E',NULL,0),
	(4,X'76767676',2,X'6161616161',1,2.3,NULL,0,'2022-05-03 00:00:00','2022-05-17 23:59:59','2022-04-25 21:13:45','2022-04-25 22:42:50',X'61646D696E',X'61646D696E',NULL,0),
	(5,X'E59CB0E68EA8',3,X'E5958AE5958AE5958A',1,6,NULL,1,'2022-05-22 00:00:00','2024-05-23 23:59:59','2023-04-26 19:56:07',NULL,X'61646D696E',NULL,NULL,0),
	(6,X'E68A96E99FB3E5958AE5958AE5958A',2,X'E6B4BBE58AA8',1,8,NULL,0,'2022-05-16 00:00:00','2022-05-19 23:59:59',NULL,NULL,X'61646D696E',X'61646D696E',NULL,0),
	(7,X'E68A96E99FB3E5958AE5958AE5958A',2,X'E6B4BBE58AA8',1,8,NULL,0,'2022-05-16 00:00:00','2022-05-19 23:59:59',NULL,NULL,X'61646D696E',X'61646D696E',NULL,0);

/*!40000 ALTER TABLE `tienchin_activity` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table tienchin_assignment
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tienchin_assignment`;

CREATE TABLE `tienchin_assignment` (
  `aid` int NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `type` int DEFAULT '0' COMMENT '类型0 线索 1 商机',
  `assign_id` int DEFAULT NULL COMMENT '线索/商机 id',
  `user_id` bigint DEFAULT NULL COMMENT '所属人用户id',
  `user_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '所属人名称',
  `dept_id` bigint DEFAULT NULL COMMENT '所属人所属组织',
  `latest` tinyint(1) DEFAULT '1' COMMENT '是否当前最新分配人',
  `create_time` datetime DEFAULT NULL COMMENT '分配时间',
  `create_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '分配人',
  `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '更新人',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`aid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin COMMENT='分配记录表';

LOCK TABLES `tienchin_assignment` WRITE;
/*!40000 ALTER TABLE `tienchin_assignment` DISABLE KEYS */;

INSERT INTO `tienchin_assignment` (`aid`, `type`, `assign_id`, `user_id`, `user_name`, `dept_id`, `latest`, `create_time`, `create_by`, `update_time`, `update_by`, `remark`)
VALUES
	(4,0,23,1,X'61646D696E',103,0,'2023-01-17 19:55:05',X'61646D696E','2023-01-17 14:28:45',NULL,NULL),
	(7,0,23,3,X'7A68616E6773616E',100,0,'2023-01-17 22:28:46',X'61646D696E','2023-01-17 14:29:22',NULL,NULL),
	(8,0,23,2,X'7279',105,0,'2023-01-17 22:29:23',X'61646D696E','2023-01-17 14:38:26',NULL,NULL),
	(13,0,23,3,X'7A68616E6773616E',100,0,'2023-01-17 22:38:26',X'61646D696E','2023-01-17 14:49:42',NULL,NULL),
	(14,0,23,2,X'7279',105,0,'2023-01-17 22:49:42',X'61646D696E','2023-01-18 10:45:28',NULL,NULL),
	(15,0,24,1,X'61646D696E',103,0,'2023-01-18 16:14:14',X'61646D696E','2023-01-18 13:30:02',NULL,NULL),
	(16,0,23,3,X'7A68616E6773616E',100,0,'2023-01-18 18:45:29',X'61646D696E','2023-01-18 13:18:42',NULL,NULL),
	(18,0,23,2,X'7279',105,0,'2023-01-18 21:18:43',X'61646D696E','2023-01-18 13:33:54',NULL,NULL),
	(19,0,24,3,X'7A68616E6773616E',100,0,'2023-01-18 21:30:02',X'61646D696E','2023-02-04 11:39:08',NULL,NULL),
	(20,0,23,3,X'7A68616E6773616E',100,0,'2023-01-18 21:33:55',X'61646D696E','2023-01-18 13:39:34',NULL,NULL),
	(21,0,23,1,X'61646D696E',103,1,'2023-01-18 21:39:34',X'61646D696E',NULL,NULL,NULL),
	(22,0,24,1,X'61646D696E',103,1,'2023-02-04 19:39:09',X'61646D696E',NULL,NULL,NULL);

/*!40000 ALTER TABLE `tienchin_assignment` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table tienchin_business
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tienchin_business`;

CREATE TABLE `tienchin_business` (
  `business_id` bigint NOT NULL AUTO_INCREMENT COMMENT '线索id',
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '客户姓名',
  `channel_id` int DEFAULT NULL COMMENT '渠道',
  `activity_id` int DEFAULT NULL COMMENT '活动',
  `gender` int DEFAULT NULL COMMENT '0 男 1 女',
  `age` int DEFAULT NULL COMMENT '年龄',
  `weixin` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '微信',
  `qq` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'qq',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '手机号',
  `level` int DEFAULT NULL COMMENT '客户意向等级 1 近期报名 2 打算报名，考虑中 3 了解一下 4 打酱油',
  `subject` int DEFAULT NULL COMMENT '意向私教课程',
  `status` int DEFAULT '1' COMMENT '状态(已分配1  进行中2  回收3)',
  `fail_count` int DEFAULT '0' COMMENT '伪线索失败次数(最大数3次)',
  `next_time` datetime DEFAULT NULL COMMENT '下次跟进时间',
  `transfer` tinyint(1) DEFAULT '0' COMMENT '是否转派',
  `end_time` datetime DEFAULT NULL COMMENT '线索失效时间',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '更新人',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `del_flag` int DEFAULT '0' COMMENT '0 未删除 1 表示删除',
  `province` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '省',
  `city` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '市',
  `area` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '区',
  `course_id` int DEFAULT NULL COMMENT '课程ID',
  `occupation` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '职业',
  `education` varchar(64) COLLATE utf8_bin DEFAULT '' COMMENT '学历',
  `height` double DEFAULT NULL COMMENT '身高',
  `weight` double DEFAULT NULL COMMENT '体重',
  `reason` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '锻炼的原因',
  `hours` int DEFAULT NULL COMMENT '每周可以用于锻炼的时间',
  `othen_intention` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '其他意向',
  `clue_id` int DEFAULT NULL COMMENT '线索ID',
  PRIMARY KEY (`business_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin COMMENT='线索';



# Dump of table tienchin_channel
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tienchin_channel`;

CREATE TABLE `tienchin_channel` (
  `channel_id` int unsigned NOT NULL AUTO_INCREMENT,
  `channel_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '渠道名称',
  `status` int DEFAULT '0' COMMENT '渠道状态 0可用；1禁用',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `type` int DEFAULT NULL COMMENT '渠道类型 1 线上渠道 2 线下渠道',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `del_flag` int DEFAULT NULL,
  PRIMARY KEY (`channel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `tienchin_channel` WRITE;
/*!40000 ALTER TABLE `tienchin_channel` DISABLE KEYS */;

INSERT INTO `tienchin_channel` (`channel_id`, `channel_name`, `status`, `remark`, `type`, `create_time`, `update_time`, `create_by`, `update_by`, `del_flag`)
VALUES
	(1,'百度搜索',1,'aaaaa',2,'2022-04-23 15:12:13','2023-01-17 00:32:12','admin','admin',0),
	(2,'抖音短视频',0,'无',1,'2022-04-23 15:12:13','2022-04-23 15:12:23','admin','admin',0),
	(3,'线下地推',0,'无',2,'2022-04-23 15:12:13','2022-04-23 15:12:23','admin','admin',0),
	(4,'KOL渠道',0,'无',2,'2022-04-23 15:12:13','2022-04-23 15:12:23','admin','admin',0),
	(5,'公众号推广',0,'无',1,NULL,'2022-04-23 15:43:25','admin','admin',0),
	(6,'小程序推广',0,'哈哈',1,'2022-04-23 15:32:37','2022-04-23 15:43:11','admin','admin',0),
	(13,'2',0,'2',2,'2022-04-23 16:03:40','2022-04-23 16:05:55','javaboy','javaboy',0),
	(19,'d',0,'d',1,'2022-04-28 23:02:44','2022-04-28 23:02:49','admin','admin',0);

/*!40000 ALTER TABLE `tienchin_channel` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table tienchin_clue
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tienchin_clue`;

CREATE TABLE `tienchin_clue` (
  `clue_id` bigint NOT NULL AUTO_INCREMENT COMMENT '线索id',
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '客户姓名',
  `channel_id` int DEFAULT NULL COMMENT '渠道',
  `activity_id` int DEFAULT NULL COMMENT '活动',
  `gender` int DEFAULT NULL COMMENT '0 男 1 女',
  `age` int DEFAULT NULL COMMENT '年龄',
  `weixin` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '微信',
  `qq` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'qq',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '手机号',
  `level` int DEFAULT NULL COMMENT '客户意向等级 1 近期报名 2 打算报名，考虑中 3 了解一下 4 打酱油',
  `subject` int DEFAULT NULL COMMENT '意向私教课程',
  `status` int DEFAULT '1' COMMENT '状态(已分配1  进行中2  回收3  伪线索4)',
  `fail_count` int DEFAULT '0' COMMENT '伪线索失败次数(最大数3次)',
  `next_time` datetime DEFAULT NULL COMMENT '下次跟进时间',
  `transfer` tinyint(1) DEFAULT '0' COMMENT '是否转派',
  `end_time` datetime DEFAULT NULL COMMENT '线索失效时间',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '更新人',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `del_flag` int DEFAULT '0',
  PRIMARY KEY (`clue_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin COMMENT='线索';

LOCK TABLES `tienchin_clue` WRITE;
/*!40000 ALTER TABLE `tienchin_clue` DISABLE KEYS */;

INSERT INTO `tienchin_clue` (`clue_id`, `name`, `channel_id`, `activity_id`, `gender`, `age`, `weixin`, `qq`, `phone`, `level`, `subject`, `status`, `fail_count`, `next_time`, `transfer`, `end_time`, `create_time`, `create_by`, `update_time`, `update_by`, `remark`, `del_flag`)
VALUES
	(23,X'E5BCA0E4B889313233666666',3,5,0,30,NULL,NULL,X'3133313131313131313131',NULL,NULL,2,2,'2023-01-18 19:55:04',0,NULL,'2023-01-17 19:55:04',X'61646D696E','2023-02-04 11:45:43',NULL,NULL,0),
	(24,X'E9878CE696AF',2,4,1,27,X'61616161616161',X'3131313131',X'3138313131313131313131',1,2,4,3,'2023-01-20 04:14:14',0,NULL,'2023-01-18 16:14:14',X'61646D696E','2023-01-19 14:34:37',NULL,NULL,0);

/*!40000 ALTER TABLE `tienchin_clue` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table tienchin_course
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tienchin_course`;

CREATE TABLE `tienchin_course` (
  `course_id` int NOT NULL AUTO_INCREMENT COMMENT '课程id',
  `type` int DEFAULT NULL COMMENT '课程类型 1 舞蹈类 2 游泳类 3 拳击类',
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '课程名称',
  `price` double DEFAULT NULL COMMENT '价格',
  `apply_to` int DEFAULT NULL COMMENT '适用人群',
  `info` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '课程描述信息',
  `subject` char(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '课程归类',
  `create_time` timestamp NULL DEFAULT NULL,
  `create_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `update_time` timestamp NULL DEFAULT NULL,
  `update_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `del_flag` tinyint NOT NULL DEFAULT '0' COMMENT '是否删除 1 是',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin COMMENT='课程管理';

LOCK TABLES `tienchin_course` WRITE;
/*!40000 ALTER TABLE `tienchin_course` DISABLE KEYS */;

INSERT INTO `tienchin_course` (`course_id`, `type`, `name`, `price`, `apply_to`, `info`, `subject`, `create_time`, `create_by`, `update_time`, `update_by`, `del_flag`, `remark`)
VALUES
	(1,1,X'E6B091E6978FE8889EE585A5E997A8',999,2,X'E59294E58FBDE68993E58DA1E889B0E88BA6E5A58BE69697',NULL,'2023-01-17 00:53:55',X'61646D696E','2023-01-17 00:54:03',X'61646D696E',0,NULL);

/*!40000 ALTER TABLE `tienchin_course` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table tienchin_follow_record
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tienchin_follow_record`;

CREATE TABLE `tienchin_follow_record` (
  `record_id` int unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint DEFAULT NULL COMMENT '线索还是商机',
  `assign_id` bigint DEFAULT NULL COMMENT '线索/商机的id',
  `info` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '跟进记录',
  `create_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '跟进人',
  `create_time` datetime DEFAULT NULL COMMENT '跟进时间',
  `update_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `tienchin_follow_record` WRITE;
/*!40000 ALTER TABLE `tienchin_follow_record` DISABLE KEYS */;

INSERT INTO `tienchin_follow_record` (`record_id`, `type`, `assign_id`, `info`, `create_by`, `create_time`, `update_by`, `update_time`)
VALUES
	(10,0,24,'意向强烈，继续跟进','admin','2023-01-19 13:42:13',NULL,NULL),
	(11,0,24,'ffffffff','admin','2023-01-19 13:47:13',NULL,NULL),
	(12,0,24,'空号:ddddd','admin','2023-01-19 15:36:36',NULL,NULL),
	(13,0,24,'其他:啊啊啊啊','admin','2023-01-19 15:37:40',NULL,NULL),
	(14,0,24,'无法联系:undefined','admin','2023-01-19 19:27:00',NULL,NULL),
	(15,0,23,NULL,'admin','2023-01-19 19:30:41',NULL,NULL),
	(16,0,23,'无法联系:','admin','2023-01-19 19:31:21',NULL,NULL),
	(17,0,23,'无法联系:','admin','2023-01-19 19:38:40',NULL,NULL),
	(18,0,23,'ffff','admin','2023-02-04 19:45:44',NULL,NULL);

/*!40000 ALTER TABLE `tienchin_follow_record` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
