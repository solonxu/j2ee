CREATE TABLE IF NOT EXISTS `sys_users`(
  `name` VARCHAR(100) NOT NULL,
  `password` VARCHAR(40) NOT NULL,
  `last_update_date` DATE,
   PRIMARY KEY ( `name` )
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

--insert solon
insert sys_users (name,password) values('solon','abc123');
commit;


--create vendors table

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for vendors
-- ----------------------------
DROP TABLE IF EXISTS `vendors`;
CREATE TABLE `vendors` (
  `id` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '厂家序号ID',
  `vendorid` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '厂家编号',
  `vendorsname` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT '厂家全称',
  `shortname` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '厂家简称',
  `habitat` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '所在地',
  `addr` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '详细地址',
  `postcode` varchar(100) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '邮政编码',
  `fax` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '传真号码',
  `tel` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '电话号码',
  `contactman` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '联系人',
  `email` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '电子邮箱',
  `memo` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '简介',
  `brand` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '品牌',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
