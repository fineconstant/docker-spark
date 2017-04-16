# Default Environment Variables
# SPARK_MASTER_PORT         7077
# SPARK_MASTER_WEBUI_PORT   8080
# SPARK_WORKER_WEBUI_PORT   8081
# SPARK_WORKER_INSTANCES    1
# ---
# Spark Master REST URL     6066

# https://hub.docker.com/r/phusion/baseimage/
FROM phusion/baseimage:latest

LABEL maintainer "kamilduda01@gmail.com"
LABEL version = "jre_8_spark_2.1.0"

# baseimage - run during container startup
CMD ["/sbin/my_init"]
RUN mkdir -p /etc/my_init.d
COPY start-spark.sh /etc/my_init.d/start-spark.sh
RUN chmod +x /etc/my_init.d/start-spark.sh

### Install Java
RUN apt-get update && \
    apt-get upgrade -y && \
    add-apt-repository ppa:webupd8team/java -y && \
    apt-get update && \
    echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
    echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections && \
    apt-get install -y oracle-java8-installer && \
    apt-get install -y oracle-java8-set-default  && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN export JAVA_HOME=/usr/lib/jvm/java-8-oracle && \
    PATH=$JAVA_HOME/bin:$PATH


### Install Spark

# Version
ENV SPARK_VERSION="2.1.0"
ENV HADOOP_VERSION="2.7"

# Set home and path
ENV SPARK_HOME="/usr/local/spark-$SPARK_VERSION"
ENV PATH="$PATH:$SPARK_HOME/bin"
ENV PATH="$PATH:$SPARK_HOME/sbin"

# Container working directory
WORKDIR $SPARK_HOME

# Archive download URL
# http://www.apache.org/dyn/closer.lua/spark/spark-2.1.0/spark-2.1.0-bin-hadoop2.7.tgz
ARG ARCHIVE_FILE=spark-$SPARK_VERSION-bin-hadoop$HADOOP_VERSION.tgz
ARG ARCHIVE_URL=http://ftp.ps.pl/pub/apache/spark/spark-$SPARK_VERSION/$ARCHIVE_FILE

# Download and install
RUN \
  mkdir -p "${SPARK_HOME}" && \
  wget $ARCHIVE_URL && \
  tar -xzf $ARCHIVE_FILE --strip-components=1 -C $SPARK_HOME && \
  rm -f $ARCHIVE_FILE

# Expose ports
EXPOSE 7077 8080-9090 6066 4040
