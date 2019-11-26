if [ "$NOINDEX" == "1" ]
then
	sed -i -e 's/href="phpmyadmin"/href=""/g' /var/www/index.html
	sed -i -e 's/href="wordpress"/href=""/g' /var/www/index.html
fi

service nginx start
service php7.3-fpm start
service mysql start
