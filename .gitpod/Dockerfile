FROM gitpod/workspace-full

USER root

ARG DEBIAN_FRONTEND noninteractive

# Install PHP 8.0
RUN add-apt-repository -y ppa:ondrej/php \
 && install-packages \
  # php8.0 \ # this installs apache2
  php8.0-cli \
  php8.0-common \
  php8.0-bz2 \
  php8.0-bcmath \
  php8.0-curl \
  # php8.0-dev \ # this installs several other php versions somehow
  php8.0-gd \
  php8.0-gmp \
  php8.0-imap \
  php8.0-intl \
  php8.0-mbstring \
  php8.0-mysql \
  php8.0-pgsql \
  php8.0-soap \
  php8.0-sqlite3 \
  php8.0-tokenizer \
  php8.0-xsl \
  php8.0-xml \
  php8.0-zip \
  php-pear \
  php8.0-mcrypt \
  php8.0-redis \
  php8.0-xdebug \
 && sudo -E update-alternatives --set php /usr/bin/php8.0

# Install MySQL
RUN install-packages mysql-server \
 && mkdir -p /var/run/mysqld /var/log/mysql \
 && chown -R gitpod:gitpod /etc/mysql /var/run/mysqld /var/log/mysql /var/lib/mysql /var/lib/mysql-files /var/lib/mysql-keyring /var/lib/mysql-upgrade

# Install our own MySQL config
COPY .gitpod/mysql/mysql.cnf /etc/mysql/mysql.conf.d/mysqld.cnf

# Install default-login for MySQL clients
COPY .gitpod/mysql/client.cnf /etc/mysql/mysql.conf.d/client.cnf

# Install MySQL init and run script
COPY .gitpod/mysql/mysql-bashrc-launch.sh /etc/mysql/mysql-bashrc-launch.sh

# Install Redis
RUN install-packages redis-server \
 && mkdir -p /var/run/redis /var/log/redis /var/redis \
 && chown -R gitpod:gitpod /etc/redis /var/run/redis /var/log/redis /var/redis

# Install Redis run script
COPY .gitpod/redis/redis-bashrc-launch.sh /etc/redis/redis-bashrc-launch.sh

USER gitpod

RUN echo "sudo /etc/mysql/mysql-bashrc-launch.sh" >> /home/gitpod/.bashrc.d/100-mysql-launch
RUN echo "sudo /etc/redis/redis-bashrc-launch.sh" >> /home/gitpod/.bashrc.d/100-redis-launch
