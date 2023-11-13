#!/bin/sh

echo 'Please enter you sudo password to update system.'
sudo apt update && sudo apt upgrade -y
echo 'System updated.'

echo ''
echo ''

echo 'Installing Apache2'

sudo apt install apache2

echo 'Thanks for install apache2'

echo ''
echo 'Installed Apache2 Version'
sudo apache2 -v

echo 'Apache2 status checking.'
systemctl status apache2

echo 'apache2 enebling'
sudo systemctl enable apache2 --now

echo ''
echo ''

echo "Now you can check apache2 default page to ensure it's serving content as expected."
echo '__________________________________________________________________________________'
echo ''
echo ''
echo 'Typically, this would be either of the following URLs:'
echo '127.0.0.1'
echo 'http://localhost'
echo ''
echo ''

echo 'Lets Install mariadb'
echo '____________________'
echo ''
sudo apt install mariadb-server mariadb-client
echo ''
echo ''

echo 'Mariadb version'
echo '_______________'
mariadb --version
echo ''
echo ''

echo 'Current status of mariadb.'
echo '_________________________'
systemctl status mariadb
echo ''
echo ''

echo 'This command also ensures that MariaDB starts automatically upon system boot:'
echo '_____________________________________________________________________________'
sudo systemctl enable mariadb --now
echo ''
echo ''

echo '__________________________________________________'
echo 'Securing MariaDB with the Provided Security Script'
echo '__________________________________________________'
echo ''
echo 'For all decisions, you’d typically respond with (Y) to approve the recommended security actions.'
echo ''
echo 'While executing the script, you’ll be prompted to make several security-related decisions:'
echo ''
echo ''
echo '[1] Define a password for the root accounts.'
echo ''
echo '[2] Eliminate root accounts that can be accessed from outside the localhost.'
echo ''
echo '[3] Delete anonymous user accounts.'
echo ''
echo '[4] Remove the test database, which, in its default state, can be accessed by any anonymous users.'
echo ''
echo ''
sudo mysql_secure_installation
echo ''
echo ''

echo ''

echo 'Now lets install PHP'
echo 'Please change the version according to your need.'
echo 'For clarity, a concrete example would be:'

sudo apt install php8.2 libapache2-mod-php8.2

echo ''
echo 'Php installed.'

echo ''
echo 'PHP Version'
php -version
echo ''
echo ''

echo 'Lets restart the apache2.'
echo ''
sudo systemctl restart apache2

echo ''
echo ''

echo 'ALL DONE.'
echo 'Congratulations.....'
