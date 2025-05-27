FROM wordpress:latest

WORKDIR /var/www/html

COPY setup-wordpress.sh /code/setup-wordpress.sh

RUN chmod +x /code/setup-wordpress.sh

ENTRYPOINT ["/code/setup-wordpress.sh"]
