# Build SafeNetwork Docker container (inspired by DeusNexus image)
FROM alpine:latest
LABEL version="0.2"
LABEL maintainer="Traktion"
LABEL release-date="2024-03-21"

# Update and install dependencies
RUN apk update
RUN apk add bash #unix shell to run install script
RUN apk add curl #cUrl to transfer data

RUN addgroup -S safe && adduser -S safe -G safe
USER safe:safe
WORKDIR /home/safe

#Make profile file with exported PATH and refresh the shell (while building)
SHELL ["/bin/bash", "--login", "-c"]
RUN echo 'export PATH=$PATH:/home/safe/.local/share/safe/cli:/home/safe/.local/share/safe/node' > ~/.profile && source ~/.profile

#Set ENV PATH (after build will be used to find 'safe' and 'safenode')
ENV PATH=$PATH:/home/safe/.local/bin/

#Installation Script - MaidSafe installation script
RUN curl -sSL https://raw.githubusercontent.com/maidsafe/safeup/main/install.sh | bash

#Install Safe - During Build
RUN safeup client
RUN safeup node
RUN safeup node-manager
RUN safeup update

COPY sn_start_docker_testnet.sh /home/safe/.local/bin/safenode_manager_testnet.sh
USER root:root
RUN chmod +x /home/safe/.local/bin/safenode_manager_testnet.sh
USER safe:safe

ENTRYPOINT ["/home/safe/.local/bin/safenode_manager_testnet.sh"]
#TODO: Expose correct range for safenode-manager config
EXPOSE 12346-12357/tcp
EXPOSE 12346-12357/udp
