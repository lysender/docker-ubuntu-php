FROM ubuntu:trusty
MAINTAINER Leonel Baer <leonel@lysender.com>

# Install  packages
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && \
    apt-get -y install mysql-client \
    git \
    tree \
    php5 \
    php5-cgi \
    php5-cli \
    php5-common \
    php5-fpm \
    libapache2-mod-php5 \
    php-pear \
    php5-mysql \
    php5-dev \
    php5-gd \
    php5-mcrypt \
    php5-xmlrpc \
    psmisc \
    net-tools \
    curl \
    sqlite3 \
    sendmail && apt-get clean

# Configure
ADD ./start.sh /start.sh

RUN chmod 755 /start.sh
RUN php5enmod mcrypt

CMD ["/bin/bash", "/start.sh"]
