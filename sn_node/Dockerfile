# Build SafeNetwork Docker container (inspired by DeusNexus image)
FROM alpine:latest
LABEL version="0.1"
LABEL maintainer="Traktion"
LABEL release-date="2021-05-20"

# Update and install dependencies
RUN apk update
RUN apk add bash #unix shell to run install script
RUN apk add curl #cUrl to transfer data

#Make profile file with exported PATH and refresh the shell (while building)
SHELL ["/bin/bash", "--login", "-c"]
RUN echo 'export PATH=$PATH:/root/.safe/cli' > ~/.profile && source ~/.profile

#Set ENV PATH (after build will be used to find 'safe')
ENV PATH=$PATH:/root/.safe/cli

#Installation Script - MaidSafe installation script
RUN curl -so- https://sn-api.s3.amazonaws.com/install.sh | bash

#Install Safe - During Build
RUN safe node install
RUN safe auth install

#Connect to fleming testnet
RUN safe networks add fleming-testnet https://sn-node.s3.eu-west-2.amazonaws.com/config/node_connection_info.config

#Switch to fleming testnet
RUN safe networks switch fleming-testnet

# Create test coins
RUN safe keys create --test-coins --for-cli

# Join fleming testnet
RUN safe node join

#Expose PORT of the node
EXPOSE 12000

#Run command on Docker launch
CMD ["safe"]
