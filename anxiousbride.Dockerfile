FROM wordpress AS dev

SHELL ["/bin/bash", "--login", "-c"]
ENV DEBIAN_FRONTEND=noninteractive

#  Install Git 
RUN apt-get update -y && apt-get install git -y

# # Install PHP 
# RUN apt-get update -y && apt-get install -y php libapache2-mod-php \
#     curl git php-cli unzip 

# Install composer 
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Install node 
# Install nvm 
SHELL ["/bin/bash", "--login", "-i", "-c"]
ENV NODE_VERSION 20.10.0
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash 
RUN source /root/.bashrc && nvm install $NODE_VERSION && nvm alias default $NODE_VERSION && nvm use default 
SHELL ["/bin/bash", "--login", "-c"]

# # Get Python 10 
# RUN apt-get install software-properties-common -y && add-apt-repository ppa:deadsnakes/ppa -y
# RUN apt-get update -y && apt-get install python3.9 -y