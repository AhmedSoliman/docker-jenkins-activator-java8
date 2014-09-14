# Jenkins Slave with Typesafe Activator on Oracle Java 8

This is a jenkins slave that automatically installs your self-signed certificate (ssl) and runs jenkins Swarm client to connect to your jenkins build server, you con configure the labels, mode, executors, name, and username/password for Swarm

typesafe activator is installed and available on path (sbt) you can use it instead of sbt if you like, this contains the full activator 1.2.10 bundle

## Running

```
    docker run -ti \
      -e JENKINS_MASTER=https://jenkins.yourhost.com \
      -e SSL_HOST=jenkins.yourhost.com \
      -e JENKINS_USERNAME='jenkins' \
      -e JENKINS_PASSWORD='jenkins' \
      -e SLAVE_NAME="Test Node" \
      -e SLAVE_LABELS="test java" \
      -e SLAVE_EXECUTORS=2 \
      -e SLAVE_MODE=exclusive 
    ahmedsoliman/jenkins-slave:latest
```

The only variable required is JENKINS_MASTER the rest are optional, you must specify the SSL_HOST if you are connected to a jenkins host with a self-signed ssl certificate.

Notes: `SLAVE_MODE` can get one of two values, either `exclusive` or `normal`, default is `normal`

