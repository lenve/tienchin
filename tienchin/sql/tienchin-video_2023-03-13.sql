# ************************************************************
# Sequel Pro SQL dump
# Version 5446
#
# https://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 8.0.27)
# Database: tienchin-video
# Generation Time: 2023-03-13 13:01:57 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
SET NAMES utf8mb4;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table ACT_APP_APPDEF
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ACT_APP_APPDEF`;

CREATE TABLE `ACT_APP_APPDEF` (
  `ID_` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `REV_` int NOT NULL,
  `NAME_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `VERSION_` int NOT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `RESOURCE_NAME_` varchar(4000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_IDX_APP_DEF_UNIQ` (`KEY_`,`VERSION_`,`TENANT_ID_`),
  KEY `ACT_IDX_APP_DEF_DPLY` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_APP_DEF_DPLY` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `ACT_APP_DEPLOYMENT` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table ACT_APP_DATABASECHANGELOG
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ACT_APP_DATABASECHANGELOG`;

CREATE TABLE `ACT_APP_DATABASECHANGELOG` (
  `ID` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `AUTHOR` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `FILENAME` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `ORDEREXECUTED` int NOT NULL,
  `EXECTYPE` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `MD5SUM` varchar(35) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `COMMENTS` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TAG` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LIQUIBASE` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CONTEXTS` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LABELS` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `ACT_APP_DATABASECHANGELOG` WRITE;
/*!40000 ALTER TABLE `ACT_APP_DATABASECHANGELOG` DISABLE KEYS */;

INSERT INTO `ACT_APP_DATABASECHANGELOG` (`ID`, `AUTHOR`, `FILENAME`, `DATEEXECUTED`, `ORDEREXECUTED`, `EXECTYPE`, `MD5SUM`, `DESCRIPTION`, `COMMENTS`, `TAG`, `LIQUIBASE`, `CONTEXTS`, `LABELS`, `DEPLOYMENT_ID`)
VALUES
	('1','flowable','org/flowable/app/db/liquibase/flowable-app-db-changelog.xml','2023-02-26 08:02:53',1,'EXECUTED','8:496fc778bdf2ab13f2e1926d0e63e0a2','createTable tableName=ACT_APP_DEPLOYMENT; createTable tableName=ACT_APP_DEPLOYMENT_RESOURCE; addForeignKeyConstraint baseTableName=ACT_APP_DEPLOYMENT_RESOURCE, constraintName=ACT_FK_APP_RSRC_DPL, referencedTableName=ACT_APP_DEPLOYMENT; createIndex...','',NULL,'4.3.5',NULL,NULL,'7398572907'),
	('2','flowable','org/flowable/app/db/liquibase/flowable-app-db-changelog.xml','2023-02-26 08:02:53',2,'EXECUTED','8:ccea9ebfb6c1f8367ca4dd473fcbb7db','modifyDataType columnName=DEPLOY_TIME_, tableName=ACT_APP_DEPLOYMENT','',NULL,'4.3.5',NULL,NULL,'7398572907'),
	('3','flowable','org/flowable/app/db/liquibase/flowable-app-db-changelog.xml','2023-02-26 08:02:53',3,'EXECUTED','8:f1f8aff320aade831944ebad24355f3d','createIndex indexName=ACT_IDX_APP_DEF_UNIQ, tableName=ACT_APP_APPDEF','',NULL,'4.3.5',NULL,NULL,'7398572907');

/*!40000 ALTER TABLE `ACT_APP_DATABASECHANGELOG` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table ACT_APP_DATABASECHANGELOGLOCK
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ACT_APP_DATABASECHANGELOGLOCK`;

CREATE TABLE `ACT_APP_DATABASECHANGELOGLOCK` (
  `ID` int NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime DEFAULT NULL,
  `LOCKEDBY` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `ACT_APP_DATABASECHANGELOGLOCK` WRITE;
/*!40000 ALTER TABLE `ACT_APP_DATABASECHANGELOGLOCK` DISABLE KEYS */;

INSERT INTO `ACT_APP_DATABASECHANGELOGLOCK` (`ID`, `LOCKED`, `LOCKGRANTED`, `LOCKEDBY`)
VALUES
	(1,b'0',NULL,NULL);

/*!40000 ALTER TABLE `ACT_APP_DATABASECHANGELOGLOCK` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table ACT_APP_DEPLOYMENT
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ACT_APP_DEPLOYMENT`;

CREATE TABLE `ACT_APP_DEPLOYMENT` (
  `ID_` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `NAME_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DEPLOY_TIME_` datetime(3) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table ACT_APP_DEPLOYMENT_RESOURCE
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ACT_APP_DEPLOYMENT_RESOURCE`;

CREATE TABLE `ACT_APP_DEPLOYMENT_RESOURCE` (
  `ID_` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `NAME_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `RESOURCE_BYTES_` longblob,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_APP_RSRC_DPL` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_APP_RSRC_DPL` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `ACT_APP_DEPLOYMENT` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table ACT_CMMN_CASEDEF
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ACT_CMMN_CASEDEF`;

CREATE TABLE `ACT_CMMN_CASEDEF` (
  `ID_` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `REV_` int NOT NULL,
  `NAME_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `VERSION_` int NOT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `RESOURCE_NAME_` varchar(4000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `HAS_GRAPHICAL_NOTATION_` bit(1) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `DGRM_RESOURCE_NAME_` varchar(4000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `HAS_START_FORM_KEY_` bit(1) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_IDX_CASE_DEF_UNIQ` (`KEY_`,`VERSION_`,`TENANT_ID_`),
  KEY `ACT_IDX_CASE_DEF_DPLY` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_CASE_DEF_DPLY` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `ACT_CMMN_DEPLOYMENT` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table ACT_CMMN_DATABASECHANGELOG
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ACT_CMMN_DATABASECHANGELOG`;

CREATE TABLE `ACT_CMMN_DATABASECHANGELOG` (
  `ID` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `AUTHOR` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `FILENAME` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `ORDEREXECUTED` int NOT NULL,
  `EXECTYPE` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `MD5SUM` varchar(35) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `COMMENTS` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TAG` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LIQUIBASE` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CONTEXTS` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LABELS` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `ACT_CMMN_DATABASECHANGELOG` WRITE;
/*!40000 ALTER TABLE `ACT_CMMN_DATABASECHANGELOG` DISABLE KEYS */;

INSERT INTO `ACT_CMMN_DATABASECHANGELOG` (`ID`, `AUTHOR`, `FILENAME`, `DATEEXECUTED`, `ORDEREXECUTED`, `EXECTYPE`, `MD5SUM`, `DESCRIPTION`, `COMMENTS`, `TAG`, `LIQUIBASE`, `CONTEXTS`, `LABELS`, `DEPLOYMENT_ID`)
VALUES
	('1','flowable','org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml','2023-02-26 08:02:50',1,'EXECUTED','8:8b4b922d90b05ff27483abefc9597aa6','createTable tableName=ACT_CMMN_DEPLOYMENT; createTable tableName=ACT_CMMN_DEPLOYMENT_RESOURCE; addForeignKeyConstraint baseTableName=ACT_CMMN_DEPLOYMENT_RESOURCE, constraintName=ACT_FK_CMMN_RSRC_DPL, referencedTableName=ACT_CMMN_DEPLOYMENT; create...','',NULL,'4.3.5',NULL,NULL,'7398569158'),
	('2','flowable','org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml','2023-02-26 08:02:50',2,'EXECUTED','8:65e39b3d385706bb261cbeffe7533cbe','addColumn tableName=ACT_CMMN_CASEDEF; addColumn tableName=ACT_CMMN_DEPLOYMENT_RESOURCE; addColumn tableName=ACT_CMMN_RU_CASE_INST; addColumn tableName=ACT_CMMN_RU_PLAN_ITEM_INST','',NULL,'4.3.5',NULL,NULL,'7398569158'),
	('3','flowable','org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml','2023-02-26 08:02:50',3,'EXECUTED','8:c01f6e802b49436b4489040da3012359','addColumn tableName=ACT_CMMN_RU_PLAN_ITEM_INST; addColumn tableName=ACT_CMMN_RU_CASE_INST; createIndex indexName=ACT_IDX_PLAN_ITEM_STAGE_INST, tableName=ACT_CMMN_RU_PLAN_ITEM_INST; addColumn tableName=ACT_CMMN_RU_PLAN_ITEM_INST; addColumn tableNam...','',NULL,'4.3.5',NULL,NULL,'7398569158'),
	('4','flowable','org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml','2023-02-26 08:02:50',4,'EXECUTED','8:e40d29cb79345b7fb5afd38a7f0ba8fc','createTable tableName=ACT_CMMN_HI_PLAN_ITEM_INST; addColumn tableName=ACT_CMMN_RU_MIL_INST; addColumn tableName=ACT_CMMN_HI_MIL_INST','',NULL,'4.3.5',NULL,NULL,'7398569158'),
	('5','flowable','org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml','2023-02-26 08:02:51',5,'EXECUTED','8:70349de472f87368dcdec971a10311a0','modifyDataType columnName=DEPLOY_TIME_, tableName=ACT_CMMN_DEPLOYMENT; modifyDataType columnName=START_TIME_, tableName=ACT_CMMN_RU_CASE_INST; modifyDataType columnName=START_TIME_, tableName=ACT_CMMN_RU_PLAN_ITEM_INST; modifyDataType columnName=T...','',NULL,'4.3.5',NULL,NULL,'7398569158'),
	('6','flowable','org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml','2023-02-26 08:02:52',6,'EXECUTED','8:10e82e26a7fee94c32a92099c059c18c','createIndex indexName=ACT_IDX_CASE_DEF_UNIQ, tableName=ACT_CMMN_CASEDEF','',NULL,'4.3.5',NULL,NULL,'7398569158'),
	('7','flowable','org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml','2023-02-26 08:02:52',7,'EXECUTED','8:530bc81a1e30618ccf4a2da1f7c6c043','renameColumn newColumnName=CREATE_TIME_, oldColumnName=START_TIME_, tableName=ACT_CMMN_RU_PLAN_ITEM_INST; renameColumn newColumnName=CREATE_TIME_, oldColumnName=CREATED_TIME_, tableName=ACT_CMMN_HI_PLAN_ITEM_INST; addColumn tableName=ACT_CMMN_RU_P...','',NULL,'4.3.5',NULL,NULL,'7398569158'),
	('8','flowable','org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml','2023-02-26 08:02:52',8,'EXECUTED','8:e8c2eb1ce28bc301efe07e0e29757781','addColumn tableName=ACT_CMMN_HI_PLAN_ITEM_INST','',NULL,'4.3.5',NULL,NULL,'7398569158'),
	('9','flowable','org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml','2023-02-26 08:02:52',9,'EXECUTED','8:4cb4782b9bdec5ced2a64c525aa7b3a0','addColumn tableName=ACT_CMMN_RU_PLAN_ITEM_INST; addColumn tableName=ACT_CMMN_HI_PLAN_ITEM_INST','',NULL,'4.3.5',NULL,NULL,'7398569158'),
	('10','flowable','org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml','2023-02-26 08:02:52',10,'EXECUTED','8:341c16be247f5d17badc9809da8691f9','addColumn tableName=ACT_CMMN_RU_CASE_INST; addColumn tableName=ACT_CMMN_RU_CASE_INST; createIndex indexName=ACT_IDX_CASE_INST_REF_ID_, tableName=ACT_CMMN_RU_CASE_INST; addColumn tableName=ACT_CMMN_HI_CASE_INST; addColumn tableName=ACT_CMMN_HI_CASE...','',NULL,'4.3.5',NULL,NULL,'7398569158'),
	('11','flowable','org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml','2023-02-26 08:02:52',11,'EXECUTED','8:d7c4da9276bcfffbfb0ebfb25e3f7b05','addColumn tableName=ACT_CMMN_RU_PLAN_ITEM_INST; addColumn tableName=ACT_CMMN_HI_PLAN_ITEM_INST','',NULL,'4.3.5',NULL,NULL,'7398569158'),
	('12','flowable','org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml','2023-02-26 08:02:52',12,'EXECUTED','8:adf4ecc45f2aa9a44a5626b02e1d6f98','addColumn tableName=ACT_CMMN_RU_CASE_INST','',NULL,'4.3.5',NULL,NULL,'7398569158'),
	('13','flowable','org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml','2023-02-26 08:02:52',13,'EXECUTED','8:7550626f964ab5518464709408333ec1','addColumn tableName=ACT_CMMN_RU_PLAN_ITEM_INST; addColumn tableName=ACT_CMMN_HI_PLAN_ITEM_INST','',NULL,'4.3.5',NULL,NULL,'7398569158'),
	('14','flowable','org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml','2023-02-26 08:02:52',14,'EXECUTED','8:086b40b3a05596dcc8a8d7479922d494','addColumn tableName=ACT_CMMN_RU_CASE_INST; addColumn tableName=ACT_CMMN_HI_CASE_INST','',NULL,'4.3.5',NULL,NULL,'7398569158'),
	('16','flowable','org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml','2023-02-26 08:02:52',15,'EXECUTED','8:a697a222ddd99dd15b36516a252f1c63','addColumn tableName=ACT_CMMN_RU_CASE_INST; addColumn tableName=ACT_CMMN_HI_CASE_INST','',NULL,'4.3.5',NULL,NULL,'7398569158');

/*!40000 ALTER TABLE `ACT_CMMN_DATABASECHANGELOG` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table ACT_CMMN_DATABASECHANGELOGLOCK
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ACT_CMMN_DATABASECHANGELOGLOCK`;

CREATE TABLE `ACT_CMMN_DATABASECHANGELOGLOCK` (
  `ID` int NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime DEFAULT NULL,
  `LOCKEDBY` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `ACT_CMMN_DATABASECHANGELOGLOCK` WRITE;
/*!40000 ALTER TABLE `ACT_CMMN_DATABASECHANGELOGLOCK` DISABLE KEYS */;

INSERT INTO `ACT_CMMN_DATABASECHANGELOGLOCK` (`ID`, `LOCKED`, `LOCKGRANTED`, `LOCKEDBY`)
VALUES
	(1,b'0',NULL,NULL);

/*!40000 ALTER TABLE `ACT_CMMN_DATABASECHANGELOGLOCK` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table ACT_CMMN_DEPLOYMENT
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ACT_CMMN_DEPLOYMENT`;

CREATE TABLE `ACT_CMMN_DEPLOYMENT` (
  `ID_` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `NAME_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DEPLOY_TIME_` datetime(3) DEFAULT NULL,
  `PARENT_DEPLOYMENT_ID_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table ACT_CMMN_DEPLOYMENT_RESOURCE
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ACT_CMMN_DEPLOYMENT_RESOURCE`;

CREATE TABLE `ACT_CMMN_DEPLOYMENT_RESOURCE` (
  `ID_` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `NAME_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `RESOURCE_BYTES_` longblob,
  `GENERATED_` bit(1) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_CMMN_RSRC_DPL` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_CMMN_RSRC_DPL` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `ACT_CMMN_DEPLOYMENT` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table ACT_CMMN_HI_CASE_INST
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ACT_CMMN_HI_CASE_INST`;

CREATE TABLE `ACT_CMMN_HI_CASE_INST` (
  `ID_` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `REV_` int NOT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PARENT_ID_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CASE_DEF_ID_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `STATE_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `START_TIME_` datetime(3) DEFAULT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `START_USER_ID_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CALLBACK_ID_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CALLBACK_TYPE_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `REFERENCE_ID_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REFERENCE_TYPE_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LAST_REACTIVATION_TIME_` datetime(3) DEFAULT NULL,
  `LAST_REACTIVATION_USER_ID_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `BUSINESS_STATUS_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table ACT_CMMN_HI_MIL_INST
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ACT_CMMN_HI_MIL_INST`;

CREATE TABLE `ACT_CMMN_HI_MIL_INST` (
  `ID_` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `REV_` int NOT NULL,
  `NAME_` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `TIME_STAMP_` datetime(3) DEFAULT NULL,
  `CASE_INST_ID_` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CASE_DEF_ID_` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ELEMENT_ID_` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table ACT_CMMN_HI_PLAN_ITEM_INST
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ACT_CMMN_HI_PLAN_ITEM_INST`;

CREATE TABLE `ACT_CMMN_HI_PLAN_ITEM_INST` (
  `ID_` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `REV_` int NOT NULL,
  `NAME_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `STATE_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CASE_DEF_ID_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CASE_INST_ID_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `STAGE_INST_ID_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `IS_STAGE_` bit(1) DEFAULT NULL,
  `ELEMENT_ID_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ITEM_DEFINITION_ID_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ITEM_DEFINITION_TYPE_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CREATE_TIME_` datetime(3) DEFAULT NULL,
  `LAST_AVAILABLE_TIME_` datetime(3) DEFAULT NULL,
  `LAST_ENABLED_TIME_` datetime(3) DEFAULT NULL,
  `LAST_DISABLED_TIME_` datetime(3) DEFAULT NULL,
  `LAST_STARTED_TIME_` datetime(3) DEFAULT NULL,
  `LAST_SUSPENDED_TIME_` datetime(3) DEFAULT NULL,
  `COMPLETED_TIME_` datetime(3) DEFAULT NULL,
  `OCCURRED_TIME_` datetime(3) DEFAULT NULL,
  `TERMINATED_TIME_` datetime(3) DEFAULT NULL,
  `EXIT_TIME_` datetime(3) DEFAULT NULL,
  `ENDED_TIME_` datetime(3) DEFAULT NULL,
  `LAST_UPDATED_TIME_` datetime(3) DEFAULT NULL,
  `START_USER_ID_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REFERENCE_ID_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REFERENCE_TYPE_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `ENTRY_CRITERION_ID_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EXIT_CRITERION_ID_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SHOW_IN_OVERVIEW_` bit(1) DEFAULT NULL,
  `EXTRA_VALUE_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DERIVED_CASE_DEF_ID_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LAST_UNAVAILABLE_TIME_` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table ACT_CMMN_RU_CASE_INST
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ACT_CMMN_RU_CASE_INST`;

CREATE TABLE `ACT_CMMN_RU_CASE_INST` (
  `ID_` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `REV_` int NOT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PARENT_ID_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CASE_DEF_ID_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `STATE_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `START_TIME_` datetime(3) DEFAULT NULL,
  `START_USER_ID_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CALLBACK_ID_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CALLBACK_TYPE_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `LOCK_TIME_` datetime(3) DEFAULT NULL,
  `IS_COMPLETEABLE_` bit(1) DEFAULT NULL,
  `REFERENCE_ID_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REFERENCE_TYPE_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LAST_REACTIVATION_TIME_` datetime(3) DEFAULT NULL,
  `LAST_REACTIVATION_USER_ID_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `BUSINESS_STATUS_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_CASE_INST_CASE_DEF` (`CASE_DEF_ID_`),
  KEY `ACT_IDX_CASE_INST_PARENT` (`PARENT_ID_`),
  KEY `ACT_IDX_CASE_INST_REF_ID_` (`REFERENCE_ID_`),
  CONSTRAINT `ACT_FK_CASE_INST_CASE_DEF` FOREIGN KEY (`CASE_DEF_ID_`) REFERENCES `ACT_CMMN_CASEDEF` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table ACT_CMMN_RU_MIL_INST
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ACT_CMMN_RU_MIL_INST`;

CREATE TABLE `ACT_CMMN_RU_MIL_INST` (
  `ID_` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `NAME_` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `TIME_STAMP_` datetime(3) DEFAULT NULL,
  `CASE_INST_ID_` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CASE_DEF_ID_` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ELEMENT_ID_` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_MIL_CASE_DEF` (`CASE_DEF_ID_`),
  KEY `ACT_IDX_MIL_CASE_INST` (`CASE_INST_ID_`),
  CONSTRAINT `ACT_FK_MIL_CASE_DEF` FOREIGN KEY (`CASE_DEF_ID_`) REFERENCES `ACT_CMMN_CASEDEF` (`ID_`),
  CONSTRAINT `ACT_FK_MIL_CASE_INST` FOREIGN KEY (`CASE_INST_ID_`) REFERENCES `ACT_CMMN_RU_CASE_INST` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table ACT_CMMN_RU_PLAN_ITEM_INST
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ACT_CMMN_RU_PLAN_ITEM_INST`;

CREATE TABLE `ACT_CMMN_RU_PLAN_ITEM_INST` (
  `ID_` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `REV_` int NOT NULL,
  `CASE_DEF_ID_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CASE_INST_ID_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `STAGE_INST_ID_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `IS_STAGE_` bit(1) DEFAULT NULL,
  `ELEMENT_ID_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `STATE_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CREATE_TIME_` datetime(3) DEFAULT NULL,
  `START_USER_ID_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REFERENCE_ID_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REFERENCE_TYPE_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `ITEM_DEFINITION_ID_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ITEM_DEFINITION_TYPE_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `IS_COMPLETEABLE_` bit(1) DEFAULT NULL,
  `IS_COUNT_ENABLED_` bit(1) DEFAULT NULL,
  `VAR_COUNT_` int DEFAULT NULL,
  `SENTRY_PART_INST_COUNT_` int DEFAULT NULL,
  `LAST_AVAILABLE_TIME_` datetime(3) DEFAULT NULL,
  `LAST_ENABLED_TIME_` datetime(3) DEFAULT NULL,
  `LAST_DISABLED_TIME_` datetime(3) DEFAULT NULL,
  `LAST_STARTED_TIME_` datetime(3) DEFAULT NULL,
  `LAST_SUSPENDED_TIME_` datetime(3) DEFAULT NULL,
  `COMPLETED_TIME_` datetime(3) DEFAULT NULL,
  `OCCURRED_TIME_` datetime(3) DEFAULT NULL,
  `TERMINATED_TIME_` datetime(3) DEFAULT NULL,
  `EXIT_TIME_` datetime(3) DEFAULT NULL,
  `ENDED_TIME_` datetime(3) DEFAULT NULL,
  `ENTRY_CRITERION_ID_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EXIT_CRITERION_ID_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EXTRA_VALUE_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DERIVED_CASE_DEF_ID_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LAST_UNAVAILABLE_TIME_` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_PLAN_ITEM_CASE_DEF` (`CASE_DEF_ID_`),
  KEY `ACT_IDX_PLAN_ITEM_CASE_INST` (`CASE_INST_ID_`),
  KEY `ACT_IDX_PLAN_ITEM_STAGE_INST` (`STAGE_INST_ID_`),
  CONSTRAINT `ACT_FK_PLAN_ITEM_CASE_DEF` FOREIGN KEY (`CASE_DEF_ID_`) REFERENCES `ACT_CMMN_CASEDEF` (`ID_`),
  CONSTRAINT `ACT_FK_PLAN_ITEM_CASE_INST` FOREIGN KEY (`CASE_INST_ID_`) REFERENCES `ACT_CMMN_RU_CASE_INST` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table ACT_CMMN_RU_SENTRY_PART_INST
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ACT_CMMN_RU_SENTRY_PART_INST`;

CREATE TABLE `ACT_CMMN_RU_SENTRY_PART_INST` (
  `ID_` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `REV_` int NOT NULL,
  `CASE_DEF_ID_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CASE_INST_ID_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PLAN_ITEM_INST_ID_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ON_PART_ID_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `IF_PART_ID_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TIME_STAMP_` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_SENTRY_CASE_DEF` (`CASE_DEF_ID_`),
  KEY `ACT_IDX_SENTRY_CASE_INST` (`CASE_INST_ID_`),
  KEY `ACT_IDX_SENTRY_PLAN_ITEM` (`PLAN_ITEM_INST_ID_`),
  CONSTRAINT `ACT_FK_SENTRY_CASE_DEF` FOREIGN KEY (`CASE_DEF_ID_`) REFERENCES `ACT_CMMN_CASEDEF` (`ID_`),
  CONSTRAINT `ACT_FK_SENTRY_CASE_INST` FOREIGN KEY (`CASE_INST_ID_`) REFERENCES `ACT_CMMN_RU_CASE_INST` (`ID_`),
  CONSTRAINT `ACT_FK_SENTRY_PLAN_ITEM` FOREIGN KEY (`PLAN_ITEM_INST_ID_`) REFERENCES `ACT_CMMN_RU_PLAN_ITEM_INST` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table ACT_CO_CONTENT_ITEM
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ACT_CO_CONTENT_ITEM`;

CREATE TABLE `ACT_CO_CONTENT_ITEM` (
  `ID_` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `NAME_` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `MIME_TYPE_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TASK_ID_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PROC_INST_ID_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CONTENT_STORE_ID_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CONTENT_STORE_NAME_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `FIELD_` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CONTENT_AVAILABLE_` bit(1) DEFAULT b'0',
  `CREATED_` timestamp(6) NULL DEFAULT NULL,
  `CREATED_BY_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LAST_MODIFIED_` timestamp(6) NULL DEFAULT NULL,
  `LAST_MODIFIED_BY_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CONTENT_SIZE_` bigint DEFAULT '0',
  `TENANT_ID_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `idx_contitem_taskid` (`TASK_ID_`),
  KEY `idx_contitem_procid` (`PROC_INST_ID_`),
  KEY `idx_contitem_scope` (`SCOPE_ID_`,`SCOPE_TYPE_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table ACT_CO_DATABASECHANGELOG
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ACT_CO_DATABASECHANGELOG`;

CREATE TABLE `ACT_CO_DATABASECHANGELOG` (
  `ID` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `AUTHOR` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `FILENAME` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `ORDEREXECUTED` int NOT NULL,
  `EXECTYPE` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `MD5SUM` varchar(35) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `COMMENTS` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TAG` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LIQUIBASE` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CONTEXTS` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LABELS` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `ACT_CO_DATABASECHANGELOG` WRITE;
/*!40000 ALTER TABLE `ACT_CO_DATABASECHANGELOG` DISABLE KEYS */;

INSERT INTO `ACT_CO_DATABASECHANGELOG` (`ID`, `AUTHOR`, `FILENAME`, `DATEEXECUTED`, `ORDEREXECUTED`, `EXECTYPE`, `MD5SUM`, `DESCRIPTION`, `COMMENTS`, `TAG`, `LIQUIBASE`, `CONTEXTS`, `LABELS`, `DEPLOYMENT_ID`)
VALUES
	('1','activiti','org/flowable/content/db/liquibase/flowable-content-db-changelog.xml','2023-02-26 08:02:48',1,'EXECUTED','8:7644d7165cfe799200a2abdd3419e8b6','createTable tableName=ACT_CO_CONTENT_ITEM; createIndex indexName=idx_contitem_taskid, tableName=ACT_CO_CONTENT_ITEM; createIndex indexName=idx_contitem_procid, tableName=ACT_CO_CONTENT_ITEM','',NULL,'4.3.5',NULL,NULL,'7398568315'),
	('2','flowable','org/flowable/content/db/liquibase/flowable-content-db-changelog.xml','2023-02-26 08:02:48',2,'EXECUTED','8:fe7b11ac7dbbf9c43006b23bbab60bab','addColumn tableName=ACT_CO_CONTENT_ITEM; createIndex indexName=idx_contitem_scope, tableName=ACT_CO_CONTENT_ITEM','',NULL,'4.3.5',NULL,NULL,'7398568315');

/*!40000 ALTER TABLE `ACT_CO_DATABASECHANGELOG` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table ACT_CO_DATABASECHANGELOGLOCK
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ACT_CO_DATABASECHANGELOGLOCK`;

CREATE TABLE `ACT_CO_DATABASECHANGELOGLOCK` (
  `ID` int NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime DEFAULT NULL,
  `LOCKEDBY` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `ACT_CO_DATABASECHANGELOGLOCK` WRITE;
/*!40000 ALTER TABLE `ACT_CO_DATABASECHANGELOGLOCK` DISABLE KEYS */;

INSERT INTO `ACT_CO_DATABASECHANGELOGLOCK` (`ID`, `LOCKED`, `LOCKGRANTED`, `LOCKEDBY`)
VALUES
	(1,b'0',NULL,NULL);

/*!40000 ALTER TABLE `ACT_CO_DATABASECHANGELOGLOCK` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table ACT_DMN_DATABASECHANGELOG
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ACT_DMN_DATABASECHANGELOG`;

CREATE TABLE `ACT_DMN_DATABASECHANGELOG` (
  `ID` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `AUTHOR` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `FILENAME` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `ORDEREXECUTED` int NOT NULL,
  `EXECTYPE` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `MD5SUM` varchar(35) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `COMMENTS` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TAG` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LIQUIBASE` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CONTEXTS` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LABELS` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `ACT_DMN_DATABASECHANGELOG` WRITE;
/*!40000 ALTER TABLE `ACT_DMN_DATABASECHANGELOG` DISABLE KEYS */;

INSERT INTO `ACT_DMN_DATABASECHANGELOG` (`ID`, `AUTHOR`, `FILENAME`, `DATEEXECUTED`, `ORDEREXECUTED`, `EXECTYPE`, `MD5SUM`, `DESCRIPTION`, `COMMENTS`, `TAG`, `LIQUIBASE`, `CONTEXTS`, `LABELS`, `DEPLOYMENT_ID`)
VALUES
	('1','activiti','org/flowable/dmn/db/liquibase/flowable-dmn-db-changelog.xml','2023-02-26 08:02:46',1,'EXECUTED','8:c8701f1c71018b55029f450b2e9a10a1','createTable tableName=ACT_DMN_DEPLOYMENT; createTable tableName=ACT_DMN_DEPLOYMENT_RESOURCE; createTable tableName=ACT_DMN_DECISION_TABLE','',NULL,'4.3.5',NULL,NULL,'7398566464'),
	('2','flowable','org/flowable/dmn/db/liquibase/flowable-dmn-db-changelog.xml','2023-02-26 08:02:46',2,'EXECUTED','8:47f94b27feb7df8a30d4e338c7bd5fb8','createTable tableName=ACT_DMN_HI_DECISION_EXECUTION','',NULL,'4.3.5',NULL,NULL,'7398566464'),
	('3','flowable','org/flowable/dmn/db/liquibase/flowable-dmn-db-changelog.xml','2023-02-26 08:02:46',3,'EXECUTED','8:ac17eae89fbdccb6e08daf3c7797b579','addColumn tableName=ACT_DMN_HI_DECISION_EXECUTION','',NULL,'4.3.5',NULL,NULL,'7398566464'),
	('4','flowable','org/flowable/dmn/db/liquibase/flowable-dmn-db-changelog.xml','2023-02-26 08:02:46',4,'EXECUTED','8:f73aabc4529e7292c2942073d1cff6f9','dropColumn columnName=PARENT_DEPLOYMENT_ID_, tableName=ACT_DMN_DECISION_TABLE','',NULL,'4.3.5',NULL,NULL,'7398566464'),
	('5','flowable','org/flowable/dmn/db/liquibase/flowable-dmn-db-changelog.xml','2023-02-26 08:02:46',5,'EXECUTED','8:3e03528582dd4eeb4eb41f9b9539140d','modifyDataType columnName=DEPLOY_TIME_, tableName=ACT_DMN_DEPLOYMENT; modifyDataType columnName=START_TIME_, tableName=ACT_DMN_HI_DECISION_EXECUTION; modifyDataType columnName=END_TIME_, tableName=ACT_DMN_HI_DECISION_EXECUTION','',NULL,'4.3.5',NULL,NULL,'7398566464'),
	('6','flowable','org/flowable/dmn/db/liquibase/flowable-dmn-db-changelog.xml','2023-02-26 08:02:47',6,'EXECUTED','8:646c6a061e0b6e8a62e69844ff96abb0','createIndex indexName=ACT_IDX_DEC_TBL_UNIQ, tableName=ACT_DMN_DECISION_TABLE','',NULL,'4.3.5',NULL,NULL,'7398566464'),
	('7','flowable','org/flowable/dmn/db/liquibase/flowable-dmn-db-changelog.xml','2023-02-26 08:02:47',7,'EXECUTED','8:215a499ff7ae77685b55355245b8b708','dropIndex indexName=ACT_IDX_DEC_TBL_UNIQ, tableName=ACT_DMN_DECISION_TABLE; renameTable newTableName=ACT_DMN_DECISION, oldTableName=ACT_DMN_DECISION_TABLE; createIndex indexName=ACT_IDX_DMN_DEC_UNIQ, tableName=ACT_DMN_DECISION','',NULL,'4.3.5',NULL,NULL,'7398566464'),
	('8','flowable','org/flowable/dmn/db/liquibase/flowable-dmn-db-changelog.xml','2023-02-26 08:02:47',8,'EXECUTED','8:5355bee389318afed91a11702f2df032','addColumn tableName=ACT_DMN_DECISION','',NULL,'4.3.5',NULL,NULL,'7398566464');

/*!40000 ALTER TABLE `ACT_DMN_DATABASECHANGELOG` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table ACT_DMN_DATABASECHANGELOGLOCK
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ACT_DMN_DATABASECHANGELOGLOCK`;

CREATE TABLE `ACT_DMN_DATABASECHANGELOGLOCK` (
  `ID` int NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime DEFAULT NULL,
  `LOCKEDBY` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `ACT_DMN_DATABASECHANGELOGLOCK` WRITE;
/*!40000 ALTER TABLE `ACT_DMN_DATABASECHANGELOGLOCK` DISABLE KEYS */;

INSERT INTO `ACT_DMN_DATABASECHANGELOGLOCK` (`ID`, `LOCKED`, `LOCKGRANTED`, `LOCKEDBY`)
VALUES
	(1,b'0',NULL,NULL);

/*!40000 ALTER TABLE `ACT_DMN_DATABASECHANGELOGLOCK` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table ACT_DMN_DECISION
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ACT_DMN_DECISION`;

CREATE TABLE `ACT_DMN_DECISION` (
  `ID_` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `NAME_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `VERSION_` int DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `RESOURCE_NAME_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DESCRIPTION_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DECISION_TYPE_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_IDX_DMN_DEC_UNIQ` (`KEY_`,`VERSION_`,`TENANT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table ACT_DMN_DEPLOYMENT
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ACT_DMN_DEPLOYMENT`;

CREATE TABLE `ACT_DMN_DEPLOYMENT` (
  `ID_` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `NAME_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DEPLOY_TIME_` datetime(3) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PARENT_DEPLOYMENT_ID_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table ACT_DMN_DEPLOYMENT_RESOURCE
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ACT_DMN_DEPLOYMENT_RESOURCE`;

CREATE TABLE `ACT_DMN_DEPLOYMENT_RESOURCE` (
  `ID_` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `NAME_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `RESOURCE_BYTES_` longblob,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table ACT_DMN_HI_DECISION_EXECUTION
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ACT_DMN_HI_DECISION_EXECUTION`;

CREATE TABLE `ACT_DMN_HI_DECISION_EXECUTION` (
  `ID_` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `DECISION_DEFINITION_ID_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `START_TIME_` datetime(3) DEFAULT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `INSTANCE_ID_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EXECUTION_ID_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ACTIVITY_ID_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `FAILED_` bit(1) DEFAULT b'0',
  `TENANT_ID_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EXECUTION_JSON_` longtext COLLATE utf8mb4_unicode_ci,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table ACT_EVT_LOG
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ACT_EVT_LOG`;

CREATE TABLE `ACT_EVT_LOG` (
  `LOG_NR_` bigint NOT NULL AUTO_INCREMENT,
  `TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TIME_STAMP_` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DATA_` longblob,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LOCK_TIME_` timestamp(3) NULL DEFAULT NULL,
  `IS_PROCESSED_` tinyint DEFAULT '0',
  PRIMARY KEY (`LOG_NR_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;



# Dump of table ACT_FO_DATABASECHANGELOG
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ACT_FO_DATABASECHANGELOG`;

CREATE TABLE `ACT_FO_DATABASECHANGELOG` (
  `ID` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `AUTHOR` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `FILENAME` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `ORDEREXECUTED` int NOT NULL,
  `EXECTYPE` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `MD5SUM` varchar(35) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `COMMENTS` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TAG` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LIQUIBASE` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CONTEXTS` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LABELS` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `ACT_FO_DATABASECHANGELOG` WRITE;
/*!40000 ALTER TABLE `ACT_FO_DATABASECHANGELOG` DISABLE KEYS */;

INSERT INTO `ACT_FO_DATABASECHANGELOG` (`ID`, `AUTHOR`, `FILENAME`, `DATEEXECUTED`, `ORDEREXECUTED`, `EXECTYPE`, `MD5SUM`, `DESCRIPTION`, `COMMENTS`, `TAG`, `LIQUIBASE`, `CONTEXTS`, `LABELS`, `DEPLOYMENT_ID`)
VALUES
	('1','activiti','org/flowable/form/db/liquibase/flowable-form-db-changelog.xml','2023-02-26 08:02:47',1,'EXECUTED','8:033ebf9380889aed7c453927ecc3250d','createTable tableName=ACT_FO_FORM_DEPLOYMENT; createTable tableName=ACT_FO_FORM_RESOURCE; createTable tableName=ACT_FO_FORM_DEFINITION; createTable tableName=ACT_FO_FORM_INSTANCE','',NULL,'4.3.5',NULL,NULL,'7398567363'),
	('2','flowable','org/flowable/form/db/liquibase/flowable-form-db-changelog.xml','2023-02-26 08:02:47',2,'EXECUTED','8:986365ceb40445ce3b27a8e6b40f159b','addColumn tableName=ACT_FO_FORM_INSTANCE','',NULL,'4.3.5',NULL,NULL,'7398567363'),
	('3','flowable','org/flowable/form/db/liquibase/flowable-form-db-changelog.xml','2023-02-26 08:02:47',3,'EXECUTED','8:abf482518ceb09830ef674e52c06bf15','dropColumn columnName=PARENT_DEPLOYMENT_ID_, tableName=ACT_FO_FORM_DEFINITION','',NULL,'4.3.5',NULL,NULL,'7398567363'),
	('4','flowable','org/flowable/form/db/liquibase/flowable-form-db-changelog.xml','2023-02-26 08:02:47',4,'EXECUTED','8:2087829f22a4b2298dbf530681c74854','modifyDataType columnName=DEPLOY_TIME_, tableName=ACT_FO_FORM_DEPLOYMENT; modifyDataType columnName=SUBMITTED_DATE_, tableName=ACT_FO_FORM_INSTANCE','',NULL,'4.3.5',NULL,NULL,'7398567363'),
	('5','flowable','org/flowable/form/db/liquibase/flowable-form-db-changelog.xml','2023-02-26 08:02:47',5,'EXECUTED','8:b4be732b89e5ca028bdd520c6ad4d446','createIndex indexName=ACT_IDX_FORM_DEF_UNIQ, tableName=ACT_FO_FORM_DEFINITION','',NULL,'4.3.5',NULL,NULL,'7398567363'),
	('6','flowable','org/flowable/form/db/liquibase/flowable-form-db-changelog.xml','2023-02-26 08:02:47',6,'EXECUTED','8:384bbd364a649b67c3ca1bcb72fe537f','createIndex indexName=ACT_IDX_FORM_TASK, tableName=ACT_FO_FORM_INSTANCE; createIndex indexName=ACT_IDX_FORM_PROC, tableName=ACT_FO_FORM_INSTANCE; createIndex indexName=ACT_IDX_FORM_SCOPE, tableName=ACT_FO_FORM_INSTANCE','',NULL,'4.3.5',NULL,NULL,'7398567363');

/*!40000 ALTER TABLE `ACT_FO_DATABASECHANGELOG` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table ACT_FO_DATABASECHANGELOGLOCK
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ACT_FO_DATABASECHANGELOGLOCK`;

CREATE TABLE `ACT_FO_DATABASECHANGELOGLOCK` (
  `ID` int NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime DEFAULT NULL,
  `LOCKEDBY` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `ACT_FO_DATABASECHANGELOGLOCK` WRITE;
/*!40000 ALTER TABLE `ACT_FO_DATABASECHANGELOGLOCK` DISABLE KEYS */;

INSERT INTO `ACT_FO_DATABASECHANGELOGLOCK` (`ID`, `LOCKED`, `LOCKGRANTED`, `LOCKEDBY`)
VALUES
	(1,b'0',NULL,NULL);

/*!40000 ALTER TABLE `ACT_FO_DATABASECHANGELOGLOCK` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table ACT_FO_FORM_DEFINITION
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ACT_FO_FORM_DEFINITION`;

CREATE TABLE `ACT_FO_FORM_DEFINITION` (
  `ID_` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `NAME_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `VERSION_` int DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `RESOURCE_NAME_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DESCRIPTION_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_IDX_FORM_DEF_UNIQ` (`KEY_`,`VERSION_`,`TENANT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table ACT_FO_FORM_DEPLOYMENT
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ACT_FO_FORM_DEPLOYMENT`;

CREATE TABLE `ACT_FO_FORM_DEPLOYMENT` (
  `ID_` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `NAME_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DEPLOY_TIME_` datetime(3) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PARENT_DEPLOYMENT_ID_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table ACT_FO_FORM_INSTANCE
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ACT_FO_FORM_INSTANCE`;

CREATE TABLE `ACT_FO_FORM_INSTANCE` (
  `ID_` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `FORM_DEFINITION_ID_` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `TASK_ID_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PROC_INST_ID_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PROC_DEF_ID_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SUBMITTED_DATE_` datetime(3) DEFAULT NULL,
  `SUBMITTED_BY_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `FORM_VALUES_ID_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_FORM_TASK` (`TASK_ID_`),
  KEY `ACT_IDX_FORM_PROC` (`PROC_INST_ID_`),
  KEY `ACT_IDX_FORM_SCOPE` (`SCOPE_ID_`,`SCOPE_TYPE_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table ACT_FO_FORM_RESOURCE
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ACT_FO_FORM_RESOURCE`;

CREATE TABLE `ACT_FO_FORM_RESOURCE` (
  `ID_` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `NAME_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `RESOURCE_BYTES_` longblob,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table ACT_GE_BYTEARRAY
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ACT_GE_BYTEARRAY`;

CREATE TABLE `ACT_GE_BYTEARRAY` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BYTES_` longblob,
  `GENERATED_` tinyint DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_BYTEARR_DEPL` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_BYTEARR_DEPL` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `ACT_RE_DEPLOYMENT` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;

LOCK TABLES `ACT_GE_BYTEARRAY` WRITE;
/*!40000 ALTER TABLE `ACT_GE_BYTEARRAY` DISABLE KEYS */;

INSERT INTO `ACT_GE_BYTEARRAY` (`ID_`, `REV_`, `NAME_`, `DEPLOYMENT_ID_`, `BYTES_`, `GENERATED_`)
VALUES
	(X'66656535306462622D623562372D313165642D393664652D633635616363336536383465',1,X'2F55736572732F73616E672F776F726B73706163652F7469656E6368696E2D766964656F2F636F64652F7469656E6368696E2F7469656E6368696E2D61646D696E2F7461726765742F636C61737365732F70726F6365737365732F7469656E6368696E5F636F6E74726163745F617070726F76655F70726F636573732E62706D6E32302E786D6C',X'66656535306462612D623562372D313165642D393664652D633635616363336536383465',X'3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554462D38223F3E0A3C646566696E6974696F6E7320786D6C6E733D22687474703A2F2F7777772E6F6D672E6F72672F737065632F42504D4E2F32303130303532342F4D4F44454C2220786D6C6E733A7873693D22687474703A2F2F7777772E77332E6F72672F323030312F584D4C536368656D612D696E7374616E63652220786D6C6E733A7873643D22687474703A2F2F7777772E77332E6F72672F323030312F584D4C536368656D612220786D6C6E733A666C6F7761626C653D22687474703A2F2F666C6F7761626C652E6F72672F62706D6E2220786D6C6E733A62706D6E64693D22687474703A2F2F7777772E6F6D672E6F72672F737065632F42504D4E2F32303130303532342F44492220786D6C6E733A6F6D6764633D22687474703A2F2F7777772E6F6D672E6F72672F737065632F44442F32303130303532342F44432220786D6C6E733A6F6D6764693D22687474703A2F2F7777772E6F6D672E6F72672F737065632F44442F32303130303532342F44492220747970654C616E67756167653D22687474703A2F2F7777772E77332E6F72672F323030312F584D4C536368656D61222065787072657373696F6E4C616E67756167653D22687474703A2F2F7777772E77332E6F72672F313939392F585061746822207461726765744E616D6573706163653D22687474703A2F2F7777772E666C6F7761626C652E6F72672F70726F6365737364656622206578706F727465723D22466C6F7761626C65204F70656E20536F75726365204D6F64656C657222206578706F7274657256657273696F6E3D22362E372E32223E0A20203C70726F636573732069643D227469656E6368696E5F636F6E74726163745F617070726F766522206E616D653D225469656E4368696EE9A1B9E79BAEE59088E5908CE5AEA1E689B9E6B581E7A88B2220697345786563757461626C653D2274727565223E0A202020203C73746172744576656E742069643D2273746172744576656E74312220666C6F7761626C653A666F726D4669656C6456616C69646174696F6E3D2274727565223E3C2F73746172744576656E743E0A202020203C757365725461736B2069643D227375626D6974436F6E74726163745461736B22206E616D653D22E68F90E4BAA4E59088E5908C2220666C6F7761626C653A61737369676E65653D22247B63757272656E74557365727D2220666C6F7761626C653A666F726D4669656C6456616C69646174696F6E3D2274727565223E0A2020202020203C657874656E73696F6E456C656D656E74733E0A20202020202020203C6D6F64656C65723A61637469766974692D69646D2D696E69746961746F7220786D6C6E733A6D6F64656C65723D22687474703A2F2F666C6F7761626C652E6F72672F6D6F64656C6572223E3C215B43444154415B747275655D5D3E3C2F6D6F64656C65723A61637469766974692D69646D2D696E69746961746F723E0A2020202020203C2F657874656E73696F6E456C656D656E74733E0A202020203C2F757365725461736B3E0A202020203C73657175656E6365466C6F772069643D227369642D34393544434130362D433642302D344346322D383541342D3245334235353737464644432220736F757263655265663D2273746172744576656E743122207461726765745265663D227375626D6974436F6E74726163745461736B223E3C2F73657175656E6365466C6F773E0A202020203C757365725461736B2069643D227369642D31343432433237412D303233452D344146332D423942352D46353338453335333730334222206E616D653D22E59088E5908CE5AEA1E689B92220666C6F7761626C653A61737369676E65653D22247B617070726F7665557365727D2220666C6F7761626C653A666F726D4669656C6456616C69646174696F6E3D2274727565223E0A2020202020203C657874656E73696F6E456C656D656E74733E0A20202020202020203C6D6F64656C65723A696E69746961746F722D63616E2D636F6D706C65746520786D6C6E733A6D6F64656C65723D22687474703A2F2F666C6F7761626C652E6F72672F6D6F64656C6572223E3C215B43444154415B66616C73655D5D3E3C2F6D6F64656C65723A696E69746961746F722D63616E2D636F6D706C6574653E0A2020202020203C2F657874656E73696F6E456C656D656E74733E0A202020203C2F757365725461736B3E0A202020203C73657175656E6365466C6F772069643D227369642D34303731443443382D313932322D344636342D424343302D3841324546413745334239382220736F757263655265663D227375626D6974436F6E74726163745461736B22207461726765745265663D227369642D31343432433237412D303233452D344146332D423942352D463533384533353337303342223E3C2F73657175656E6365466C6F773E0A202020203C6578636C7573697665476174657761792069643D227369642D32303332443039342D313442382D344338342D383534462D454537374242393230433243223E3C2F6578636C7573697665476174657761793E0A202020203C656E644576656E742069643D227369642D39463637354245422D364537412D343039302D394543432D303343393633424134373631223E3C2F656E644576656E743E0A202020203C73657175656E6365466C6F772069643D227369642D36374634334642382D453335392D344146312D413034332D3930464337464131423934442220736F757263655265663D227369642D31343432433237412D303233452D344146332D423942352D46353338453335333730334222207461726765745265663D227369642D32303332443039342D313442382D344338342D383534462D454537374242393230433243223E3C2F73657175656E6365466C6F773E0A202020203C73657175656E6365466C6F772069643D227369642D36323344313138462D353138352D343936452D383138452D41433341424133433442394422206E616D653D22E5AEA1E689B9E9809AE8BF872220736F757263655265663D227369642D32303332443039342D313442382D344338342D383534462D45453737424239323043324322207461726765745265663D227369642D39463637354245422D364537412D343039302D394543432D303343393633424134373631223E0A2020202020203C636F6E646974696F6E45787072657373696F6E207873693A747970653D2274466F726D616C45787072657373696F6E223E3C215B43444154415B247B617070726F76657D5D5D3E3C2F636F6E646974696F6E45787072657373696F6E3E0A202020203C2F73657175656E6365466C6F773E0A202020203C73657175656E6365466C6F772069643D227369642D36374443363942452D324139342D343734412D394130322D41303535314631383432453922206E616D653D22E59088E5908CE5AEA1E689B9E9A9B3E59B9E2220736F757263655265663D227369642D32303332443039342D313442382D344338342D383534462D45453737424239323043324322207461726765745265663D227375626D6974436F6E74726163745461736B223E0A2020202020203C636F6E646974696F6E45787072657373696F6E207873693A747970653D2274466F726D616C45787072657373696F6E223E3C215B43444154415B247B21617070726F76657D5D5D3E3C2F636F6E646974696F6E45787072657373696F6E3E0A202020203C2F73657175656E6365466C6F773E0A20203C2F70726F636573733E0A20203C62706D6E64693A42504D4E4469616772616D2069643D2242504D4E4469616772616D5F7469656E6368696E5F636F6E74726163745F617070726F7665223E0A202020203C62706D6E64693A42504D4E506C616E652062706D6E456C656D656E743D227469656E6368696E5F636F6E74726163745F617070726F7665222069643D2242504D4E506C616E655F7469656E6368696E5F636F6E74726163745F617070726F7665223E0A2020202020203C62706D6E64693A42504D4E53686170652062706D6E456C656D656E743D2273746172744576656E7431222069643D2242504D4E53686170655F73746172744576656E7431223E0A20202020202020203C6F6D6764633A426F756E6473206865696768743D2233302E30222077696474683D2233302E302220783D223130302E302220793D223136332E30223E3C2F6F6D6764633A426F756E64733E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E53686170652062706D6E456C656D656E743D227375626D6974436F6E74726163745461736B222069643D2242504D4E53686170655F7375626D6974436F6E74726163745461736B223E0A20202020202020203C6F6D6764633A426F756E6473206865696768743D2238302E30222077696474683D223130302E302220783D223231302E302220793D223133382E30223E3C2F6F6D6764633A426F756E64733E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E53686170652062706D6E456C656D656E743D227369642D31343432433237412D303233452D344146332D423942352D463533384533353337303342222069643D2242504D4E53686170655F7369642D31343432433237412D303233452D344146332D423942352D463533384533353337303342223E0A20202020202020203C6F6D6764633A426F756E6473206865696768743D2238302E30222077696474683D223130302E302220783D223432302E302220793D223133382E30223E3C2F6F6D6764633A426F756E64733E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E53686170652062706D6E456C656D656E743D227369642D32303332443039342D313442382D344338342D383534462D454537374242393230433243222069643D2242504D4E53686170655F7369642D32303332443039342D313442382D344338342D383534462D454537374242393230433243223E0A20202020202020203C6F6D6764633A426F756E6473206865696768743D2234302E30222077696474683D2234302E302220783D223537302E302220793D223135382E30223E3C2F6F6D6764633A426F756E64733E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E53686170652062706D6E456C656D656E743D227369642D39463637354245422D364537412D343039302D394543432D303343393633424134373631222069643D2242504D4E53686170655F7369642D39463637354245422D364537412D343039302D394543432D303343393633424134373631223E0A20202020202020203C6F6D6764633A426F756E6473206865696768743D2232382E30222077696474683D2232382E302220783D223733352E302220793D223136342E30223E3C2F6F6D6764633A426F756E64733E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E456467652062706D6E456C656D656E743D227369642D34393544434130362D433642302D344346322D383541342D324533423535373746464443222069643D2242504D4E456467655F7369642D34393544434130362D433642302D344346322D383541342D3245334235353737464644432220666C6F7761626C653A736F75726365446F636B6572583D2231352E302220666C6F7761626C653A736F75726365446F636B6572593D2231352E302220666C6F7761626C653A746172676574446F636B6572583D2235302E302220666C6F7761626C653A746172676574446F636B6572593D2234302E30223E0A20202020202020203C6F6D6764693A776179706F696E7420783D223132392E39343939393931333037363739362220793D223137382E30223E3C2F6F6D6764693A776179706F696E743E0A20202020202020203C6F6D6764693A776179706F696E7420783D223230392E39393939393939393939383036372220793D223137382E30223E3C2F6F6D6764693A776179706F696E743E0A2020202020203C2F62706D6E64693A42504D4E456467653E0A2020202020203C62706D6E64693A42504D4E456467652062706D6E456C656D656E743D227369642D36374634334642382D453335392D344146312D413034332D393046433746413142393444222069643D2242504D4E456467655F7369642D36374634334642382D453335392D344146312D413034332D3930464337464131423934442220666C6F7761626C653A736F75726365446F636B6572583D2235302E302220666C6F7761626C653A736F75726365446F636B6572593D2234302E302220666C6F7761626C653A746172676574446F636B6572583D2232302E352220666C6F7761626C653A746172676574446F636B6572593D2232302E35223E0A20202020202020203C6F6D6764693A776179706F696E7420783D223531392E393439393939393939393935332220793D223137382E3230373236313431303738383336223E3C2F6F6D6764693A776179706F696E743E0A20202020202020203C6F6D6764693A776179706F696E7420783D223537302E343136363636363636363636372220793D223137382E3431363636363636363636363639223E3C2F6F6D6764693A776179706F696E743E0A2020202020203C2F62706D6E64693A42504D4E456467653E0A2020202020203C62706D6E64693A42504D4E456467652062706D6E456C656D656E743D227369642D34303731443443382D313932322D344636342D424343302D384132454641374533423938222069643D2242504D4E456467655F7369642D34303731443443382D313932322D344636342D424343302D3841324546413745334239382220666C6F7761626C653A736F75726365446F636B6572583D2235302E302220666C6F7761626C653A736F75726365446F636B6572593D2234302E302220666C6F7761626C653A746172676574446F636B6572583D2235302E302220666C6F7761626C653A746172676574446F636B6572593D2234302E30223E0A20202020202020203C6F6D6764693A776179706F696E7420783D223330392E39343939393939393939353033362220793D223137382E30223E3C2F6F6D6764693A776179706F696E743E0A20202020202020203C6F6D6764693A776179706F696E7420783D223431392E39393939393939393939393730342220793D223137382E30223E3C2F6F6D6764693A776179706F696E743E0A2020202020203C2F62706D6E64693A42504D4E456467653E0A2020202020203C62706D6E64693A42504D4E456467652062706D6E456C656D656E743D227369642D36323344313138462D353138352D343936452D383138452D414333414241334334423944222069643D2242504D4E456467655F7369642D36323344313138462D353138352D343936452D383138452D4143334142413343344239442220666C6F7761626C653A736F75726365446F636B6572583D2232302E352220666C6F7761626C653A736F75726365446F636B6572593D2232302E352220666C6F7761626C653A746172676574446F636B6572583D2231342E302220666C6F7761626C653A746172676574446F636B6572593D2231342E30223E0A20202020202020203C6F6D6764693A776179706F696E7420783D223630392E353033393337333831343034322220793D223137382E3433393837333431373732313537223E3C2F6F6D6764693A776179706F696E743E0A20202020202020203C6F6D6764693A776179706F696E7420783D223733352E303030303637303133363332372220793D223137382E30343430303632353133373932223E3C2F6F6D6764693A776179706F696E743E0A2020202020203C2F62706D6E64693A42504D4E456467653E0A2020202020203C62706D6E64693A42504D4E456467652062706D6E456C656D656E743D227369642D36374443363942452D324139342D343734412D394130322D413035353146313834324539222069643D2242504D4E456467655F7369642D36374443363942452D324139342D343734412D394130322D4130353531463138343245392220666C6F7761626C653A736F75726365446F636B6572583D2232302E352220666C6F7761626C653A736F75726365446F636B6572593D2232302E352220666C6F7761626C653A746172676574446F636B6572583D2235302E302220666C6F7761626C653A746172676574446F636B6572593D2234302E30223E0A20202020202020203C6F6D6764693A776179706F696E7420783D223539302E352220793D223135382E35223E3C2F6F6D6764693A776179706F696E743E0A20202020202020203C6F6D6764693A776179706F696E7420783D223539302E352220793D2232362E30223E3C2F6F6D6764693A776179706F696E743E0A20202020202020203C6F6D6764693A776179706F696E7420783D223236302E302220793D2232362E30223E3C2F6F6D6764693A776179706F696E743E0A20202020202020203C6F6D6764693A776179706F696E7420783D223236302E302220793D223133382E30223E3C2F6F6D6764693A776179706F696E743E0A2020202020203C2F62706D6E64693A42504D4E456467653E0A202020203C2F62706D6E64693A42504D4E506C616E653E0A20203C2F62706D6E64693A42504D4E4469616772616D3E0A3C2F646566696E6974696F6E733E',0),
	(X'66666239653965632D623562372D313165642D393664652D633635616363336536383465',1,X'2F55736572732F73616E672F776F726B73706163652F7469656E6368696E2D766964656F2F636F64652F7469656E6368696E2F7469656E6368696E2D61646D696E2F7461726765742F636C61737365732F70726F6365737365732F7469656E6368696E5F636F6E74726163745F617070726F76655F70726F636573732E7469656E6368696E5F636F6E74726163745F617070726F76652E706E67',X'66656535306462612D623562372D313165642D393664652D633635616363336536383465',X'89504E470D0A1A0A0000000D4948445200000305000000E40806000000C99588C300001B0749444154785EEDDD79B01C65B93860C00DD7D272F943BD6E50EE5A6AB996CB0505B1C42A5C2A098435108A04082EE482C5A2C4A028F2875BB92B6E57D16B01010D70310102040445AF10642782921B494004493440FFFAEDDF9973277D7A3A3367FDBAE779AADE9A33DD3DDD934CBFDFF77ED3CB6CB71D000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000D0607BEFBD77268410A23ECA6D2700B48ACE0EA09E761280D6D3D901D4D34E02D07A3A3B807ADA49005A4F6707504F3B0940EBE9EC00EA692701683D9D1D403DED2400ADA7B303A8A79D04A0F5747600F5B49300B49ECE0EA09E761280D6D3D901D4D34E02D07A3A3B807ADA49005A4F6707504F3B0940EBE9EC00EA692701683D9D1D403DED2400ADA7B303A8A79D04A0F5747600F5B49300B49ECE0EA09E761280D6D3D901D4D34E02D07A3A3B807ADA49005A4F6707504F3B0940EBE9EC00EA692701683D9D1D403DED2400ADA7B303A8A79D04A0F5747600F5B49300B49ECE0EA09E761280D6D3D901D4D34E02D07A3A3B807ADA49005A4F6707504F3B0940EBE9EC00EA692701683D9D1D403DED2400ADA7B303A8A79D04A0F5747600F5B49300B49ECE0EA09E761280D6D3D901D4D34E02D07A3A3B807ADA49005A4F6707504F3B0940EBE9EC00EA692701683D9D1D403DED2400ADA7B303A8A79D04A0F5747600F5B49300B49ECE0EA09E761280D6D3D901D4D34E02D07A3A3B807ADA49005A4F6707504F3B0940EBE9EC00EA692701683D9D1D403DED2400ADA7B303A8A79D04A0F5747600F5B49300B49ECE0EA09E761280D6D3D901D4D34E02D07A3A3B807ADA49005A4F6707504F3B0940EBE9EC00EA692701683D9D1D403DED2400ADA7B303A8A79D04A0F5747600F5B49300B49ECE0EA09E761280D6D3D901D4D34E02D07A3A3B807ADA49005A4F6707504F3B0940EBE9EC00EA692701683D9D1D403DED2400ADA7B303A8A79D04A0F5747600F5B49300B49ECE0EA09E761280D6D3D901D4D34E02D07A3A3B807ADA49005A4F6707504F3B0940EBE9EC00EA692701683D9D1D403DED2400ADA7B303A8A79D04A0F5747600F5B49300B49ECE0EA09E761280D6D3D901D4D34E02D07A3A3B807ADA49005A4F6707504F3B0940EBE9EC00EA692701683D9D1D403DED2400ADA7B303A8A79D04A0F5747600F5B49300B49ECE0EA09E761280D6D3D901D4D34E02D07A3A3B807ADA49005A4F6707504F3B0940EBE9EC00EA692701683D9D1D403DED2400ADA7B303A8A79D04A0F5747600F5B49300B49ECE0EA09E761280D6D3D901D4D34E02D07A3A3B807ADA49005A4F6707504F3B0940EBE9EC00EA692701683D9D1D403DED2400ADA7B303A8A79D04A0F5747600F5B49300B49ECE0EA09E761280D6D3D901D4D34E02D07A3A3B807ADA49005A4F6707504F3B0940EBE9EC00EA6927016895BC63BB283AB76DC445E5D7010C338302005A25EFD876A91804946397F2EB008699410100AD1347022A06028E1200F460500040EBC491808AC180A304003D181400D04A7144A06240E0280140058302005AA9C7D1825DCACB01605000408B958E16384A00D083410100AD553A5AB04B793E00FF9F410100ADD6395A509E0EC0FFD14E02D06A9DA305E5E900FC1FED24003D6559F6D8DB6EBBED67575C71C5BF56AC58915D78E1858D8CE8ECCAD39A12F9FFFB23AB56ADBA6BE5CA957B953F1F9AA12D79D4E49047DB665000404F7921F35F79479AAD5FBF3EDBB46953F6CF7FFE534C73C4FF7BFCFF5F7CF1C5F7E5C5CD9EE5CF88F4C9A3990F79B46D060500F414DF6C46475AEE60C5F4C7BA75EB36E4C5CC55E5CF88F4C9A374421EF5665000404F71AA836F36D388F81CF2626673F933227DF2289D9047BD191400D0539C8B5BEE54C5CC457C1EE5CF88F4C9A3B4421E55332800A0A77E8B9907FEB62EBBEDEAD3B335BFFA5411F1774C2B2F2726168A9966924769853CAA665000404FFD1433F7DFFB97ECBA0B4ECCFEE797FFB155C4B498575E5E8C3F1433CD248FD20A7954CDA000809EFA2966EE5C73CE9842A6137F5E73EE98E5C5F84331D34CF228AD9047D50C0A00E8A99F62E68F177D6E4C11D38998575E5E8C3F1433CD248FD20A7954CDA000809EFA2966AEBBF0A431454C27625E797931FE50CC34933C4A2BE451358302007A52CCA4158A9966924769853CAA665000404FFD14337197947211D38998575E5E8C3F1433CD248FD20A7954CDA000809EFA29666EBEFC2B638A984EC4BCF2F262FCA1986926799456C8A36A060500F4D44F31B3F12F7FC8AEFBEF4F8E2964625ACC2B2F2FC61F8A9966924769853CAA665000404FFD143311B7FFE607638A9998565E4E4C2C1433CD248FD20A7954CDA000809EFA2A66366FCE6E5EFDB531C54C4C8B79639617E30EC54C33C9A3B4421E55332800A0A76D1533F14BAB375DFEE531854C27629E5F639DBC50CC34933C4A2BE451358302007AEA59CC6CDE9CADBB796576EDF9C78D2960CA11CBC4B2BEED9C7828669A491EA515F2A89A4101003D551533DBFA56B357F8B673E2A1986926799456C8A36A060500F45455CCF4F3AD66AF88D796D727FA0FC54C33C9A3B4421E55332800A0A7AA62A65CA00C1AE5F589FE4331D34CF228AD904795FE7D6450F0EFE519005059CC88990BC54C33C9A3B4421E8D110381F5792C1E79343000606B8A99B44231D34CF228AD90475BE90C083A0381F2730050CCA4168A9966924769853C1AD56B00D06B3A00C34A31935628669A491EA515F2A8B0ADC27F5BF301A64E96653B5C71C5151FFCC10F7EF0DF4B962CD970ECB1C76E5AB870E12371F1D382050BB62C5EBCF8EFF9B45B962E5D7ADABC79F3FEADFC7A269F6226AD50CC34933C4A2BE451DF057FBFCB41DF66CD9AF59CBCAE5B3067CE9C73F2C7ABF2B833EABC91C7AB46A62F88E5CAAF6508E483811DCF3FFFFC6F9E78E289FF9A3F7F7EF6D5AF7E35BBF2CA2BB35B6FBD35DBB8716316E2319EC7F4987FC821873CBC68D1A2DB0E3DF4D03DCAEB63F22866D20AC54C33C9A3B462C8F368D0427FD0E5A1D2ECD9B377CD8BFD552303807E6355BCAEBC2E5A2A2FF28F58BA74E9A68F7CE423D915575C913DFCF0C3C520605B62B958FEA8A38EDA72F8E1875F938F2C772AAF9B8953CCA415435ECC34963C4A2B86388FC65BE08FF775B05DD46779717F5E45C13F489CA7CE6BB1BCAEDFFE820B2EF8CFC30E3B2C5BBE7C79F6D0430F95EBFEBEC4EBE2F5071D74D003FBECB3CFEEE5ED30318A99B462888B9946934769C590E6D1440BFB89BE9E21347BF6ECDDF2DAEC6FDD05FEFEFBEF9F9D72CA29D98A152B2ACF0889E9313F962B0D0CEE89F595B741C3E59FFDF6679E79E6AF172E5C98DD70C30D5B57F9E314EB993F7FFE8373E7CE3DA4BC3DC64F3193560C6931D378F228AD18C23C9AAC827EB2D6C310C88BF883F301C1439DA27EDF7DF7CDBEF5AD6F65F7DE7B6FB984AB14CBC5F2F1BAAE81C196586F795B34581C2158B06041B67EFDFAF23E3021B1BE79F3E6DD6F243979143369C5101633AD208FD28A21CBA3C92EE4277B7DB4D0C81182D101C191471E99DD7EFBEDE5B2AD2FF1BA787DF7C0409DD712AB57AF3E220604937584A02C5FEF23071C70C0BDB366CDDAB9BC6D06A798492B86AC98690D7994560C511E950BF8EDF33870E47110E5D795D70BA3A2FE9A3B77EEBD9D22FEF8E38FCFEEBBEFBE72B93690787DACA76B60B0519DD770F9E7BAE3C9279FBC29AE01984ACB962DBB37DF21CF2F6F9FC12966D28A212A665A451EA515439247E5C23D0AFAEFE411FFF678EC7760D0EB75E5F543212FD897771F2198E880A023D6533A62B0BCBC6D1AE4BCF3CEFB46DC6568BC1715F72BD63F7FFEFCBBDDC66AE2143369C5901433AD238FD28A21C8A3AA823DBEE98F7F7727FA1918740F083A7140D7FCAAED30C4466E3B3A7A0DC1784F19EA25D6D77D8D813AAFA1F2CF7287134E38E15F711BD1E970D96597C5D5EE9796DF078351CCA4154350CCB4923C4A2B5A9E47BD0AF5AA02BF6E6050B5FCB747A677EBB53D8650D45D9D823D2E129E0AB1DEAEA305EABC265ABD7AF5070E3DF4D0BE7F8760A2623BF968F26F7E11AF5A9E4817E5B14B797A996226AD687931D338F2A899917A1EF5BB5F55D856815E55E8570D0CAA96AB1A10746C6BBB345C3FFBE4C82F153F12C57ADC4EB4DFBB0C0D2AD6DB75BBD247D4790DF4FDEF7FFFC2F825E2E9B464C992EBE6CC99B3B0FC5E2812BC9350B589AE98492B522F66868D3C6A66A49E47FDEE5725FD16E655057FF7C0A06A7EDD80A0A3DFEDD340FDEC93516F7596FBEC673F5B2EC92655ACBFB32D755E032D5DBAF4EEE93A75A8E357BFFAD59A7C8739B3FC5ED82AC16B135D319356A45ECC0C1B79D4CC483D8FFADDAFBA0C5A905715FEF17C878AE9FD0C083A067D1F34443FFB64FEFCCCCEFCBCFE2A9764932AD6DFF55ED4794D73CC31C76CBAEDB6DBCA9FEB94BAF1C61BD7E63BCBD5E5F74265825726BA6226AD48BD98193615F9238F1A10A9E751C5FE54B95F8D186F215E3530B8B1F47C900141C778DF0F09ABD817C7EC93F9E3D59DE9535DEFC5FABBDE833AAF69162C58F0C83DF7DC53FE5CA7D4C68D1BEFCF7796BF94DF0BB509BE55A22B66D28AD48B9961539137E590470946EA7954B11F95A3D8AFB69B78015E353098C880A063A2EF8BC454EC83E5887D7243E7F954D77BB1FEAE6DABF39A262E0AD9B2654BF9739D52F9F6FE5EB1E38A0162A68A99B56BD7663FFEF18F8BFB1297E7D5C52DB7DC52DC9960C3860D63E69563CD9A35D90F7FF8C3E21B87F2BC54A3FCF98866C44CE55127A66A5FBFFCF2CBB32F7EF18B63A677E28F7FFC6376D65967157F5F73CD35D99FFFFCE76CF3E6CDD9AF7FFDEBE217E8CBCB4F57943F9F26C6AC59B3B21D77DC318AF7C5E5FE764071CA50F908413C8FE913B1B8FC9EC5F0C454D77BB1FEAEED6D2EEF7C24EEB0C30EDB32D523C7B2BBEFBEFB96BD8D202B9513B82B2EDA3B81D31ECE3DF7DCA2738A7DE6431FFA50F698C73C267BDCE31E57C4631FFBD8ECD5AF7E75B15CDCB3F8E28B2FCEE27A95882850E275679F7DF6E8B4981FCB75AF3F8AA4673DEB59D90E3BEC90BDF295AFCCEEBAEBAEADE6470113DB7CFCE31F9F3DE1094F181331FDD18F7E7476E595578E79EF5319A97FC3396C2AF227A93C8A98CC7D3DF2297E3CE8C31FFE70112F7DE94B8B7C8B5FA9EF4C8BF9AB57AF2ED6FDB5AF7D2D7BEA539F5AFCFDFCE73F3FFBCC673E53FC1D391C83FEF27B9DAE483D8F2AF6A7CAFD6ABB897F235F77A4A0EAAE44FD9AE8FB223115FBE2987D327FFC4B67FA54D77B8E1434DCD1471FFDF7A93EC7ACECFAEBAFFFCDDECE35AB5497D8DD66A29859B56A5576D45147151D5314F9EF7FFFFBB39D76DA293BE080038A78DDEB5E97BDE10D6F2896FDEE77BF5B0C105EF39AD764CF79CE738AC78857BDEA55D9739FFBDCE2EF98FFED6F7FBB58FEC1071FCCCE3CF3CCEC79CF7B5EF6E637BF39BBE1861BB277BCE31DC5FA7FFEF39F670F3CF040B1DC75D75D576CFFD8638FCD3EF1894F649FFCE42747239E7FFCE31F2FE64741557EFF5319A91733C326E53C9A8A7DFD273FF949B6FDF6DB67871C7248117BEDB557F6CC673E33EEFE313A2D061F3FFAD18FB24B2EB9249B376F5EF6A4273D29FBE94F7F9ABDE4252FC93EFFF9CF17DB8CC146BCB74B2FBD34FBC31FFE30E6BD4F75A49E47FDEE5723C65B80570D08CA470CC6333018EFFB2161FDEC937BBBA6807E1D77DC71374DF7DD87CE3AEBAC73F676557AA5BAC4EE3613C54C0C0AE297AFF3CD675FFAD2978A41411414871D7658116F7AD39BB2D7BFFEF55BBD268E06C4379ADFF8C6378AE7279C7042F68C673C237EC46E74992F7FF9CBC54021D61B471CE2DFBFDF7EFB6573E7CE2D8A94981EAF59BA74E968A174CC31C71485D4AEBBEE3A1AF1FC631FFBD868A1547EFF5319A91733C326D53C9AAA7DFD1FFFF847B15CCC7BD7BBDE550CCE63DE5BDFFAD6E2F93BDFF9CE621071FFFDF71747EBE2285F6C2F06F791C36F7CE31B8BA309312DDE4F1CA188F75A7EFF531DA9E751BFFB5597410BF1AA01415C435075F7A141060683BE0F1AA29F7D726F771FA25F4B962C396DBA7FA7E0C8238F5CEEFEB5D5EA12BBDB7417339D58BE7C79D1219D7EFAE9D917BEF085ECC0030FCC0E3AE8A022E2EF283C3ACBC6B79E718A42141C37DD745331EDF7BFFF7DF6DAD7BEB61828C4C062D3A64DD957BEF2956CF7DD77CF3EFDE94F676F79CB5BB2B7BDED6DA311CF3FF5A94F65EF79CF7B8A6F333B85529C331DD7287CEE739F1B8DD88FAFBEFAEAD142A9FCDEA732522F66864DAA793495FB7A0CCC5FF08217144716E2C85DCC3BFCF0C38BE7313D4E25EABC8F6F7EF39BD9D39FFEF4ECE69B6F2E06052F7AD18B8A4EBC333039E28823C6BCF7E988D4F3A8DFFDAAA4DF82BCD780A0EE770AFA1918F4BB7D1AA89F7DD2EF14D0B779F3E6FDDBFCF9F31F9EC65F34FEDF7C67B9DB2FDD4DCC7417331171EE7224FA76231DD2139FF8C4EC694F7BDA56F194A73C257E9C2E5BB66C59B1CC9E7BEE591C3D886F2A631DEF7BDFFB8A53263EF8C10F16F33BE72FDF71C71DD9F7BEF7BDE2F48672C4F43BEFBCB3B810B2BB508AC14514362F7EF18B8B5325E2F48B72A1345D917A3143B599C8A3A9DAD7A3E88F53F50E3EF8E0ECBDEF7D6F312FF2359E3FFBD9CF1E1D14FCEE77BF8B5F952FE6C780A07CFA50DE1F8C79CFD3152DCEA36D15E655057FD55D86AA96AB1B186C6BBB0C81E9FC45E3FDF6DBAFD84E6C4F9DD7508B162DBA7DBA4E213AE38C337E94EF2C9796DF038399896266F1E2C5C537FCF9E68B0142BEDF1403802840E21A819FFDEC67C5B9CD51A4C41180AF7FFDEBC56314FEF19A38DD281EE33CE6585F0C1CA2F889BF57AE5C59CC8BD316E2CE1D9D880B1F637A9C071DCB75174A710D439C6611D3E334889D77DE794CA1345DD1E262A6D566228FA66A5F8FA23F4E4D8AC7CEA03B4E05EA9E1ECB1D7AE8A1C5BC1800C4697CE541415C53D0C9CBE98E96E75114E655057A55A15F3520E8A85ABE6A60D06B7B0CA1A8BB3ADFE0C791C7A910EBED6C439DD7607927B1C751471DB5E5A1871E2A7FC6932A5FFF9DF98E72F3ECD9B3772DBF07063313C54C7C8379CE39E7149D50DC92348E00C4058B712E725CB4187750896F30AB6E6918E736C7EBE25CE8F2BC88B8B031E65F7BEDB55B4D8FD38D627AE7AE29E54229AE6388531D62BD5585D27445CB8B99D69A893C9AAA7D3D8AFE987ED24927151716C7BCA38F3EBA781E79D91914C485CDA79D765A71E4219E570D0A4E3EF9E4ECC4134F1CF3DEA73A86208FAA0AF503B7DBBAC0AF1B1074540D0C0EE89A5FB51D8658D45D9D823D8E14C69DFF2653AC6FEEDCB99DA304993AAFE18E3CF2C86B962F5FFE48F9839E448F9C7AEAA9A7E73BCBF2F2B619DC4C1433119D6B0AE2768A71B793B89B503430AF78C52B8A3B0EC5B9CE71316367F9F85D83B8034ABC264E7B88C7386270FDF5D76FB5DEF1144A714A459C0B1D1752464443542E94A62B86A09869A599C8A3A9DAD763201085FEBBDFFDEEE214BD98170388781ED3BB4F0BEA5C53107FC7A02006F73110E80C0A3EFAD18F46A73EE6BD4F750C491E950BF6EE02BF9F014147AFD795D70F85A8BF3A457BDCA238BEDC9B0CB19E238E38E2E1AEA304EABCA69B356BD6CE79C7707F7C8B34152EB9E492EFE73BCABAD84E79DB0C6E268A998B2EBAA8281EF2CD17773779D9CB5E96BDFDED6F2F9EC7ED15E3F4A22826E24E43B1EC6EBBED963DEA518FCA5EFEF297171726C71D52E28E264F7EF2938BD7C480224E378A75C79D8D625A5C93D07D8D421C8188E99DBB15C56D123BCFE362CD5FFCE217C5F4B86032EE8C14173BC7FC18B494DFFF54C6901433AD3313793455FB7A0C36E2D4A4CEDF31AFF33B20F1EFEC0C36E231CE2B8EBB1CC551BE38253006F8FBECB34FF11E226FE3B70B8E3FFEF831EF7DAA6388F2A85CB847411FDFF4F73B20E828BFAEBC5E1815F5575E876DEC14EF91E3131D18C4EB8F3BEEB8D12304B17E755E4BE49DC2EE071F7CF08371FAC7645ABB76EDB9F98E72D7ECD9B3772B6F93F1998962262E828C0B1DE3173BE302E2F80633EEA91EBF351017337EE0031FC8F6D8638FEC3BDFF94EF6DBDFFEB6F8B632EE40543E3F397ED538CE3D8CDB27760A952862629011DBF8E52F7F391AB1AE98DE2994E2DBD4B8934AF72D4D23A2618ABBBAC43ABBEFB2325D3144C54CABCC441E4DC7BE1EB7028E2301E5237211B19D17BEF085D9C2850B8B5B04C7DD42E217C763DEA9A79E5AE476E4739C2E587EED54C790E5D16417F093BD3E5A28EAB0BC1EDBD27DC460BCA712C5EB4A4708B6A8F35A66EEDCB987CC9B37EFEF9375C460E40841FC9ADEC1E56D317E3351CC88DE3164C54C6BC8A3B46208F368B20AF9C95A0F4320EAB1EE81419C021C5FD4F57B57A2582E96EFBE8660647DEABC368A91DEFEFBEF7FEFB265CBEE1DEFC5C77151F1C83504FF6BE438F9143369C5101633AD208FD28A21CDA38916F4137D3D4368E488C13D5D457D715AE129A79C92AD58B122BBF5D65BB38D1B3716F55C3CC6F3981EF3BB6E3BDA897BD4792D3767CE9C9DF251E005F3E7CFBFFBB2CB2EFB5BBFBF63902FB7FE8C33CEF8CF7C27B9398FF3623DE57533718A99B462488B99C6934769C510E7D1780BFBF1BE0E8A3A2FEAB452813F68A8F386C9C86DAC56EDBBEFBEF79D74D249D7E623C5EB6EBCF1C63B366CD8F0403E06B8FFAF7FFDEB6D6BD6ACF9CDD9679FBD6CD1A245B1736D88E5DD8E6A6A2966D28A212E661A4D1EA515439E478316F8832E0F953A755E45C15F17EABC6136F28B780BF211E139F9E35579C46F0EC48E118F578D4C5FE017ECA6876226AD18F262A6B1E4515A218FFA2EF4FB5D0EFAA6CE838652CCA4158A9966924769853C2A6CABE0DFD67C0086896226AD50CC34933C4A2BE4D1A85E857FAFE9000C2BC54C5AA1986926799456C8A3AD940700E5E700A098492D1433CD248FD20A7934466720B078E4D1800080AD2966D20AC54C33C9A3B4421E5572840080DE1433698562A699E4515A218F7A7A42790200141433698562A699E4515A218F0060408A99B44231D34CF228AD9047003020C54C5AA1986926799456C8230018906226AD50CC34933C4A2BE411000C4831935628669A491EA515F2080006A498492B1433CD248FD20A7904000352CCA4158A9966924769853C0280012966D20AC54C33C9A3B4421E01C0801433698562A699E4515A218F0060408A99B44231D34CF228AD9047003020C54C5AA1986926799456C8230018906226AD50CC34933C4A2BE411000C4831935628669A491EA515F2080006A498492B1433CD248FD20A7904000352CCA4158A9966924769853C028001AD58B1E2914D9B368DE954C5F447FE39DC9517339BCB9F11E99347E9843C02807158B56AD55DEBD7AF1FD3B18AE98F3FFDE94F67E4C5CC55E5CF88F4C9A374421E01C038AC5CB972AF8B2FBEF8BE75EBD66DF04DE7CC44FEFFBE6EEDDAB53FCE0B993BF2D8B3FC19913E7934F3218F006082A2038D6FD6F2F8679C8B2BA63DE2FF3DFEFF15320D169FDFC8E7288F6626E411000000000000000000000000000000000000000000000000000000B4D9FF03AE3F2A7CC4BDD5D70000000049454E44AE426082',1);

/*!40000 ALTER TABLE `ACT_GE_BYTEARRAY` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table ACT_GE_PROPERTY
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ACT_GE_PROPERTY`;

CREATE TABLE `ACT_GE_PROPERTY` (
  `NAME_` varchar(64) COLLATE utf8_bin NOT NULL,
  `VALUE_` varchar(300) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int DEFAULT NULL,
  PRIMARY KEY (`NAME_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;

LOCK TABLES `ACT_GE_PROPERTY` WRITE;
/*!40000 ALTER TABLE `ACT_GE_PROPERTY` DISABLE KEYS */;

INSERT INTO `ACT_GE_PROPERTY` (`NAME_`, `VALUE_`, `REV_`)
VALUES
	(X'62617463682E736368656D612E76657273696F6E',X'362E372E322E30',1),
	(X'6366672E657865637574696F6E2D72656C617465642D656E7469746965732D636F756E74',X'74727565',1),
	(X'6366672E7461736B2D72656C617465642D656E7469746965732D636F756E74',X'74727565',1),
	(X'636F6D6D6F6E2E736368656D612E76657273696F6E',X'362E372E322E30',1),
	(X'656E746974796C696E6B2E736368656D612E76657273696F6E',X'362E372E322E30',1),
	(X'6576656E74737562736372697074696F6E2E736368656D612E76657273696F6E',X'362E372E322E30',1),
	(X'6964656E746974796C696E6B2E736368656D612E76657273696F6E',X'362E372E322E30',1),
	(X'6A6F622E736368656D612E76657273696F6E',X'362E372E322E30',1),
	(X'6E6578742E64626964',X'31',1),
	(X'736368656D612E686973746F7279',X'63726561746528362E372E322E3029',1),
	(X'736368656D612E76657273696F6E',X'362E372E322E30',1),
	(X'7461736B2E736368656D612E76657273696F6E',X'362E372E322E30',1),
	(X'7661726961626C652E736368656D612E76657273696F6E',X'362E372E322E30',1);

/*!40000 ALTER TABLE `ACT_GE_PROPERTY` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table ACT_HI_ACTINST
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ACT_HI_ACTINST`;

CREATE TABLE `ACT_HI_ACTINST` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT '1',
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin NOT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CALL_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ACT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `TRANSACTION_ORDER_` int DEFAULT NULL,
  `DURATION_` bigint DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_ACT_INST_START` (`START_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_PROCINST` (`PROC_INST_ID_`,`ACT_ID_`),
  KEY `ACT_IDX_HI_ACT_INST_EXEC` (`EXECUTION_ID_`,`ACT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;

LOCK TABLES `ACT_HI_ACTINST` WRITE;
/*!40000 ALTER TABLE `ACT_HI_ACTINST` DISABLE KEYS */;

INSERT INTO `ACT_HI_ACTINST` (`ID_`, `REV_`, `PROC_DEF_ID_`, `PROC_INST_ID_`, `EXECUTION_ID_`, `ACT_ID_`, `TASK_ID_`, `CALL_PROC_INST_ID_`, `ACT_NAME_`, `ACT_TYPE_`, `ASSIGNEE_`, `START_TIME_`, `END_TIME_`, `TRANSACTION_ORDER_`, `DURATION_`, `DELETE_REASON_`, `TENANT_ID_`)
VALUES
	(X'31366663653932302D626366622D313165642D383735632D656533626362626332633363',1,X'7469656E6368696E5F636F6E74726163745F617070726F76653A313A66666261616433642D623562372D313165642D393664652D633635616363336536383465',X'31366663373365632D626366622D313165642D383735632D656533626362626332633363',X'31366663653931662D626366622D313165642D383735632D656533626362626332633363',X'73746172744576656E7431',NULL,NULL,NULL,X'73746172744576656E74',NULL,'2023-03-07 23:16:52.684','2023-03-07 23:16:52.686',1,2,NULL,X''),
	(X'31366664356535312D626366622D313165642D383735632D656533626362626332633363',1,X'7469656E6368696E5F636F6E74726163745F617070726F76653A313A66666261616433642D623562372D313165642D393664652D633635616363336536383465',X'31366663373365632D626366622D313165642D383735632D656533626362626332633363',X'31366663653931662D626366622D313165642D383735632D656533626362626332633363',X'7369642D34393544434130362D433642302D344346322D383541342D324533423535373746464443',NULL,NULL,NULL,X'73657175656E6365466C6F77',NULL,'2023-03-07 23:16:52.687','2023-03-07 23:16:52.687',2,0,NULL,X''),
	(X'31366664383536322D626366622D313165642D383735632D656533626362626332633363',2,X'7469656E6368696E5F636F6E74726163745F617070726F76653A313A66666261616433642D623562372D313165642D393664652D633635616363336536383465',X'31366663373365632D626366622D313165642D383735632D656533626362626332633363',X'31366663653931662D626366622D313165642D383735632D656533626362626332633363',X'7375626D6974436F6E74726163745461736B',X'31366666613834332D626366622D313165642D383735632D656533626362626332633363',NULL,X'E68F90E4BAA4E59088E5908C',X'757365725461736B',X'61646D696E','2023-03-07 23:16:52.688','2023-03-07 23:16:52.784',3,96,NULL,X''),
	(X'31373063613039612D626366622D313165642D383735632D656533626362626332633363',1,X'7469656E6368696E5F636F6E74726163745F617070726F76653A313A66666261616433642D623562372D313165642D393664652D633635616363336536383465',X'31366663373365632D626366622D313165642D383735632D656533626362626332633363',X'31366663653931662D626366622D313165642D383735632D656533626362626332633363',X'7369642D34303731443443382D313932322D344636342D424343302D384132454641374533423938',NULL,NULL,NULL,X'73657175656E6365466C6F77',NULL,'2023-03-07 23:16:52.787','2023-03-07 23:16:52.787',1,0,NULL,X''),
	(X'31373063656562622D626366622D313165642D383735632D656533626362626332633363',2,X'7469656E6368696E5F636F6E74726163745F617070726F76653A313A66666261616433642D623562372D313165642D393664652D633635616363336536383465',X'31366663373365632D626366622D313165642D383735632D656533626362626332633363',X'31366663653931662D626366622D313165642D383735632D656533626362626332633363',X'7369642D31343432433237412D303233452D344146332D423942352D463533384533353337303342',X'31373063656562632D626366622D313165642D383735632D656533626362626332633363',NULL,X'E59088E5908CE5AEA1E689B9',X'757365725461736B',X'7A68616E6773616E','2023-03-07 23:16:52.789','2023-03-09 21:38:37.343',2,166904554,NULL,X''),
	(X'32653533623136322D623562382D313165642D393664652D633635616363336536383465',1,X'7469656E6368696E5F636F6E74726163745F617070726F76653A313A66666261616433642D623562372D313165642D393664652D633635616363336536383465',X'32653533336332652D623562382D313165642D393664652D633635616363336536383465',X'32653533623136312D623562382D313165642D393664652D633635616363336536383465',X'73746172744576656E7431',NULL,NULL,NULL,X'73746172744576656E74',NULL,'2023-02-26 17:30:17.420','2023-02-26 17:30:17.423',1,3,NULL,X''),
	(X'32653534396263332D623562382D313165642D393664652D633635616363336536383465',1,X'7469656E6368696E5F636F6E74726163745F617070726F76653A313A66666261616433642D623562372D313165642D393664652D633635616363336536383465',X'32653533336332652D623562382D313165642D393664652D633635616363336536383465',X'32653533623136312D623562382D313165642D393664652D633635616363336536383465',X'7369642D34393544434130362D433642302D344346322D383541342D324533423535373746464443',NULL,NULL,NULL,X'73657175656E6365466C6F77',NULL,'2023-02-26 17:30:17.426','2023-02-26 17:30:17.426',2,0,NULL,X''),
	(X'32653534396263342D623562382D313165642D393664652D633635616363336536383465',2,X'7469656E6368696E5F636F6E74726163745F617070726F76653A313A66666261616433642D623562372D313165642D393664652D633635616363336536383465',X'32653533336332652D623562382D313165642D393664652D633635616363336536383465',X'32653533623136312D623562382D313165642D393664652D633635616363336536383465',X'7375626D6974436F6E74726163745461736B',X'32653537383166352D623562382D313165642D393664652D633635616363336536383465',NULL,X'E68F90E4BAA4E59088E5908C',X'757365725461736B',X'61646D696E','2023-02-26 17:30:17.426','2023-02-26 17:30:17.531',3,105,NULL,X''),
	(X'32653634656637632D623562382D313165642D393664652D633635616363336536383465',1,X'7469656E6368696E5F636F6E74726163745F617070726F76653A313A66666261616433642D623562372D313165642D393664652D633635616363336536383465',X'32653533336332652D623562382D313165642D393664652D633635616363336536383465',X'32653533623136312D623562382D313165642D393664652D633635616363336536383465',X'7369642D34303731443443382D313932322D344636342D424343302D384132454641374533423938',NULL,NULL,NULL,X'73657175656E6365466C6F77',NULL,'2023-02-26 17:30:17.533','2023-02-26 17:30:17.533',1,0,NULL,X''),
	(X'32653635313638642D623562382D313165642D393664652D633635616363336536383465',2,X'7469656E6368696E5F636F6E74726163745F617070726F76653A313A66666261616433642D623562372D313165642D393664652D633635616363336536383465',X'32653533336332652D623562382D313165642D393664652D633635616363336536383465',X'32653533623136312D623562382D313165642D393664652D633635616363336536383465',X'7369642D31343432433237412D303233452D344146332D423942352D463533384533353337303342',X'32653635336439652D623562382D313165642D393664652D633635616363336536383465',NULL,X'E59088E5908CE5AEA1E689B9',X'757365725461736B',X'7A68616E6773616E','2023-02-26 17:30:17.534','2023-03-07 22:44:52.674',2,796475140,NULL,X''),
	(X'33663462636434332D626538612D313165642D626237612D356161333737323439343364',1,X'7469656E6368696E5F636F6E74726163745F617070726F76653A313A66666261616433642D623562372D313165642D393664652D633635616363336536383465',X'36303536333630342D626234612D313165642D383763372D633635616363336536383465',X'36303536643234372D626234612D313165642D383763372D633635616363336536383465',X'7369642D36374634334642382D453335392D344146312D413034332D393046433746413142393444',NULL,NULL,NULL,X'73657175656E6365466C6F77',NULL,'2023-03-09 22:54:09.505','2023-03-09 22:54:09.505',1,0,NULL,X''),
	(X'33663463343237342D626538612D313165642D626237612D356161333737323439343364',1,X'7469656E6368696E5F636F6E74726163745F617070726F76653A313A66666261616433642D623562372D313165642D393664652D633635616363336536383465',X'36303536333630342D626234612D313165642D383763372D633635616363336536383465',X'36303536643234372D626234612D313165642D383763372D633635616363336536383465',X'7369642D32303332443039342D313442382D344338342D383534462D454537374242393230433243',NULL,NULL,NULL,X'6578636C757369766547617465776179',NULL,'2023-03-09 22:54:09.508','2023-03-09 22:54:09.529',2,21,NULL,X''),
	(X'33663466373663352D626538612D313165642D626237612D356161333737323439343364',1,X'7469656E6368696E5F636F6E74726163745F617070726F76653A313A66666261616433642D623562372D313165642D393664652D633635616363336536383465',X'36303536333630342D626234612D313165642D383763372D633635616363336536383465',X'36303536643234372D626234612D313165642D383763372D633635616363336536383465',X'7369642D36323344313138462D353138352D343936452D383138452D414333414241334334423944',NULL,NULL,X'E5AEA1E689B9E9809AE8BF87',X'73657175656E6365466C6F77',NULL,'2023-03-09 22:54:09.529','2023-03-09 22:54:09.529',3,0,NULL,X''),
	(X'33663466656266362D626538612D313165642D626237612D356161333737323439343364',1,X'7469656E6368696E5F636F6E74726163745F617070726F76653A313A66666261616433642D623562372D313165642D393664652D633635616363336536383465',X'36303536333630342D626234612D313165642D383763372D633635616363336536383465',X'36303536643234372D626234612D313165642D383763372D633635616363336536383465',X'7369642D39463637354245422D364537412D343039302D394543432D303343393633424134373631',NULL,NULL,NULL,X'656E644576656E74',NULL,'2023-03-09 22:54:09.532','2023-03-09 22:54:09.533',4,1,NULL,X''),
	(X'36303536643234382D626234612D313165642D383763372D633635616363336536383465',1,X'7469656E6368696E5F636F6E74726163745F617070726F76653A313A66666261616433642D623562372D313165642D393664652D633635616363336536383465',X'36303536333630342D626234612D313165642D383763372D633635616363336536383465',X'36303536643234372D626234612D313165642D383763372D633635616363336536383465',X'73746172744576656E7431',NULL,NULL,NULL,X'73746172744576656E74',NULL,'2023-03-05 19:39:23.663','2023-03-05 19:39:23.667',1,4,NULL,X''),
	(X'36303537626361392D626234612D313165642D383763372D633635616363336536383465',1,X'7469656E6368696E5F636F6E74726163745F617070726F76653A313A66666261616433642D623562372D313165642D393664652D633635616363336536383465',X'36303536333630342D626234612D313165642D383763372D633635616363336536383465',X'36303536643234372D626234612D313165642D383763372D633635616363336536383465',X'7369642D34393544434130362D433642302D344346322D383541342D324533423535373746464443',NULL,NULL,NULL,X'73657175656E6365466C6F77',NULL,'2023-03-05 19:39:23.669','2023-03-05 19:39:23.669',2,0,NULL,X''),
	(X'36303537626361612D626234612D313165642D383763372D633635616363336536383465',2,X'7469656E6368696E5F636F6E74726163745F617070726F76653A313A66666261616433642D623562372D313165642D393664652D633635616363336536383465',X'36303536333630342D626234612D313165642D383763372D633635616363336536383465',X'36303536643234372D626234612D313165642D383763372D633635616363336536383465',X'7375626D6974436F6E74726163745461736B',X'36303562313830622D626234612D313165642D383763372D633635616363336536383465',NULL,X'E68F90E4BAA4E59088E5908C',X'757365725461736B',X'61646D696E','2023-03-05 19:39:23.669','2023-03-05 19:39:23.791',3,122,NULL,X''),
	(X'36303661663639322D626234612D313165642D383763372D633635616363336536383465',1,X'7469656E6368696E5F636F6E74726163745F617070726F76653A313A66666261616433642D623562372D313165642D393664652D633635616363336536383465',X'36303536333630342D626234612D313165642D383763372D633635616363336536383465',X'36303536643234372D626234612D313165642D383763372D633635616363336536383465',X'7369642D34303731443443382D313932322D344636342D424343302D384132454641374533423938',NULL,NULL,NULL,X'73657175656E6365466C6F77',NULL,'2023-03-05 19:39:23.795','2023-03-05 19:39:23.795',1,0,NULL,X''),
	(X'36303662393264332D626234612D313165642D383763372D633635616363336536383465',2,X'7469656E6368696E5F636F6E74726163745F617070726F76653A313A66666261616433642D623562372D313165642D393664652D633635616363336536383465',X'36303536333630342D626234612D313165642D383763372D633635616363336536383465',X'36303536643234372D626234612D313165642D383763372D633635616363336536383465',X'7369642D31343432433237412D303233452D344146332D423942352D463533384533353337303342',X'36303662623965342D626234612D313165642D383763372D633635616363336536383465',NULL,X'E59088E5908CE5AEA1E689B9',X'757365725461736B',X'7A68616E6773616E','2023-03-05 19:39:23.799','2023-03-07 22:44:47.363',2,183923564,NULL,X''),
	(X'39623639633435382D626366362D313165642D623633362D633635616363336536383465',1,X'7469656E6368696E5F636F6E74726163745F617070726F76653A313A66666261616433642D623562372D313165642D393664652D633635616363336536383465',X'36303536333630342D626234612D313165642D383763372D633635616363336536383465',X'36303536643234372D626234612D313165642D383763372D633635616363336536383465',X'7369642D36374634334642382D453335392D344146312D413034332D393046433746413142393444',NULL,NULL,NULL,X'73657175656E6365466C6F77',NULL,'2023-03-07 22:44:47.373','2023-03-07 22:44:47.373',1,0,NULL,X''),
	(X'39623661333938392D626366362D313165642D623633362D633635616363336536383465',1,X'7469656E6368696E5F636F6E74726163745F617070726F76653A313A66666261616433642D623562372D313165642D393664652D633635616363336536383465',X'36303536333630342D626234612D313165642D383763372D633635616363336536383465',X'36303536643234372D626234612D313165642D383763372D633635616363336536383465',X'7369642D32303332443039342D313442382D344338342D383534462D454537374242393230433243',NULL,NULL,NULL,X'6578636C757369766547617465776179',NULL,'2023-03-07 22:44:47.376','2023-03-07 22:44:47.399',2,23,NULL,X''),
	(X'39623664626266612D626366362D313165642D623633362D633635616363336536383465',1,X'7469656E6368696E5F636F6E74726163745F617070726F76653A313A66666261616433642D623562372D313165642D393664652D633635616363336536383465',X'36303536333630342D626234612D313165642D383763372D633635616363336536383465',X'36303536643234372D626234612D313165642D383763372D633635616363336536383465',X'7369642D36374443363942452D324139342D343734412D394130322D413035353146313834324539',NULL,NULL,X'E59088E5908CE5AEA1E689B9E9A9B3E59B9E',X'73657175656E6365466C6F77',NULL,'2023-03-07 22:44:47.399','2023-03-07 22:44:47.399',3,0,NULL,X''),
	(X'39623665333132622D626366362D313165642D623633362D633635616363336536383465',2,X'7469656E6368696E5F636F6E74726163745F617070726F76653A313A66666261616433642D623562372D313165642D393664652D633635616363336536383465',X'36303536333630342D626234612D313165642D383763372D633635616363336536383465',X'36303536643234372D626234612D313165642D383763372D633635616363336536383465',X'7375626D6974436F6E74726163745461736B',X'39623665353833632D626366362D313165642D623633362D633635616363336536383465',NULL,X'E68F90E4BAA4E59088E5908C',X'757365725461736B',X'61646D696E','2023-03-07 22:44:47.402','2023-03-09 22:29:32.114',4,171884712,NULL,X''),
	(X'39653932663064312D626366362D313165642D623633362D633635616363336536383465',1,X'7469656E6368696E5F636F6E74726163745F617070726F76653A313A66666261616433642D623562372D313165642D393664652D633635616363336536383465',X'32653533336332652D623562382D313165642D393664652D633635616363336536383465',X'32653533623136312D623562382D313165642D393664652D633635616363336536383465',X'7369642D36374634334642382D453335392D344146312D413034332D393046433746413142393444',NULL,NULL,NULL,X'73657175656E6365466C6F77',NULL,'2023-03-07 22:44:52.676','2023-03-07 22:44:52.676',1,0,NULL,X''),
	(X'39653933336566322D626366362D313165642D623633362D633635616363336536383465',1,X'7469656E6368696E5F636F6E74726163745F617070726F76653A313A66666261616433642D623562372D313165642D393664652D633635616363336536383465',X'32653533336332652D623562382D313165642D393664652D633635616363336536383465',X'32653533623136312D623562382D313165642D393664652D633635616363336536383465',X'7369642D32303332443039342D313442382D344338342D383534462D454537374242393230433243',NULL,NULL,NULL,X'6578636C757369766547617465776179',NULL,'2023-03-07 22:44:52.678','2023-03-07 22:44:52.679',2,1,NULL,X''),
	(X'39653933363630332D626366362D313165642D623633362D633635616363336536383465',1,X'7469656E6368696E5F636F6E74726163745F617070726F76653A313A66666261616433642D623562372D313165642D393664652D633635616363336536383465',X'32653533336332652D623562382D313165642D393664652D633635616363336536383465',X'32653533623136312D623562382D313165642D393664652D633635616363336536383465',X'7369642D36323344313138462D353138352D343936452D383138452D414333414241334334423944',NULL,NULL,X'E5AEA1E689B9E9809AE8BF87',X'73657175656E6365466C6F77',NULL,'2023-03-07 22:44:52.679','2023-03-07 22:44:52.679',3,0,NULL,X''),
	(X'39653933623432342D626366362D313165642D623633362D633635616363336536383465',1,X'7469656E6368696E5F636F6E74726163745F617070726F76653A313A66666261616433642D623562372D313165642D393664652D633635616363336536383465',X'32653533336332652D623562382D313165642D393664652D633635616363336536383465',X'32653533623136312D623562382D313165642D393664652D633635616363336536383465',X'7369642D39463637354245422D364537412D343039302D394543432D303343393633424134373631',NULL,NULL,NULL,X'656E644576656E74',NULL,'2023-03-07 22:44:52.681','2023-03-07 22:44:52.684',4,3,NULL,X''),
	(X'62316563323264642D626537662D313165642D626632312D356161333737323439343364',1,X'7469656E6368696E5F636F6E74726163745F617070726F76653A313A66666261616433642D623562372D313165642D393664652D633635616363336536383465',X'31366663373365632D626366622D313165642D383735632D656533626362626332633363',X'31366663653931662D626366622D313165642D383735632D656533626362626332633363',X'7369642D36374634334642382D453335392D344146312D413034332D393046433746413142393444',NULL,NULL,NULL,X'73657175656E6365466C6F77',NULL,'2023-03-09 21:38:37.352','2023-03-09 21:38:37.352',1,0,NULL,X''),
	(X'62316563393830652D626537662D313165642D626632312D356161333737323439343364',1,X'7469656E6368696E5F636F6E74726163745F617070726F76653A313A66666261616433642D623562372D313165642D393664652D633635616363336536383465',X'31366663373365632D626366622D313165642D383735632D656533626362626332633363',X'31366663653931662D626366622D313165642D383735632D656533626362626332633363',X'7369642D32303332443039342D313442382D344338342D383534462D454537374242393230433243',NULL,NULL,NULL,X'6578636C757369766547617465776179',NULL,'2023-03-09 21:38:37.355','2023-03-09 21:38:37.384',2,29,NULL,X''),
	(X'62316631303464662D626537662D313165642D626632312D356161333737323439343364',1,X'7469656E6368696E5F636F6E74726163745F617070726F76653A313A66666261616433642D623562372D313165642D393664652D633635616363336536383465',X'31366663373365632D626366622D313165642D383735632D656533626362626332633363',X'31366663653931662D626366622D313165642D383735632D656533626362626332633363',X'7369642D36323344313138462D353138352D343936452D383138452D414333414241334334423944',NULL,NULL,X'E5AEA1E689B9E9809AE8BF87',X'73657175656E6365466C6F77',NULL,'2023-03-09 21:38:37.384','2023-03-09 21:38:37.384',3,0,NULL,X''),
	(X'62316631376131302D626537662D313165642D626632312D356161333737323439343364',1,X'7469656E6368696E5F636F6E74726163745F617070726F76653A313A66666261616433642D623562372D313165642D393664652D633635616363336536383465',X'31366663373365632D626366622D313165642D383735632D656533626362626332633363',X'31366663653931662D626366622D313165642D383735632D656533626362626332633363',X'7369642D39463637354245422D364537412D343039302D394543432D303343393633424134373631',NULL,NULL,NULL,X'656E644576656E74',NULL,'2023-03-09 21:38:37.387','2023-03-09 21:38:37.389',4,2,NULL,X''),
	(X'63656234393661362D626538362D313165642D613730392D356161333737323439343364',1,X'7469656E6368696E5F636F6E74726163745F617070726F76653A313A66666261616433642D623562372D313165642D393664652D633635616363336536383465',X'36303536333630342D626234612D313165642D383763372D633635616363336536383465',X'36303536643234372D626234612D313165642D383763372D633635616363336536383465',X'7369642D34303731443443382D313932322D344636342D424343302D384132454641374533423938',NULL,NULL,NULL,X'73657175656E6365466C6F77',NULL,'2023-03-09 22:29:32.119','2023-03-09 22:29:32.119',1,0,NULL,X''),
	(X'63656234653463372D626538362D313165642D613730392D356161333737323439343364',2,X'7469656E6368696E5F636F6E74726163745F617070726F76653A313A66666261616433642D623562372D313165642D393664652D633635616363336536383465',X'36303536333630342D626234612D313165642D383763372D633635616363336536383465',X'36303536643234372D626234612D313165642D383763372D633635616363336536383465',X'7369642D31343432433237412D303233452D344146332D423942352D463533384533353337303342',X'63656237326562382D626538362D313165642D613730392D356161333737323439343364',NULL,X'E59088E5908CE5AEA1E689B9',X'757365725461736B',X'7A68616E6773616E','2023-03-09 22:29:32.121','2023-03-09 22:54:09.499',2,1477378,NULL,X'');

/*!40000 ALTER TABLE `ACT_HI_ACTINST` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table ACT_HI_ATTACHMENT
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ACT_HI_ATTACHMENT`;

CREATE TABLE `ACT_HI_ATTACHMENT` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `URL_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CONTENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TIME_` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;



# Dump of table ACT_HI_COMMENT
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ACT_HI_COMMENT`;

CREATE TABLE `ACT_HI_COMMENT` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TIME_` datetime(3) NOT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACTION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `MESSAGE_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `FULL_MSG_` longblob,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;



# Dump of table ACT_HI_DETAIL
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ACT_HI_DETAIL`;

CREATE TABLE `ACT_HI_DETAIL` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int DEFAULT NULL,
  `TIME_` datetime(3) NOT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_DETAIL_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_ACT_INST` (`ACT_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_TIME` (`TIME_`),
  KEY `ACT_IDX_HI_DETAIL_NAME` (`NAME_`),
  KEY `ACT_IDX_HI_DETAIL_TASK_ID` (`TASK_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;



# Dump of table ACT_HI_ENTITYLINK
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ACT_HI_ENTITYLINK`;

CREATE TABLE `ACT_HI_ENTITYLINK` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `LINK_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` datetime(3) DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_ELEMENT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REF_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REF_SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REF_SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ROOT_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ROOT_SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HIERARCHY_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_ENT_LNK_SCOPE` (`SCOPE_ID_`,`SCOPE_TYPE_`,`LINK_TYPE_`),
  KEY `ACT_IDX_HI_ENT_LNK_REF_SCOPE` (`REF_SCOPE_ID_`,`REF_SCOPE_TYPE_`,`LINK_TYPE_`),
  KEY `ACT_IDX_HI_ENT_LNK_ROOT_SCOPE` (`ROOT_SCOPE_ID_`,`ROOT_SCOPE_TYPE_`,`LINK_TYPE_`),
  KEY `ACT_IDX_HI_ENT_LNK_SCOPE_DEF` (`SCOPE_DEFINITION_ID_`,`SCOPE_TYPE_`,`LINK_TYPE_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;



# Dump of table ACT_HI_IDENTITYLINK
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ACT_HI_IDENTITYLINK`;

CREATE TABLE `ACT_HI_IDENTITYLINK` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` datetime(3) DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_USER` (`USER_ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_SCOPE` (`SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_HI_IDENT_LNK_SUB_SCOPE` (`SUB_SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_HI_IDENT_LNK_SCOPE_DEF` (`SCOPE_DEFINITION_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_HI_IDENT_LNK_TASK` (`TASK_ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_PROCINST` (`PROC_INST_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;

LOCK TABLES `ACT_HI_IDENTITYLINK` WRITE;
/*!40000 ALTER TABLE `ACT_HI_IDENTITYLINK` DISABLE KEYS */;

INSERT INTO `ACT_HI_IDENTITYLINK` (`ID_`, `GROUP_ID_`, `TYPE_`, `USER_ID_`, `TASK_ID_`, `CREATE_TIME_`, `PROC_INST_ID_`, `SCOPE_ID_`, `SUB_SCOPE_ID_`, `SCOPE_TYPE_`, `SCOPE_DEFINITION_ID_`)
VALUES
	(X'31366663396166642D626366622D313165642D383735632D656533626362626332633363',NULL,X'73746172746572',X'61646D696E',NULL,'2023-03-07 23:16:52.682',X'31366663373365632D626366622D313165642D383735632D656533626362626332633363',NULL,NULL,NULL,NULL),
	(X'31366666663636342D626366622D313165642D383735632D656533626362626332633363',NULL,X'61737369676E6565',X'61646D696E',X'31366666613834332D626366622D313165642D383735632D656533626362626332633363','2023-03-07 23:16:52.704',NULL,NULL,NULL,NULL,NULL),
	(X'31373030316437352D626366622D313165642D383735632D656533626362626332633363',NULL,X'7061727469636970616E74',X'61646D696E',NULL,'2023-03-07 23:16:52.705',X'31366663373365632D626366622D313165642D383735632D656533626362626332633363',NULL,NULL,NULL,NULL),
	(X'31373061303838392D626366622D313165642D383735632D656533626362626332633363',NULL,X'7061727469636970616E74',X'61646D696E',NULL,'2023-03-07 23:16:52.770',X'31366663373365632D626366622D313165642D383735632D656533626362626332633363',NULL,NULL,NULL,NULL),
	(X'31373064313563642D626366622D313165642D383735632D656533626362626332633363',NULL,X'61737369676E6565',X'7A68616E6773616E',X'31373063656562632D626366622D313165642D383735632D656533626362626332633363','2023-03-07 23:16:52.790',NULL,NULL,NULL,NULL,NULL),
	(X'31373064313563652D626366622D313165642D383735632D656533626362626332633363',NULL,X'7061727469636970616E74',X'7A68616E6773616E',NULL,'2023-03-07 23:16:52.790',X'31366663373365632D626366622D313165642D383735632D656533626362626332633363',NULL,NULL,NULL,NULL),
	(X'32653533336332662D623562382D313165642D393664652D633635616363336536383465',NULL,X'73746172746572',X'61646D696E',NULL,'2023-02-26 17:30:17.418',X'32653533336332652D623562382D313165642D393664652D633635616363336536383465',NULL,NULL,NULL,NULL),
	(X'32653538316533362D623562382D313165642D393664652D633635616363336536383465',NULL,X'61737369676E6565',X'61646D696E',X'32653537383166352D623562382D313165642D393664652D633635616363336536383465','2023-02-26 17:30:17.449',NULL,NULL,NULL,NULL,NULL),
	(X'32653538316533372D623562382D313165642D393664652D633635616363336536383465',NULL,X'7061727469636970616E74',X'61646D696E',NULL,'2023-02-26 17:30:17.449',X'32653533336332652D623562382D313165642D393664652D633635616363336536383465',NULL,NULL,NULL,NULL),
	(X'32653633343163622D623562382D313165642D393664652D633635616363336536383465',NULL,X'7061727469636970616E74',X'61646D696E',NULL,'2023-02-26 17:30:17.522',X'32653533336332652D623562382D313165642D393664652D633635616363336536383465',NULL,NULL,NULL,NULL),
	(X'32653635336439662D623562382D313165642D393664652D633635616363336536383465',NULL,X'61737369676E6565',X'7A68616E6773616E',X'32653635336439652D623562382D313165642D393664652D633635616363336536383465','2023-02-26 17:30:17.535',NULL,NULL,NULL,NULL,NULL),
	(X'32653635336461302D623562382D313165642D393664652D633635616363336536383465',NULL,X'7061727469636970616E74',X'7A68616E6773616E',NULL,'2023-02-26 17:30:17.535',X'32653533336332652D623562382D313165642D393664652D633635616363336536383465',NULL,NULL,NULL,NULL),
	(X'33663438393866322D626538612D313165642D626237612D356161333737323439343364',NULL,X'7061727469636970616E74',X'7A68616E6773616E',NULL,'2023-03-09 22:54:09.485',X'36303536333630342D626234612D313165642D383763372D633635616363336536383465',NULL,NULL,NULL,NULL),
	(X'36303536356431352D626234612D313165642D383763372D633635616363336536383465',NULL,X'73746172746572',X'61646D696E',NULL,'2023-03-05 19:39:23.661',X'36303536333630342D626234612D313165642D383763372D633635616363336536383465',NULL,NULL,NULL,NULL),
	(X'36303562623434632D626234612D313165642D383763372D633635616363336536383465',NULL,X'61737369676E6565',X'61646D696E',X'36303562313830622D626234612D313165642D383763372D633635616363336536383465','2023-03-05 19:39:23.695',NULL,NULL,NULL,NULL,NULL),
	(X'36303562623434642D626234612D313165642D383763372D633635616363336536383465',NULL,X'7061727469636970616E74',X'61646D696E',NULL,'2023-03-05 19:39:23.695',X'36303536333630342D626234612D313165642D383763372D633635616363336536383465',NULL,NULL,NULL,NULL),
	(X'36303638383539312D626234612D313165642D383763372D633635616363336536383465',NULL,X'7061727469636970616E74',X'61646D696E',NULL,'2023-03-05 19:39:23.779',X'36303536333630342D626234612D313165642D383763372D633635616363336536383465',NULL,NULL,NULL,NULL),
	(X'36303662623965352D626234612D313165642D383763372D633635616363336536383465',NULL,X'61737369676E6565',X'7A68616E6773616E',X'36303662623965342D626234612D313165642D383763372D633635616363336536383465','2023-03-05 19:39:23.800',NULL,NULL,NULL,NULL,NULL),
	(X'36303662623965362D626234612D313165642D383763372D633635616363336536383465',NULL,X'7061727469636970616E74',X'7A68616E6773616E',NULL,'2023-03-05 19:39:23.800',X'36303536333630342D626234612D313165642D383763372D633635616363336536383465',NULL,NULL,NULL,NULL),
	(X'39623635613561372D626366362D313165642D623633362D633635616363336536383465',NULL,X'7061727469636970616E74',X'7A68616E6773616E',NULL,'2023-03-07 22:44:47.346',X'36303536333630342D626234612D313165642D383763372D633635616363336536383465',NULL,NULL,NULL,NULL),
	(X'39623665376634642D626366362D313165642D623633362D633635616363336536383465',NULL,X'61737369676E6565',X'61646D696E',X'39623665353833632D626366362D313165642D623633362D633635616363336536383465','2023-03-07 22:44:47.404',NULL,NULL,NULL,NULL,NULL),
	(X'39653931316331302D626366362D313165642D623633362D633635616363336536383465',NULL,X'7061727469636970616E74',X'7A68616E6773616E',NULL,'2023-03-07 22:44:52.664',X'32653533336332652D623562382D313165642D393664652D633635616363336536383465',NULL,NULL,NULL,NULL),
	(X'62316537386566632D626537662D313165642D626632312D356161333737323439343364',NULL,X'7061727469636970616E74',X'7A68616E6773616E',NULL,'2023-03-09 21:38:37.322',X'31366663373365632D626366622D313165642D383735632D656533626362626332633363',NULL,NULL,NULL,NULL),
	(X'63656231383936352D626538362D313165642D613730392D356161333737323439343364',NULL,X'7061727469636970616E74',X'61646D696E',NULL,'2023-03-09 22:29:32.099',X'36303536333630342D626234612D313165642D383763372D633635616363336536383465',NULL,NULL,NULL,NULL),
	(X'63656237613365392D626538362D313165642D613730392D356161333737323439343364',NULL,X'61737369676E6565',X'7A68616E6773616E',X'63656237326562382D626538362D313165642D613730392D356161333737323439343364','2023-03-09 22:29:32.139',NULL,NULL,NULL,NULL,NULL);

/*!40000 ALTER TABLE `ACT_HI_IDENTITYLINK` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table ACT_HI_PROCINST
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ACT_HI_PROCINST`;

CREATE TABLE `ACT_HI_PROCINST` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT '1',
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint DEFAULT NULL,
  `START_USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `END_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUPER_PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CALLBACK_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CALLBACK_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REFERENCE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REFERENCE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROPAGATED_STAGE_INST_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `BUSINESS_STATUS_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `PROC_INST_ID_` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_PRO_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_PRO_I_BUSKEY` (`BUSINESS_KEY_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;

LOCK TABLES `ACT_HI_PROCINST` WRITE;
/*!40000 ALTER TABLE `ACT_HI_PROCINST` DISABLE KEYS */;

INSERT INTO `ACT_HI_PROCINST` (`ID_`, `REV_`, `PROC_INST_ID_`, `BUSINESS_KEY_`, `PROC_DEF_ID_`, `START_TIME_`, `END_TIME_`, `DURATION_`, `START_USER_ID_`, `START_ACT_ID_`, `END_ACT_ID_`, `SUPER_PROCESS_INSTANCE_ID_`, `DELETE_REASON_`, `TENANT_ID_`, `NAME_`, `CALLBACK_ID_`, `CALLBACK_TYPE_`, `REFERENCE_ID_`, `REFERENCE_TYPE_`, `PROPAGATED_STAGE_INST_ID_`, `BUSINESS_STATUS_`)
VALUES
	(X'31366663373365632D626366622D313165642D383735632D656533626362626332633363',2,X'31366663373365632D626366622D313165642D383735632D656533626362626332633363',NULL,X'7469656E6368696E5F636F6E74726163745F617070726F76653A313A66666261616433642D623562372D313165642D393664652D633635616363336536383465','2023-03-07 23:16:52.681','2023-03-09 21:38:37.423',166904742,X'61646D696E',X'73746172744576656E7431',X'7369642D39463637354245422D364537412D343039302D394543432D303343393633424134373631',NULL,NULL,X'',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(X'32653533336332652D623562382D313165642D393664652D633635616363336536383465',2,X'32653533336332652D623562382D313165642D393664652D633635616363336536383465',NULL,X'7469656E6368696E5F636F6E74726163745F617070726F76653A313A66666261616433642D623562372D313165642D393664652D633635616363336536383465','2023-02-26 17:30:17.417','2023-03-07 22:44:52.726',796475309,X'61646D696E',X'73746172744576656E7431',X'7369642D39463637354245422D364537412D343039302D394543432D303343393633424134373631',NULL,NULL,X'',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(X'36303536333630342D626234612D313165642D383763372D633635616363336536383465',2,X'36303536333630342D626234612D313165642D383763372D633635616363336536383465',NULL,X'7469656E6368696E5F636F6E74726163745F617070726F76653A313A66666261616433642D623562372D313165642D393664652D633635616363336536383465','2023-03-05 19:39:23.659','2023-03-09 22:54:09.563',357285904,X'61646D696E',X'73746172744576656E7431',X'7369642D39463637354245422D364537412D343039302D394543432D303343393633424134373631',NULL,NULL,X'',NULL,NULL,NULL,NULL,NULL,NULL,NULL);

/*!40000 ALTER TABLE `ACT_HI_PROCINST` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table ACT_HI_TASKINST
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ACT_HI_TASKINST`;

CREATE TABLE `ACT_HI_TASKINST` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT '1',
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROPAGATED_STAGE_INST_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `CLAIM_TIME_` datetime(3) DEFAULT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY_` int DEFAULT NULL,
  `DUE_DATE_` datetime(3) DEFAULT NULL,
  `FORM_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `LAST_UPDATED_TIME_` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_TASK_SCOPE` (`SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_HI_TASK_SUB_SCOPE` (`SUB_SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_HI_TASK_SCOPE_DEF` (`SCOPE_DEFINITION_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_HI_TASK_INST_PROCINST` (`PROC_INST_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;

LOCK TABLES `ACT_HI_TASKINST` WRITE;
/*!40000 ALTER TABLE `ACT_HI_TASKINST` DISABLE KEYS */;

INSERT INTO `ACT_HI_TASKINST` (`ID_`, `REV_`, `PROC_DEF_ID_`, `TASK_DEF_ID_`, `TASK_DEF_KEY_`, `PROC_INST_ID_`, `EXECUTION_ID_`, `SCOPE_ID_`, `SUB_SCOPE_ID_`, `SCOPE_TYPE_`, `SCOPE_DEFINITION_ID_`, `PROPAGATED_STAGE_INST_ID_`, `NAME_`, `PARENT_TASK_ID_`, `DESCRIPTION_`, `OWNER_`, `ASSIGNEE_`, `START_TIME_`, `CLAIM_TIME_`, `END_TIME_`, `DURATION_`, `DELETE_REASON_`, `PRIORITY_`, `DUE_DATE_`, `FORM_KEY_`, `CATEGORY_`, `TENANT_ID_`, `LAST_UPDATED_TIME_`)
VALUES
	(X'31366666613834332D626366622D313165642D383735632D656533626362626332633363',2,X'7469656E6368696E5F636F6E74726163745F617070726F76653A313A66666261616433642D623562372D313165642D393664652D633635616363336536383465',NULL,X'7375626D6974436F6E74726163745461736B',X'31366663373365632D626366622D313165642D383735632D656533626362626332633363',X'31366663653931662D626366622D313165642D383735632D656533626362626332633363',NULL,NULL,NULL,NULL,NULL,X'E68F90E4BAA4E59088E5908C',NULL,NULL,NULL,X'61646D696E','2023-03-07 23:16:52.688',NULL,'2023-03-07 23:16:52.773',85,NULL,50,NULL,NULL,NULL,X'','2023-03-07 23:16:52.773'),
	(X'31373063656562632D626366622D313165642D383735632D656533626362626332633363',2,X'7469656E6368696E5F636F6E74726163745F617070726F76653A313A66666261616433642D623562372D313165642D393664652D633635616363336536383465',NULL,X'7369642D31343432433237412D303233452D344146332D423942352D463533384533353337303342',X'31366663373365632D626366622D313165642D383735632D656533626362626332633363',X'31366663653931662D626366622D313165642D383735632D656533626362626332633363',NULL,NULL,NULL,NULL,NULL,X'E59088E5908CE5AEA1E689B9',NULL,NULL,NULL,X'7A68616E6773616E','2023-03-07 23:16:52.789',NULL,'2023-03-09 21:38:37.326',166904537,NULL,50,NULL,NULL,NULL,X'','2023-03-09 21:38:37.326'),
	(X'32653537383166352D623562382D313165642D393664652D633635616363336536383465',2,X'7469656E6368696E5F636F6E74726163745F617070726F76653A313A66666261616433642D623562372D313165642D393664652D633635616363336536383465',NULL,X'7375626D6974436F6E74726163745461736B',X'32653533336332652D623562382D313165642D393664652D633635616363336536383465',X'32653533623136312D623562382D313165642D393664652D633635616363336536383465',NULL,NULL,NULL,NULL,NULL,X'E68F90E4BAA4E59088E5908C',NULL,NULL,NULL,X'61646D696E','2023-02-26 17:30:17.426',NULL,'2023-02-26 17:30:17.524',98,NULL,50,NULL,NULL,NULL,X'','2023-02-26 17:30:17.524'),
	(X'32653635336439652D623562382D313165642D393664652D633635616363336536383465',2,X'7469656E6368696E5F636F6E74726163745F617070726F76653A313A66666261616433642D623562372D313165642D393664652D633635616363336536383465',NULL,X'7369642D31343432433237412D303233452D344146332D423942352D463533384533353337303342',X'32653533336332652D623562382D313165642D393664652D633635616363336536383465',X'32653533623136312D623562382D313165642D393664652D633635616363336536383465',NULL,NULL,NULL,NULL,NULL,X'E59088E5908CE5AEA1E689B9',NULL,NULL,NULL,X'7A68616E6773616E','2023-02-26 17:30:17.534',NULL,'2023-03-07 22:44:52.667',796475133,NULL,50,NULL,NULL,NULL,X'','2023-03-07 22:44:52.667'),
	(X'36303562313830622D626234612D313165642D383763372D633635616363336536383465',2,X'7469656E6368696E5F636F6E74726163745F617070726F76653A313A66666261616433642D623562372D313165642D393664652D633635616363336536383465',NULL,X'7375626D6974436F6E74726163745461736B',X'36303536333630342D626234612D313165642D383763372D633635616363336536383465',X'36303536643234372D626234612D313165642D383763372D633635616363336536383465',NULL,NULL,NULL,NULL,NULL,X'E68F90E4BAA4E59088E5908C',NULL,NULL,NULL,X'61646D696E','2023-03-05 19:39:23.669',NULL,'2023-03-05 19:39:23.782',113,NULL,50,NULL,NULL,NULL,X'','2023-03-05 19:39:23.782'),
	(X'36303662623965342D626234612D313165642D383763372D633635616363336536383465',2,X'7469656E6368696E5F636F6E74726163745F617070726F76653A313A66666261616433642D623562372D313165642D393664652D633635616363336536383465',NULL,X'7369642D31343432433237412D303233452D344146332D423942352D463533384533353337303342',X'36303536333630342D626234612D313165642D383763372D633635616363336536383465',X'36303536643234372D626234612D313165642D383763372D633635616363336536383465',NULL,NULL,NULL,NULL,NULL,X'E59088E5908CE5AEA1E689B9',NULL,NULL,NULL,X'7A68616E6773616E','2023-03-05 19:39:23.799',NULL,'2023-03-07 22:44:47.351',183923552,NULL,50,NULL,NULL,NULL,X'','2023-03-07 22:44:47.351'),
	(X'39623665353833632D626366362D313165642D623633362D633635616363336536383465',2,X'7469656E6368696E5F636F6E74726163745F617070726F76653A313A66666261616433642D623562372D313165642D393664652D633635616363336536383465',NULL,X'7375626D6974436F6E74726163745461736B',X'36303536333630342D626234612D313165642D383763372D633635616363336536383465',X'36303536643234372D626234612D313165642D383763372D633635616363336536383465',NULL,NULL,NULL,NULL,NULL,X'E68F90E4BAA4E59088E5908C',NULL,NULL,NULL,X'61646D696E','2023-03-07 22:44:47.402',NULL,'2023-03-09 22:29:32.102',171884700,NULL,50,NULL,NULL,NULL,X'','2023-03-09 22:29:32.102'),
	(X'63656237326562382D626538362D313165642D613730392D356161333737323439343364',2,X'7469656E6368696E5F636F6E74726163745F617070726F76653A313A66666261616433642D623562372D313165642D393664652D633635616363336536383465',NULL,X'7369642D31343432433237412D303233452D344146332D423942352D463533384533353337303342',X'36303536333630342D626234612D313165642D383763372D633635616363336536383465',X'36303536643234372D626234612D313165642D383763372D633635616363336536383465',NULL,NULL,NULL,NULL,NULL,X'E59088E5908CE5AEA1E689B9',NULL,NULL,NULL,X'7A68616E6773616E','2023-03-09 22:29:32.121',NULL,'2023-03-09 22:54:09.488',1477367,NULL,50,NULL,NULL,NULL,X'','2023-03-09 22:54:09.488');

/*!40000 ALTER TABLE `ACT_HI_TASKINST` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table ACT_HI_TSK_LOG
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ACT_HI_TSK_LOG`;

CREATE TABLE `ACT_HI_TSK_LOG` (
  `ID_` bigint NOT NULL AUTO_INCREMENT,
  `TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TIME_STAMP_` timestamp(3) NOT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DATA_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;



# Dump of table ACT_HI_VARINST
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ACT_HI_VARINST`;

CREATE TABLE `ACT_HI_VARINST` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT '1',
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` datetime(3) DEFAULT NULL,
  `LAST_UPDATED_TIME_` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_PROCVAR_NAME_TYPE` (`NAME_`,`VAR_TYPE_`),
  KEY `ACT_IDX_HI_VAR_SCOPE_ID_TYPE` (`SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_HI_VAR_SUB_ID_TYPE` (`SUB_SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_HI_PROCVAR_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_PROCVAR_TASK_ID` (`TASK_ID_`),
  KEY `ACT_IDX_HI_PROCVAR_EXE` (`EXECUTION_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;

LOCK TABLES `ACT_HI_VARINST` WRITE;
/*!40000 ALTER TABLE `ACT_HI_VARINST` DISABLE KEYS */;

INSERT INTO `ACT_HI_VARINST` (`ID_`, `REV_`, `PROC_INST_ID_`, `EXECUTION_ID_`, `TASK_ID_`, `NAME_`, `VAR_TYPE_`, `SCOPE_ID_`, `SUB_SCOPE_ID_`, `SCOPE_TYPE_`, `BYTEARRAY_ID_`, `DOUBLE_`, `LONG_`, `TEXT_`, `TEXT2_`, `CREATE_TIME_`, `LAST_UPDATED_TIME_`)
VALUES
	(X'31366663633230652D626366622D313165642D383735632D656533626362626332633363',0,X'31366663373365632D626366622D313165642D383735632D656533626362626332633363',X'31366663373365632D626366622D313165642D383735632D656533626362626332633363',NULL,X'63757272656E7455736572',X'737472696E67',NULL,NULL,NULL,NULL,NULL,NULL,X'61646D696E',NULL,'2023-03-07 23:16:52.684','2023-03-07 23:16:52.684'),
	(X'31373061303838362D626366622D313165642D383735632D656533626362626332633363',0,X'31366663373365632D626366622D313165642D383735632D656533626362626332633363',X'31366663373365632D626366622D313165642D383735632D656533626362626332633363',NULL,X'636F6E74726163744964',X'696E7465676572',NULL,NULL,NULL,NULL,NULL,13,X'3133',NULL,'2023-03-07 23:16:52.770','2023-03-07 23:16:52.770'),
	(X'31373061303838372D626366622D313165642D383735632D656533626362626332633363',0,X'31366663373365632D626366622D313165642D383735632D656533626362626332633363',X'31366663373365632D626366622D313165642D383735632D656533626362626332633363',NULL,X'617070726F766555736572',X'737472696E67',NULL,NULL,NULL,NULL,NULL,NULL,X'7A68616E6773616E',NULL,'2023-03-07 23:16:52.770','2023-03-07 23:16:52.770'),
	(X'31373061303838382D626366622D313165642D383735632D656533626362626332633363',0,X'31366663373365632D626366622D313165642D383735632D656533626362626332633363',X'31366663373365632D626366622D313165642D383735632D656533626362626332633363',NULL,X'617070726F7665557365724964',X'696E7465676572',NULL,NULL,NULL,NULL,NULL,3,X'33',NULL,'2023-03-07 23:16:52.770','2023-03-07 23:16:52.770'),
	(X'32653533363334302D623562382D313165642D393664652D633635616363336536383465',0,X'32653533336332652D623562382D313165642D393664652D633635616363336536383465',X'32653533336332652D623562382D313165642D393664652D633635616363336536383465',NULL,X'63757272656E7455736572',X'737472696E67',NULL,NULL,NULL,NULL,NULL,NULL,X'61646D696E',NULL,'2023-02-26 17:30:17.420','2023-02-26 17:30:17.420'),
	(X'32653633343163382D623562382D313165642D393664652D633635616363336536383465',0,X'32653533336332652D623562382D313165642D393664652D633635616363336536383465',X'32653533336332652D623562382D313165642D393664652D633635616363336536383465',NULL,X'636F6E74726163744964',X'696E7465676572',NULL,NULL,NULL,NULL,NULL,7,X'37',NULL,'2023-02-26 17:30:17.522','2023-02-26 17:30:17.522'),
	(X'32653633343163392D623562382D313165642D393664652D633635616363336536383465',0,X'32653533336332652D623562382D313165642D393664652D633635616363336536383465',X'32653533336332652D623562382D313165642D393664652D633635616363336536383465',NULL,X'617070726F766555736572',X'737472696E67',NULL,NULL,NULL,NULL,NULL,NULL,X'7A68616E6773616E',NULL,'2023-02-26 17:30:17.522','2023-02-26 17:30:17.522'),
	(X'32653633343163612D623562382D313165642D393664652D633635616363336536383465',0,X'32653533336332652D623562382D313165642D393664652D633635616363336536383465',X'32653533336332652D623562382D313165642D393664652D633635616363336536383465',NULL,X'617070726F7665557365724964',X'696E7465676572',NULL,NULL,NULL,NULL,NULL,3,X'33',NULL,'2023-02-26 17:30:17.522','2023-02-26 17:30:17.522'),
	(X'36303536383432362D626234612D313165642D383763372D633635616363336536383465',1,X'36303536333630342D626234612D313165642D383763372D633635616363336536383465',X'36303536333630342D626234612D313165642D383763372D633635616363336536383465',NULL,X'63757272656E7455736572',X'737472696E67',NULL,NULL,NULL,NULL,NULL,NULL,X'61646D696E',NULL,'2023-03-05 19:39:23.663','2023-03-09 22:29:32.091'),
	(X'36303638383538652D626234612D313165642D383763372D633635616363336536383465',1,X'36303536333630342D626234612D313165642D383763372D633635616363336536383465',X'36303536333630342D626234612D313165642D383763372D633635616363336536383465',NULL,X'636F6E74726163744964',X'696E7465676572',NULL,NULL,NULL,NULL,NULL,8,X'38',NULL,'2023-03-05 19:39:23.779','2023-03-09 22:29:32.093'),
	(X'36303638383538662D626234612D313165642D383763372D633635616363336536383465',1,X'36303536333630342D626234612D313165642D383763372D633635616363336536383465',X'36303536333630342D626234612D313165642D383763372D633635616363336536383465',NULL,X'617070726F766555736572',X'737472696E67',NULL,NULL,NULL,NULL,NULL,NULL,X'7A68616E6773616E',NULL,'2023-03-05 19:39:23.779','2023-03-09 22:29:32.094'),
	(X'36303638383539302D626234612D313165642D383763372D633635616363336536383465',1,X'36303536333630342D626234612D313165642D383763372D633635616363336536383465',X'36303536333630342D626234612D313165642D383763372D633635616363336536383465',NULL,X'617070726F7665557365724964',X'696E7465676572',NULL,NULL,NULL,NULL,NULL,3,X'33',NULL,'2023-03-05 19:39:23.779','2023-03-09 22:29:32.096'),
	(X'39623635303936352D626366362D313165642D623633362D633635616363336536383465',1,X'36303536333630342D626234612D313165642D383763372D633635616363336536383465',X'36303536333630342D626234612D313165642D383763372D633635616363336536383465',NULL,X'726561736F6E',X'737472696E67',NULL,NULL,NULL,NULL,NULL,NULL,X'E59088E5908CE5AE9AE4BBB7E5A4AAE4BD8EEFBC8CE4B88DE59088E98082',NULL,'2023-03-07 22:44:47.345','2023-03-09 22:54:09.478'),
	(X'39623635376539362D626366362D313165642D623633362D633635616363336536383465',1,X'36303536333630342D626234612D313165642D383763372D633635616363336536383465',X'36303536333630342D626234612D313165642D383763372D633635616363336536383465',NULL,X'617070726F7665',X'626F6F6C65616E',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,'2023-03-07 22:44:47.345','2023-03-09 22:54:09.481'),
	(X'39653931316330652D626366362D313165642D623633362D633635616363336536383465',0,X'32653533336332652D623562382D313165642D393664652D633635616363336536383465',X'32653533336332652D623562382D313165642D393664652D633635616363336536383465',NULL,X'726561736F6E',X'6E756C6C',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2023-03-07 22:44:52.664','2023-03-07 22:44:52.664'),
	(X'39653931316330662D626366362D313165642D623633362D633635616363336536383465',0,X'32653533336332652D623562382D313165642D393664652D633635616363336536383465',X'32653533336332652D623562382D313165642D393664652D633635616363336536383465',NULL,X'617070726F7665',X'626F6F6C65616E',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,'2023-03-07 22:44:52.664','2023-03-07 22:44:52.664'),
	(X'62316536376438612D626537662D313165642D626632312D356161333737323439343364',0,X'31366663373365632D626366622D313165642D383735632D656533626362626332633363',X'31366663373365632D626366622D313165642D383735632D656533626362626332633363',NULL,X'726561736F6E',X'6E756C6C',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2023-03-09 21:38:37.320','2023-03-09 21:38:37.320'),
	(X'62316537343064622D626537662D313165642D626632312D356161333737323439343364',0,X'31366663373365632D626366622D313165642D383735632D656533626362626332633363',X'31366663373365632D626366622D313165642D383735632D656533626362626332633363',NULL,X'617070726F7665',X'626F6F6C65616E',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,'2023-03-09 21:38:37.320','2023-03-09 21:38:37.320');

/*!40000 ALTER TABLE `ACT_HI_VARINST` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table ACT_ID_BYTEARRAY
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ACT_ID_BYTEARRAY`;

CREATE TABLE `ACT_ID_BYTEARRAY` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `BYTES_` longblob,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;



# Dump of table ACT_ID_GROUP
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ACT_ID_GROUP`;

CREATE TABLE `ACT_ID_GROUP` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;



# Dump of table ACT_ID_INFO
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ACT_ID_INFO`;

CREATE TABLE `ACT_ID_INFO` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `USER_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `VALUE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PASSWORD_` longblob,
  `PARENT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;



# Dump of table ACT_ID_MEMBERSHIP
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ACT_ID_MEMBERSHIP`;

CREATE TABLE `ACT_ID_MEMBERSHIP` (
  `USER_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `GROUP_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`USER_ID_`,`GROUP_ID_`),
  KEY `ACT_FK_MEMB_GROUP` (`GROUP_ID_`),
  CONSTRAINT `ACT_FK_MEMB_GROUP` FOREIGN KEY (`GROUP_ID_`) REFERENCES `ACT_ID_GROUP` (`ID_`),
  CONSTRAINT `ACT_FK_MEMB_USER` FOREIGN KEY (`USER_ID_`) REFERENCES `ACT_ID_USER` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;



# Dump of table ACT_ID_PRIV
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ACT_ID_PRIV`;

CREATE TABLE `ACT_ID_PRIV` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_UNIQ_PRIV_NAME` (`NAME_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;



# Dump of table ACT_ID_PRIV_MAPPING
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ACT_ID_PRIV_MAPPING`;

CREATE TABLE `ACT_ID_PRIV_MAPPING` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PRIV_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_PRIV_MAPPING` (`PRIV_ID_`),
  KEY `ACT_IDX_PRIV_USER` (`USER_ID_`),
  KEY `ACT_IDX_PRIV_GROUP` (`GROUP_ID_`),
  CONSTRAINT `ACT_FK_PRIV_MAPPING` FOREIGN KEY (`PRIV_ID_`) REFERENCES `ACT_ID_PRIV` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;



# Dump of table ACT_ID_PROPERTY
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ACT_ID_PROPERTY`;

CREATE TABLE `ACT_ID_PROPERTY` (
  `NAME_` varchar(64) COLLATE utf8_bin NOT NULL,
  `VALUE_` varchar(300) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int DEFAULT NULL,
  PRIMARY KEY (`NAME_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;

LOCK TABLES `ACT_ID_PROPERTY` WRITE;
/*!40000 ALTER TABLE `ACT_ID_PROPERTY` DISABLE KEYS */;

INSERT INTO `ACT_ID_PROPERTY` (`NAME_`, `VALUE_`, `REV_`)
VALUES
	(X'736368656D612E76657273696F6E',X'362E372E322E30',1);

/*!40000 ALTER TABLE `ACT_ID_PROPERTY` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table ACT_ID_TOKEN
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ACT_ID_TOKEN`;

CREATE TABLE `ACT_ID_TOKEN` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `TOKEN_VALUE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TOKEN_DATE_` timestamp(3) NULL DEFAULT NULL,
  `IP_ADDRESS_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_AGENT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TOKEN_DATA_` varchar(2000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;



# Dump of table ACT_ID_USER
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ACT_ID_USER`;

CREATE TABLE `ACT_ID_USER` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `FIRST_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LAST_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DISPLAY_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EMAIL_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PWD_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PICTURE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;



# Dump of table ACT_PROCDEF_INFO
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ACT_PROCDEF_INFO`;

CREATE TABLE `ACT_PROCDEF_INFO` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `INFO_JSON_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_UNIQ_INFO_PROCDEF` (`PROC_DEF_ID_`),
  KEY `ACT_IDX_INFO_PROCDEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_INFO_JSON_BA` (`INFO_JSON_ID_`),
  CONSTRAINT `ACT_FK_INFO_JSON_BA` FOREIGN KEY (`INFO_JSON_ID_`) REFERENCES `ACT_GE_BYTEARRAY` (`ID_`),
  CONSTRAINT `ACT_FK_INFO_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `ACT_RE_PROCDEF` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;



# Dump of table ACT_RE_DEPLOYMENT
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ACT_RE_DEPLOYMENT`;

CREATE TABLE `ACT_RE_DEPLOYMENT` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `DEPLOY_TIME_` timestamp(3) NULL DEFAULT NULL,
  `DERIVED_FROM_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DERIVED_FROM_ROOT_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_DEPLOYMENT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ENGINE_VERSION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;

LOCK TABLES `ACT_RE_DEPLOYMENT` WRITE;
/*!40000 ALTER TABLE `ACT_RE_DEPLOYMENT` DISABLE KEYS */;

INSERT INTO `ACT_RE_DEPLOYMENT` (`ID_`, `NAME_`, `CATEGORY_`, `KEY_`, `TENANT_ID_`, `DEPLOY_TIME_`, `DERIVED_FROM_`, `DERIVED_FROM_ROOT_`, `PARENT_DEPLOYMENT_ID_`, `ENGINE_VERSION_`)
VALUES
	(X'66656535306462612D623562372D313165642D393664652D633635616363336536383465',X'537072696E67426F6F744175746F4465706C6F796D656E74',NULL,NULL,X'','2023-02-26 17:28:57.838',NULL,NULL,X'66656535306462612D623562372D313165642D393664652D633635616363336536383465',NULL);

/*!40000 ALTER TABLE `ACT_RE_DEPLOYMENT` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table ACT_RE_MODEL
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ACT_RE_MODEL`;

CREATE TABLE `ACT_RE_MODEL` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LAST_UPDATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `VERSION_` int DEFAULT NULL,
  `META_INFO_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EDITOR_SOURCE_VALUE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EDITOR_SOURCE_EXTRA_VALUE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_MODEL_SOURCE` (`EDITOR_SOURCE_VALUE_ID_`),
  KEY `ACT_FK_MODEL_SOURCE_EXTRA` (`EDITOR_SOURCE_EXTRA_VALUE_ID_`),
  KEY `ACT_FK_MODEL_DEPLOYMENT` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_MODEL_DEPLOYMENT` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `ACT_RE_DEPLOYMENT` (`ID_`),
  CONSTRAINT `ACT_FK_MODEL_SOURCE` FOREIGN KEY (`EDITOR_SOURCE_VALUE_ID_`) REFERENCES `ACT_GE_BYTEARRAY` (`ID_`),
  CONSTRAINT `ACT_FK_MODEL_SOURCE_EXTRA` FOREIGN KEY (`EDITOR_SOURCE_EXTRA_VALUE_ID_`) REFERENCES `ACT_GE_BYTEARRAY` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;



# Dump of table ACT_RE_PROCDEF
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ACT_RE_PROCDEF`;

CREATE TABLE `ACT_RE_PROCDEF` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VERSION_` int NOT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DGRM_RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `HAS_START_FORM_KEY_` tinyint DEFAULT NULL,
  `HAS_GRAPHICAL_NOTATION_` tinyint DEFAULT NULL,
  `SUSPENSION_STATE_` int DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `ENGINE_VERSION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DERIVED_FROM_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DERIVED_FROM_ROOT_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DERIVED_VERSION_` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_UNIQ_PROCDEF` (`KEY_`,`VERSION_`,`DERIVED_VERSION_`,`TENANT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;

LOCK TABLES `ACT_RE_PROCDEF` WRITE;
/*!40000 ALTER TABLE `ACT_RE_PROCDEF` DISABLE KEYS */;

INSERT INTO `ACT_RE_PROCDEF` (`ID_`, `REV_`, `CATEGORY_`, `NAME_`, `KEY_`, `VERSION_`, `DEPLOYMENT_ID_`, `RESOURCE_NAME_`, `DGRM_RESOURCE_NAME_`, `DESCRIPTION_`, `HAS_START_FORM_KEY_`, `HAS_GRAPHICAL_NOTATION_`, `SUSPENSION_STATE_`, `TENANT_ID_`, `ENGINE_VERSION_`, `DERIVED_FROM_`, `DERIVED_FROM_ROOT_`, `DERIVED_VERSION_`)
VALUES
	(X'7469656E6368696E5F636F6E74726163745F617070726F76653A313A66666261616433642D623562372D313165642D393664652D633635616363336536383465',1,X'687474703A2F2F7777772E666C6F7761626C652E6F72672F70726F63657373646566',X'5469656E4368696EE9A1B9E79BAEE59088E5908CE5AEA1E689B9E6B581E7A88B',X'7469656E6368696E5F636F6E74726163745F617070726F7665',1,X'66656535306462612D623562372D313165642D393664652D633635616363336536383465',X'2F55736572732F73616E672F776F726B73706163652F7469656E6368696E2D766964656F2F636F64652F7469656E6368696E2F7469656E6368696E2D61646D696E2F7461726765742F636C61737365732F70726F6365737365732F7469656E6368696E5F636F6E74726163745F617070726F76655F70726F636573732E62706D6E32302E786D6C',X'2F55736572732F73616E672F776F726B73706163652F7469656E6368696E2D766964656F2F636F64652F7469656E6368696E2F7469656E6368696E2D61646D696E2F7461726765742F636C61737365732F70726F6365737365732F7469656E6368696E5F636F6E74726163745F617070726F76655F70726F636573732E7469656E6368696E5F636F6E74726163745F617070726F76652E706E67',NULL,0,1,1,X'',NULL,NULL,NULL,0);

/*!40000 ALTER TABLE `ACT_RE_PROCDEF` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table ACT_RU_ACTINST
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ACT_RU_ACTINST`;

CREATE TABLE `ACT_RU_ACTINST` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT '1',
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin NOT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CALL_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ACT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint DEFAULT NULL,
  `TRANSACTION_ORDER_` int DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_RU_ACTI_START` (`START_TIME_`),
  KEY `ACT_IDX_RU_ACTI_END` (`END_TIME_`),
  KEY `ACT_IDX_RU_ACTI_PROC` (`PROC_INST_ID_`),
  KEY `ACT_IDX_RU_ACTI_PROC_ACT` (`PROC_INST_ID_`,`ACT_ID_`),
  KEY `ACT_IDX_RU_ACTI_EXEC` (`EXECUTION_ID_`),
  KEY `ACT_IDX_RU_ACTI_EXEC_ACT` (`EXECUTION_ID_`,`ACT_ID_`),
  KEY `ACT_IDX_RU_ACTI_TASK` (`TASK_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;



# Dump of table ACT_RU_DEADLETTER_JOB
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ACT_RU_DEADLETTER_JOB`;

CREATE TABLE `ACT_RU_DEADLETTER_JOB` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ELEMENT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ELEMENT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CORRELATION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CUSTOM_VALUES_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_DEADLETTER_JOB_EXCEPTION_STACK_ID` (`EXCEPTION_STACK_ID_`),
  KEY `ACT_IDX_DEADLETTER_JOB_CUSTOM_VALUES_ID` (`CUSTOM_VALUES_ID_`),
  KEY `ACT_IDX_DEADLETTER_JOB_CORRELATION_ID` (`CORRELATION_ID_`),
  KEY `ACT_IDX_DJOB_SCOPE` (`SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_DJOB_SUB_SCOPE` (`SUB_SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_DJOB_SCOPE_DEF` (`SCOPE_DEFINITION_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_FK_DEADLETTER_JOB_EXECUTION` (`EXECUTION_ID_`),
  KEY `ACT_FK_DEADLETTER_JOB_PROCESS_INSTANCE` (`PROCESS_INSTANCE_ID_`),
  KEY `ACT_FK_DEADLETTER_JOB_PROC_DEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_CUSTOM_VALUES` FOREIGN KEY (`CUSTOM_VALUES_ID_`) REFERENCES `ACT_GE_BYTEARRAY` (`ID_`),
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `ACT_GE_BYTEARRAY` (`ID_`),
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`),
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `ACT_RE_PROCDEF` (`ID_`),
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;



# Dump of table ACT_RU_ENTITYLINK
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ACT_RU_ENTITYLINK`;

CREATE TABLE `ACT_RU_ENTITYLINK` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `CREATE_TIME_` datetime(3) DEFAULT NULL,
  `LINK_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_ELEMENT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REF_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REF_SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REF_SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ROOT_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ROOT_SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HIERARCHY_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_ENT_LNK_SCOPE` (`SCOPE_ID_`,`SCOPE_TYPE_`,`LINK_TYPE_`),
  KEY `ACT_IDX_ENT_LNK_REF_SCOPE` (`REF_SCOPE_ID_`,`REF_SCOPE_TYPE_`,`LINK_TYPE_`),
  KEY `ACT_IDX_ENT_LNK_ROOT_SCOPE` (`ROOT_SCOPE_ID_`,`ROOT_SCOPE_TYPE_`,`LINK_TYPE_`),
  KEY `ACT_IDX_ENT_LNK_SCOPE_DEF` (`SCOPE_DEFINITION_ID_`,`SCOPE_TYPE_`,`LINK_TYPE_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;



# Dump of table ACT_RU_EVENT_SUBSCR
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ACT_RU_EVENT_SUBSCR`;

CREATE TABLE `ACT_RU_EVENT_SUBSCR` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `EVENT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EVENT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACTIVITY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CONFIGURATION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATED_` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_EVENT_SUBSCR_CONFIG_` (`CONFIGURATION_`),
  KEY `ACT_FK_EVENT_EXEC` (`EXECUTION_ID_`),
  CONSTRAINT `ACT_FK_EVENT_EXEC` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;



# Dump of table ACT_RU_EXECUTION
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ACT_RU_EXECUTION`;

CREATE TABLE `ACT_RU_EXECUTION` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SUPER_EXEC_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ROOT_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `IS_ACTIVE_` tinyint DEFAULT NULL,
  `IS_CONCURRENT_` tinyint DEFAULT NULL,
  `IS_SCOPE_` tinyint DEFAULT NULL,
  `IS_EVENT_SCOPE_` tinyint DEFAULT NULL,
  `IS_MI_ROOT_` tinyint DEFAULT NULL,
  `SUSPENSION_STATE_` int DEFAULT NULL,
  `CACHED_ENT_STATE_` int DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime(3) DEFAULT NULL,
  `START_USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LOCK_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `IS_COUNT_ENABLED_` tinyint DEFAULT NULL,
  `EVT_SUBSCR_COUNT_` int DEFAULT NULL,
  `TASK_COUNT_` int DEFAULT NULL,
  `JOB_COUNT_` int DEFAULT NULL,
  `TIMER_JOB_COUNT_` int DEFAULT NULL,
  `SUSP_JOB_COUNT_` int DEFAULT NULL,
  `DEADLETTER_JOB_COUNT_` int DEFAULT NULL,
  `EXTERNAL_WORKER_JOB_COUNT_` int DEFAULT NULL,
  `VAR_COUNT_` int DEFAULT NULL,
  `ID_LINK_COUNT_` int DEFAULT NULL,
  `CALLBACK_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CALLBACK_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REFERENCE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REFERENCE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROPAGATED_STAGE_INST_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `BUSINESS_STATUS_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_EXEC_BUSKEY` (`BUSINESS_KEY_`),
  KEY `ACT_IDC_EXEC_ROOT` (`ROOT_PROC_INST_ID_`),
  KEY `ACT_IDX_EXEC_REF_ID_` (`REFERENCE_ID_`),
  KEY `ACT_FK_EXE_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_EXE_PARENT` (`PARENT_ID_`),
  KEY `ACT_FK_EXE_SUPER` (`SUPER_EXEC_`),
  KEY `ACT_FK_EXE_PROCDEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_EXE_PARENT` FOREIGN KEY (`PARENT_ID_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`) ON DELETE CASCADE,
  CONSTRAINT `ACT_FK_EXE_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `ACT_RE_PROCDEF` (`ID_`),
  CONSTRAINT `ACT_FK_EXE_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ACT_FK_EXE_SUPER` FOREIGN KEY (`SUPER_EXEC_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;



# Dump of table ACT_RU_EXTERNAL_JOB
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ACT_RU_EXTERNAL_JOB`;

CREATE TABLE `ACT_RU_EXTERNAL_JOB` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `LOCK_EXP_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ELEMENT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ELEMENT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CORRELATION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CUSTOM_VALUES_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_EXTERNAL_JOB_EXCEPTION_STACK_ID` (`EXCEPTION_STACK_ID_`),
  KEY `ACT_IDX_EXTERNAL_JOB_CUSTOM_VALUES_ID` (`CUSTOM_VALUES_ID_`),
  KEY `ACT_IDX_EXTERNAL_JOB_CORRELATION_ID` (`CORRELATION_ID_`),
  KEY `ACT_IDX_EJOB_SCOPE` (`SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_EJOB_SUB_SCOPE` (`SUB_SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_EJOB_SCOPE_DEF` (`SCOPE_DEFINITION_ID_`,`SCOPE_TYPE_`),
  CONSTRAINT `ACT_FK_EXTERNAL_JOB_CUSTOM_VALUES` FOREIGN KEY (`CUSTOM_VALUES_ID_`) REFERENCES `ACT_GE_BYTEARRAY` (`ID_`),
  CONSTRAINT `ACT_FK_EXTERNAL_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `ACT_GE_BYTEARRAY` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;



# Dump of table ACT_RU_HISTORY_JOB
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ACT_RU_HISTORY_JOB`;

CREATE TABLE `ACT_RU_HISTORY_JOB` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `LOCK_EXP_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CUSTOM_VALUES_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ADV_HANDLER_CFG_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;



# Dump of table ACT_RU_IDENTITYLINK
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ACT_RU_IDENTITYLINK`;

CREATE TABLE `ACT_RU_IDENTITYLINK` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_IDENT_LNK_USER` (`USER_ID_`),
  KEY `ACT_IDX_IDENT_LNK_GROUP` (`GROUP_ID_`),
  KEY `ACT_IDX_IDENT_LNK_SCOPE` (`SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_IDENT_LNK_SUB_SCOPE` (`SUB_SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_IDENT_LNK_SCOPE_DEF` (`SCOPE_DEFINITION_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_ATHRZ_PROCEDEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_TSKASS_TASK` (`TASK_ID_`),
  KEY `ACT_FK_IDL_PROCINST` (`PROC_INST_ID_`),
  CONSTRAINT `ACT_FK_ATHRZ_PROCEDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `ACT_RE_PROCDEF` (`ID_`),
  CONSTRAINT `ACT_FK_IDL_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`),
  CONSTRAINT `ACT_FK_TSKASS_TASK` FOREIGN KEY (`TASK_ID_`) REFERENCES `ACT_RU_TASK` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;



# Dump of table ACT_RU_JOB
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ACT_RU_JOB`;

CREATE TABLE `ACT_RU_JOB` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `LOCK_EXP_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ELEMENT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ELEMENT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CORRELATION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CUSTOM_VALUES_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_JOB_EXCEPTION_STACK_ID` (`EXCEPTION_STACK_ID_`),
  KEY `ACT_IDX_JOB_CUSTOM_VALUES_ID` (`CUSTOM_VALUES_ID_`),
  KEY `ACT_IDX_JOB_CORRELATION_ID` (`CORRELATION_ID_`),
  KEY `ACT_IDX_JOB_SCOPE` (`SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_JOB_SUB_SCOPE` (`SUB_SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_JOB_SCOPE_DEF` (`SCOPE_DEFINITION_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_FK_JOB_EXECUTION` (`EXECUTION_ID_`),
  KEY `ACT_FK_JOB_PROCESS_INSTANCE` (`PROCESS_INSTANCE_ID_`),
  KEY `ACT_FK_JOB_PROC_DEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_JOB_CUSTOM_VALUES` FOREIGN KEY (`CUSTOM_VALUES_ID_`) REFERENCES `ACT_GE_BYTEARRAY` (`ID_`),
  CONSTRAINT `ACT_FK_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `ACT_GE_BYTEARRAY` (`ID_`),
  CONSTRAINT `ACT_FK_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`),
  CONSTRAINT `ACT_FK_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `ACT_RE_PROCDEF` (`ID_`),
  CONSTRAINT `ACT_FK_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;



# Dump of table ACT_RU_SUSPENDED_JOB
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ACT_RU_SUSPENDED_JOB`;

CREATE TABLE `ACT_RU_SUSPENDED_JOB` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ELEMENT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ELEMENT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CORRELATION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CUSTOM_VALUES_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_SUSPENDED_JOB_EXCEPTION_STACK_ID` (`EXCEPTION_STACK_ID_`),
  KEY `ACT_IDX_SUSPENDED_JOB_CUSTOM_VALUES_ID` (`CUSTOM_VALUES_ID_`),
  KEY `ACT_IDX_SUSPENDED_JOB_CORRELATION_ID` (`CORRELATION_ID_`),
  KEY `ACT_IDX_SJOB_SCOPE` (`SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_SJOB_SUB_SCOPE` (`SUB_SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_SJOB_SCOPE_DEF` (`SCOPE_DEFINITION_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_FK_SUSPENDED_JOB_EXECUTION` (`EXECUTION_ID_`),
  KEY `ACT_FK_SUSPENDED_JOB_PROCESS_INSTANCE` (`PROCESS_INSTANCE_ID_`),
  KEY `ACT_FK_SUSPENDED_JOB_PROC_DEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_CUSTOM_VALUES` FOREIGN KEY (`CUSTOM_VALUES_ID_`) REFERENCES `ACT_GE_BYTEARRAY` (`ID_`),
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `ACT_GE_BYTEARRAY` (`ID_`),
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`),
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `ACT_RE_PROCDEF` (`ID_`),
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;



# Dump of table ACT_RU_TASK
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ACT_RU_TASK`;

CREATE TABLE `ACT_RU_TASK` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROPAGATED_STAGE_INST_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DELEGATION_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY_` int DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `DUE_DATE_` datetime(3) DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUSPENSION_STATE_` int DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `FORM_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CLAIM_TIME_` datetime(3) DEFAULT NULL,
  `IS_COUNT_ENABLED_` tinyint DEFAULT NULL,
  `VAR_COUNT_` int DEFAULT NULL,
  `ID_LINK_COUNT_` int DEFAULT NULL,
  `SUB_TASK_COUNT_` int DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_TASK_CREATE` (`CREATE_TIME_`),
  KEY `ACT_IDX_TASK_SCOPE` (`SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_TASK_SUB_SCOPE` (`SUB_SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_TASK_SCOPE_DEF` (`SCOPE_DEFINITION_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_FK_TASK_EXE` (`EXECUTION_ID_`),
  KEY `ACT_FK_TASK_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_TASK_PROCDEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_TASK_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`),
  CONSTRAINT `ACT_FK_TASK_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `ACT_RE_PROCDEF` (`ID_`),
  CONSTRAINT `ACT_FK_TASK_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;



# Dump of table ACT_RU_TIMER_JOB
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ACT_RU_TIMER_JOB`;

CREATE TABLE `ACT_RU_TIMER_JOB` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `LOCK_EXP_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ELEMENT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ELEMENT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CORRELATION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CUSTOM_VALUES_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_TIMER_JOB_EXCEPTION_STACK_ID` (`EXCEPTION_STACK_ID_`),
  KEY `ACT_IDX_TIMER_JOB_CUSTOM_VALUES_ID` (`CUSTOM_VALUES_ID_`),
  KEY `ACT_IDX_TIMER_JOB_CORRELATION_ID` (`CORRELATION_ID_`),
  KEY `ACT_IDX_TIMER_JOB_DUEDATE` (`DUEDATE_`),
  KEY `ACT_IDX_TJOB_SCOPE` (`SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_TJOB_SUB_SCOPE` (`SUB_SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_TJOB_SCOPE_DEF` (`SCOPE_DEFINITION_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_FK_TIMER_JOB_EXECUTION` (`EXECUTION_ID_`),
  KEY `ACT_FK_TIMER_JOB_PROCESS_INSTANCE` (`PROCESS_INSTANCE_ID_`),
  KEY `ACT_FK_TIMER_JOB_PROC_DEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_TIMER_JOB_CUSTOM_VALUES` FOREIGN KEY (`CUSTOM_VALUES_ID_`) REFERENCES `ACT_GE_BYTEARRAY` (`ID_`),
  CONSTRAINT `ACT_FK_TIMER_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `ACT_GE_BYTEARRAY` (`ID_`),
  CONSTRAINT `ACT_FK_TIMER_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`),
  CONSTRAINT `ACT_FK_TIMER_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `ACT_RE_PROCDEF` (`ID_`),
  CONSTRAINT `ACT_FK_TIMER_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;



# Dump of table ACT_RU_VARIABLE
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ACT_RU_VARIABLE`;

CREATE TABLE `ACT_RU_VARIABLE` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_RU_VAR_SCOPE_ID_TYPE` (`SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_RU_VAR_SUB_ID_TYPE` (`SUB_SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_FK_VAR_BYTEARRAY` (`BYTEARRAY_ID_`),
  KEY `ACT_IDX_VARIABLE_TASK_ID` (`TASK_ID_`),
  KEY `ACT_FK_VAR_EXE` (`EXECUTION_ID_`),
  KEY `ACT_FK_VAR_PROCINST` (`PROC_INST_ID_`),
  CONSTRAINT `ACT_FK_VAR_BYTEARRAY` FOREIGN KEY (`BYTEARRAY_ID_`) REFERENCES `ACT_GE_BYTEARRAY` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;



# Dump of table FLW_CHANNEL_DEFINITION
# ------------------------------------------------------------

DROP TABLE IF EXISTS `FLW_CHANNEL_DEFINITION`;

CREATE TABLE `FLW_CHANNEL_DEFINITION` (
  `ID_` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `NAME_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `VERSION_` int DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CREATE_TIME_` datetime(3) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `RESOURCE_NAME_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DESCRIPTION_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `IMPLEMENTATION_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_IDX_CHANNEL_DEF_UNIQ` (`KEY_`,`VERSION_`,`TENANT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table FLW_EV_DATABASECHANGELOG
# ------------------------------------------------------------

DROP TABLE IF EXISTS `FLW_EV_DATABASECHANGELOG`;

CREATE TABLE `FLW_EV_DATABASECHANGELOG` (
  `ID` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `AUTHOR` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `FILENAME` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `ORDEREXECUTED` int NOT NULL,
  `EXECTYPE` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `MD5SUM` varchar(35) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `COMMENTS` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TAG` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LIQUIBASE` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CONTEXTS` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LABELS` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `FLW_EV_DATABASECHANGELOG` WRITE;
/*!40000 ALTER TABLE `FLW_EV_DATABASECHANGELOG` DISABLE KEYS */;

INSERT INTO `FLW_EV_DATABASECHANGELOG` (`ID`, `AUTHOR`, `FILENAME`, `DATEEXECUTED`, `ORDEREXECUTED`, `EXECTYPE`, `MD5SUM`, `DESCRIPTION`, `COMMENTS`, `TAG`, `LIQUIBASE`, `CONTEXTS`, `LABELS`, `DEPLOYMENT_ID`)
VALUES
	('1','flowable','org/flowable/eventregistry/db/liquibase/flowable-eventregistry-db-changelog.xml','2023-02-26 08:02:45',1,'EXECUTED','8:1b0c48c9cf7945be799d868a2626d687','createTable tableName=FLW_EVENT_DEPLOYMENT; createTable tableName=FLW_EVENT_RESOURCE; createTable tableName=FLW_EVENT_DEFINITION; createIndex indexName=ACT_IDX_EVENT_DEF_UNIQ, tableName=FLW_EVENT_DEFINITION; createTable tableName=FLW_CHANNEL_DEFIN...','',NULL,'4.3.5',NULL,NULL,'7398565280'),
	('2','flowable','org/flowable/eventregistry/db/liquibase/flowable-eventregistry-db-changelog.xml','2023-02-26 08:02:45',2,'EXECUTED','8:0ea825feb8e470558f0b5754352b9cda','addColumn tableName=FLW_CHANNEL_DEFINITION; addColumn tableName=FLW_CHANNEL_DEFINITION','',NULL,'4.3.5',NULL,NULL,'7398565280'),
	('3','flowable','org/flowable/eventregistry/db/liquibase/flowable-eventregistry-db-changelog.xml','2023-02-26 08:02:45',3,'EXECUTED','8:3c2bb293350b5cbe6504331980c9dcee','customChange','',NULL,'4.3.5',NULL,NULL,'7398565280');

/*!40000 ALTER TABLE `FLW_EV_DATABASECHANGELOG` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table FLW_EV_DATABASECHANGELOGLOCK
# ------------------------------------------------------------

DROP TABLE IF EXISTS `FLW_EV_DATABASECHANGELOGLOCK`;

CREATE TABLE `FLW_EV_DATABASECHANGELOGLOCK` (
  `ID` int NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime DEFAULT NULL,
  `LOCKEDBY` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `FLW_EV_DATABASECHANGELOGLOCK` WRITE;
/*!40000 ALTER TABLE `FLW_EV_DATABASECHANGELOGLOCK` DISABLE KEYS */;

INSERT INTO `FLW_EV_DATABASECHANGELOGLOCK` (`ID`, `LOCKED`, `LOCKGRANTED`, `LOCKEDBY`)
VALUES
	(1,b'0',NULL,NULL);

/*!40000 ALTER TABLE `FLW_EV_DATABASECHANGELOGLOCK` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table FLW_EVENT_DEFINITION
# ------------------------------------------------------------

DROP TABLE IF EXISTS `FLW_EVENT_DEFINITION`;

CREATE TABLE `FLW_EVENT_DEFINITION` (
  `ID_` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `NAME_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `VERSION_` int DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `RESOURCE_NAME_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DESCRIPTION_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_IDX_EVENT_DEF_UNIQ` (`KEY_`,`VERSION_`,`TENANT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table FLW_EVENT_DEPLOYMENT
# ------------------------------------------------------------

DROP TABLE IF EXISTS `FLW_EVENT_DEPLOYMENT`;

CREATE TABLE `FLW_EVENT_DEPLOYMENT` (
  `ID_` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `NAME_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DEPLOY_TIME_` datetime(3) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PARENT_DEPLOYMENT_ID_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table FLW_EVENT_RESOURCE
# ------------------------------------------------------------

DROP TABLE IF EXISTS `FLW_EVENT_RESOURCE`;

CREATE TABLE `FLW_EVENT_RESOURCE` (
  `ID_` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `NAME_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `RESOURCE_BYTES_` longblob,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table FLW_RU_BATCH
# ------------------------------------------------------------

DROP TABLE IF EXISTS `FLW_RU_BATCH`;

CREATE TABLE `FLW_RU_BATCH` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `TYPE_` varchar(64) COLLATE utf8_bin NOT NULL,
  `SEARCH_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SEARCH_KEY2_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` datetime(3) NOT NULL,
  `COMPLETE_TIME_` datetime(3) DEFAULT NULL,
  `STATUS_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `BATCH_DOC_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;



# Dump of table FLW_RU_BATCH_PART
# ------------------------------------------------------------

DROP TABLE IF EXISTS `FLW_RU_BATCH_PART`;

CREATE TABLE `FLW_RU_BATCH_PART` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `BATCH_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(64) COLLATE utf8_bin NOT NULL,
  `SCOPE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SEARCH_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SEARCH_KEY2_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` datetime(3) NOT NULL,
  `COMPLETE_TIME_` datetime(3) DEFAULT NULL,
  `STATUS_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `RESULT_DOC_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `FLW_IDX_BATCH_PART` (`BATCH_ID_`),
  CONSTRAINT `FLW_FK_BATCH_PART_PARENT` FOREIGN KEY (`BATCH_ID_`) REFERENCES `FLW_RU_BATCH` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;



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
	(127,0,'其他','4','clue_invalidate',NULL,'warning','N','0','admin','2023-01-19 06:47:18','',NULL,NULL),
	(128,0,'已分配','1','business_status',NULL,'primary','N','0','admin','2023-02-05 02:14:06','',NULL,NULL),
	(129,0,'进行中','2','business_status',NULL,'success','N','0','admin','2023-02-05 02:14:19','',NULL,NULL),
	(130,0,'回收','3','business_status',NULL,'info','N','0','admin','2023-02-05 02:14:31','',NULL,NULL),
	(131,0,'无','0','business_occupation',NULL,'default','N','0','admin','2023-02-09 14:31:38','',NULL,NULL),
	(132,0,'技术','1','business_occupation',NULL,'default','N','0','admin','2023-02-09 14:31:45','',NULL,NULL),
	(133,0,'产品','2','business_occupation',NULL,'default','N','0','admin','2023-02-09 14:31:55','',NULL,NULL),
	(134,0,'设计','3','business_occupation',NULL,'default','N','0','admin','2023-02-09 14:32:03','',NULL,NULL),
	(135,0,'运营','4','business_occupation',NULL,'default','N','0','admin','2023-02-09 14:32:10','',NULL,NULL),
	(136,0,'市场','5','business_occupation',NULL,'default','N','0','admin','2023-02-09 14:32:19','',NULL,NULL),
	(137,0,'销售','6','business_occupation',NULL,'default','N','0','admin','2023-02-09 14:32:25','',NULL,NULL),
	(138,0,'小学','0','business_education',NULL,'default','N','0','admin','2023-02-09 14:33:50','',NULL,NULL),
	(139,0,'初中','1','business_education',NULL,'default','N','0','admin','2023-02-09 14:33:56','',NULL,NULL),
	(140,0,'高中','2','business_education',NULL,'default','N','0','admin','2023-02-09 14:34:03','',NULL,NULL),
	(141,0,'中专','3','business_education',NULL,'default','N','0','admin','2023-02-09 14:34:10','',NULL,NULL),
	(142,0,'大专','4','business_education',NULL,'default','N','0','admin','2023-02-09 14:34:15','',NULL,NULL),
	(143,0,'本科','5','business_education',NULL,'default','N','0','admin','2023-02-09 14:34:22','',NULL,NULL),
	(144,0,'研究生','6','business_education',NULL,'default','N','0','admin','2023-02-09 14:34:35','',NULL,NULL),
	(145,0,'博士','7','business_education',NULL,'default','N','0','admin','2023-02-09 14:34:44','',NULL,NULL),
	(146,0,'其他','8','business_education',NULL,'default','N','0','admin','2023-02-09 14:34:51','',NULL,NULL),
	(147,0,'课程','1','business_focus',NULL,'default','N','0','admin','2023-02-09 14:37:47','',NULL,NULL),
	(148,0,'价格','2','business_focus',NULL,'default','N','0','admin','2023-02-09 14:37:53','',NULL,NULL),
	(149,0,'位置','3','business_focus',NULL,'default','N','0','admin','2023-02-09 14:38:01','',NULL,NULL),
	(150,0,'时间','4','business_focus',NULL,'default','N','0','admin','2023-02-09 14:38:10','',NULL,NULL),
	(151,0,'教练','5','business_focus',NULL,'default','N','0','admin','2023-02-09 14:38:18','',NULL,NULL),
	(152,0,'环境','6','business_focus',NULL,'default','N','0','admin','2023-02-09 14:38:28','',NULL,NULL),
	(153,0,'待审核','1','contract_status',NULL,'default','N','0','admin','2023-02-22 13:21:13','',NULL,NULL),
	(154,0,'审批通过','2','contract_status',NULL,'default','N','0','admin','2023-02-22 13:21:22','',NULL,NULL),
	(155,0,'驳回','3','contract_status',NULL,'default','N','0','admin','2023-02-22 13:21:30','',NULL,NULL);

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
	(108,'无效线索类型','clue_invalidate','0','admin','2023-01-19 06:46:24','',NULL,NULL),
	(109,'商机状态','business_status','0','admin','2023-02-05 02:13:43','',NULL,NULL),
	(110,'职业种类','business_occupation','0','admin','2023-02-09 14:31:12','',NULL,NULL),
	(111,'学历种类','business_education','0','admin','2023-02-09 14:33:39','',NULL,NULL),
	(112,'商机沟通重点','business_focus','0','admin','2023-02-09 14:37:34','',NULL,NULL),
	(113,'合同状态','contract_status','0','admin','2023-02-22 13:20:45','',NULL,NULL);

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
	(43,'admin','127.0.0.1','内网IP','Chrome 10','Mac OS X','0','登录成功','2023-02-04 12:36:15'),
	(44,'admin','127.0.0.1','内网IP','Chrome 10','Mac OS X','0','登录成功','2023-02-04 15:14:25'),
	(45,'admin','127.0.0.1','内网IP','Unknown','Unknown','0','登录成功','2023-02-04 15:47:25'),
	(46,'admin','127.0.0.1','内网IP','Chrome 10','Mac OS X','0','登录成功','2023-02-05 01:26:22'),
	(47,'admin','127.0.0.1','内网IP','Unknown','Unknown','0','登录成功','2023-02-05 01:51:39'),
	(48,'admin','127.0.0.1','内网IP','Chrome 10','Mac OS X','0','登录成功','2023-02-05 02:11:45'),
	(49,'admin','127.0.0.1','内网IP','Unknown','Unknown','0','登录成功','2023-02-05 02:46:00'),
	(50,'admin','127.0.0.1','内网IP','Chrome 10','Mac OS X','0','登录成功','2023-02-09 12:25:01'),
	(51,'admin','127.0.0.1','内网IP','Chrome 10','Mac OS X','0','登录成功','2023-02-09 13:11:42'),
	(52,'admin','127.0.0.1','内网IP','Chrome 10','Mac OS X','0','登录成功','2023-02-09 15:36:03'),
	(53,'admin','127.0.0.1','内网IP','Chrome 10','Mac OS X','0','登录成功','2023-02-11 11:16:45'),
	(54,'admin','127.0.0.1','内网IP','Chrome 10','Mac OS X','0','登录成功','2023-02-11 12:01:38'),
	(55,'admin','127.0.0.1','内网IP','Unknown','Unknown','0','登录成功','2023-02-11 12:12:51'),
	(56,'admin','127.0.0.1','内网IP','Chrome 10','Mac OS X','0','登录成功','2023-02-11 15:20:23'),
	(57,'admin','127.0.0.1','内网IP','Chrome 10','Mac OS X','0','登录成功','2023-02-11 16:20:46'),
	(58,'admin','127.0.0.1','内网IP','Chrome 10','Mac OS X','0','登录成功','2023-02-21 14:24:59'),
	(59,'admin','127.0.0.1','内网IP','Chrome 10','Mac OS X','0','登录成功','2023-02-22 12:27:28'),
	(60,'admin','127.0.0.1','内网IP','Chrome 10','Mac OS X','0','登录成功','2023-02-22 13:01:39'),
	(61,'admin','127.0.0.1','内网IP','Chrome 11','Mac OS X','0','登录成功','2023-02-22 14:57:44'),
	(62,'admin','127.0.0.1','内网IP','Chrome 11','Mac OS X','0','登录成功','2023-02-23 14:40:13'),
	(63,'admin','127.0.0.1','内网IP','Unknown','Unknown','0','登录成功','2023-02-23 15:04:49'),
	(64,'admin','127.0.0.1','内网IP','Chrome 11','Mac OS X','0','登录成功','2023-02-23 15:13:11'),
	(65,'admin','127.0.0.1','内网IP','Chrome 11','Mac OS X','0','登录成功','2023-02-25 04:37:33'),
	(66,'admin','127.0.0.1','内网IP','Chrome 11','Mac OS X','0','登录成功','2023-02-25 11:42:50'),
	(67,'admin','127.0.0.1','内网IP','Chrome 11','Mac OS X','0','退出成功','2023-02-25 12:12:36'),
	(68,'admin','127.0.0.1','内网IP','Chrome 11','Mac OS X','0','登录成功','2023-02-25 12:12:39'),
	(69,'admin','127.0.0.1','内网IP','Chrome 11','Mac OS X','0','登录成功','2023-02-25 13:42:30'),
	(70,'admin','127.0.0.1','内网IP','Chrome 11','Mac OS X','0','登录成功','2023-02-26 03:21:58'),
	(71,'admin','127.0.0.1','内网IP','Chrome 11','Mac OS X','0','登录成功','2023-02-26 04:56:14'),
	(72,'admin','127.0.0.1','内网IP','Chrome 11','Mac OS X','0','登录成功','2023-02-26 05:37:47'),
	(73,'admin','127.0.0.1','内网IP','Chrome 11','Mac OS X','0','登录成功','2023-02-26 06:31:11'),
	(74,'admin','127.0.0.1','内网IP','Chrome 11','Mac OS X','0','退出成功','2023-02-26 06:31:50'),
	(75,'admin','127.0.0.1','内网IP','Chrome 11','Mac OS X','0','登录成功','2023-02-26 06:34:28'),
	(76,'admin','127.0.0.1','内网IP','Chrome 11','Mac OS X','0','登录成功','2023-02-26 08:03:02'),
	(77,'admin','127.0.0.1','内网IP','Chrome 11','Mac OS X','0','退出成功','2023-02-26 08:03:35'),
	(78,'zhangsan','127.0.0.1','内网IP','Chrome 11','Mac OS X','0','登录成功','2023-02-26 08:03:40'),
	(79,'zhangsan','127.0.0.1','内网IP','Chrome 11','Mac OS X','0','退出成功','2023-02-26 08:03:49'),
	(80,'admin','127.0.0.1','内网IP','Chrome 11','Mac OS X','0','登录成功','2023-02-26 08:03:53'),
	(81,'admin','127.0.0.1','内网IP','Chrome 11','Mac OS X','0','退出成功','2023-02-26 08:05:27'),
	(82,'zhangsan','127.0.0.1','内网IP','Chrome 11','Mac OS X','0','登录成功','2023-02-26 08:05:32'),
	(83,'zhangsan','127.0.0.1','内网IP','Chrome 11','Mac OS X','0','退出成功','2023-02-26 09:22:22'),
	(84,'admin','127.0.0.1','内网IP','Chrome 11','Mac OS X','0','登录成功','2023-02-26 09:22:28'),
	(85,'admin','127.0.0.1','内网IP','Chrome 11','Mac OS X','0','退出成功','2023-02-26 09:27:31'),
	(86,'zhangsan','127.0.0.1','内网IP','Chrome 11','Mac OS X','0','登录成功','2023-02-26 09:27:38'),
	(87,'zhangsan','127.0.0.1','内网IP','Chrome 11','Mac OS X','0','退出成功','2023-02-26 09:29:18'),
	(88,'admin','127.0.0.1','内网IP','Chrome 11','Mac OS X','0','登录成功','2023-02-26 09:29:24'),
	(89,'admin','127.0.0.1','内网IP','Chrome 11','Mac OS X','0','退出成功','2023-02-26 09:30:25'),
	(90,'zhangsan','127.0.0.1','内网IP','Chrome 11','Mac OS X','0','登录成功','2023-02-26 09:30:30'),
	(91,'zhangsan','127.0.0.1','内网IP','Chrome 11','Mac OS X','0','登录成功','2023-03-05 03:44:38'),
	(92,'zhangsan','127.0.0.1','内网IP','Chrome 11','Mac OS X','0','退出成功','2023-03-05 03:44:48'),
	(93,'admin','127.0.0.1','内网IP','Chrome 11','Mac OS X','0','登录成功','2023-03-05 03:44:54'),
	(94,'admin','127.0.0.1','内网IP','Chrome 11','Mac OS X','0','退出成功','2023-03-05 03:45:24'),
	(95,'zhangsan','127.0.0.1','内网IP','Chrome 11','Mac OS X','0','登录成功','2023-03-05 03:45:30'),
	(96,'zhangsan','127.0.0.1','内网IP','Chrome 11','Mac OS X','0','登录成功','2023-03-05 09:19:23'),
	(97,'admin','127.0.0.1','内网IP','Unknown','Unknown','0','登录成功','2023-03-05 09:51:19'),
	(98,'zhangsan','127.0.0.1','内网IP','Chrome 11','Mac OS X','0','登录成功','2023-03-05 10:35:33'),
	(99,'admin','127.0.0.1','内网IP','Unknown','Unknown','0','登录成功','2023-03-05 10:52:06'),
	(100,'zhangsan','127.0.0.1','内网IP','Chrome 11','Mac OS X','0','退出成功','2023-03-05 11:02:37'),
	(101,'zhangsan','127.0.0.1','内网IP','Chrome 11','Mac OS X','0','登录成功','2023-03-05 11:02:39'),
	(102,'admin','127.0.0.1','内网IP','Unknown','Unknown','0','登录成功','2023-03-05 11:23:31'),
	(103,'zhangsan','127.0.0.1','内网IP','Chrome 11','Mac OS X','0','退出成功','2023-03-05 11:37:05'),
	(104,'admin','127.0.0.1','内网IP','Chrome 11','Mac OS X','0','登录成功','2023-03-05 11:37:11'),
	(105,'admin','127.0.0.1','内网IP','Chrome 11','Mac OS X','0','退出成功','2023-03-05 11:39:28'),
	(106,'zhangsan','127.0.0.1','内网IP','Chrome 11','Mac OS X','0','登录成功','2023-03-05 11:39:34'),
	(107,'zhangsan','127.0.0.1','内网IP','Chrome 11','Mac OS X','0','登录成功','2023-03-05 13:00:47'),
	(108,'admin','127.0.0.1','内网IP','Unknown','Unknown','0','登录成功','2023-03-05 13:15:44'),
	(109,'zhangsan','127.0.0.1','内网IP','Unknown','Unknown','0','登录成功','2023-03-05 13:16:46'),
	(110,'zhangsan','127.0.0.1','内网IP','Unknown','Unknown','0','登录成功','2023-03-05 13:18:21'),
	(111,'zhangsan','127.0.0.1','内网IP','Unknown','Unknown','0','登录成功','2023-03-05 13:23:05'),
	(112,'admin','127.0.0.1','内网IP','Unknown','Unknown','0','登录成功','2023-03-05 13:23:16'),
	(113,'admin','127.0.0.1','内网IP','Unknown','Unknown','0','登录成功','2023-03-05 13:26:53'),
	(114,'zhangsan','127.0.0.1','内网IP','Unknown','Unknown','0','登录成功','2023-03-05 13:27:23'),
	(115,'zhangsan','127.0.0.1','内网IP','Chrome 11','Mac OS X','0','登录成功','2023-03-05 13:31:03'),
	(116,'zhangsan','127.0.0.1','内网IP','Chrome 11','Mac OS X','0','退出成功','2023-03-05 13:31:14'),
	(117,'admin','127.0.0.1','内网IP','Chrome 11','Mac OS X','0','登录成功','2023-03-05 13:31:19'),
	(118,'admin','127.0.0.1','内网IP','Chrome 11','Mac OS X','0','退出成功','2023-03-05 13:32:47'),
	(119,'zhangsan','127.0.0.1','内网IP','Chrome 11','Mac OS X','0','登录成功','2023-03-05 13:32:54'),
	(120,'zhangsan','127.0.0.1','内网IP','Chrome 11','Mac OS X','0','登录成功','2023-03-07 13:46:40'),
	(121,'zhangsan','127.0.0.1','内网IP','Chrome 11','Mac OS X','0','退出成功','2023-03-07 14:12:32'),
	(122,'admin','127.0.0.1','内网IP','Chrome 11','Mac OS X','0','登录成功','2023-03-07 14:12:38'),
	(123,'admin','127.0.0.1','内网IP','Chrome 11','Mac OS X','0','退出成功','2023-03-07 14:13:07'),
	(124,'zhangsan','127.0.0.1','内网IP','Chrome 11','Mac OS X','0','登录成功','2023-03-07 14:13:16'),
	(125,'zhangsan','127.0.0.1','内网IP','Chrome 11','Mac OS X','0','退出成功','2023-03-07 14:14:15'),
	(126,'admin','127.0.0.1','内网IP','Chrome 11','Mac OS X','0','登录成功','2023-03-07 14:14:21'),
	(127,'admin','127.0.0.1','内网IP','Chrome 11','Mac OS X','0','退出成功','2023-03-07 14:31:00'),
	(128,'zhangsan','127.0.0.1','内网IP','Chrome 11','Mac OS X','0','登录成功','2023-03-07 14:31:07'),
	(129,'zhangsan','127.0.0.1','内网IP','Chrome 11','Mac OS X','0','退出成功','2023-03-07 14:44:57'),
	(130,'admin','127.0.0.1','内网IP','Chrome 11','Mac OS X','0','登录成功','2023-03-07 14:45:04'),
	(131,'admin','127.0.0.1','内网IP','Chrome 11','Mac OS X','0','退出成功','2023-03-07 15:01:08'),
	(132,'admin','127.0.0.1','内网IP','Chrome 11','Mac OS X','0','登录成功','2023-03-07 15:01:11'),
	(133,'admin','127.0.0.1','内网IP','Chrome 11','Mac OS X','0','退出成功','2023-03-07 15:09:49'),
	(134,'admin','127.0.0.1','内网IP','Chrome 11','Mac OS X','0','登录成功','2023-03-07 15:09:52'),
	(135,'admin','127.0.0.1','内网IP','Chrome 11','Mac OS X','0','退出成功','2023-03-07 15:18:14'),
	(136,'zhangsan','127.0.0.1','内网IP','Chrome 11','Mac OS X','0','登录成功','2023-03-07 15:18:20'),
	(137,'zhangsan','127.0.0.1','内网IP','Chrome 11','Mac OS X','0','退出成功','2023-03-07 15:21:48'),
	(138,'admin','127.0.0.1','内网IP','Chrome 11','Mac OS X','0','登录成功','2023-03-07 15:21:59'),
	(139,'admin','127.0.0.1','内网IP','Chrome 11','Mac OS X','0','退出成功','2023-03-07 15:33:10'),
	(140,'zhangsan','127.0.0.1','内网IP','Chrome 11','Mac OS X','0','登录成功','2023-03-07 15:33:15'),
	(141,'zhangsan','127.0.0.1','内网IP','Chrome 11','Mac OS X','0','退出成功','2023-03-07 15:41:08'),
	(142,'admin','127.0.0.1','内网IP','Chrome 11','Mac OS X','1','用户不存在/密码错误','2023-03-07 15:41:17'),
	(143,'admin','127.0.0.1','内网IP','Chrome 11','Mac OS X','0','登录成功','2023-03-07 15:41:21'),
	(144,'admin','127.0.0.1','内网IP','Chrome 11','Mac OS X','0','退出成功','2023-03-07 15:50:26'),
	(145,'zhangsan','127.0.0.1','内网IP','Chrome 11','Mac OS X','0','登录成功','2023-03-07 15:50:37'),
	(146,'zhangsan','127.0.0.1','内网IP','Chrome 11','Mac OS X','0','退出成功','2023-03-07 15:50:49'),
	(147,'admin','127.0.0.1','内网IP','Chrome 11','Mac OS X','0','登录成功','2023-03-07 15:51:02'),
	(148,'admin','127.0.0.1','内网IP','Chrome 11','Mac OS X','0','登录成功','2023-03-09 13:23:40'),
	(149,'zhangsan','127.0.0.1','内网IP','Unknown','Unknown','0','登录成功','2023-03-09 13:35:30'),
	(150,'admin','127.0.0.1','内网IP','Unknown','Unknown','0','登录成功','2023-03-09 13:36:18'),
	(151,'admin','127.0.0.1','内网IP','Chrome 11','Mac OS X','0','退出成功','2023-03-09 13:38:23'),
	(152,'zhangsan','127.0.0.1','内网IP','Chrome 11','Mac OS X','0','登录成功','2023-03-09 13:38:30'),
	(153,'zhangsan','127.0.0.1','内网IP','Chrome 11','Mac OS X','0','退出成功','2023-03-09 13:42:58'),
	(154,'admin','127.0.0.1','内网IP','Chrome 11','Mac OS X','0','登录成功','2023-03-09 13:43:06'),
	(155,'admin','127.0.0.1','内网IP','Chrome 11','Mac OS X','0','退出成功','2023-03-09 14:29:39'),
	(156,'zhangsan','127.0.0.1','内网IP','Chrome 11','Mac OS X','0','登录成功','2023-03-09 14:29:46'),
	(157,'zhangsan','127.0.0.1','内网IP','Chrome 11','Mac OS X','0','退出成功','2023-03-09 14:53:33'),
	(158,'admin','127.0.0.1','内网IP','Chrome 11','Mac OS X','0','登录成功','2023-03-09 14:53:39'),
	(159,'admin','127.0.0.1','内网IP','Chrome 11','Mac OS X','0','退出成功','2023-03-09 14:53:51'),
	(160,'zhangsan','127.0.0.1','内网IP','Chrome 11','Mac OS X','0','登录成功','2023-03-09 14:53:56'),
	(161,'zhangsan','127.0.0.1','内网IP','Chrome 11','Mac OS X','0','退出成功','2023-03-09 14:54:15'),
	(162,'admin','127.0.0.1','内网IP','Chrome 11','Mac OS X','0','登录成功','2023-03-09 14:54:24'),
	(163,'admin','127.0.0.1','内网IP','Chrome 11','Mac OS X','0','登录成功','2023-03-10 12:55:23'),
	(164,'admin','127.0.0.1','内网IP','Chrome 11','Mac OS X','0','登录成功','2023-03-12 03:07:11'),
	(165,'admin','127.0.0.1','内网IP','Unknown','Unknown','0','登录成功','2023-03-12 04:36:51'),
	(166,'admin','127.0.0.1','内网IP','Chrome 11','Mac OS X','0','登录成功','2023-03-12 05:51:39'),
	(167,'admin','127.0.0.1','内网IP','Chrome 11','Mac OS X','0','登录成功','2023-03-12 08:08:17'),
	(168,'admin','127.0.0.1','内网IP','Chrome 11','Mac OS X','0','登录成功','2023-03-12 09:10:07'),
	(169,'admin','127.0.0.1','内网IP','Chrome 11','Mac OS X','0','登录成功','2023-03-12 09:51:00'),
	(170,'admin','127.0.0.1','内网IP','Unknown','Unknown','0','登录成功','2023-03-12 10:45:39'),
	(171,'admin','127.0.0.1','内网IP','Chrome 11','Mac OS X','0','登录成功','2023-03-12 10:50:51'),
	(172,'admin','127.0.0.1','内网IP','Chrome 11','Mac OS X','0','退出成功','2023-03-12 10:58:14'),
	(173,'admin','127.0.0.1','内网IP','Chrome 11','Mac OS X','0','登录成功','2023-03-12 10:58:16');

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
	(3063,'查看商机',2001,7,'',NULL,NULL,1,0,'F','0','0','tienchin:business:view','#','admin','2023-02-04 12:40:33','',NULL,''),
	(3064,'查询合同',2002,1,'',NULL,NULL,1,0,'F','0','0','tienchin:contract:list','#','admin','2023-02-22 13:22:11','',NULL,''),
	(3065,'添加合同',2002,2,'',NULL,NULL,1,0,'F','0','0','tienchin:contract:create','#','admin','2023-02-22 13:22:41','',NULL,''),
	(3066,'删除合同',2002,3,'',NULL,NULL,1,0,'F','0','0','tienchin:contract:remove','#','admin','2023-02-22 13:23:04','',NULL,''),
	(3067,'修改合同',2002,4,'',NULL,NULL,1,0,'F','0','0','tienchin:contract:edit','#','admin','2023-02-22 13:23:24','',NULL,''),
	(3068,'预览合同',2002,5,'',NULL,NULL,1,0,'F','0','0','tienchin:contract:view','#','admin','2023-02-22 13:23:52','',NULL,''),
	(3069,'查看详情',2002,6,'',NULL,NULL,1,0,'F','0','0','tienchin:contract:details','#','admin','2023-02-22 13:24:27','',NULL,''),
	(3070,'合同审批',2002,7,'',NULL,NULL,1,0,'F','0','0','tienchin:contract:approve','#','admin','2023-02-22 13:24:54','',NULL,''),
	(3071,'线索统计',2006,1,'',NULL,NULL,1,0,'F','0','0','tienchin:analysis:clue','#','admin','2023-03-12 03:47:40','',NULL,''),
	(3072,'商机统计',2006,2,'',NULL,NULL,1,0,'F','0','0','tienchin:analysis:business','#','admin','2023-03-12 03:48:05','',NULL,''),
	(3073,'渠道统计',2006,3,'',NULL,NULL,1,0,'F','0','0','tienchin:analysis:channel','#','admin','2023-03-12 03:48:33','',NULL,''),
	(3074,'活动统计',2006,4,'',NULL,NULL,1,0,'F','0','0','tienchin:analysis:activity','#','admin','2023-03-12 03:48:55','',NULL,'');

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
	(53,'菜单管理',1,'org.javaboy.tienchin.web.controller.system.SysMenuController.add(org.javaboy.tienchin.common.core.domain.entity.SysMenu)','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"orderNum\":7,\"menuName\":\"查看商机\",\"params\":{},\"parentId\":2001,\"isCache\":\"0\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"F\",\"perms\":\"tienchin:business:view\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-02-04 12:40:33'),
	(54,'字典类型',1,'org.javaboy.tienchin.web.controller.system.SysDictTypeController.add(org.javaboy.tienchin.common.core.domain.entity.SysDictType)','POST',1,'admin',NULL,'/system/dict/type','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"dictName\":\"商机状态\",\"params\":{},\"dictType\":\"business_status\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-02-05 02:13:43'),
	(55,'字典数据',1,'org.javaboy.tienchin.web.controller.system.SysDictDataController.add(org.javaboy.tienchin.common.core.domain.entity.SysDictData)','POST',1,'admin',NULL,'/system/dict/data','127.0.0.1','内网IP','{\"dictValue\":\"1\",\"listClass\":\"primary\",\"dictSort\":0,\"params\":{},\"dictType\":\"business_status\",\"dictLabel\":\"已分配\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-02-05 02:14:06'),
	(56,'字典数据',1,'org.javaboy.tienchin.web.controller.system.SysDictDataController.add(org.javaboy.tienchin.common.core.domain.entity.SysDictData)','POST',1,'admin',NULL,'/system/dict/data','127.0.0.1','内网IP','{\"dictValue\":\"2\",\"listClass\":\"success\",\"dictSort\":0,\"params\":{},\"dictType\":\"business_status\",\"dictLabel\":\"进行中\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-02-05 02:14:19'),
	(57,'字典数据',1,'org.javaboy.tienchin.web.controller.system.SysDictDataController.add(org.javaboy.tienchin.common.core.domain.entity.SysDictData)','POST',1,'admin',NULL,'/system/dict/data','127.0.0.1','内网IP','{\"dictValue\":\"3\",\"listClass\":\"info\",\"dictSort\":0,\"params\":{},\"dictType\":\"business_status\",\"dictLabel\":\"回收\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-02-05 02:14:31'),
	(58,'线索管理',1,'org.javaboy.tienchin.web.controller.tienchin.clue.ClueController.add(org.javaboy.tienchin.clue.domain.Clue)','POST',1,'admin',NULL,'/tienchin/clue','127.0.0.1','内网IP','{\"gender\":0,\"nextTime\":\"2023-02-06T10:40:50.837824000\",\"clueId\":25,\"activityId\":2,\"createBy\":\"admin\",\"createTime\":\"2023-02-05T10:40:50.837871000\",\"phone\":\"18111133333\",\"name\":\"王武\",\"age\":20,\"channelId\":1}','{\"msg\":\"线索录入成功\",\"code\":200}',0,NULL,'2023-02-05 02:40:51'),
	(59,'商机管理',1,'org.javaboy.tienchin.web.controller.tienchin.business.BusinessController.add(org.javaboy.tienchin.business.domain.Business)','POST',1,'admin',NULL,'/tienchin/business','127.0.0.1','内网IP','{\"nextTime\":\"2023-02-06T10:46:48.319543000\",\"businessId\":3,\"createBy\":\"admin\",\"createTime\":\"2023-02-05T10:46:48.319492000\",\"phone\":\"111111\",\"name\":\"zhaoliu\",\"status\":1}','{\"msg\":\"商机录入成功\",\"code\":200}',0,NULL,'2023-02-05 02:46:48'),
	(60,'商机管理',1,'org.javaboy.tienchin.web.controller.tienchin.business.BusinessController.add(org.javaboy.tienchin.business.domain.Business)','POST',1,'admin',NULL,'/tienchin/business','127.0.0.1','内网IP','{\"gender\":1,\"nextTime\":\"2023-02-06T10:56:54.667423000\",\"businessId\":4,\"activityId\":2,\"channelId\":1,\"createBy\":\"admin\",\"createTime\":\"2023-02-05T10:56:54.667387000\",\"phone\":\"13222222222\",\"name\":\"fengqi\",\"age\":30,\"status\":1}','{\"msg\":\"商机录入成功\",\"code\":200}',0,NULL,'2023-02-05 02:56:54'),
	(61,'商机管理',1,'org.javaboy.tienchin.web.controller.tienchin.business.BusinessController.add(org.javaboy.tienchin.business.domain.Business)','POST',1,'admin',NULL,'/tienchin/business','127.0.0.1','内网IP','{\"phone\":\"111111\"}','{\"msg\":\"客户手机号码重复，录入失败\",\"code\":500}',0,NULL,'2023-02-05 03:02:57'),
	(62,'线索管理',1,'org.javaboy.tienchin.web.controller.tienchin.clue.ClueController.add(org.javaboy.tienchin.clue.domain.Clue)','POST',1,'admin',NULL,'/tienchin/clue','127.0.0.1','内网IP','{\"nextTime\":\"2023-02-06T11:36:51.279191000\",\"clueId\":26,\"createBy\":\"admin\",\"createTime\":\"2023-02-05T11:36:51.279229000\",\"phone\":\"15199999999\",\"name\":\"ff\"}','{\"msg\":\"线索录入成功\",\"code\":200}',0,NULL,'2023-02-05 03:36:51'),
	(63,'字典类型',1,'org.javaboy.tienchin.web.controller.system.SysDictTypeController.add(org.javaboy.tienchin.common.core.domain.entity.SysDictType)','POST',1,'admin',NULL,'/system/dict/type','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"dictName\":\"职业种类\",\"params\":{},\"dictType\":\"business_occupation\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-02-09 14:31:12'),
	(64,'字典数据',1,'org.javaboy.tienchin.web.controller.system.SysDictDataController.add(org.javaboy.tienchin.common.core.domain.entity.SysDictData)','POST',1,'admin',NULL,'/system/dict/data','127.0.0.1','内网IP','{\"dictValue\":\"0\",\"listClass\":\"default\",\"dictSort\":0,\"params\":{},\"dictType\":\"business_occupation\",\"dictLabel\":\"无\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-02-09 14:31:38'),
	(65,'字典数据',1,'org.javaboy.tienchin.web.controller.system.SysDictDataController.add(org.javaboy.tienchin.common.core.domain.entity.SysDictData)','POST',1,'admin',NULL,'/system/dict/data','127.0.0.1','内网IP','{\"dictValue\":\"1\",\"listClass\":\"default\",\"dictSort\":0,\"params\":{},\"dictType\":\"business_occupation\",\"dictLabel\":\"技术\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-02-09 14:31:45'),
	(66,'字典数据',1,'org.javaboy.tienchin.web.controller.system.SysDictDataController.add(org.javaboy.tienchin.common.core.domain.entity.SysDictData)','POST',1,'admin',NULL,'/system/dict/data','127.0.0.1','内网IP','{\"dictValue\":\"2\",\"listClass\":\"default\",\"dictSort\":0,\"params\":{},\"dictType\":\"business_occupation\",\"dictLabel\":\"产品\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-02-09 14:31:55'),
	(67,'字典数据',1,'org.javaboy.tienchin.web.controller.system.SysDictDataController.add(org.javaboy.tienchin.common.core.domain.entity.SysDictData)','POST',1,'admin',NULL,'/system/dict/data','127.0.0.1','内网IP','{\"dictValue\":\"3\",\"listClass\":\"default\",\"dictSort\":0,\"params\":{},\"dictType\":\"business_occupation\",\"dictLabel\":\"设计\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-02-09 14:32:03'),
	(68,'字典数据',1,'org.javaboy.tienchin.web.controller.system.SysDictDataController.add(org.javaboy.tienchin.common.core.domain.entity.SysDictData)','POST',1,'admin',NULL,'/system/dict/data','127.0.0.1','内网IP','{\"dictValue\":\"4\",\"listClass\":\"default\",\"dictSort\":0,\"params\":{},\"dictType\":\"business_occupation\",\"dictLabel\":\"运营\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-02-09 14:32:10'),
	(69,'字典数据',1,'org.javaboy.tienchin.web.controller.system.SysDictDataController.add(org.javaboy.tienchin.common.core.domain.entity.SysDictData)','POST',1,'admin',NULL,'/system/dict/data','127.0.0.1','内网IP','{\"dictValue\":\"5\",\"listClass\":\"default\",\"dictSort\":0,\"params\":{},\"dictType\":\"business_occupation\",\"dictLabel\":\"市场\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-02-09 14:32:19'),
	(70,'字典数据',1,'org.javaboy.tienchin.web.controller.system.SysDictDataController.add(org.javaboy.tienchin.common.core.domain.entity.SysDictData)','POST',1,'admin',NULL,'/system/dict/data','127.0.0.1','内网IP','{\"dictValue\":\"6\",\"listClass\":\"default\",\"dictSort\":0,\"params\":{},\"dictType\":\"business_occupation\",\"dictLabel\":\"销售\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-02-09 14:32:25'),
	(71,'字典类型',1,'org.javaboy.tienchin.web.controller.system.SysDictTypeController.add(org.javaboy.tienchin.common.core.domain.entity.SysDictType)','POST',1,'admin',NULL,'/system/dict/type','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"dictName\":\"学历种类\",\"params\":{},\"dictType\":\"business_education\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-02-09 14:33:39'),
	(72,'字典数据',1,'org.javaboy.tienchin.web.controller.system.SysDictDataController.add(org.javaboy.tienchin.common.core.domain.entity.SysDictData)','POST',1,'admin',NULL,'/system/dict/data','127.0.0.1','内网IP','{\"dictValue\":\"0\",\"listClass\":\"default\",\"dictSort\":0,\"params\":{},\"dictType\":\"business_education\",\"dictLabel\":\"小学\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-02-09 14:33:50'),
	(73,'字典数据',1,'org.javaboy.tienchin.web.controller.system.SysDictDataController.add(org.javaboy.tienchin.common.core.domain.entity.SysDictData)','POST',1,'admin',NULL,'/system/dict/data','127.0.0.1','内网IP','{\"dictValue\":\"1\",\"listClass\":\"default\",\"dictSort\":0,\"params\":{},\"dictType\":\"business_education\",\"dictLabel\":\"初中\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-02-09 14:33:56'),
	(74,'字典数据',1,'org.javaboy.tienchin.web.controller.system.SysDictDataController.add(org.javaboy.tienchin.common.core.domain.entity.SysDictData)','POST',1,'admin',NULL,'/system/dict/data','127.0.0.1','内网IP','{\"dictValue\":\"2\",\"listClass\":\"default\",\"dictSort\":0,\"params\":{},\"dictType\":\"business_education\",\"dictLabel\":\"高中\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-02-09 14:34:03'),
	(75,'字典数据',1,'org.javaboy.tienchin.web.controller.system.SysDictDataController.add(org.javaboy.tienchin.common.core.domain.entity.SysDictData)','POST',1,'admin',NULL,'/system/dict/data','127.0.0.1','内网IP','{\"dictValue\":\"3\",\"listClass\":\"default\",\"dictSort\":0,\"params\":{},\"dictType\":\"business_education\",\"dictLabel\":\"中专\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-02-09 14:34:10'),
	(76,'字典数据',1,'org.javaboy.tienchin.web.controller.system.SysDictDataController.add(org.javaboy.tienchin.common.core.domain.entity.SysDictData)','POST',1,'admin',NULL,'/system/dict/data','127.0.0.1','内网IP','{\"dictValue\":\"4\",\"listClass\":\"default\",\"dictSort\":0,\"params\":{},\"dictType\":\"business_education\",\"dictLabel\":\"大专\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-02-09 14:34:15'),
	(77,'字典数据',1,'org.javaboy.tienchin.web.controller.system.SysDictDataController.add(org.javaboy.tienchin.common.core.domain.entity.SysDictData)','POST',1,'admin',NULL,'/system/dict/data','127.0.0.1','内网IP','{\"dictValue\":\"5\",\"listClass\":\"default\",\"dictSort\":0,\"params\":{},\"dictType\":\"business_education\",\"dictLabel\":\"本科\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-02-09 14:34:22'),
	(78,'字典数据',1,'org.javaboy.tienchin.web.controller.system.SysDictDataController.add(org.javaboy.tienchin.common.core.domain.entity.SysDictData)','POST',1,'admin',NULL,'/system/dict/data','127.0.0.1','内网IP','{\"dictValue\":\"6\",\"listClass\":\"default\",\"dictSort\":0,\"params\":{},\"dictType\":\"business_education\",\"dictLabel\":\"研究生\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-02-09 14:34:35'),
	(79,'字典数据',1,'org.javaboy.tienchin.web.controller.system.SysDictDataController.add(org.javaboy.tienchin.common.core.domain.entity.SysDictData)','POST',1,'admin',NULL,'/system/dict/data','127.0.0.1','内网IP','{\"dictValue\":\"7\",\"listClass\":\"default\",\"dictSort\":0,\"params\":{},\"dictType\":\"business_education\",\"dictLabel\":\"博士\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-02-09 14:34:44'),
	(80,'字典数据',1,'org.javaboy.tienchin.web.controller.system.SysDictDataController.add(org.javaboy.tienchin.common.core.domain.entity.SysDictData)','POST',1,'admin',NULL,'/system/dict/data','127.0.0.1','内网IP','{\"dictValue\":\"8\",\"listClass\":\"default\",\"dictSort\":0,\"params\":{},\"dictType\":\"business_education\",\"dictLabel\":\"其他\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-02-09 14:34:51'),
	(81,'字典类型',1,'org.javaboy.tienchin.web.controller.system.SysDictTypeController.add(org.javaboy.tienchin.common.core.domain.entity.SysDictType)','POST',1,'admin',NULL,'/system/dict/type','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"dictName\":\"商机沟通重点\",\"params\":{},\"dictType\":\"business_focus\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-02-09 14:37:34'),
	(82,'字典数据',1,'org.javaboy.tienchin.web.controller.system.SysDictDataController.add(org.javaboy.tienchin.common.core.domain.entity.SysDictData)','POST',1,'admin',NULL,'/system/dict/data','127.0.0.1','内网IP','{\"dictValue\":\"1\",\"listClass\":\"default\",\"dictSort\":0,\"params\":{},\"dictType\":\"business_focus\",\"dictLabel\":\"课程\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-02-09 14:37:47'),
	(83,'字典数据',1,'org.javaboy.tienchin.web.controller.system.SysDictDataController.add(org.javaboy.tienchin.common.core.domain.entity.SysDictData)','POST',1,'admin',NULL,'/system/dict/data','127.0.0.1','内网IP','{\"dictValue\":\"2\",\"listClass\":\"default\",\"dictSort\":0,\"params\":{},\"dictType\":\"business_focus\",\"dictLabel\":\"价格\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-02-09 14:37:53'),
	(84,'字典数据',1,'org.javaboy.tienchin.web.controller.system.SysDictDataController.add(org.javaboy.tienchin.common.core.domain.entity.SysDictData)','POST',1,'admin',NULL,'/system/dict/data','127.0.0.1','内网IP','{\"dictValue\":\"3\",\"listClass\":\"default\",\"dictSort\":0,\"params\":{},\"dictType\":\"business_focus\",\"dictLabel\":\"位置\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-02-09 14:38:01'),
	(85,'字典数据',1,'org.javaboy.tienchin.web.controller.system.SysDictDataController.add(org.javaboy.tienchin.common.core.domain.entity.SysDictData)','POST',1,'admin',NULL,'/system/dict/data','127.0.0.1','内网IP','{\"dictValue\":\"4\",\"listClass\":\"default\",\"dictSort\":0,\"params\":{},\"dictType\":\"business_focus\",\"dictLabel\":\"时间\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-02-09 14:38:10'),
	(86,'字典数据',1,'org.javaboy.tienchin.web.controller.system.SysDictDataController.add(org.javaboy.tienchin.common.core.domain.entity.SysDictData)','POST',1,'admin',NULL,'/system/dict/data','127.0.0.1','内网IP','{\"dictValue\":\"5\",\"listClass\":\"default\",\"dictSort\":0,\"params\":{},\"dictType\":\"business_focus\",\"dictLabel\":\"教练\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-02-09 14:38:18'),
	(87,'字典数据',1,'org.javaboy.tienchin.web.controller.system.SysDictDataController.add(org.javaboy.tienchin.common.core.domain.entity.SysDictData)','POST',1,'admin',NULL,'/system/dict/data','127.0.0.1','内网IP','{\"dictValue\":\"6\",\"listClass\":\"default\",\"dictSort\":0,\"params\":{},\"dictType\":\"business_focus\",\"dictLabel\":\"环境\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-02-09 14:38:28'),
	(88,'课程管理',1,'org.javaboy.tienchin.web.controller.tienchin.CourseController.add(org.javaboy.tienchin.course.domain.Course)','POST',1,'admin',NULL,'/tienchin/course','127.0.0.1','内网IP','{\"applyTo\":1,\"createBy\":\"admin\",\"createTime\":\"2023-02-11T20:51:12.534445000\",\"price\":1000.0,\"name\":\"少儿游泳班\",\"delFlag\":0,\"type\":2,\"courseId\":2,\"info\":\"啊啊啊\"}','{\"msg\":\"添加成功\",\"code\":200}',0,NULL,'2023-02-11 12:51:12'),
	(89,'商机管理',1,'org.javaboy.tienchin.web.controller.tienchin.business.BusinessController.add(org.javaboy.tienchin.business.domain.Business)','POST',1,'admin',NULL,'/tienchin/business','127.0.0.1','内网IP','{\"gender\":0,\"businessId\":2,\"activityId\":5,\"channelId\":3,\"qq\":\"qq111456\",\"weixin\":\"weixin123456\",\"createTime\":\"2023-02-04T23:59:44\",\"phone\":\"13111111111\",\"name\":\"张三123fff\",\"age\":31,\"status\":1}','{\"msg\":\"客户手机号码重复，录入失败\",\"code\":500}',0,NULL,'2023-02-21 15:14:01'),
	(90,'字典类型',1,'org.javaboy.tienchin.web.controller.system.SysDictTypeController.add(org.javaboy.tienchin.common.core.domain.entity.SysDictType)','POST',1,'admin',NULL,'/system/dict/type','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"dictName\":\"合同状态\",\"params\":{},\"dictType\":\"contract_status\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-02-22 13:20:45'),
	(91,'字典数据',1,'org.javaboy.tienchin.web.controller.system.SysDictDataController.add(org.javaboy.tienchin.common.core.domain.entity.SysDictData)','POST',1,'admin',NULL,'/system/dict/data','127.0.0.1','内网IP','{\"dictValue\":\"1\",\"listClass\":\"default\",\"dictSort\":0,\"params\":{},\"dictType\":\"contract_status\",\"dictLabel\":\"待审核\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-02-22 13:21:13'),
	(92,'字典数据',1,'org.javaboy.tienchin.web.controller.system.SysDictDataController.add(org.javaboy.tienchin.common.core.domain.entity.SysDictData)','POST',1,'admin',NULL,'/system/dict/data','127.0.0.1','内网IP','{\"dictValue\":\"2\",\"listClass\":\"default\",\"dictSort\":0,\"params\":{},\"dictType\":\"contract_status\",\"dictLabel\":\"审批通过\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-02-22 13:21:22'),
	(93,'字典数据',1,'org.javaboy.tienchin.web.controller.system.SysDictDataController.add(org.javaboy.tienchin.common.core.domain.entity.SysDictData)','POST',1,'admin',NULL,'/system/dict/data','127.0.0.1','内网IP','{\"dictValue\":\"3\",\"listClass\":\"default\",\"dictSort\":0,\"params\":{},\"dictType\":\"contract_status\",\"dictLabel\":\"驳回\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-02-22 13:21:30'),
	(94,'菜单管理',1,'org.javaboy.tienchin.web.controller.system.SysMenuController.add(org.javaboy.tienchin.common.core.domain.entity.SysMenu)','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"orderNum\":1,\"menuName\":\"查询合同\",\"params\":{},\"parentId\":2002,\"isCache\":\"0\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"F\",\"perms\":\"tienchin:contract:list\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-02-22 13:22:11'),
	(95,'菜单管理',1,'org.javaboy.tienchin.web.controller.system.SysMenuController.add(org.javaboy.tienchin.common.core.domain.entity.SysMenu)','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"orderNum\":2,\"menuName\":\"添加合同\",\"params\":{},\"parentId\":2002,\"isCache\":\"0\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"F\",\"perms\":\"tienchin:contract:create\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-02-22 13:22:41'),
	(96,'菜单管理',1,'org.javaboy.tienchin.web.controller.system.SysMenuController.add(org.javaboy.tienchin.common.core.domain.entity.SysMenu)','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"orderNum\":3,\"menuName\":\"删除合同\",\"params\":{},\"parentId\":2002,\"isCache\":\"0\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"F\",\"perms\":\"tienchin:contract:remove\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-02-22 13:23:04'),
	(97,'菜单管理',1,'org.javaboy.tienchin.web.controller.system.SysMenuController.add(org.javaboy.tienchin.common.core.domain.entity.SysMenu)','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"orderNum\":4,\"menuName\":\"修改合同\",\"params\":{},\"parentId\":2002,\"isCache\":\"0\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"F\",\"perms\":\"tienchin:contract:edit\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-02-22 13:23:24'),
	(98,'菜单管理',1,'org.javaboy.tienchin.web.controller.system.SysMenuController.add(org.javaboy.tienchin.common.core.domain.entity.SysMenu)','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"orderNum\":5,\"menuName\":\"预览合同\",\"params\":{},\"parentId\":2002,\"isCache\":\"0\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"F\",\"perms\":\"tienchin:contract:view\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-02-22 13:23:52'),
	(99,'菜单管理',1,'org.javaboy.tienchin.web.controller.system.SysMenuController.add(org.javaboy.tienchin.common.core.domain.entity.SysMenu)','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"orderNum\":6,\"menuName\":\"查看详情\",\"params\":{},\"parentId\":2002,\"isCache\":\"0\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"F\",\"perms\":\"tienchin:contract:details\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-02-22 13:24:27'),
	(100,'菜单管理',1,'org.javaboy.tienchin.web.controller.system.SysMenuController.add(org.javaboy.tienchin.common.core.domain.entity.SysMenu)','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"orderNum\":7,\"menuName\":\"合同审批\",\"params\":{},\"parentId\":2002,\"isCache\":\"0\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"F\",\"perms\":\"tienchin:contract:approve\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-02-22 13:24:54'),
	(101,'角色管理',1,'org.javaboy.tienchin.web.controller.system.SysRoleController.add(org.javaboy.tienchin.common.core.domain.entity.SysRole)','POST',1,'admin',NULL,'/system/role','127.0.0.1','内网IP','{\"flag\":false,\"roleId\":5,\"admin\":false,\"params\":{},\"roleSort\":\"0\",\"deptCheckStrictly\":true,\"createBy\":\"admin\",\"menuCheckStrictly\":true,\"roleKey\":\"contract_role\",\"roleName\":\"业务经理\",\"deptIds\":[],\"menuIds\":[2002,3064,3065,3066,3067,3068,3069,3070],\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-02-26 08:04:55'),
	(102,'用户管理',4,'org.javaboy.tienchin.web.controller.system.SysUserController.insertAuthRole(java.lang.Long,java.lang.Long[])','PUT',1,'admin',NULL,'/system/user/authRole','127.0.0.1','内网IP','3 [4,5]','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-02-26 08:05:23'),
	(103,'菜单管理',1,'org.javaboy.tienchin.web.controller.system.SysMenuController.add(org.javaboy.tienchin.common.core.domain.entity.SysMenu)','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"orderNum\":1,\"menuName\":\"线索统计\",\"params\":{},\"parentId\":2006,\"isCache\":\"0\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"F\",\"perms\":\"tienchin:analysis:clue\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-03-12 03:47:40'),
	(104,'菜单管理',1,'org.javaboy.tienchin.web.controller.system.SysMenuController.add(org.javaboy.tienchin.common.core.domain.entity.SysMenu)','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"orderNum\":2,\"menuName\":\"商机统计\",\"params\":{},\"parentId\":2006,\"isCache\":\"0\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"F\",\"perms\":\"tienchin:analysis:business\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-03-12 03:48:05'),
	(105,'菜单管理',1,'org.javaboy.tienchin.web.controller.system.SysMenuController.add(org.javaboy.tienchin.common.core.domain.entity.SysMenu)','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"orderNum\":3,\"menuName\":\"渠道统计\",\"params\":{},\"parentId\":2006,\"isCache\":\"0\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"F\",\"perms\":\"tienchin:analysis:channel\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-03-12 03:48:33'),
	(106,'菜单管理',1,'org.javaboy.tienchin.web.controller.system.SysMenuController.add(org.javaboy.tienchin.common.core.domain.entity.SysMenu)','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"visible\":\"0\",\"orderNum\":4,\"menuName\":\"活动统计\",\"params\":{},\"parentId\":2006,\"isCache\":\"0\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"F\",\"perms\":\"tienchin:analysis:activity\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-03-12 03:48:55');

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
	(4,'线索管理员','clue_role',0,'1',1,1,'0','0','admin','2023-01-18 07:29:16','admin','2023-01-18 07:29:35',NULL),
	(5,'业务经理','contract_role',0,'1',1,1,'0','0','admin','2023-02-26 08:04:55','',NULL,NULL);

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
	(4,3056),
	(5,2002),
	(5,3064),
	(5,3065),
	(5,3066),
	(5,3067),
	(5,3068),
	(5,3069),
	(5,3070);

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
	(1,103,'admin','TienChin健身','00','ry@163.com','15888888888','1','','$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2','0','0','127.0.0.1','2023-03-12 18:58:17','admin','2023-01-16 16:20:26','','2023-03-12 10:58:16','管理员'),
	(2,105,'ry','TienChin健身_test','00','ry@qq.com','15666666666','1','','$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2','0','0','127.0.0.1','2023-01-16 16:20:26','admin','2023-01-16 16:20:26','',NULL,'测试员'),
	(3,100,'zhangsan','张三','00','111@qq.com','13011111111','0','','$2a$10$V5aLwXgE8rF1Gm6Wl6dNNuS271ibQYqp64nccgEdDoRIQjfa71X8C','0','0','127.0.0.1','2023-03-09 22:53:56','admin','2023-01-17 02:50:55','','2023-03-09 14:53:56',NULL);

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
	(3,4),
	(3,5);

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
	(21,0,23,1,X'61646D696E',103,1,'2023-01-18 21:39:34',X'61646D696E','2023-02-05 01:42:27',NULL,NULL),
	(22,0,24,1,X'61646D696E',103,1,'2023-02-04 19:39:09',X'61646D696E','2023-02-05 02:12:53',NULL,NULL),
	(24,1,2,1,X'61646D696E',103,1,'2023-02-04 23:59:44',X'61646D696E',NULL,NULL,NULL),
	(25,0,25,1,X'61646D696E',103,1,'2023-02-05 10:40:51',X'61646D696E',NULL,NULL,NULL),
	(26,1,3,1,X'61646D696E',103,1,'2023-02-05 10:46:48',X'61646D696E',NULL,NULL,NULL),
	(27,1,4,1,X'61646D696E',103,1,'2023-02-05 10:56:55',X'61646D696E',NULL,NULL,NULL),
	(28,1,5,1,X'61646D696E',103,0,'2023-02-05 10:59:30',X'61646D696E','2023-02-05 03:36:26',NULL,NULL),
	(30,1,5,3,X'7A68616E6773616E',100,1,'2023-02-05 11:36:26',X'61646D696E',NULL,NULL,NULL),
	(31,0,26,1,X'61646D696E',103,0,'2023-02-05 11:36:51',X'61646D696E','2023-02-05 03:37:01',NULL,NULL),
	(32,0,26,2,X'7279',105,1,'2023-02-05 11:37:01',X'61646D696E',NULL,NULL,NULL);

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
  `status` int NOT NULL DEFAULT '1' COMMENT '状态(已分配1  进行中2  回收3)',
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
  `money` double DEFAULT NULL COMMENT '意向金额',
  `education` varchar(64) COLLATE utf8_bin DEFAULT '' COMMENT '学历',
  `height` double DEFAULT NULL COMMENT '身高',
  `weight` double DEFAULT NULL COMMENT '体重',
  `reason` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '锻炼的原因',
  `hours` int DEFAULT NULL COMMENT '每周可以用于锻炼的时间',
  `othen_intention` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '其他意向',
  `clue_id` int DEFAULT NULL COMMENT '线索ID',
  PRIMARY KEY (`business_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin COMMENT='线索';

LOCK TABLES `tienchin_business` WRITE;
/*!40000 ALTER TABLE `tienchin_business` DISABLE KEYS */;

INSERT INTO `tienchin_business` (`business_id`, `name`, `channel_id`, `activity_id`, `gender`, `age`, `weixin`, `qq`, `phone`, `level`, `subject`, `status`, `fail_count`, `next_time`, `transfer`, `end_time`, `create_time`, `create_by`, `update_time`, `update_by`, `remark`, `del_flag`, `province`, `city`, `area`, `course_id`, `occupation`, `money`, `education`, `height`, `weight`, `reason`, `hours`, `othen_intention`, `clue_id`)
VALUES
	(2,X'E5BCA0E4B889313233666666',3,5,1,30,X'77656978696E313233333333',X'7171343536363636',X'3133313131313131313131',NULL,NULL,1,0,NULL,0,NULL,'2023-02-04 23:59:44',X'61646D696E','2023-02-26 05:27:51',NULL,NULL,1,NULL,NULL,NULL,1,NULL,NULL,X'',NULL,NULL,NULL,NULL,NULL,23),
	(3,X'7A68616F6C6975',NULL,NULL,NULL,NULL,NULL,NULL,X'313131313131',NULL,NULL,1,0,'2023-02-06 10:46:48',0,NULL,'2023-02-05 10:46:48',X'61646D696E','2023-02-21 15:28:37',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,X'',NULL,NULL,NULL,NULL,NULL,NULL),
	(4,X'66656E677169',1,2,0,30,X'77656978696E313233',NULL,X'3133323232323232323232',NULL,NULL,1,0,'2023-02-06 10:56:55',0,NULL,'2023-02-05 10:56:55',X'61646D696E','2023-02-21 15:28:32',X'61646D696E',NULL,0,X'E5B1B1E8A5BFE79C81',X'E995BFE6B2BBE5B882',X'E5B1AFE79599E58CBA',2,X'E4BAA7E59381',10000,X'E69CACE7A791',180,80,X'666666',10,NULL,NULL),
	(5,X'E78E8BE6ADA6',1,2,0,20,NULL,NULL,X'3138313131313333333333',NULL,NULL,1,0,'2023-02-06 10:59:30',0,NULL,'2023-02-05 10:59:30',X'61646D696E','2023-02-21 15:28:36',NULL,NULL,0,X'E5B9BFE4B89CE79C81',X'E6B7B1E59CB3E5B882',X'E58D97E5B1B1E58CBA',1,X'E8AEBEE8AEA1',NULL,X'E69CACE7A791',NULL,NULL,NULL,NULL,NULL,25);

/*!40000 ALTER TABLE `tienchin_business` ENABLE KEYS */;
UNLOCK TABLES;


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
	(23,X'E5BCA0E4B889313233666666',3,5,0,30,NULL,NULL,X'3133313131313131313131',NULL,NULL,2,2,'2023-01-18 19:55:04',0,NULL,'2023-01-17 19:55:04',X'61646D696E','2023-02-04 15:59:44',NULL,NULL,1),
	(24,X'E9878CE696AF',2,4,1,27,X'61616161616161',X'3131313131',X'3138313131313131313131',1,2,4,3,'2023-01-20 04:14:14',0,NULL,'2023-01-18 16:14:14',X'61646D696E','2023-01-19 14:34:37',NULL,NULL,0),
	(25,X'E78E8BE6ADA6',1,2,0,20,NULL,NULL,X'3138313131313333333333',NULL,NULL,1,0,'2023-02-06 10:40:51',0,NULL,'2023-02-05 10:40:51',X'61646D696E','2023-03-12 09:45:10',NULL,NULL,1),
	(26,X'6666',3,5,NULL,NULL,NULL,NULL,X'3135313939393939393939',NULL,NULL,4,0,'2023-02-06 11:36:51',0,NULL,'2023-02-05 11:36:51',X'61646D696E','2023-03-12 11:08:49',NULL,NULL,0);

/*!40000 ALTER TABLE `tienchin_clue` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table tienchin_contract
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tienchin_contract`;

CREATE TABLE `tienchin_contract` (
  `contract_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '合同编号',
  `phone` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '客户手机号码',
  `name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '客户姓名',
  `type` int DEFAULT NULL COMMENT '课程分类',
  `activity_id` int DEFAULT NULL COMMENT '活动 ID',
  `activity_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '活动名称',
  `course_id` int DEFAULT NULL COMMENT '课程ID',
  `course_name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '课程名称',
  `channel_id` int DEFAULT NULL COMMENT '渠道ID',
  `channel_name` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '渠道名称',
  `status` int DEFAULT NULL COMMENT '合同的状态（待审核1，已通过2，驳回3）',
  `file_path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '合同文件地址',
  `contract_price` double DEFAULT NULL COMMENT '合同价格',
  `course_price` double DEFAULT NULL COMMENT '课程价格',
  `discount_type` int DEFAULT NULL COMMENT '折扣类型',
  `process_instance_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '流程ID',
  `business_id` int DEFAULT NULL COMMENT '商机ID',
  `create_by` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_by` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `del_flag` int DEFAULT NULL,
  `approve_dept_id` int DEFAULT NULL COMMENT '合同审批部门ID',
  `approve_dept_name` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '合同审批部门名称',
  `approve_user_id` int DEFAULT NULL COMMENT '审批用户ID',
  `approve_user_name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '审批用户名称',
  PRIMARY KEY (`contract_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `tienchin_contract` WRITE;
/*!40000 ALTER TABLE `tienchin_contract` DISABLE KEYS */;

INSERT INTO `tienchin_contract` (`contract_id`, `phone`, `name`, `type`, `activity_id`, `activity_name`, `course_id`, `course_name`, `channel_id`, `channel_name`, `status`, `file_path`, `contract_price`, `course_price`, `discount_type`, `process_instance_id`, `business_id`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`, `approve_dept_id`, `approve_dept_name`, `approve_user_id`, `approve_user_name`)
VALUES
	(7,'13111111111','张三123fff',1,5,'地推',1,'民族舞入门',3,'线下地推',2,'http://localhost:8080/tienchin/contract/views/2023/02/26/b8deeb1d-ab33-4e4a-add9-b31a88aeee43-张三健身合同.docx',200,999,1,'2e533c2e-b5b8-11ed-96de-c65acc3e684e',2,'admin','2023-02-26 17:30:17',NULL,NULL,NULL,0,100,NULL,3,'zhangsan'),
	(8,'18111133333','王武',1,2,'啊啊啊啊',1,'民族舞入门',1,'百度搜索',2,'http://localhost:8080/tienchin/contract/views/2023/03/05/e276d4df-20e1-4d84-8ab1-2c4cce4bc1ab-李四健身合同.doc',1100,999,2,'60563604-bb4a-11ed-87c7-c65acc3e684e',5,'admin','2023-03-05 19:39:24','admin','2023-03-09 22:29:32',NULL,0,100,NULL,3,'zhangsan'),
	(13,'13222222222','fengqi',2,2,'啊啊啊啊',2,'少儿游泳班',1,'百度搜索',2,'http://localhost:8080/tienchin/contract/views/2023/03/07/4aa25e0f-3dd6-4f5b-8511-3cd1e2c11e23-李四健身合同.doc',100,1000,2,'16fc73ec-bcfb-11ed-875c-ee3bcbbc2c3c',4,'admin','2023-03-07 23:16:53',NULL,NULL,NULL,0,100,NULL,3,'zhangsan');

/*!40000 ALTER TABLE `tienchin_contract` ENABLE KEYS */;
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
	(1,1,X'E6B091E6978FE8889EE585A5E997A8',999,2,X'E59294E58FBDE68993E58DA1E889B0E88BA6E5A58BE69697',NULL,'2023-01-17 00:53:55',X'61646D696E','2023-01-17 00:54:03',X'61646D696E',0,NULL),
	(2,2,X'E5B091E584BFE6B8B8E6B3B3E78FAD',1000,1,X'E5958AE5958AE5958A',NULL,'2023-02-11 20:51:13',X'61646D696E',NULL,NULL,0,NULL);

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
	(18,0,23,'ffff','admin','2023-02-04 19:45:44',NULL,NULL),
	(19,1,4,'【3】解释我们的位置优势','admin','2023-02-11 23:51:08',NULL,NULL),
	(20,1,4,'【价格】介绍价格','admin','2023-02-11 23:53:24',NULL,NULL),
	(21,1,4,'【课程】fff','admin','2023-02-11 23:54:22',NULL,NULL),
	(22,1,4,'【undefined】undefined','admin','2023-02-12 00:20:54',NULL,NULL),
	(23,1,4,'【价格】ffff','admin','2023-02-12 00:23:35',NULL,NULL),
	(24,1,4,'【时间】沟通客户的时间安排','admin','2023-02-21 22:39:51',NULL,NULL),
	(25,1,4,'【教练】教练资质','admin','2023-02-21 22:48:56',NULL,NULL);

/*!40000 ALTER TABLE `tienchin_follow_record` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
