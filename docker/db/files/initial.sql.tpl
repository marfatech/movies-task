CREATE DATABASE IF NOT EXISTS `${MYSQL_DATABASE}`;
CREATE DATABASE IF NOT EXISTS `test_${MYSQL_DATABASE}`;

CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';

GRANT ALL ON `${MYSQL_DATABASE}`.* TO '${MYSQL_USER}'@'%';
GRANT ALL ON `test_${MYSQL_DATABASE}`.* TO '${MYSQL_USER}'@'%';

flush privileges;
