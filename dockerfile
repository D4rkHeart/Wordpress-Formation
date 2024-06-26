FROM wordpress:6

RUN apt-get update && \
    apt-get install -y certbot python3-certbot-apache msmtp msmtp-mta && \
    a2enmod ssl

COPY configurations.sh /usr/local/bin/configurations.sh

RUN touch /var/log/msmtp.log && chown www-data:www-data /var/log/msmtp.log

RUN chmod +x /usr/local/bin/configurations.sh

ENTRYPOINT ["/usr/local/bin/configurations.sh"]

CMD ["apache2-foreground"]
