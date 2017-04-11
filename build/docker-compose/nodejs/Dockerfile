FROM node:6.10.2

# create a non-privileged user called app
# Update npm
# https://github.com/npm/npm/releases

# The new user might have to have the same UID as the docker host (1000)
# RUN useradd -U -o -u 1000 -m -s /bin/false app
RUN useradd -U -m -s /bin/false app

ENV HOME=/home/app

COPY package.json $HOME/chat/
RUN chown -R app:app $HOME/*

# in container, /home/app/chat is the working directory
USER app
WORKDIR $HOME/chat

RUN npm install

# default is server.js
CMD ["node", "index.js"]
