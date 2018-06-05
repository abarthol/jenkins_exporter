FROM quay.io/prometheus/busybox:latest
LABEL maintainer="docker@code-fabrik.com"

COPY jenkins_exporter /bin/jenkins_exporter

EXPOSE 9103
#ENTRYPOINT ["/bin/jenkins_exporter"]
