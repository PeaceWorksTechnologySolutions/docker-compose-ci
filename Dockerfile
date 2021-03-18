ARG DOCKER_VERSION=latest
FROM tmaier/docker-compose:${DOCKER_VERSION}

ARG COMPOSE_VERSION=

RUN apk add --no-cache bash \
 && sed -i -e "s/bin\/ash/bin\/bash/" /etc/passwd \
 && rm /bin/sh \
 && ln -s /bin/bash /bin/sh
ENV LC_ALL=en_US.UTF-8

LABEL \
  org.opencontainers.image.authors="Jason Hildebrand <jason@peaceworks.ca>" \
  org.opencontainers.image.description="This docker image installs docker-compose on top of the docker image, and uses bash as the default shell." \
  org.opencontainers.image.licenses="MIT" \
  org.opencontainers.image.source="https://github.com/PeaceWorksTechnologySolutions/docker-compose-ci" \
  org.opencontainers.image.title="Docker Compose and Bash on docker base image" \
  org.opencontainers.image.vendor="PeaceWorks Technology Solutions" \
  org.opencontainers.image.version="${DOCKER_VERSION} with docker-compose"
