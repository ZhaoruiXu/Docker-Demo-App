FROM node:13-alpine

# the ENV variables are ONLY inside the container and will not affect the HOST(my laptop) environment
ENV MONGO_DB_USERNAME=admin \
    MONGO_DB_PWD=password

# RUN is to execute any linux commands (RUN is executed inside the container)
# the directory created is ONLY inside the container!
# When the -p option is used, the command creates the directory only if it doesn’t exist.
RUN mkdir -p /home/app 

# COPY command executes on the HOST machine!
# so if you want to copy files inside the container, you would do RUN then do linux cp command to do that
COPY ./app /home/app

# set default dir so that next commands executes in /home/app dir
WORKDIR /home/app

# will execute npm install in /home/app because of WORKDIR
RUN npm install

# CMD aka command, which executes an entry point linux command (so equals to $ node server.js to run the server.js file)
# no need for /home/app/server.js because of WORKDIR
# NOTE: there is ONLY one CMD command allowed inside of a Dockerfile (but you can have multiple RUN commands)
CMD ["node", "server.js"]

