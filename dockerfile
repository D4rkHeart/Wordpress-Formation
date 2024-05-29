FROM wordpress:6

RUN apt-get update && \
    apt-get install -y certbot python3-certbot-apache && \
    a2enmod ssl

COPY init-cert.sh /usr/local/bin/init-cert.sh

RUN chmod +x /usr/local/bin/init-cert.sh

ENTRYPOINT ["/usr/local/bin/init-cert.sh"]


CMD ["apache2-foreground"]
