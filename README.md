http://144.217.87.14/

Last deployed on 21/09/2017.

Test student username: "123", password:"123".

Test landlord username: "landlord", password:"landlord".





sudo mysqld_safe --skip-grant-tables

mysql -u root

UPDATE mysql.user SET Password=PASSWORD('your-password') WHERE User='root';

FLUSH PRIVILEGES;

\q
