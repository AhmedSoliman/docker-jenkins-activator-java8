# Jenkins Slave with Java 8 and NodeJs with Mocha

This is a jenkins slave that automatically installs your self-signed certificate (ssl) and runs jenkins Swarm client to connect to your jenkins build server, you con configure the labels, mode, executors, name, and username/password for Swarm

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
ahmedsoliman/jenkins-slave-node:latest
```

The only variable required is JENKINS_MASTER the rest are optional, you must specify the SSL_HOST if you are connected to a jenkins host with a self-signed ssl certificate.

Notes: `SLAVE_MODE` can get one of two values, either `exclusive` or `normal`, default is `normal`
