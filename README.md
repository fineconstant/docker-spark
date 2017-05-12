# Apache Spark Docker cluster

### [Docker Hub for this image](https://hub.docker.com/r/kduda/spark/)

Based on ["A minimal Ubuntu base image modified for Docker-friendliness"](https://github.com/phusion/baseimage-docker)

#### Supported tags and respective `Dockerfile` links
* [`jre-8_spark-2.1.0`, `latest`  (jre-8_spark-2.1.0/Dockerfile)](https://github.com/DudaKamil/docker-spark/blob/master/Dockerfile) 

#### How to use this image
### start a single apache spark instance
`$ docker run --name some-spark -d kduda/spark`

This image exposes `8080 - 9090, 7077, 6066, 4040` ports.

### start a spark cluster with `docker-compose up -d`
* [`spark/docker-compose.yml`](https://github.com/DudaKamil/docker-spark/blob/master/spark/docker-compose.yml) - Spark Master and 4 workers 
* [`spark-zeppelin/docker-compose.yml`](https://github.com/DudaKamil/docker-spark/blob/master/spark-zeppelin/docker-compose.yml) - Zeppelin [based on this image](https://github.com/DudaKamil/docker-zeppelin) with Spark Master and 4 workers
