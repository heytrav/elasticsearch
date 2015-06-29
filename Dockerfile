#
# Elasticsearch Dockerfile
#
# https://github.com/dockerfile/elasticsearch
#

# Pull base image.
FROM java:openjdk-8u45-jre
MAINTAINER Travis Holton <travis@ideegeo.com>

ENV ES_PKG_NAME elasticsearch-1.6.0

# Install Elasticsearch.
RUN \
  cd / && \
  wget https://download.elasticsearch.org/elasticsearch/elasticsearch/$ES_PKG_NAME.tar.gz && \
  tar xvzf $ES_PKG_NAME.tar.gz && \
  rm -f $ES_PKG_NAME.tar.gz && \
  mv /$ES_PKG_NAME /elasticsearch



ADD config /elasticsearch/config/
RUN /elasticsearch/bin/plugin --install io.fabric8/elasticsearch-cloud-kubernetes/1.2.1 --verbose
