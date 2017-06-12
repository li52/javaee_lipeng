DROP DATABASE IF EXISTS db_javaee;
CREATE DATABASE db_javaee;

DROP TABLE IF EXISTS db_javaee.user;
CREATE TABLE db_javaee.user (
  id INT AUTO_INCREMENT PRIMARY KEY COMMENT 'ID PK',
  nick VARCHAR(255) NOT NULL COMMENT '昵称',
  mobile VARCHAR(255) NOT NULL COMMENT '手机号',
  password VARCHAR(255) NOT NULL COMMENT '密码'
)COMMENT '用户表';

SELECT *
FROM db_javaee.user;

INSERT INTO db_javaee.user VALUE (NULL ,'Tom','123','123');

SHOW DATABASES ;

SELECT *
FROM db_1702.ip;

SHOW FULL COLUMNS FROM db_1702.ip;

SELECT *
FROM db_1702.ip
WHERE inet_aton('66.44.2.100') BETWEEN inet_aton(min) AND inet_aton(max);