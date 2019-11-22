if [ "$NOINDEX" == "1" ]
then
	rm -f /var/www/index.html
fi

service nginx start
service php7.3-fpm start
service mysql start
