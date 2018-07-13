# AdWords optimizer
Find max ROI or min CPA for your AdWords campaigns

## Installation steps

### Install Node.js

```bash
$ curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
$ sudo apt-get install -y nodejs
```

### Install Git

```bash
$ wget https://www.kernel.org/pub/software/scm/git/git-2.14.1.tar.gz
$ tar -zxf git-2.14.1.tar.gz
$ cd git-2.14.1
$ sudo apt-get install libcurl4-openssl-dev
$ make configure
$ ./configure --prefix=/usr
$ make all
$ sudo make install
```

### Configure Git

```bash
$ nano ~/.gitconfig

~/.gitconfig
[user]
        name = Sammy Shark
        email = sammy@example.com
```

### Clone this repository

```bash
$ git clone https://github.com/passiondev211/optimize.git
```

### Install YARN and Patch-Package

```bash
$ sudo npm -g install yarn
$ sudo npm -g install patch-package
```

### Prepare development environment

```bash
$ yarn install
```

### Build the production version of the project

```bash
$ yarn run build
```

## Tweak the config settings

```bash
$ cp api/conf.php .
$ nano ./conf.php
```
```php
<?php
define('DATABASE_HOST','127.0.0.1');
define('DATABASE_NAME','wpdatabase');
define('DATABASE_USER','db_username');
define('DATABASE_PASS','db_password');

define('SMTP_HOST','localhost');
define('SMTP_PORT',587);
define('SMTP_SSL','tls'); // empty, 'ssl' or 'tls'
define('SMTP_USER','auth_user@example.com');
define('SMTP_PASS','auth_pass');

define('SMTP_FROM','noreply@example.com');
define('SMTP_CONTACT','noreply@example.com');
define('USE_SMTP',FALSE); // whether to use SMTP directly or rely on PHP's mail()

define('VIDEO','bTqVqk7FSmY'); // YouTube ID of the explainer video
$admin_id = Array(4,5); // IDs from table mm_user for Administrator privileges
?>
```

## Create database schema

Execute the SQL dump `optimize.sql` using your favorite **phpMyAdmin**.

## Deploy for the first time

```bash
$ sudo mkdir -p /var/www/html/optimize
$ sudo cp examples/* /var/www/html/optimize/
$ sudo cp -r ampl /var/www/html/optimize/
$ sudo cp -r api /var/www/html/optimize/
$ sudo cp -r dist/* /var/www/html/optimize/
$ sudo cp conf.php /var/www/html/optimize/api/
$ sudo chown -R www-data:www-data /var/www/html/optimize
$ sudo chmod 754 /var/www/html/optimize/ampl/ampl
$ sudo chmod 754 /var/www/html/optimize/ampl/minos
```

### Subsequent deployments (do not forget to build for production version of the source code)

```bash
$ sudo rm -rf /var/www/html/optimize/{api,js,css,img}
$ sudo cp -r api /var/www/html/optimize/
$ sudo cp -r dist/* /var/www/html/optimize/
$ sudo cp conf.php /var/www/html/optimize/api/
$ sudo chown -R www-data:www-data /var/www/html/optimize
```

## How to access the tool

Open `https://example.com`

## How to change the video

Edit the row with `ID = 1` in table `mm_config` of the database.
