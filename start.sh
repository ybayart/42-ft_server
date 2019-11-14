docker build -t ft_server:v1 .
docker run -tid -p 80:80 \
				-p 443:443 \
				-v /Users/ybayart/Documents/ft_server/srcs/nginx/certs/:/etc/nginx/certs \
				-v /Users/ybayart/Documents/ft_server/srcs/nginx/default:/etc/nginx/sites-enabled/default \
				--name ft_server ft_server:v1
docker exec -it ft_server service nginx start
docker exec -it ft_server service php7.3-fpm start
docker exec -dit ft_server service mysql start
