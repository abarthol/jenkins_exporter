# Jenkins Exporter

A [Prometheus](https://prometheus.io/) exporter that collects Jenkins statistics.


## Installation

We are offering a docker image under https://hub.docker.com/r/codefabrik/jenkins_exporter/

### Usage

```bash
# docker run -ti --rm codefabrik/jenkins_exporter -h
Usage of /bin/jenkins_exporter:
  -jenkins.address string
      Address where to reach Jenkins
  -jenkins.password string
      Password to authenticate on Jenkins
  -jenkins.username string
      Username to authenticate on Jenkins
  -log.format value
      Set the log target and format. Example: "logger:syslog?appname=bob&local=7" or "logger:stdout?json=true" (default "logger:stderr")
  -log.level value
      Only log messages with the given severity or above. Valid levels: [debug, info, warn, error, fatal] (default "info")
  -version
      Print version information
  -web.listen-address string
      Address to listen on for web interface and telemetry (default ":9103")
  -web.telemetry-path string
      Path to expose metrics of the exporter (default "/metrics")
```


## Development

Make sure you have a working Go environment, for further reference or a guide take a look at the [install instructions](http://golang.org/doc/install.html). It is also possible to just simply execute the `go get github.com/webhippie/jenkins_exporter` command, but we prefer to use our `Makefile`:

```bash
go get -d github.com/abarthol/jenkins_exporter
cd $GOPATH/src/github.com/abarthol/jenkins_exporter
make test build

./jenkins_exporter -h
```


## Metrics

```
# HELP jenkins_exporter_build_info A metric with a constant '1' value labeled by version, revision, branch, and goversion from which jenkins_exporter was built.
# TYPE jenkins_exporter_build_info gauge
jenkins_exporter_build_info{branch="master",goversion="go1.8.1",revision="4792fdc30a695a1a19d54ffe395d0f838d6d8cee",version="0.1.0"} 1
# HELP jenkins_job_color Color code of the Jenkins job
# TYPE jenkins_job_color gauge
jenkins_job_color{name="build-project-1"} 0
jenkins_job_color{name="build-project-2"} 0
jenkins_job_color{name="build-project-3"} 0
jenkins_job_color{name="build-project-4"} 0
jenkins_job_color{name="build-project-5"} 1
# HELP jenkins_up Check if Jenkins response can be processed
# TYPE jenkins_up gauge
jenkins_up 1
```


## Authors

* [Alexander Bartholomäi](https://github/abarthol)
* [Thomas Boerger](https://github.com/tboerger)


## License

Apache-2.0


## Copyright

```
Copyright (c) 2018 CodeFabrik GmbH <docker@code-fabrik.com>
while crucial parts may still fall under the original authors copyright:
Copyright (c) 2017 Thomas Boerger <http://www.webhippie.de>
```
