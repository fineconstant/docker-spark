# Apache Spark Docker cluster


## [Docker Hub for this image](https://hub.docker.com/r/kduda/spark/)

#### Supported tags and respective `Dockerfile` links
* [`jre-8_spark-2.1.0`, `latest`  (jre-8_spark-2.1.0/Dockerfile)](https://github.com/DudaKamil/docker-spark/blob/master/Dockerfile) 

#### How to use this image
### start a single apache spark instance
`$ docker run --name some-spark -d kduda/spark`

This image exposes `8080, 8081, 7077, 6066` ports.

### start a spark cluster using [`docker-compose.yml`](https://github.com/DudaKamil/docker-spark/blob/master/docker-compose.yml)
`docker-compose up -d`