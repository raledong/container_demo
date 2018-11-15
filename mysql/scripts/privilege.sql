# 可以在这里加入数据库权限管理相关的内容
CREATE USER 'rale'@'%' IDENTIFIED WITH mysql_native_password BY '12345';
GRANT ALL PRIVILEGES ON *.* TO 'rale'@'%';