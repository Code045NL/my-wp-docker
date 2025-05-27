FROM wordpress:latest

# Zet werkdir, bv waar wp core staat
WORKDIR /wp

# Kopieer je setup script en .env naar een geschikte plek
COPY setup-wordpress.sh /code/setup-wordpress.sh
COPY .env /code/.env

# Maak setup script uitvoerbaar
RUN chmod +x /code/setup-wordpress.sh

# Installeer wp-cli (optioneel, maar wordpress:latest image heeft wp-cli al meestal)
# RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
#     chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

# Zet entrypoint naar je setup script (of gebruik CMD)
ENTRYPOINT ["/code/setup-wordpress.sh"]
