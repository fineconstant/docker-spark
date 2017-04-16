# Default Environment Variables
# SPARK_MASTER_WEBUI_PORT   8080
# SPARK_WORKER_WEBUI_PORT   8081
# SPARK_MASTER_PORT         7077
# SPARK_WORKER_INSTANCES    1
# ---
# Spark Master REST URL     6066

FROM openjdk:8-jre-alpine

MAINTAINER Kamil Duda <kamilduda01@gmail.com>
LABEL version = "jre_8_spark_2.1.0"

# Version
ENV SPARK_VERSION="2.1.0"

# Set home
ENV SPARK_HOME="/usr/local/spark-$SPARK_VERSION"

# Update system
RUN \
  apk update && \
  apk upgrade && \
  apk add wget tar && \
  rm -rf /var/cache/apk/* && \
  rm -rf /var/lib/apk/* && \
  rm -rf /etc/apk/cache/*

## Install Spark

# Build download URL
# http://www.apache.org/dyn/closer.lua/spark/spark-2.1.0/spark-2.1.0-bin-without-hadoop.tgz
ARG ARCHIVE_FILE=spark-$SPARK_VERSION-bin-without-hadoop.tgz
ARG ARCHIVE_URL=http://ftp.ps.pl/pub/apache/spark/spark-$SPARK_VERSION/$ARCHIVE_FILE

# Download and install
RUN \
  mkdir -p "${SPARK_HOME}" && \
  wget $ARCHIVE_URL && \
  tar -xzf $ARCHIVE_FILE --strip-components=1 -C $SPARK_HOME && \
  rm -f $ARCHIVE_FILE

# Expose ports
EXPOSE 8080 8081 7077 6066
