FROM ahmedsoliman/jenkins-slave:latest

MAINTAINER Ahmed Soliman <me@ahmedsoliman.com>

RUN wget "http://downloads.typesafe.com/typesafe-activator/1.2.10/typesafe-activator-1.2.10.zip" && \
    unzip typesafe-activator-*.zip

ENV PATH /data/typesafe-activator-1.2.10:$PATH

ADD ./cmd.sh /data/

CMD ["./cmd.sh"]