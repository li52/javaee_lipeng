DROP DATABASE IF EXISTS db_javaee;
CREATE DATABASE db_javaee;
USE db_javaee;

DROP TABLE IF EXISTS db_javaee.user;
CREATE TABLE db_javaee.user (
  id       INT AUTO_INCREMENT PRIMARY KEY
  COMMENT 'ID PK',
  nick     VARCHAR(255) NOT NULL
  COMMENT '昵称',
  mobile   VARCHAR(255) NOT NULL
  COMMENT '手机号',
  password VARCHAR(255) NOT NULL
  COMMENT '密码'
)
  COMMENT '用户表';

DROP TABLE IF EXISTS db_javaee.student;
CREATE TABLE db_javaee.student (
  id     INT AUTO_INCREMENT PRIMARY KEY
  COMMENT 'ID PK',
  name   VARCHAR(255) NOT NULL
  COMMENT '姓名',
  gender VARCHAR(255) NOT NULL
  COMMENT '性别',
  dob    DATE         NOT NULL
  COMMENT '出生日期'
)
  COMMENT '学生表';

SELECT *
FROM db_javaee.user;

SELECT *
FROM db_javaee.student;

-- CRUD Create-Insert Retrieve-Select Update-Update Delete-Delete

TRUNCATE TABLE db_javaee.user;
TRUNCATE TABLE db_javaee.student;

SELECT *
FROM db_javaee.user;

SELECT *
FROM db_1702.ip;

SHOW FULL COLUMNS FROM db_1702.ip;

SELECT *
FROM db_1702.ip
WHERE inet_aton('66.44.2.100') BETWEEN inet_aton(min) AND inet_aton(max);