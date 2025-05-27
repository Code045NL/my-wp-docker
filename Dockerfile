FROM wordpress:latest

WORKDIR /

COPY setup-wordpress.sh /code/setup-wordpress.sh

RUN chmod +x /code/setup-wordpress.sh

ENTRYPOINT ["/code/setup-wordpress.sh"]
