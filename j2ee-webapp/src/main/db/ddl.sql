CREATE TABLE IF NOT EXISTS `sys_users`(
  `name` VARCHAR(100) NOT NULL,
  `password` VARCHAR(40) NOT NULL,
  `last_update_date` DATE,
   PRIMARY KEY ( `name` )
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

--insert solon
insert sys_users (name,password) values('solon','abc123');
commit;
