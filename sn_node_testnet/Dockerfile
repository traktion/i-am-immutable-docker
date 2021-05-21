# Build SafeNetwork Docker container (inspired by DeusNexus image)
FROM alpine:latest
LABEL version="0.1"
LABEL maintainer="Traktion"
LABEL release-date="2021-05-20"

# Update and install dependencies
RUN apk update
RUN apk add bash #unix shell to run install script
RUN apk add curl #cUrl to transfer data

RUN addgroup -S safe && adduser -S safe -G safe
USER safe:safe
WORKDIR /home/safe

#Make profile file with exported PATH and refresh the shell (while building)
SHELL ["/bin/bash", "--login", "-c"]
RUN echo 'export PATH=$PATH:/home/safe/.safe/cli:/home/safe/.safe/node' > ~/.profile && source ~/.profile

#Set ENV PATH (after build will be used to find 'sn_node')
ENV PATH=$PATH:/home/safe/.safe/cli:/home/safe/.safe/node/

#Installation Script - MaidSafe installation script
RUN curl -so- https://sn-api.s3.amazonaws.com/install.sh | bash

#Install Safe - During Build
RUN safe node install
RUN safe auth install

COPY sn_start_docker_testnet.sh /home/safe/.safe/node/sn_start_docker_testnet.sh
USER root:root
RUN chmod +x /home/safe/.safe/node/sn_start_docker_testnet.sh
USER safe:safe

ENTRYPOINT ["/home/safe/.safe/node/sn_start_docker_testnet.sh"]
EXPOSE 12346-12357/tcp
EXPOSE 12346-12357/udp
