FROM ubuntu:18.04
MAINTAINER Anthony Thorne <anthonythorne33@hotmail.com>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get install -y apt-utils

# General installs.
RUN apt-get install git-core build-essential rsync curl bzip2 libpng-dev gnupg ssh -y
RUN apt-get install php php-common php-curl php-gd php-mbstring php-mysql php-soap php-xml php-xmlrpc php-zip -y

# Install Python and ansible
RUN apt-get install python3.6 python3-pip python3-setuptools python3-dev build-essential -y
RUN pip3 install ansible

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --file=composer
RUN ln -s /usr/local/bin/composer.phar /usr/local/bin/composer

# Install Node.JS 12
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -
RUN apt-get install -y nodejs

# Install Yarn.
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install yarn
