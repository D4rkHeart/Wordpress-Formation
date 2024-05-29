#!/bin/bash

# Vérification des variables d'environnement nécessaires
if [ -z "$DOMAIN" ] || [ -z "$EMAIL" ] || [ -z "$SMTP_HOST" ] || [ -z "$SMTP_PORT" ] || [ -z "$SMTP_USER" ] || [ -z "$SMTP_PASS" ] || [ -z "$SMTP_SECURE" ]; then
  echo "Les variables DOMAIN, EMAIL, SMTP_HOST, SMTP_PORT, SMTP_USER, SMTP_PASS, et SMTP_SECURE doivent être définies dans le fichier .env"
  exit 1
fi

echo "DOMAIN: $DOMAIN"
echo "EMAIL: $EMAIL"

SSL_CERT_DIR="/etc/letsencrypt/live/$DOMAIN"

# Génération des certificats SSL si nécessaire
if [ ! -f "$SSL_CERT_DIR/fullchain.pem" ] || [ ! -f "$SSL_CERT_DIR/privkey.pem" ]; then
  echo "Les certificats ne sont pas encore générés. Génération des certificats..."

  certbot certonly --staging --standalone --non-interactive --agree-tos --email $EMAIL -d $DOMAIN

  if [ -f "$SSL_CERT_DIR/fullchain.pem" ] && [ -f "$SSL_CERT_DIR/privkey.pem" ]; then
    echo "Les certificats ont été générés."
  else
    echo "Erreur : Les certificats n'ont pas été générés correctement."
    exit 1
  fi
else
  echo "Les certificats existent déjà."
fi

# Configuration d'Apache pour utiliser les certificats SSL
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

# Configuration de msmtp
MSMTP_CONFIG="/etc/msmtprc"

cat > $MSMTP_CONFIG <<EOL
defaults
logfile        /var/log/msmtp.log

account         ${SMTP_ACCOUNT}
host            ${SMTP_HOST}
port            ${SMTP_PORT}
from            ${SMTP_FROM}
user            ${SMTP_USER}
password        ${SMTP_PASS}
tls             ${SMTP_SECURE}
tls_starttls    on
auth            on
set_from_header on

account default: ${SMTP_ACCOUNT}
EOL

chmod 600 $MSMTP_CONFIG
chown www-data:www-data $MSMTP_CONFIG

exec /usr/local/bin/docker-entrypoint.sh "$@"
