FROM dockerfile/java:oracle-java8

MAINTAINER Ahmed Soliman <me@ahmedsoliman.com>

RUN \
    apt-get update && \
    apt-get install -y git


RUN wget "http://maven.jenkins-ci.org/content/repositories/releases/org/jenkins-ci/plugins/swarm-client/1.16/swarm-client-1.16-jar-with-dependencies.jar"

RUN \
    wget "http://opentox.ntua.gr/files/InstallCert.zip" && \
    unzip InstallCert.zip

RUN \
    apt-get install -y nodejs npm && \
    npm install -g mocha


RUN rm -rf /var/lib/apt/lists/*

WORKDIR /data

ADD ./cmd.sh /data/

CMD ["./cmd.sh"]
