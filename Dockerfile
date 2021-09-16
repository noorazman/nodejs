FROM node:latest AS node_base

FROM binhex/arch-base:latest
LABEL org.opencontainers.image.authors="noorazman"

COPY --from=node_base / /
# additional files
##################

# add supervisor conf file for app
ADD build/*.conf /etc/supervisor/conf.d/

# add install and packer bash script
ADD build/root/*.sh /root/

# install app
#############
ENV NODE_ENV=production
WORKDIR /usr/src/app
COPY ["package.json", "package-lock.json*", "npm-shrinkwrap.json*", "./"]
RUN npm install --production --silent && mv node_modules ../
COPY . .
RUN chown -R nobody /usr/src/app
RUN ln -s /usr/src/app/app.js /usr/bin/shareclipext


# make executable and run bash scripts to install app
RUN chmod +x /root/*.sh && \
	/bin/bash /root/install.sh

# docker settings
#################

# map /config to host defined config path (used to store configuration from app)
VOLUME /config

# expose port for the app
EXPOSE 3000

# set permissions
#################

# run script to set uid, gid and permissions
CMD ["/bin/bash", "/usr/local/bin/init.sh"]