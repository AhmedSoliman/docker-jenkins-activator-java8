FROM java:8

MAINTAINER Ahmed Soliman <me@ahmedsoliman.com>

RUN wget "http://maven.jenkins-ci.org/content/repositories/releases/org/jenkins-ci/plugins/swarm-client/1.22/swarm-client-1.22-jar-with-dependencies.jar"

RUN \
    wget "http://opentox.ntua.gr/files/InstallCert.zip" && \
    unzip InstallCert.zip

RUN \
    apt-get update && \
    apt-get install -y git nodejs npm wget && \
    npm install -g mocha

RUN ln -s /usr/bin/nodejs /usr/bin/node

RUN wget -qO- https://get.docker.com/ | sh

RUN apt-get clean 

RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR /data

ADD ./cmd.sh /data/

CMD ["./cmd.sh"]
