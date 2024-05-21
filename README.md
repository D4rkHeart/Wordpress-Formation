
# Première partie : à propos de WordPress

## Qu'est-ce que c'est wordpress ?

Créé en 2003 par Matt Mullenweg et Mike Little, WordPress est un système de gestion de contenu (CMS) open-source qui permet de créer et de gérer facilement des sites web. Il offre une interface conviviale et une grande flexibilité, ce qui en fait l'une des plateformes les plus populaires pour la création de sites web, qu'ils soient personnels, professionnels ou institutionnels.

Concernant les auteurs, on pourrait dire que le principal contributeur de WordPress est techniquement la communauté mondiale de développeurs, de designers et d'utilisateurs qui contribuent l'amélioration continue de la plateforme.

## Q&A

* WordPress est-il beaucoup utilisé ?
	* Oui, WordPress est extrêmement populaire et largement utilisé à travers le monde. En fait, il alimente plus [d'un tiers de tous les sites web](https://kinsta.com/fr/blog/statistiques-wordpress/) actifs sur Internet. Sa popularité découle de sa simplicité d'utilisation, de sa flexibilité et de sa capacité à être adapté à divers besoins, qu'il s'agisse de blogs personnels, de sites d'entreprises, de boutiques en ligne ou même de grands sites d'actualités.
* Combien coûte WordPress ?
	* WordPress est disponible en deux versions principales : WordPress.com, qui propose des services d'hébergement et de gestion de sites web avec [différents niveaux d'abonnement payants](https://wpvip.com/pricing/), et WordPress.org, qui fournit le logiciel gratuitement, mais nécessite un hébergement web séparé. Ainsi, le coût dépend du type de service ou d'hébergement que vous choisissez, avec des options allant de gratuites à des plans premium payants.
* Quelle est la différence entre wordpress.com et wordpress.org ?
	* La [principale différence entre WordPress.com et WordPress.org](https://wpvip.com/2023/02/16/wordpress-org-vs-wordpress-com-vs-wordpress-vip-whats-the-difference/) réside dans l'hébergement et le contrôle du site. WordPress.com offre un service d'hébergement intégré avec divers plans payants, ce qui signifie que votre site sera hébergé sur les serveurs de WordPress.com et que vous aurez accès à des fonctionnalités spécifiques selon votre abonnement. En revanche, WordPress.org fournit uniquement le logiciel WordPress lui-même, que vous devez installer sur un serveur d'hébergement web tiers que vous choisissez et gérez vous-même. Cela offre une plus grande liberté et personnalisation, mais nécessite également plus de connaissances techniques et peut impliquer des coûts supplémentaires pour l'hébergement. 

## Qu'est-ce que c'est un CMS 

C'est un système de gestion de contenu (**C**ontent **M**anagement **S**ystem) est une application logicielle qui permet de créer, de modifier et de gérer le contenu d'un site web, sans nécessiter de connaissances en programmation ou en développement web. Les CMS fournissent une interface conviviale qui permet aux utilisateurs de créer et d'organiser du contenu textuel, des images, des vidéos, etc., et de le publier sur un site web avec facilité. Ils offrent également souvent des fonctionnalités telles que la gestion des utilisateurs, des thèmes et des extensions pour étendre les fonctionnalités du site. Les CMS sont largement utilisés pour créer une grande variété de sites web, allant des blogs personnels aux sites d'entreprises en passant par les sites de e-commerce.

# Deuxième partie : installation locale

## installation sur un Ubuntu 23.10 - Version longue 

Je me suis documenté et j'ai trouvé une source qui décrit parfaitement le chemin à parcourir pour ma version d'ubuntu . 
https://wiki.crowncloud.net/?How_to_Install_WordPress_on_Ubuntu_23_10 et 
https://ubuntu.com/tutorials/install-and-configure-wordpress. Les étapes ci dessous seront De base tiré (paraphrasé et traduit) de ces sources, je le notif
### 01 - Prérequis

Avant de commencer, assurez-vous d'avoir la distribution : Ubuntu 20.04 avec un utilisateur non-root avec privilèges sudo et un pare-feu activé. 

```shell
apt install apache2 mysql php
```
Vous pouvez suivre les instructions fournies dans la section "Prerequisites" du [guide officiel](https://ubuntu.com/tutorials/install-and-configure-wordpress#1-overview)
### 02 - Création de la base de données MySQL

1. Connectez-vous à MySQL en utilisant la commande suivante :    
```bash
sudo mysql -u root --password=root
```

2. Créez une nouvelle base de données pour WordPress :
```sql   
CREATE DATABASE wordpress;
``` 

3. Créez un nouvel utilisateur MySQL et attribuez-lui des privilèges sur la base de données WordPress :
```sql    
CREATE USER 'wordpressuser'@'localhost' IDENTIFIED BY 'password'; 
GRANT ALL PRIVILEGES ON wordpress.* TO 'wordpressuser'@'localhost'; 
FLUSH PRIVILEGES;
```

4. Quittez MySQL :
```sql
exit
```  


### 03 - Installation de WordPress

1.  Téléchargez le package WordPress en utilisant la commande wget :
```bash
sudo wget -c https://wordpress.org/latest.tar.gz
```

2.  Extrayez le package WordPress téléchargé :    
```bash
sudo tar -xzvf latest.tar.gz
```

3. Déplacez le contenu extrait vers le répertoire /var/www/html/ :
```bash    
sudo cp -r wordpress/* /var/www/html/wordpress/
```

(a faire si vous ne vboulez pas utilisez l'installer de wordpress)
4. Créez un fichier de configuration pour WordPress :    
```bash    
sudo mv /var/www/html/wordpress/wp-config-sample.php /var/www/html/wordpress/wp-config.php
```

5. Ouvrez le fichier `wp-config.php` pour configurer WordPress : 
```bash    
sudo nano /var/www/html/wp-config.php
```

6. Fournissez les détails de la base de données MySQL que vous avez créée précédemment dans les sections suivantes du fichier `wp-config.php` :    
```php    
define( 'DB_NAME', 'wordpress' ); 
define( 'DB_USER', 'wordpressuser' ); 
define( 'DB_PASSWORD', 'password' ); 
define( 'DB_HOST', 'localhost' );
```

### 04 - Finalisation de l'installation

1. Accédez à votre site WordPress via votre navigateur web en utilisant l'adresse IP de votre serveur ou votre nom de domaine.

2. Suivez les instructions à l'écran pour terminer l'installation de WordPress en fournissant les informations nécessaires, telles que le nom du site, l'adresse e-mail de l'administrateur, etc.

3. Une fois l'installation terminée, vous pouvez vous connecter à l'interface d'administration de WordPress en ajoutant `/wp-admin` à la fin de l'URL de votre site.

5. TODO : ajouter explication changement : blog_public pour pas index

---

## installation sur un Ubuntu 23.10 - Version courte (Docker)

### 01 - Installation de Docker  
Assurez-vous d'avoir Docker installé sur votre système Ubuntu. Si ce n'est pas le cas, vous pouvez suivre les instructions d'installation sur le site officiel de Docker : [Installation de Docker sur Ubuntu](https://docs.docker.com/engine/install/ubuntu/).  

### 02 - Vérification du status de docker 
Une fois Docker installé, assurez-vous que le service Docker est en cours d'exécution en utilisant la commande suivante dans votre terminal :    
```bash
sudo systemctl status docker
```

### 03 - Configuration de Docker pour WordPress

1. Créez un nouveau répertoire pour votre installation WordPress :
```bash
mkdir wordpress 
cd wordpress
```

2. Créez un fichier `docker-compose.yml` dans ce répertoire et ajoutez le contenu suivant :
```yaml
version: '3.3'

services:
  db:
    image: mysql:5.7
    volumes:
      - db_data:/var/lib/mysql
    restart: always
    environment:
      MYSQL_ROOT_PASSWORD: somewordpress
      MYSQL_DATABASE: wordpress
      MYSQL_USER: wordpress
      MYSQL_PASSWORD: wordpress

  wordpress:
    depends_on:
      - db
    image: wordpress:latest
    ports:
      - "8080:80"
    restart: always
   volumes:
     - wp-content:/var/www/html/wp-content
    environment:
      WORDPRESS_DB_HOST: db:3306
      WORDPRESS_DB_USER: wordpress
      WORDPRESS_DB_PASSWORD: wordpress
      WORDPRESS_DB_NAME: wordpress
volumes:
    db_data: {}
	wp-content:
```

3. Enregistrez et fermez le fichier `docker-compose.yml`. 

### 04 - Lancement de WordPress avec Docker

1. Exécutez la commande suivante dans le répertoire où se trouve votre fichier `docker-compose.yml` pour démarrer les conteneurs Docker :

 ``` bash
   docker-compose up -d
 ```

2. Une fois les conteneurs démarrés, accédez à votre navigateur web et entrez l'adresse suivante : `http://localhost:8080`. Vous devriez voir l'assistant d'installation de WordPress.

3. Suivez les instructions pour terminer l'installation de WordPress en fournissant les informations nécessaires telles que le nom du site, l'adresse e-mail de l'administrateur, etc.

### Références

- [Documentation Docker](https://docs.docker.com/guides/)
- [Site officiel de WordPress](https://wordpress.org/)

### De quoi WordPress a-t-il besoin pour fonctionner ?

WordPress nécessite les éléments suivants pour fonctionner correctement :

* **Un serveur web :** Pour exécuter les scripts PHP de WordPress. Dans notre cas, nous utilisons Apache via une image Docker.

* **Une base de données :** WordPress stocke toutes ses données dans une base de données MySQL. Nous utilisons également une instance MySQL via une image Docker pour cela.

* ***PHP :** WordPress est écrit en PHP, donc un interpréteur PHP est nécessaire pour exécuter son code.

--- 
# Troisième partie : installation distante
## Procédure d’installation de WordPress sur une VM distante

L'installation de WordPress sur une machine virtuelle distante peut sembler complexe, mais en suivant ces étapes, vous pourrez le faire de manière précise, même avec peu de connaissances en informatique.

### 1. Connexion à la machine virtuelle distante

Connectez-vous à la machine virtuelle distante à l'aide de votre clé SSH et de l'adresse IP fournie par l'hébergeur. Utilisez un terminal ou un émulateur de terminal pour accéder à la ligne de commande de la machine distante.

### 2. Mise à jour du système

Avant d'installer quoi que ce soit, assurez-vous que le système est à jour en exécutant les commandes suivantes :

```bash
sudo apt update 
sudo apt upgrade -y
```
### 3. Installation des prérequis

WordPress nécessite un serveur web (comme Apache ou Nginx), PHP et une base de données MySQL. Pour les installer, exécutez les commandes suivantes :

```bash
sudo apt install apache2 php mysql-server php-mysql
```

### 4. Configuration de la base de données MySQL

Créez une base de données MySQL et un utilisateur pour WordPress en exécutant les commandes suivantes :

```bash
sudo mysql -u root -p
```

Entrez votre mot de passe MySQL lorsque vous y êtes invité. Ensuite, exécutez ces commandes MySQL :

```sql
CREATE DATABASE wordpress; CREATE USER 'wordpressuser'@'localhost' IDENTIFIED BY 'votre_mot_de_passe'; GRANT ALL PRIVILEGES ON wordpress.* TO 'wordpressuser'@'localhost'; FLUSH PRIVILEGES; EXIT;`
```

Assurez-vous de remplacer `'votre_mot_de_passe'` par un mot de passe sécurisé.

### 5. Téléchargement et configuration de WordPress

Téléchargez la dernière version de WordPress et extrayez-la dans le répertoire `/var/www/html` en exécutant les commandes suivantes :

```bash
cd /tmp 
wget -c https://wordpress.org/latest.tar.gz 
tar -xzvf latest.tar.gz 
sudo mv wordpress /var/www/html/
```

Créez un fichier de configuration WordPress en copiant le fichier d'exemple :

```bash
cd /var/www/html/wordpress 
sudo cp wp-config-sample.php wp-config.php
```

Ouvrez `wp-config.php` dans un éditeur de texte et configurez-le en fournissant les détails de la base de données MySQL que vous avez configurée précédemment.)

### 6. Configuration du serveur web

Pour qu'Apache serve correctement WordPress, vous devez activer le module `rewrite` et redémarrer le service. Exécutez les commandes suivantes :

```bash
sudo a2enmod rewrite 
sudo systemctl restart apache2
```

### 7. Finalisation de l'installation

Dans votre navigateur web, accédez à l'adresse IP de votre machine virtuelle. Vous devriez voir l'assistant d'installation de WordPress. Suivez les instructions à l'écran pour terminer l'installation en fournissant les informations nécessaires.

---
changer information d'accès grâce à la DB
how to append information 
## Source :

1. **Titre de l'article :** [15 Statistiques Impressionnantes sur WordPress en 2024](https://kinsta.com/fr/blog/statistiques-wordpress/)
   **Auteur :** Randy A. Brown
   **Date de publication :** 3 janvier 2024
   **Site :** Kinsta Blog

2. **Titre de l'article :** [WordPress.org vs WordPress.com vs WordPress VIP: What’s the Difference?](https://wpvip.com/2023/02/16/wordpress-org-vs-wordpress-com-vs-wordpress-vip-whats-the-difference/)
   **Auteur :** Non spécifié  
   **Date de publication :** 16 février 2023  
   **Site :** WordPress VIP  

3. **Titre de l'article :** [WordPress VIP: une plateforme de contenu agile](https://wpvip.com/wordpress-vip-agile-content-platform/?utm_source=WordPresscom&utm_medium=automattic_referral&utm_campaign=top_nav#discover-pricing)
   **Auteur :** Non spécifié
   **Site :** WordPress VIP

4. **Titre de la page :** [Tarification](https://wpvip.com/pricing/)
   **Auteur :** Non spécifié
   **Site :** WordPress VIP

5. **Site :** [WP Mayor](https://wpmayor.com/)

6. **Site :** [Documentation WordPress](https://wordpress.org/documentation/)

7. **Site :** [WPShout](https://wpshout.com/)
   
8. **Site :** [WPBeginner](https://www.wpbeginner.com/)

9. **Site** : [Documentation Docker](https://docs.docker.com/guides/)
   
10. **Site** :[Site officiel de WordPress](https://wordpress.org/)