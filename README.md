# Table of Contents

<!-- toc -->

- [Table of Contents](#table-of-contents)
- [Première partie : à propos de WordPress](#première-partie--à-propos-de-wordpress)
  - [Que-est ce que c'est wordpress ?](#que-est-ce-que-cest-wordpress-)
  - [Automattic](#automattic)
  - [Q\&A](#qa)
  - [Qu'est-ce que c'est qu'un CMS ?](#quest-ce-que-cest-quun-cms-)
- [Deuxième partie : installation locale](#deuxième-partie--installation-locale)
  - [installation sur un Ubuntu 23.10 - Version longue](#installation-sur-un-ubuntu-2310---version-longue)
    - [01 - Prérequis](#01---prérequis)
    - [02 - Création de la base de données MySQL](#02---création-de-la-base-de-données-mysql)
    - [03 - Installation de WordPress](#03---installation-de-wordpress)
    - [04 - Finalisation de l'installation](#04---finalisation-de-linstallation)
  - [installation sur un Ubuntu 23.10 - Version courte (Docker)](#installation-sur-un-ubuntu-2310---version-courte-docker)
    - [01 - Installation de Docker](#01---installation-de-docker)
    - [02 - Vérification du status de docker](#02---vérification-du-status-de-docker)
    - [03 - Configuration de Docker pour WordPress](#03---configuration-de-docker-pour-wordpress)
    - [04 - Lancement de WordPress avec Docker](#04---lancement-de-wordpress-avec-docker)
    - [Références](#références)
    - [De quoi WordPress a-t-il besoin pour fonctionner ?](#de-quoi-wordpress-a-t-il-besoin-pour-fonctionner-)
- [Troisième partie : installation distante](#troisième-partie--installation-distante)
  - [Procédure d’installation de WordPress sur une VM distante](#procédure-dinstallation-de-wordpress-sur-une-vm-distante)
    - [1. Connexion à la machine virtuelle distante](#1-connexion-à-la-machine-virtuelle-distante)
    - [2. Mise à jour du système](#2-mise-à-jour-du-système)
    - [3. Installation des prérequis](#3-installation-des-prérequis)
    - [4. Configuration de la base de données MySQL](#4-configuration-de-la-base-de-données-mysql)
    - [5. Téléchargement et configuration de WordPress](#5-téléchargement-et-configuration-de-wordpress)
    - [6. Configuration du serveur web](#6-configuration-du-serveur-web)
    - [7. Finalisation de l'installation](#7-finalisation-de-linstallation)
  - [À la découverte de WordPress](#à-la-découverte-de-wordpress)
    - [Copie d’écran d'une partie du site :](#copie-décran-dune-partie-du-site-)
    - [Que manque-t-il pour que mon site soit opérationnel ?](#que-manque-t-il-pour-que-mon-site-soit-opérationnel-)
- [Quatrième partie : développement avec Docker (Dev)](#quatrième-partie--développement-avec-docker-dev)
  - [Différence entre conteneurisation et virtualisation :](#différence-entre-conteneurisation-et-virtualisation-)
  - [Commandes principales pour utiliser Docker et lancer WordPress :](#commandes-principales-pour-utiliser-docker-et-lancer-wordpress-)
  - [installation sur un Ubuntu 23.10 - Version courte (Docker)](#installation-sur-un-ubuntu-2310---version-courte-docker-1)
    - [01 - Installation de Docker](#01---installation-de-docker-1)
    - [02 - Vérification du status de docker](#02---vérification-du-status-de-docker-1)
    - [03 - Configuration de Docker pour WordPress](#03---configuration-de-docker-pour-wordpress-1)
    - [04 - Lancement de WordPress avec Docker](#04---lancement-de-wordpress-avec-docker-1)
  - [Explication des termes Docker :](#explication-des-termes-docker-)
  - [Entrer dans un conteneur Docker :](#entrer-dans-un-conteneur-docker-)
  - [ER Diagram](#er-diagram)
- [Cinquième partie : déploiement avec Docker (Ops)](#cinquième-partie--déploiement-avec-docker-ops)
  - [01 - Connexion au serveur (SSH)](#01---connexion-au-serveur-ssh)
  - [02 - Téléchargement du repository](#02---téléchargement-du-repository)
  - [03 : Navigation vers le répertoire](#03--navigation-vers-le-répertoire)
  - [04 : Gnu Make](#04--gnu-make)
  - [05 : Configuration du fichier .env](#05--configuration-du-fichier-env)
  - [06 - Lancement de l'application](#06---lancement-de-lapplication)
  - [07 : Vérification du déploiement](#07--vérification-du-déploiement)
  - [Étape 7 : Accès au site](#étape-7--accès-au-site)
  - [Similarité avec le déploiement local](#similarité-avec-le-déploiement-local)
  - [Source :](#source-)

<!-- tocstop -->

# Première partie : à propos de WordPress
## Que-est ce que c'est wordpress ?

Créé en 2003 par Matt Mullenweg et Mike Little, WordPress est un système de gestion de contenu (CMS) open-source qui permet de créer et de gérer facilement des sites web. Il offre une interface conviviale et une grande flexibilité, ce qui en fait l'une des plateformes les plus populaires pour la création de sites web, qu'ils soient personnels, professionnels ou institutionnels.

Concernant les auteurs, on pourrait dire que le principal contributeur de WordPress est techniquement la communauté mondiale de développeurs, de designers et d'utilisateurs qui contribuent l'amélioration continue de la plateforme.

## Automattic

Automattic est une société multinationale spécialisée dans le développement de logiciels, principalement connue pour être la force motrice derrière WordPress.com, la plateforme d'hébergement de sites web basée sur WordPress. Fondée en 2005 par Matt Mullenweg et Mike Little, Automattic a élargi son éventail de produits pour inclure une gamme diversifiée de services et d'outils liés à la création de contenu en ligne, la gestion de communautés et le commerce électronique.

WordPress, est au cœur de l'écosystème d'Automattic. En plus de WordPress.com, Automattic est également derrière WordPress.org, la plateforme qui distribue le logiciel WordPress gratuitement et qui sert de base à des millions de sites web dans le monde entier.

Au fil des ans, Automattic a acquis de nombreuses entreprises et startups, élargissant ainsi son influence dans le domaine de la publication en ligne et de la création de contenu. Outre WordPress.com, Automattic possède des services tels que WooCommerce, un plugin de commerce électronique pour WordPress, Jetpack, un plugin de sécurité et de performance, ainsi que Tumblr, une plateforme de blogging populaire.

L'entreprise est réputée pour sa culture de travail à distance, avec une grande partie de son personnel travaillant à distance dans le monde entier. Cette approche a contribué à façonner non seulement la façon dont Automattic fonctionne en tant qu'entreprise, mais aussi l'évolution des pratiques de travail à distance dans l'ensemble de l'industrie technologique.

En résumé, Automattic est une société emblématique dans le domaine des logiciels open-source et de la publication en ligne, avec WordPress comme pilier central de son activité et de sa mission de rendre la création de contenu accessible à tous. Son lien étroit avec WordPress en fait une figure majeure dans le paysage numérique moderne.

## Q&A

* WordPress est-il beaucoup utilisé ?
	* Oui, WordPress est extrêmement populaire et largement utilisé à travers le monde. En fait, il alimente plus [d'un tiers de tous les sites web](https://kinsta.com/fr/blog/statistiques-wordpress/) actifs sur Internet. Sa popularité découle de sa simplicité d'utilisation, de sa flexibilité et de sa capacité à être adapté à divers besoins, qu'il s'agisse de blogs personnels, de sites d'entreprises, de boutiques en ligne ou même de grands sites d'actualités.
* Combien coûte WordPress ?
	* WordPress est disponible en deux versions principales : WordPress.com, qui propose des services d'hébergement et de gestion de sites web avec [différents niveaux d'abonnement payants](https://wpvip.com/pricing/), et WordPress.org, qui fournit le logiciel gratuitement, mais nécessite un hébergement web séparé. Ainsi, le coût dépend du type de service ou d'hébergement que vous choisissez, avec des options allant de gratuites à des plans premium payants.
* Quelle est la différence entre wordpress.com et wordpress.org ?
	* La [principale différence entre WordPress.com et WordPress.org](https://wpvip.com/2023/02/16/wordpress-org-vs-wordpress-com-vs-wordpress-vip-whats-the-difference/) réside dans l'hébergement et le contrôle du site. WordPress.com offre un service d'hébergement intégré avec divers plans payants, ce qui signifie que votre site sera hébergé sur les serveurs de WordPress.com et que vous aurez accès à des fonctionnalités spécifiques selon votre abonnement. En revanche, WordPress.org fournit uniquement le logiciel WordPress lui-même, que vous devez installer sur un serveur d'hébergement web tiers que vous choisissez et gérez vous-même. Cela offre une plus grande liberté et personnalisation, mais nécessite également plus de connaissances techniques et peut impliquer des coûts supplémentaires pour l'hébergement. 

## Qu'est-ce que c'est qu'un CMS ?

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

Dans votre navigateur web, accédez à l'adresse IP + le nom du repertoire ou ce trouve wordpress de votre machine virtuelle. Vous devriez voir l'assistant d'installation de WordPress. Suivez les instructions à l'écran pour terminer l'installation en fournissant les informations nécessaires.

## À la découverte de WordPress
1. **Différence entre un post et une page :**
    - **Post :** Un post est un contenu dynamique et fréquemment mis à jour, généralement affiché en ordre chronologique sur votre site. Les posts sont souvent utilisés pour des articles de blog ou des mises à jour régulières.
    - **Page :** Une page est un contenu statique et permanent, généralement utilisé pour des informations intemporelles telles que "À propos", "Contact" ou "Services". Les pages ne sont pas liées à une chronologie et restent généralement accessibles depuis le menu de navigation de votre site.
    
2. **Installer et changer les thèmes :**
    - Pour installer un nouveau thème, vous allez dans "Apparence" -> "Thèmes" dans votre tableau de bord WordPress, puis cliquez sur "Ajouter" pour télécharger un nouveau thème depuis le répertoire de thèmes WordPress ou depuis votre propre ordinateur.
    - Pour changer de thème, il vous suffit de cliquer sur "Activer" sur le thème que vous souhaitez utiliser parmi ceux installés.

3. **Installer et changer les plugins :**
    - Pour installer un nouveau plugin, allez dans "Extensions" -> "Ajouter" dans votre tableau de bord WordPress, puis recherchez le plugin souhaité dans le répertoire WordPress ou téléchargez-le depuis votre propre ordinateur.
    - Pour changer les plugins activés, allez dans "Extensions" -> "Extensions installées", puis activez, désactivez ou supprimez les plugins selon vos besoins.

4. **Écosystème des plugins et des thèmes :**
    - L'écosystème des plugins et des thèmes WordPress est vaste et varié, avec des milliers de thèmes et de plugins disponibles sur le répertoire WordPress officiel ainsi que sur d'autres sites tiers. Ces thèmes et plugins sont créés par des développeurs du monde entier pour étendre les fonctionnalités et personnaliser l'apparence de votre site WordPress.

5. **Utiliser le menu :**
    - Pour créer un menu de navigation, allez dans "Apparence" -> "Menus", puis créez un nouveau menu en ajoutant des éléments tels que des pages, des articles, des liens personnalisés, etc.
    - Vous pouvez personnaliser l'ordre et la structure de votre menu en faisant glisser et déposer les éléments, puis en les enregistrant une fois terminé.

6. **Assigner un menu à un emplacement du thème :**
    - Une fois que vous avez créé votre menu, vous pouvez l'assigner à un emplacement spécifique dans votre thème en allant dans "Apparence" -> "Menus" et en sélectionnant l'emplacement désiré dans les options de placement du menu.

7. **Visiter le menu settings (URL Rewriting, etc.) :**
    - Vous pouvez accéder aux réglages des permaliens et d'autres paramètres importants en allant dans "Réglages" -> "Permaliens" dans votre tableau de bord WordPress. C'est là que vous pouvez personnaliser la structure des URL de votre site, ce qui peut avoir un impact significatif sur le référencement et l'expérience utilisateur.

8. **Utiliser les catégories et les tags, ainsi que leurs pages :**
    - Les catégories et les tags sont des taxonomies utilisées pour organiser votre contenu. Vous pouvez les gérer en allant dans "Articles" -> "Catégories" ou "Articles" -> "Tags" dans votre tableau de bord WordPress. Chaque catégorie et tag a sa propre page d'archive qui affiche tous les articles associés.

9. **SEO et Excerpt :**
    - Le SEO (Search Engine Optimization) désigne l'ensemble des techniques visant à améliorer le classement d'un site web dans les résultats des moteurs de recherche. L'excerpt est un résumé de votre contenu qui est souvent utilisé dans les pages d'archives ou les résultats de recherche pour donner un aperçu du contenu complet. Un bon excerpt est important pour inciter les utilisateurs à cliquer et pour améliorer le référencement de votre contenu.

### Copie d’écran d'une partie du site :

![screen1](./images/wordpressSiteScreenShot1.png)

![screen2](./images/wordpressSiteScreenShot2.png)

### Que manque-t-il pour que mon site soit opérationnel ?
Pour rendre votre site pleinement opérationnel et prêt à accueillir un trafic significatif, voici ce dont vous pourriez avoir besoin :

1. **Hébergement fiable :** Assurez-vous d'avoir un hébergement web fiable et évolutif qui peut gérer un trafic accru sans compromettre les performances de votre site. Vous pouvez opter pour un hébergement partagé, un VPS (serveur privé virtuel) ou même un hébergement cloud en fonction de vos besoins et de votre budget.
    
2. **Sécurité renforcée :** Protégez votre site contre les attaques malveillantes en installant des plugins de sécurité, en utilisant des certificats SSL pour le cryptage des données et en mettant en place des mesures de sécurité telles que la vérification en deux étapes et la surveillance des journaux d'accès.
    
3. **Optimisation des performances :** Assurez-vous que votre site est rapide et réactif en optimisant les images, en minimisant les requêtes HTTP, en mettant en cache le contenu statique et en utilisant un CDN (Content Delivery Network) pour distribuer votre contenu à travers le monde.
    
4. **Sauvegardes régulières :** Mettez en place un système de sauvegarde automatique pour protéger vos données en cas de panne du serveur, de piratage ou de perte de données accidentelle. Stockez les sauvegardes sur un emplacement distant sécurisé pour une sécurité supplémentaire.
    
5. **Gestion de la montée en charge :** Anticipez la croissance de votre site en mettant en place des solutions de mise à l'échelle automatique qui peuvent gérer un trafic accru sans nécessiter d'intervention manuelle. Cela peut inclure l'utilisation de services cloud extensibles ou l'ajout de capacité de serveur supplémentaire en cas de besoin.
    
6. **Suivi des performances :** Utilisez des outils d'analyse web pour surveiller les performances de votre site, y compris le temps de chargement des pages, le taux de rebond, les conversions et d'autres métriques clés. Utilisez ces données pour identifier les domaines à améliorer et optimiser continuellement votre site.
    
7. **Support technique :** Assurez-vous d'avoir un plan de support technique en place pour résoudre rapidement les problèmes techniques et répondre aux questions des utilisateurs. Cela peut inclure un support par e-mail, un chat en direct ou même un support téléphonique en fonction de vos besoins et de vos ressources disponibles.

# Quatrième partie : développement avec Docker (Dev)

Docker est une plateforme logicielle open-source qui permet de créer, de déployer et de gérer des applications dans des conteneurs. Ces conteneurs sont des environnements légers et portables qui encapsulent tous les éléments nécessaires à l'exécution d'une application, y compris le code, les bibliothèques, les dépendances et les variables d'environnement. Docker simplifie le processus de développement, de distribution et de déploiement des applications en éliminant les problèmes de compatibilité entre les environnements de développement et de production.

## Différence entre conteneurisation et virtualisation :

La conteneurisation est différente de la virtualisation traditionnelle car elle utilise un concept de conteneurs légers qui partagent le même noyau d'exploitation et les mêmes ressources matérielles de l'hôte. Contrairement à la virtualisation, où chaque machine virtuelle nécessite son propre système d'exploitation invité et son propre ensemble de ressources, les conteneurs partagent les ressources du système d'exploitation hôte, ce qui les rend plus rapides à démarrer, plus efficaces en termes de consommation de ressources et plus portables entre les environnements de développement, de test et de production.

## Commandes principales pour utiliser Docker et lancer WordPress :

* `docker pull wordpress` : Télécharge l'image WordPress depuis le registre Docker Hub.

* `docker run --name wordpress -p 8080:80 -d wordpress` : Lance un conteneur WordPress en utilisant l'image téléchargée, en exposant le port 8080 de l'hôte pour accéder à WordPress, et en détachant le conteneur du terminal.

* `docker ps` : Affiche la liste des conteneurs en cours d'exécution.

* `docker stop <container_id>` : Arrête le conteneur spécifié.

* `docker rm <container_id>` : Supprime le conteneur spécifié.

* `docker-compose up -d` : Lance les conteneurs définis dans le fichier docker-compose.yml en mode détaché.

* `docker-compose down` : Arrête et supprime les conteneurs définis dans le fichier docker-compose.yml.

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


## Explication des termes Docker :

- Dockerfile : Un fichier texte qui contient les instructions pour créer une image Docker.
- Docker : La plateforme logicielle open-source qui permet de créer, de déployer et de gérer des conteneurs.
- Docker Compose : Un outil qui permet de définir et de gérer des applications multi-conteneurs dans un fichier YAML.
- Ports : Des points d'entrée réseau qui permettent à un conteneur Docker d'accepter les connexions externes.
- Volumes : Des points de stockage persistant qui permettent à un conteneur Docker d'accéder à des données stockées en dehors de son système de fichiers racine.
- Environnements : Des variables qui peuvent être définies pour configurer le comportement d'un conteneur Docker au moment de son démarrage.

## Entrer dans un conteneur Docker :

Utilisez la commande `docker exec -it <container_id> /bin/bash` pour ouvrir un terminal interactif à l'intérieur du conteneur spécifié.

## ER Diagram
![ER_Diagram](./images/ER_Diagram.png)
# Cinquième partie : déploiement avec Docker (Ops)
## 01 - Connexion au serveur (SSH)

```bash
ssh user@ipAdress
```

## 02 - Téléchargement du repository

```bash
git clone https://github.com/D4rkHeart/Wordpress-Formation.git
```

## 03 : Navigation vers le répertoire

Accédez au répertoire où vous avez transféré vos fichiers. 

Par exemple :
```bash 
cd /chemin/vers/votre/dossier`
```

## 04 : Gnu Make

installer [make](https://www.gnu.org/software/make/manual/make.html) si il n'est pas déjà présent : 
```bash
sudo apt -y install make
```

## 05 : Configuration du fichier .env

Utilisez la commande `make .env` pour copier le `.env.example` et le renommer en `.env`.
```bash
make .env
```

**Assurez-vous que votre fichier `.env` contient les bonnes valeurs pour les variables d'environnement nécessaires, telles que les informations de base de données et les paramètres SSL.** 

Assurez-vous également que le fichier `.env` est **sécurisé** et n'est accessible qu'à des utilisateurs autorisés.
## 06 - Lancement de l'application 

Une fois le .env configuré il ne vous reste plus qu'a utiliser la commande : 
```bash
make up 
```
## 07 : Vérification du déploiement

Une fois la commande exécutée, vérifiez que tous les services se sont lancés correctement en utilisant la commande `make ps`. Assurez-vous que tous les conteneurs sont en état "Up".

```bash
make ps
```

## Étape 7 : Accès au site
Utilisez un navigateur web pour accéder à votre site en utilisant l'adresse IP ou le nom de domaine de votre serveur, suivi du port si nécessaire (par exemple, `http://votre_domaine.com:80`). Assurez-vous que le site s'affiche correctement et que toutes les fonctionnalités sont opérationnelles.

## Similarité avec le déploiement local
Le déploiement en production est en tout point similaire à celui sur mon ordinateur. Toutes les configurations, y compris les services Docker, les volumes persistants, les variables d'environnement, les certificats SSL, les ports exposés et les fonctionnalités de l'application WordPress, sont identiques à celles de mon environnement de développement local.
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