FROM debian:buster
MAINTAINER ybayart
RUN apt update
RUN apt install -y php-fpm mariadb-server php-mysql wget nginx
RUN cd /tmp/ \
&& wget https://fr.wordpress.org/wordpress-5.3-fr_FR.tar.gz \
&& tar xvf wordpress-5.3-fr_FR.tar.gz \
&& mv wordpress /var/www/wordpress \
&& chown -Rv www-data: /var/www/
RUN cd /tmp/ \
&& wget https://files.phpmyadmin.net/phpMyAdmin/4.9.1/phpMyAdmin-4.9.1-all-languages.tar.gz \
&& tar xvf phpMyAdmin-4.9.1-all-languages.tar.gz \
&& mv phpMyAdmin-4.9.1-all-languages /var/www/phpmyadmin \
&& chown -Rv www-data: /var/www/phpmyadmin
RUN service mysql start && mysql --execute="CREATE USER 'web'@'localhost' IDENTIFIED BY 'motdepasse';GRANT ALL ON *.* TO 'web'@'localhost';CREATE DATABASE wordpress;"
RUN rm -rf /tmp/*
COPY srcs/nginx/certs /etc/nginx/certs
COPY srcs/nginx/default /etc/nginx/sites-enabled/default
COPY srcs/index.html /var/www/index.html
COPY srcs/jul.mp3 /var/www/
COPY srcs/jul.ogg /var/www/
COPY srcs/start.sh .
CMD bash start.sh && tail -F /dev/null
