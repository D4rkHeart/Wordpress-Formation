#!/bin/bash

if [ -z "$DOMAIN" ] || [ -z "$EMAIL" ]; then
  echo "Les variables DOMAIN et EMAIL doivent être définies dans le fichier .env"
  exit 1
fi

echo "DOMAIN: $DOMAIN"
echo "EMAIL: $EMAIL"

SSL_CERT_DIR="/etc/letsencrypt/live/$DOMAIN"

if [ ! -f "$SSL_CERT_DIR/fullchain.pem" ] || [ ! -f "$SSL_CERT_DIR/privkey.pem" ]; then
  echo "Les certificats ne sont pas encore générés. Génération des certificats..."

  certbot certonly --standalone --non-interactive --agree-tos --email $EMAIL -d $DOMAIN

  if [ -f "$SSL_CERT_DIR/fullchain.pem" ] && [ -f "$SSL_CERT_DIR/privkey.pem" ]; then
    echo "Les certificats ont été générés."
  else
    echo "Erreur : Les certificats n'ont pas été générés correctement."
    exit 1
  fi
else
  echo "Les certificats existent déjà."
fi


SSL_CONF_PATH="/etc/apache2/sites-available/$DOMAIN-ssl.conf"

cat > $SSL_CONF_PATH <<EOL
<VirtualHost *:443>
    ServerAdmin webmaster@$DOMAIN
    ServerName $DOMAIN

    DocumentRoot /var/www/html

    SSLEngine on
    SSLCertificateFile $SSL_CERT_DIR/fullchain.pem
    SSLCertificateKeyFile $SSL_CERT_DIR/privkey.pem

    <Directory /var/www/html>
        Options Indexes FollowSymLinks
        AllowOverride All
        Require all granted
    </Directory>

    ErrorLog \${APACHE_LOG_DIR}/error.log
    CustomLog \${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
EOL


a2ensite $DOMAIN-ssl.conf
a2enmod ssl
a2enmod headers


apachectl configtest
if apachectl configtest; then
  systemctl reload apache2
else
  echo "Erreur dans la configuration d'Apache."
  exit 1
fi

exec /usr/local/bin/docker-entrypoint.sh "$@"
