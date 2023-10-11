# Start with an Ubuntu 22.04 base image
FROM ubuntu:22.04

# Set the maintainer of the image
MAINTAINER Anthony Thorne <anthonythorne33@hotmail.com>

# Update the package list to ensure we have the latest information
RUN apt-get update

# Install apt-utils to handle package configurations and avoid potential warnings
RUN apt-get install -y apt-utils

# Install some essential tools and libraries
RUN apt-get install git-core build-essential rsync curl bzip2 libpng-dev gnupg ssh -y

# Set noninteractive mode for apt-get to avoid interactive prompts during build
ENV DEBIAN_FRONTEND noninteractive

# Install PHP and its extensions
RUN apt-get install php php-common php-curl php-gd php-mbstring php-mysql php-soap php-xml php-xmlrpc php-zip -y

# Install Python 3.6 and necessary Python tools
RUN apt-get install python3.6 python3-pip python3-setuptools python3-dev build-essential -y

# Install Composer for PHP dependency management
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --file=composer
RUN ln -s /usr/local/bin/composer.phar /usr/local/bin/composer

# Install NodeJS, nvm (Node Version Manager) to manage multiple Node.js versions
RUN apt-get install -y nodejs
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash

# Change the default shell to bash (required for nvm)
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

# Install various versions of Node.js using nvm, and set the default version to 18
RUN /bin/bash -c "source ~/.nvm/nvm.sh && nvm install 14 && nvm install 15 && nvm install 16 && nvm install 17 && nvm install 18 && nvm install 20 && nvm use 18"

# Install Yarn for managing JavaScript packages
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install yarn
