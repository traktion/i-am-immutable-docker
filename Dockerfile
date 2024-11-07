# Build SafeNetwork Docker container (inspired by DeusNexus image)
FROM alpine:latest
LABEL version="0.2.3"
LABEL maintainer="Traktion"
LABEL release-date="2024-11-07"

# Update and install dependencies
RUN apk update
RUN apk add bash #unix shell to run install script
RUN apk add curl #cUrl to transfer data

RUN addgroup -S safe && adduser -S safe -G safe
USER safe:safe
WORKDIR /home/safe

#Make profile file with exported PATH and refresh the shell (while building)
SHELL ["/bin/bash", "--login", "-c"]
RUN echo 'export PATH=$PATH:/home/safe/.local/bin' > ~/.profile
#RUN echo 'export SAFE_PEERS=/ip4/142.93.46.42/udp/43338/quic-v1/p2p/12D3KooWSaCWsF2qLULtKTtjJPYpzCKn3X3aY19WdznPB5jUfmt3' >> ~/.profile && source ~/.profile

#Set ENV PATH (after build will be used to find 'safe' and 'safenode')
ENV PATH=$PATH:/home/safe/.local/bin/
#ENV SAFE_PEERS=/ip4/142.93.46.42/udp/43338/quic-v1/p2p/12D3KooWSaCWsF2qLULtKTtjJPYpzCKn3X3aY19WdznPB5jUfmt3

#Installation Script - MaidSafe installation script
RUN curl -sSL https://raw.githubusercontent.com/maidsafe/safeup/main/install.sh | bash

#Install Safe - During Build
RUN safeup client
RUN safeup update

#Install sn_httpd
COPY sn_httpd/sn_httpd /home/safe/.local/bin/sn_httpd
COPY sn_httpd/static /home/safe/static
COPY sn_httpd/sn_httpd_wrapper.sh /home/safe/.local/bin/sn_httpd_wrapper.sh

USER root:root
RUN chmod +x /home/safe/.local/bin/sn_httpd
RUN chmod +x /home/safe/.local/bin/sn_httpd_wrapper.sh
USER safe:safe

VOLUME ["/tmp"]

ENTRYPOINT ["sn_httpd_wrapper.sh"]
EXPOSE 8080
