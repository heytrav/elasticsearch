#
# Elasticsearch Dockerfile
#
# https://github.com/dockerfile/elasticsearch
#

# Pull base image.
FROM dockerfile/java:oracle-java8
MAINTAINER Travis Holton <travis@ideegeo.com>

ENV ES_PKG_NAME elasticsearch-1.5.1

# Install Elasticsearch.
RUN \
  cd / && \
  wget https://download.elasticsearch.org/elasticsearch/elasticsearch/$ES_PKG_NAME.tar.gz && \
  tar xvzf $ES_PKG_NAME.tar.gz && \
  rm -f $ES_PKG_NAME.tar.gz && \
  mv /$ES_PKG_NAME /elasticsearch



ADD config/elasticsearch.yml /elasticsearch/config/elasticsearch.yml
RUN /elasticsearch/bin/plugin --install io.fabric8/elasticsearch-cloud-kubernetes/1.1.0 --verbose
