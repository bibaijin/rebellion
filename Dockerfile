FROM laincloud/centos-lain:20170405
# Dockerfile for building rebellion

RUN pip install supervisor && yum clean all

#Build rebellion
COPY . $GOPATH/src/github.com/laincloud/rebellion
RUN $GOPATH/src/github.com/laincloud/rebellion/build.sh

VOLUME ["/data/lain/volumes/", "/var/lib/filebeat/", "/var/log/filebeat/", "/var/log/supervisor", "/var/log/syslog/"]
ENTRYPOINT ["supervisord", "-c", "/etc/supervisord.conf"]
