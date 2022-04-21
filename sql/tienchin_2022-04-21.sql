# ************************************************************
# Sequel Pro SQL dump
# Version 5446
#
# https://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.26)
# Database: tienchin
# Generation Time: 2022-04-21 15:01:32 +0000
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
	(28,2,'失败','1','sys_common_status','','danger','N','0','admin','2022-04-21 19:29:25','',NULL,'停用状态');

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
	(10,'系统状态','sys_common_status','0','admin','2022-04-21 19:29:25','',NULL,'登录状态列表');

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
	(102,'admin','127.0.0.1','内网IP','Chrome 10','Mac OS X','0','登录成功','2022-04-21 22:06:28');

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
	(1,'系统管理',0,8,'system',NULL,'',1,0,'M','0','0','','system','admin','2022-04-21 22:40:25','','2022-04-21 22:40:44','系统管理目录'),
	(2,'系统监控',1,10,'monitor',NULL,'',1,0,'M','0','0','','monitor','admin','2022-04-21 22:40:25','admin','2022-04-21 22:40:44','系统监控目录'),
	(3,'系统工具',1,11,'tool',NULL,'',1,0,'M','0','0','','tool','admin','2022-04-21 22:40:25','admin','2022-04-21 22:40:44','系统工具目录'),
	(4,'天勤官网',0,9,'http://tienchin.vip',NULL,'',0,0,'M','0','0','','guide','admin','2022-04-21 22:40:25','','2022-04-21 22:40:44','TienChin官网地址'),
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
	(3026,'活动管理通过',2003,6,'',NULL,NULL,1,0,'F','0','0','tienchin:activity:pass','#','admin','2022-04-21 22:40:25','admin','2022-04-21 22:40:44',''),
	(3027,'活动管理驳回',2003,7,'',NULL,NULL,1,0,'F','0','0','tienchin:activity:reject','#','admin','2022-04-21 22:40:25','','2022-04-21 22:40:44',''),
	(3028,'课程管理查询',2004,1,'#','',NULL,1,0,'F','0','0','tienchin:course:query','#','admin','2022-04-21 22:40:25','','2022-04-21 22:40:44',''),
	(3029,'课程管理新增',2004,2,'#','',NULL,1,0,'F','0','0','tienchin:course:add','#','admin','2022-04-21 22:40:25','','2022-04-21 22:40:44',''),
	(3030,'课程管理修改',2004,3,'#','',NULL,1,0,'F','0','0','tienchin:course:edit','#','admin','2022-04-21 22:40:25','','2022-04-21 22:40:44',''),
	(3031,'课程管理删除',2004,4,'#','',NULL,1,0,'F','0','0','tienchin:course:remove','#','admin','2022-04-21 22:40:25','','2022-04-21 22:40:44',''),
	(3032,'课程管理导出',2004,5,'#','',NULL,1,0,'F','0','0','tienchin:course:export','#','admin','2022-04-21 22:40:25','','2022-04-21 22:40:44',''),
	(3033,'线索管理查询',2005,1,'#','',NULL,1,0,'F','0','0','tienchin:clue:query','#','admin','2022-04-21 22:40:25','','2022-04-21 22:40:44',''),
	(3034,'线索管理新增',2005,2,'#','',NULL,1,0,'F','0','0','tienchin:clue:add','#','admin','2022-04-21 22:40:25','','2022-04-21 22:40:44',''),
	(3035,'线索管理跟进',2005,3,'#','',NULL,1,0,'F','0','0','tienchin:record:add','#','admin','2022-04-21 22:40:25','admin','2022-04-21 22:40:44',''),
	(3036,'线索管理删除',2005,4,'#','',NULL,1,0,'F','0','0','tienchin:clue:remove','#','admin','2022-04-21 22:40:25','','2022-04-21 22:40:44',''),
	(3037,'线索管理查看',2005,6,'',NULL,NULL,1,0,'F','0','0','tienchin:clue:info','#','admin','2022-04-21 22:40:25','','2022-04-21 22:40:44',''),
	(3038,'线索管理分配',2005,7,'',NULL,NULL,1,0,'F','0','0','tienchin:clue:assignment','#','admin','2022-04-21 22:40:25','admin','2022-04-21 22:40:44',''),
	(3039,'线索池',2005,8,'',NULL,NULL,1,0,'F','0','0','tienchin:clue:pool','#','admin','2022-04-21 22:40:25','admin','2022-04-21 22:40:44',''),
	(3040,'线索跟进记录',2005,9,'',NULL,NULL,1,0,'F','0','0','tienchin:record:list','#','admin','2022-04-21 22:40:25','','2022-04-21 22:40:44',''),
	(3041,'线索管理批量添加',2005,10,'',NULL,NULL,1,0,'F','0','0','tienchin:clue:batchAdd','#','admin','2022-04-21 22:40:25','admin','2022-04-21 22:40:44',''),
	(3042,'线索捞取',2005,11,'clues:clue:gain',NULL,NULL,1,0,'F','0','0','tienchin:clue:gain','#','admin','2022-04-21 22:40:25','admin','2022-04-21 22:40:44',''),
	(3043,'首页基础数据查询',0,10,'',NULL,NULL,1,0,'F','1','0','indexHome:baseQuery','#','admin','2022-04-21 22:40:25','','2022-04-21 22:40:44',''),
	(3044,'首页今日简报',0,11,'',NULL,NULL,1,0,'F','1','0','indexHome:todayQuery','#','admin','2022-04-21 22:40:25','','2022-04-21 22:40:44',''),
	(3045,'首页待办',0,12,'',NULL,NULL,1,0,'F','1','0','indexHome:todoQuery','#','admin','2022-04-21 22:40:25','','2022-04-21 22:40:44',''),
	(3046,'首页漏斗图',0,13,'',NULL,NULL,1,0,'F','1','0','indexHome:funnelQuery','#','admin','2022-04-21 22:40:25','','2022-04-21 22:40:44',''),
	(3047,'首页销售龙虎榜',0,14,'',NULL,NULL,1,0,'F','1','0','indexHome:saleQuery','#','admin','2022-04-21 22:40:25','','2022-04-21 22:40:44',''),
	(3048,'首页商机龙虎榜',0,15,'',NULL,NULL,1,0,'F','1','0','indexHome:businessQuery','#','admin','2022-04-21 22:40:25','','2022-04-21 22:40:44','');

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
	(113,'菜单管理',2,'org.javaboy.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"icon\":\"chart\",\"orderNum\":6,\"menuName\":\"统计分析\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"analysis\",\"component\":\"tienchin/analysis/index\",\"children\":[],\"createTime\":1618438016000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2006,\"menuType\":\"C\",\"perms\":\"tienchin:analysis:list\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-04-21 22:18:00');

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
	(2,'普通角色','common',2,'2',1,1,'0','0','admin','2022-04-21 19:29:24','',NULL,'普通角色');

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
	(2,1060);

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
	(1,103,'admin','TienChin','00','ry@163.com','15888888888','1','','$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2','0','0','127.0.0.1','2022-04-21 22:06:29','admin','2022-04-21 19:29:24','','2022-04-21 22:06:28','管理员'),
	(2,105,'ry','TienChin','00','ry@qq.com','15666666666','1','','$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2','0','0','127.0.0.1','2022-04-21 19:29:24','admin','2022-04-21 19:29:24','',NULL,'测试员');

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
	(2,2);

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
	(2,2);

/*!40000 ALTER TABLE `sys_user_role` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
