# 初始化数据库的脚本
CREATE DATABASE container_demo;
USE container_demo;

DROP TABLE IF EXISTS user;
CREATE TABLE user(
  id INTEGER PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(255) DEFAULT ''
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO user(name) VALUES ("rale");