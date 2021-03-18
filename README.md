# Docker Compose

This docker image installs docker-compose on top of the `docker` image, and uses bash as the default shell.
This is very useful for CI pipelines, which leverage "Docker in Docker".

This image is built using [tmaier/docker-compose](https://github.com/tmaier/docker-compose), and adds bash
as the default shell (upstream did not want to make that change).

## Usage instructions for GitLab CI

You may use it like this in your `.gitlab-ci.yml` file.

```yaml
image: peaceworks/docker-compose-ci:latest

services:
  - docker:dind

before_script:
  - docker info
  - docker-compose --version

build image:
  stage: build
  script:
    - docker-compose build
```

## Common issues and possible fixes

### `ERROR: error during connect: Get http://docker:2375/v1.40/info: dial tcp: ...`

> As of version 19.03, docker:dind will automatically generate TLS certificates and require using them for communication.

See <https://github.com/tmaier/docker-compose/issues/21#issuecomment-578780163>

## Authors

Jason Hildebrand for [PeaceWorks Technology Solutions](https://peaceworks.ca),
building on work by [Tobias L. Maier](http://tobiasmaier.info) for [BauCloud GmbH](https://www.baucloud.com)
