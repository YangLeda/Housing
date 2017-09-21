http://144.217.87.14/

Last deployed on 21/09/2017.

Test student username: "123", password:"123".

Test landlord username: "landlord", password:"landlord".


重置密码：

cd /usr/local

sudo ./mysqld_safe --skip-grant-tables

./mysql -u root

USE mysql;

UPDATE user SET authentication_string=PASSWORD("NEWPASSWORD") WHERE User='root';

FLUSH PRIVILEGES;

quit

test456
