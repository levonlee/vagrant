FROM ubuntu:16.04

MAINTAINER Li Li

# https://github.com/iliyan-trifonov/node-nvm

RUN apt-get update && apt-get install -y curl build-essential libssl-dev

RUN curl -sL https://raw.githubusercontent.com/creationix/nvm/v0.33.1/install.sh | bash

# Every RUN is a separate shell, required
ENV NODE_VERSION 6.10.3
ENV NVM_DIR /root/.nvm
RUN . ~/.nvm/nvm.sh && nvm install $NODE_VERSION && nvm alias default $NODE_VERSION && nvm use default

# && npm install -g bower pm2 --user "node"
# ADD ./run_all.sh /run_all.sh

EXPOSE 3000

# CMD ["/bin/bash", "/run_all.sh"]
